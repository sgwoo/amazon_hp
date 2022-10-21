package com.amazon.hp.member.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;

import org.apache.commons.codec.binary.Base64;

import com.amazon.hp.member.service.MemberService;
import com.amazon.hp.util.JsonUtils;

import net.sf.json.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonParser;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.type.TypeReference;



@Controller
public class LoginController {
    
    @Autowired
    MemberService memberService;
    
    @RequestMapping(value = "/login-old")
    public String loginOld() {
        return "/user/login"; 
    }

    @RequestMapping(value = "/login")
    public String login(HttpServletRequest request, HttpSession session, 
    					@RequestParam(value="param", defaultValue="") String param ) {
        //String referer = request.getHeader("Referer");
        //request.getSession().setAttribute("prevPage", referer);
    	
    	String referer = request.getHeader("Referer");
    	request.getSession().setAttribute("prevPage", referer);    	
    	
    	/*String fromPage = request.getParameter("from_page");
    	boolean base_url;
    	if (fromPage != null) {
    		base_url = Base64.isBase64(fromPage);    		
    		if (base_url == true) {
        		byte[] byte_fromPage = Base64.decodeBase64(fromPage);
        		fromPage = new String(byte_fromPage);
        	}
    	}*/
    	
    	/*String referrer = "/"; //로그인 페이지를 거쳐 로그인시 메인페이지로 세팅
        if (fromPage != null) {
        	request.getSession().setAttribute("presentPage", fromPage);
        } else {        	
        	request.getSession().setAttribute("presentPage", referrer);
        }*/
        
        request.getSession().setAttribute("presentPage", referer);
        ModelAndView mav = new ModelAndView();
        mav.addObject("param", param);
        
        if(session.getAttribute("loginYn")=="Y"){
        	return "/index";
        }else{
        	return "/member/login";
        }	
    }
    
    @RequestMapping(value="/find/userId")
    public String findId(){
        return "/user/findId";
    }
    
    @ResponseBody
    @RequestMapping(value="/find/password")
    public Map<String, Object> findPassword(/*@RequestBody(required=false) Map<String,Object> param,*/
    		HttpServletResponse response,
    		@RequestParam(value="email")String email, 
    		@RequestParam(value="flowPath",defaultValue="")String flowPath
    		) throws Exception{
    	Map<String, Object> resultMap = new HashMap<String, Object>();
    	
    	byte[] byte_email = Base64.decodeBase64(email);
    	email = new String(byte_email);
    	
    	resultMap = memberService.generateTokenToEmail(email);
    	//resultMap = memberService.generateTokenToEmail(param.get("email").toString());    	        
        //resultMap.put("message","success");
    	if(flowPath.equals("mobile")){
    		String message = (String) resultMap.get("message");    		
    		response.sendRedirect("https://www.amazoncar.co.kr/home/mobile/pw_search_new.jsp?email="+email+"&message="+message);
    	}    	
        return resultMap;
    }
    
    /*
     * 토큰 검증 후 비밀번호 변경 페이지로 Redirect
     * */
    @RequestMapping(value="/find/password/reset",method=RequestMethod.GET)
    public String redirectResetPassword(WebRequest request, Model model) throws Exception{
        
        if(request.getParameter("token") != null){
            String email = memberService.verifyToken(request.getParameter("token").toString());
            
            model.addAttribute("email",email);
            return "/user/resetPassword";
            
        }else{
            throw new Exception("잘못된 접근입니다");
        }
    }
    
    /*
     * 비밀번호 변경 Action
     * */
    @ResponseBody
    @RequestMapping(value="/reset/password",method=RequestMethod.POST)
    public Map<String,Object> resetPassword(@RequestBody Map<String, Object> params) throws Exception{
        Map<String, Object> resultMap = new HashMap<String, Object>();
        
        String temp_email = params.get("email").toString();
    	byte[] byte_email = Base64.decodeBase64(temp_email);
    	String email = new String(byte_email);
    	
    	String temp_pass = params.get("password").toString();
    	byte[] byte_pass = Base64.decodeBase64(temp_pass);
    	String password = new String(byte_pass);
    	
    	Map<String, Object> resultMap2 = new HashMap<String, Object>();
    	resultMap2.put("password", password);
        resultMap2.put("email", email);
    	
        memberService.resetPassword(resultMap2);
        return resultMap;
    }
    
    // 로그인 전 이메일 인증 페이지 추가
    @RequestMapping(value="/authEmail")
    public ModelAndView authEmail(
    		@RequestParam(value="email")String email
    		){
    	
    	ModelAndView mav = new ModelAndView();
    	
    	byte[] byte_email = Base64.decodeBase64(email);
    	email = new String(byte_email);
    	
    	mav.addObject("email", email);
    	mav.setViewName("/member/authEmail");
    	
    	return mav;
    }
    
    //회원가입여부체크 및 이메일인증 여부체크 ajax
    @SuppressWarnings("unchecked")
	@ResponseBody
    @RequestMapping(value="/checkUseYn")
    public Map<String, Object> checkUseYn(
    		@RequestBody Map<String,Object> param
    		){
    	//JsonUtils json = new JsonUtils();
        //param = (Map<String, Object>) json.JsonFilter(param);
    	
    	String temp_email = param.get("email").toString();
    	byte[] byte_email = Base64.decodeBase64(temp_email); 
    	String email = new String(byte_email);
    	//String email = param.get("email").toString();
    	
    	int checkCnt2 = 0;	//회원가입 여부 체크
    	Map<String, Object> infoMap = memberService.selectUserInfo(email);    	
    	if(infoMap != null ){
    		checkCnt2 = 1;
    	}    	
    	int checkCnt = memberService.checkUseYn(email); //이메일인증 여부 체크
    	
    	Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("checkCnt",checkCnt);
        resultMap.put("checkCnt2",checkCnt2);     
        return resultMap;
    }
    
    //로그인, 견적 시작하기, 회원가입 시 회원가입여부 체크
    @ResponseBody
    @RequestMapping(value="/checkRegEmail")
    public int checkRegEmail(
    		@RequestBody Map<String,Object> params
    		){
    	//String email = param.get("email").toString();
    	
    	String temp_email = params.get("email").toString();
    	byte[] byte_email = Base64.decodeBase64(temp_email);
    	String email = new String(byte_email);
    	
    	Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("email", email);
    	
    	int checkResult = memberService.checkRegEmail(resultMap);

        return checkResult;
    }
    
    
    
}

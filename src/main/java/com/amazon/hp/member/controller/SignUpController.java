package com.amazon.hp.member.controller;

import com.amazon.hp.member.service.MemberService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.social.connect.Connection;
import org.springframework.social.connect.ConnectionData;
import org.springframework.social.connect.UserProfile;
import org.springframework.social.connect.web.ProviderSignInUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;

import org.apache.commons.codec.binary.Base64;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.map.ObjectMapper;

import com.amazon.hp.member.util.security.UserAuthenticationHandler;
import com.amazon.hp.member.util.security.UserCryptoUtil;
import com.amazon.hp.member.util.user.User;
import com.amazon.hp.member.util.user.UserCreateRequestVO;
import com.amazon.hp.rent.controller.EstimateController;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class SignUpController {

	@Autowired
	private ProviderSignInUtils providerSignInUtils;

	@Autowired
	private MemberService memberService; 
	
	@Autowired
	private EstimateController estimateController;
	
	@Autowired
	private Environment env;	
	
	UserAuthenticationHandler authHandler;	

	@RequestMapping(value="/register")
	public String registerMenu(){
		return "/member/signupHome";
	}
	
	//소셜 로그인 + 일반회원가입만 이곳에서 처리(일반 로그인은 스프링 시큐리티에서 해결)
	@SuppressWarnings({ "static-access"})
	//@RequestMapping(value ={"/signup","/signin"}, method = RequestMethod.GET) 	//이메일 인증절차 추가 >> 회원가입 후 인증절차 필요
	@RequestMapping(value ="/signup") 	//이메일 인증절차 추가 >> 회원가입 후 인증절차 필요
	public String redirectRequestToRegistrationPage(WebRequest request, 
			HttpServletRequest request2, RedirectAttributes redirectAttr, HttpSession session,HttpServletResponse response,			
			@RequestParam(value="fb_email", defaultValue="")String fb_email,
			@RequestParam(value="fb_id", defaultValue="")String fb_id,
			@RequestParam(value="kakao_email", defaultValue="")String kakao_email,
			@RequestParam(value="kakao_id", defaultValue="")String kakao_id,
			@RequestParam(value="gg_email", defaultValue="")String gg_email,
			@RequestParam(value="email", defaultValue="")String acar_email,
			@RequestParam(value="password", defaultValue="")String password,
			ModelMap modelMap)throws Exception {
		
		// 일반회원가입
		/*byte[] byte_email = Base64.decodeBase64(acar_email);
		acar_email = new String(byte_email);
		byte[] byte_password = Base64.decodeBase64(password);
		password = new String(byte_password);*/
		
		// 페이스북
		if (!fb_email.equals("undefined")) {			
			byte[] byte_fb_email = Base64.decodeBase64(fb_email);
			fb_email = new String(byte_fb_email);
		}
		
		// 구글
		byte[] byte_gg_email = Base64.decodeBase64(gg_email);
		gg_email = new String(byte_gg_email);
		
		// 카카오
		if (!kakao_email.equals("undefined")) {
			byte[] byte_kakao_email = Base64.decodeBase64(kakao_email);
			kakao_email = new String(byte_kakao_email);
		}
		
		UserCreateRequestVO userCreateRequestVO = new UserCreateRequestVO();
		
		if(fb_id != null && !fb_id.equals("")){	//페북 로그인
			userCreateRequestVO.setProviderId("facebook");
			//페이스북 이메일이 없는 경우 아이디로 식별
			if(fb_email.equals("undefined")){
				userCreateRequestVO.setEmail(fb_id);
				userCreateRequestVO.setId(fb_id);
			}else{
				userCreateRequestVO.setEmail(fb_email);
				userCreateRequestVO.setId(fb_id);
			}
			
		}else if(gg_email != null && !gg_email.equals("")){	//구글 로그인
			userCreateRequestVO.setEmail(gg_email);	
			userCreateRequestVO.setProviderId("google");
			
		}else if(kakao_id != null && !kakao_id.equals("")){ //카카오 로그인
			userCreateRequestVO.setProviderId("kakao");
			//카카오 처음 등록시 이메일을 무조건 등록해야 하기때문에 아이디로 식별
			if(kakao_email.equals("undefined")){
				userCreateRequestVO.setEmail(kakao_id);
				userCreateRequestVO.setId(kakao_id);
			}else{
				userCreateRequestVO.setEmail(kakao_email);
				userCreateRequestVO.setId(kakao_id);
			}
			
		}else if(acar_email != null && !acar_email.equals("") && password != null && !password.equals("")){	//일반 회원가입
			userCreateRequestVO.setEmail(acar_email);	
			userCreateRequestVO.setPassword(password);
			userCreateRequestVO.setProviderId("");
			
		}else{	//기존의 소스(소셜로그인용 - 소스는 남겨두겠으나 페북/구글 모두 이 루트를 타지는 않음)
			
				/* 스프링 시큐리티에서 webrequest의 session을 통해 유저 프로필을 조회 후 email을 불러오는 방식인데
			              소셜로그인쪽에서 로그인때마다 다른 값의 session 객체가 생성되는 경우가 있어서 고질적으로 로그인 불가 문제가 발생(서버리스타트 전까진 해결불가)
				   ^^^ 위의 세 분기로 대체처리.			*/
			
			Connection<?> connection = providerSignInUtils.getConnectionFromSession(request);
			//로그인한 유저 정보 끌어오기
			UserProfile userProfile = connection.fetchUserProfile();
			userCreateRequestVO = UserCreateRequestVO.fromSocialUserProfile(userProfile);
			//providerId 관리
			ConnectionData socialData = connection.createData();
			userCreateRequestVO.setProviderId(socialData.getProviderId());
		}
		
		String email = userCreateRequestVO.getEmail();		
		String redirectUrl = "/";
		User user = new User();
		
		//이미 존재하는 회원이면(로그인만 실행) 		
		if(memberService.existUser(email)) {
			//소셜로그인에서 넘어왔고 이메일정보가 있으면 따로 인증절차는 거치지 않는다
			user = User.fromVO(userCreateRequestVO);
			
		}else{	//회원이 아닌경우(회원가입+로그인)
			
			//User 정보 생성
			user = memberService.create(userCreateRequestVO);  
			String provider = (userCreateRequestVO.getProviderId() == null) ? "" : userCreateRequestVO.getProviderId();
						
			//생성된 User 정보에 Provider 업데이트
			if(!provider.equals("") && provider != null) {
				int resultNum = memberService.updateProviderInfo(user.getEmail(), provider);
				/*if (provider.equals("facebook")) {
					if(resultNum == 1){
						redirectUrl = "/regEmailForm?fb_id="+email;
						return "redirect:" + redirectUrl;
					}
				} else if (provider.equals("kakao")) {
					if(resultNum == 1){
						redirectUrl = "/regEmailKakaoForm?kakao_id="+email;
						return "redirect:" + redirectUrl;
					}
				}*/				
			}
			providerSignInUtils.doPostSignUp(user.getEmail(), request);
		}
		authHandler.CreateNewAuthenticationbyUser(user);	//로그인 처리(스프링 시큐리티)
		
		// 현재 url 로 리다이렉트 시킨다
		if(session.getAttribute("presentPage")!=null && !session.getAttribute("presentPage").equals("")){
			redirectUrl = (String)session.getAttribute("presentPage");
		}
		
		//위 이전페이지가 이메일인증 화면일 경우 메인으로 리다이렉트 시킨다
		if (redirectUrl.contains("regEmailForm") || redirectUrl.contains("regEmailKakaoForm") || redirectUrl.contains("signup")) {
			redirectUrl = "/";
		}
		return "redirect:" + redirectUrl;
	}

	//이메일 인증 체크를 위해 필요VV
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String registrationUser(@ModelAttribute UserCreateRequestVO userCreateRequestVO,	WebRequest request ) throws Exception {
		try {
			
			String email = userCreateRequestVO.getEmail();
		    byte[] byte_email = Base64.decodeBase64(email);
	    	email = new String(byte_email);
	    	
	    	String pass = userCreateRequestVO.getPassword();
		    byte[] byte_pass = Base64.decodeBase64(pass);
		    pass = new String(byte_pass);
		    
	    	userCreateRequestVO.setEmail(email);
	    	userCreateRequestVO.setPassword(pass);
			
		    //User 정보 생성
		    User user = memberService.create(userCreateRequestVO);
		    String provider = (request.getParameter("provider") == null) ? "" : request.getParameter("provider"); 
		    
			//생성된 User 정보에 Provider 업데이트 
		    if(provider != "") {
				memberService.updateProviderInfo(user.getEmail(), provider);
		    }
			providerSignInUtils.doPostSignUp(user.getEmail(), request);
			
			//authHandler.CreateNewAuthenticationbyUser(user);	//회원가입 후 자동 로그인 인증 부분
			String sendEmail = "";
			estimateController.sendEmailAuthLink(user.getEmail(), sendEmail);
			
			return "/member/authEmail";
			//return "redirect:/authEmail";
			
		} catch (Exception e) {
//		    throw e;
			return String.format("redirect:/error?message=%s", e.getMessage());
		}
	}
	

	/*
     * 이메일 인증위한 토큰 검증
     * */
    @RequestMapping(value="/userAuthEmail",method=RequestMethod.GET)
    public String redirectResetPassword(WebRequest request, Model model, HttpServletResponse response, HttpSession session) throws Exception{
        
    	try {
	        if(request.getParameter("token") != null){
        		String email = memberService.verifyToken(request.getParameter("token").toString());
        		
        		if(!email.contains("@") && !email.contains(".")){	//이메일 정보없이 소셜로그인 된 경우
        			String realEmail = memberService.selectEmailInfo(email);
        			memberService.updateRealEmail(realEmail);            	
        		}            
        		model.addAttribute("email",email);
        		return "redirect:/login";
	        }else{
	        	return "redirect:/error_auth";
	            //throw new Exception("로그인 중 오류발생! 관리자에게 문의하세요.");
	        }
    	} catch (Exception e) {
    		return "redirect:/error_auth";
    	}
    }
    
    //이메일 인증 메일보내기
    @SuppressWarnings("static-access")
	@ResponseBody
    @RequestMapping(value="/resendAuthEmail")
    public Map<String, Object> checkUseYn(HttpSession session
    		,@RequestBody Map<String,Object> param
    		) throws Exception{
    	
    	String email = param.get("email").toString();
    	byte[] byte_email = Base64.decodeBase64(email);
    	email = new String(byte_email);
    	
    	String sendEmail = "";
    	if (param.containsKey("fbId")) { // 페이스북
    		String fbId = param.get("fbId").toString();		
    		sendEmail = email;
    		
    		HashMap<String, String> vmap = new HashMap<String, String>();
    		vmap.put("email", email);
    		//vmap.put("tel", sendEmail);
    		vmap.put("fbId", fbId);
    		 
    		memberService.updateEmailInfoForFb(vmap);
    		
    	} else if(param.containsKey("kakaoId")) { // 카카오
    			String kakaoId = param.get("kakaoId").toString();		
    			sendEmail = email;
    			
    			HashMap<String, String> vmap = new HashMap<String, String>();
    			vmap.put("email", email);
    			vmap.put("kakaoId", kakaoId);
    			
    			memberService.updateEmailInfoForKakao(vmap);
    		
    	} else {	//일반 회원가입     		
    		
        	UserCryptoUtil crypto = new UserCryptoUtil();	    	
    	    String key = env.getProperty("amazoncar.user.key");
    	    
    	    //이메일을 암호화하여 토큰으로 사용한다    	    
    	    sendEmail = crypto.encrypt(key, email);
    	    
    	}
    	
    	estimateController.sendEmailAuthLink(email, sendEmail);
    	
    	//int checkCnt = memberService.checkUseYn(email);
    	
    	Map<String, Object> resultMap = new HashMap<String, Object>();
    	//if(!param.get("fbId").equals("")){	//fbId 가 있으면 소셜로그인에서 email 없이 넘어온 case
    	/*if(param.containsKey("fbId")){
    		email = sendEmail;
    	}*/
        resultMap.put("email",email);
        return resultMap;
    }
    
    //이메일 정보없이 소셜로그인시 이메일을 등록시키고 이메일인증절차 거침
    @RequestMapping(value="/regEmailForm")
    public ModelAndView regEmailForm(
    ){    	
    	ModelAndView mav = new ModelAndView();    	
    	mav.setViewName("/member/regEmail");
    	
    	return mav;
    }
    
    //이메일 정보없이 소셜로그인시 이메일을 등록시키고 이메일인증절차 거침(카카오)
    @RequestMapping(value="/regEmailKakaoForm")
    public ModelAndView regEmailKakaoForm(
    		){    	
    	ModelAndView mav = new ModelAndView();    	
    	mav.setViewName("/member/regEmailKakao");
    	
    	return mav;
    }
    
    //이메일 등록전 사용중인 이메일인지 확인
    @ResponseBody
    @RequestMapping(value="/checkUseEmail")
    public int checkUseEmail(
    		@RequestBody Map<String,Object> param
    		) throws Exception{
    	String email = param.get("email").toString();
    	byte[] byte_email = Base64.decodeBase64(email);
    	email = new String(byte_email);
    	
    	Map<String, Object> resultMap = memberService.selectUserInfo(email);    	
    	int result = 0;
    	if(resultMap == null){
    		result = 1;
    	}
    	return result;
    }
    
    //페이스북 로그인시 회원가입 여부 체크 Ajax
    @ResponseBody
    @RequestMapping(value="/checkFbLoginMember")
    public int checkFbLoginMember(
    		@RequestBody Map<String,Object> params
    		){
    	
    	String fb_id = params.get("fb_id").toString();
    	
    	String temp_fb_email = params.get("fb_email").toString();
    	byte[] byte_fb_email = Base64.decodeBase64(temp_fb_email);
    	String fb_email = new String(byte_fb_email);
    	
    	Map<String, Object> resultMap = new HashMap<String, Object>();
    	resultMap.put("fb_id", fb_id);
    	resultMap.put("fb_email", fb_email);
    	
    	int resultNum = memberService.checkFbLoginMember(resultMap);    	
    	return  resultNum;
    }    
    
    //페이스북 이메일없이 로그인시 인증절차 체크 Ajax
    @ResponseBody
    @RequestMapping(value="/checkEmailForFb")
    public Map<String,Object> authEmailForFbLogin(
    		@RequestBody Map<String,Object> params
    		){
    	
    	String fb_id = params.get("fb_id").toString();
    	String fb_email = params.get("fb_email").toString();
    	
    	if (!fb_email.equals("undefined")) {
    		//String temp_fb_email = params.get("fb_email").toString();
        	byte[] byte_fb_email = Base64.decodeBase64(fb_email);
        	fb_email = new String(byte_fb_email);
    	}
    	
    	Map<String, Object> resultMap2 = new HashMap<String, Object>();
    	resultMap2.put("fb_id", fb_id);
    	resultMap2.put("fb_email", fb_email);
    	
    	Map<String,Object> resultMap = memberService.authEmailForFbLogin(resultMap2);
    	return  resultMap;
    }
    
    //카카오 로그인시 회원가입 여부 체크 Ajax
    @ResponseBody
    @RequestMapping(value="/checkKakaoLoginMember")
    public int checkKakaoLoginMember(
    		@RequestBody Map<String,Object> params
    		){
    	
    	String kakao_id = params.get("kakao_id").toString();
    	//String kakao_email = params.get("kakao_email").toString();
    	
    	String temp_kakao_email = params.get("kakao_email").toString();
    	byte[] byte_kakao_email = Base64.decodeBase64(temp_kakao_email);
    	String kakao_email = new String(byte_kakao_email);
    	
    	Map<String, Object> resultMap = new HashMap<String, Object>();
    	resultMap.put("kakao_id", kakao_id);
    	resultMap.put("kakao_email", kakao_email);
    	
    	int resultNum = memberService.checkKakaoLoginMember(resultMap);    	
    	return  resultNum;
    }    
    
    //카카오 이메일없이 로그인시 인증절차 체크 Ajax
    @ResponseBody
    @RequestMapping(value="/checkEmailForKakao")
    public Map<String,Object> authEmailForKakaoLogin(
    		@RequestBody Map<String,Object> params
    		){
    	
    	String kakao_id = params.get("kakao_id").toString();
    	String kakao_email = params.get("kakao_email").toString();    	   	
    	byte[] byte_kakao_email = Base64.decodeBase64(kakao_email);
    	kakao_email = new String(byte_kakao_email);
    	    	
    	Map<String, Object> resultMap2 = new HashMap<String, Object>();
    	resultMap2.put("kakao_id", kakao_id);
    	resultMap2.put("kakao_email", kakao_email);
    	
    	Map<String,Object> resultMap = memberService.authEmailForKakaoLogin(resultMap2);
    	return  resultMap;
    }

 
    //인증메일 에러페이지
    @RequestMapping(value="/error_auth")
    public ModelAndView authError() {

        ModelAndView mav = new ModelAndView();
        mav.setViewName("error_auth");
        return mav;
    }
    
	/*
     * 카카오 프로필조회
     * 
     * */
    /*@RequestMapping(value="/control/kakaoPro", method=RequestMethod.POST)
    public Map<String,Object> getAccessToken(@RequestBody Map<String,String> param){
    	Map<String, Object> resultMap = null;
    	String autorize_code = param.get("code").toString();

	    final String RequestUrl = "https://kauth.kakao.com/oauth/token";

	    final List<NameValuePair> postParams = new ArrayList<NameValuePair>();

	    postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));
	    postParams.add(new BasicNameValuePair("client_id", "54869108bce682f779c8bf91e862f924"));    // REST API KEY
	    postParams.add(new BasicNameValuePair("redirect_uri", "http://localhost/home/mobile/login_check.jsp"));    // 리다이렉트 URI
	    postParams.add(new BasicNameValuePair("code", autorize_code));    // 로그인 과정중 얻은 code 값

	    final HttpClient client = HttpClientBuilder.create().build();
	    final HttpPost post = new HttpPost(RequestUrl);
	    JsonNode returnNode = null;	

	    try {

	      post.setEntity(new UrlEncodedFormEntity(postParams));
	      final HttpResponse response = client.execute(post);
	      final int responseCode = response.getStatusLine().getStatusCode();

	      System.out.println("\nSending 'POST' request to URL : " + RequestUrl);
	      System.out.println("Post parameters : " + postParams);
	      System.out.println("Response Code : " + responseCode);	     

	      //JSON 형태 반환값 처리
	      ObjectMapper mapper = new ObjectMapper();

	      returnNode = mapper.readTree(response.getEntity().getContent());	      
	      System.out.println("returnNode : " + returnNode);
	      System.out.println("returnNode : " + returnNode.path("access_token").getTextValue());	      
	      
	      resultMap = new HashMap<>();	      
	      resultMap.put("access_token", returnNode.path("access_token").getTextValue());
	      System.out.println("resultMap : " + resultMap);
	      
	    } catch (UnsupportedEncodingException e) {
	      e.printStackTrace();
	    } catch (ClientProtocolException e) {
	      e.printStackTrace();
	    } catch (IOException e) {
	      e.printStackTrace();
	    } finally {
	        // clear resources
	    }	    

	    return resultMap;
	}*/
    
}


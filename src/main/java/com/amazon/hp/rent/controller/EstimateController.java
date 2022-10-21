package com.amazon.hp.rent.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.util.UriComponents;

import com.amazon.hp.home.dao.HomeDAO;
import com.amazon.hp.home.service.UserService;
import com.amazon.hp.member.service.MemberService;
import com.amazon.hp.member.util.user.User;
import com.amazon.hp.model.CarDetail;
import com.amazon.hp.rent.dao.RentDAO;
import com.amazon.hp.rent.service.EstimateService;
import com.amazon.hp.rent.service.RentService;
import com.amazon.hp.util.SendMailHelper;


@Controller
@SessionAttributes({"estId","carManagedId","rentLocationCode","rentManagedId","estEmail"}) //월렌트 차량예약 세션 정보
public class EstimateController {

	@Autowired RentDAO rentDao;
	@Autowired HomeDAO homeDao;
	
    @Autowired RentService rentService;
    @Autowired EstimateService estiService;
    @Autowired SendMailHelper mailHelper;
    @Autowired UserService userService;
    @Autowired MemberService memberService;
    
    /* 전기차, 수소차 사전예약 */
    @ResponseBody
    @RequestMapping(value={"/estimate/reserve"}, method=RequestMethod.POST)
    public String getSimpleEstimateReserveData(@RequestBody Map<String,String> param, Model model) throws Exception{
    	
        String message = "사전예약 등록이 완료되었습니다";
        DateFormat regFormat = new SimpleDateFormat("yyyyMMddHHmm");
        Date today = new Date();
        String regDate = regFormat.format(today).toString();
        String regCode = Long.toString(System.currentTimeMillis());
        String newEstimateId = regCode + "1";
        
        param.put("reg_dt", regDate);
        param.put("est_id", newEstimateId);
        
        try{        	
            rentService.setSimpleEstimateReserveCustomerInfo(param);
        }catch(Exception e){
            message = "사전예약 등록 오류입니다. 관리자에게 문의해주세요.";
        }finally{
            userService.insertEstimateInfoToCoolMsg(param);
        }
        
        return message;
    }
    
    /* 특별할인차량 상담신청 */
    @ResponseBody
    @RequestMapping(value={"/estimate/discount"}, method=RequestMethod.POST)
    public String getSimpleEstimateDiscountData(@RequestBody Map<String,String> param, Model model) throws Exception{
    	
    	String message = "사전예약 등록이 완료되었습니다";
    	DateFormat regFormat = new SimpleDateFormat("yyyyMMddHHmm");
    	Date today = new Date();
    	String regDate = regFormat.format(today).toString();
    	String regCode = Long.toString(System.currentTimeMillis());
    	String newEstimateId = regCode + "1";
    	
    	param.put("reg_dt", regDate);
    	param.put("est_id", newEstimateId);
    	
    	try{        	
    		rentService.setSimpleEstimateDiscountCustomerInfo(param);
    	}catch(Exception e){
    		message = "사전예약 등록 오류입니다. 관리자에게 문의해주세요.";
    	}finally{
    		//userService.insertEstimateInfoToCoolMsg(param);
    	}
    	
    	return message;
    }
    
    /* 메인 간편상담 */
    @ResponseBody
    @RequestMapping(value={"/estimate/simple2"}, method=RequestMethod.POST)
    public String getSimpleEstimateData2(@RequestBody Map<String,String> param, Model model) throws Exception{
    	
    	String estArea = URLDecoder.decode(param.get("estArea").toString(), "UTF-8");
    	String estName = URLDecoder.decode(param.get("estName").toString(), "UTF-8");
    	String estTel = URLDecoder.decode(param.get("estTel").toString(), "UTF-8");
    	String estEmail = URLDecoder.decode(param.get("estEmail").toString(), "UTF-8");
    	String etc = URLDecoder.decode(param.get("etc").toString(), "UTF-8");
    	String cType = param.get("cType").toString();
    	String message = "";
        
    	param.put("estArea", estArea);
        param.put("estName", estName);
        param.put("estTel", estTel);
        param.put("estEmail", estEmail);
        param.put("etc", etc);
    	
    	if (cType.equals("mobile")) {
    		message = "1";
    	} else {
    		message = "간편상담 등록이 완료되었습니다";
    	}
    	
    	DateFormat regFormat = new SimpleDateFormat("yyyyMMddHHmm");
    	Date today = new Date();
    	String regDate = regFormat.format(today).toString();
    	String regCode = Long.toString(System.currentTimeMillis());
    	String newEstimateId = regCode + "1";
    	
    	param.put("reg_dt", regDate);
    	param.put("est_id", newEstimateId);
    	
    	//String block_ip = homeDao.getBlockIp(param);
    	//System.out.println(block_ip);
    	
    	try{
    		if (estName.equals("qeNtfPNC") || estEmail.equals("sample@email.tst")) {
    			if (cType.equals("mobile")) {
            		message = "0";
            	} else {
            		message = "간편상담 등록 오류입니다. 관리자에게 문의해주세요.";
            	}
            } else {
            	rentService.setSimpleEstimateCustomerInfo2(param);
            	userService.insertEstimateInfoToCoolMsg(param);
            }
    	}catch(Exception e){
    		if (cType.equals("mobile")) {
        		message = "0";
        	} else {
        		message = "간편상담 등록 오류입니다. 관리자에게 문의해주세요.";
        	}
    	}
    	
    	return message;
    }    
    
    /* 신차 간편상담 요청 */
    @ResponseBody
    @RequestMapping(value={"/estimate/simple"}, method=RequestMethod.POST)
    public String getSimpleEstimateData(@RequestBody Map<String, String> param, Model model) throws Exception{
    	
        String message = "간편상담 등록이 완료되었습니다";
        String estEmail = URLDecoder.decode(param.get("estEmail").toString(), "UTF-8");
        param.put("estEmail", estEmail);
        String estName = param.get("estName").toString();
        
        try{
            if (estName.equals("qeNtfPNC") || estEmail.equals("sample@email.tst")) {
            	message = "간편상담 등록 오류입니다. 관리자에게 문의해주세요.";
            } else {            	
            	rentService.setSimpleEstimateCustomerInfo(param);
            	userService.insertEstimateInfoToCoolMsg(param);
            }
        }catch(Exception e){
        	//System.out.println("EstimateController : getSimpleEstimateData >> " + e);
            message = "간편상담 등록 오류입니다. 관리자에게 문의해주세요.";
        }
        return message;
    }
    
    /* 견적요청, 차량예약  Step1 */
    @RequestMapping(value="/estimate/step1", method=RequestMethod.POST)
    public String getEstimateData(HttpServletRequest request, @RequestParam Map<String, String> param, Model model) throws Exception{
        if(param.get("seq") != null){
            
            CarDetail carDetail = rentService.getNewCarRentDetail(param);
            List<Map<String, Object>> optionList = rentService.getCarOption(param);
            List<Map<String, Object>> colorList = rentService.getCarColor(param);
            
            model.addAttribute("paramData", param);
            model.addAttribute("optionList",optionList);
            model.addAttribute("colorList",colorList);
            model.addAttribute("mainData",carDetail.getMainMap());
            model.addAttribute("estimateData",carDetail.getEstimateMap());
            
        }
        String referrer = request.getRequestURI(); //로그인시 현재의 페이지로 세팅
        request.getSession().setAttribute("presentPage", referrer);
        
        return "/rent/estimate/newCar/estimate_step1";
    }

    /* 견적요청, 차량예약  Step2*/
    @RequestMapping(value="/estimate/step2", method=RequestMethod.POST)
    public String getEstimateData2step(@RequestParam Map<String,String> param, Model model){
        Map<String, Object> resultMap = rentService.getEstimateData(param.get("estRegCode").toString());
        model.addAttribute("data", resultMap);
        model.addAttribute("paramData",param);
        
        return "/rent/estimate/newCar/estimate_step2";
    }
    
    /* 견적요청, 차량예약  Step3*/
    @RequestMapping(value={"/estimate/step3", "/estimate/smart/step3"}) //, method=RequestMethod.POST
    public String getEstimateData3step(HttpServletRequest request, HttpSession session, @RequestParam Map<String,String> param, Model model){
        try{
        	
            int checkResult = rentService.setEstimateCustomerInfo(param);
            if(checkResult == 1){            	
            	Map<String, Object> estimateMap = rentService.getEstimateData(param.get("regCode"));            	
                model.addAttribute("paramData", param);
                model.addAttribute("data",estimateMap);
                
                //담당직원에게 쿨메신저 알람                
                userService.insertEstimateInfoToCoolMsg(param);
                
                //메일발송
                //mailHelper.sendMail("[아마존카]차량 렌트 견적 상담 신청 확인 메일입니다",param.get("estEmail"),"test",param.get("estId"));
            }
        }catch(Exception e){            
        }
        return "/rent/estimate/smart/estimate_step3";
    }
    
    /* 재리스/재렌트 견적요청, 차량예약  Step1 */
    @SuppressWarnings("unchecked")
	@RequestMapping(value="/estimate/secondhand/step1"/*, method=RequestMethod.POST*/)
    public String getSecondhandEstimateData(HttpServletRequest request, HttpSession session, @RequestParam Map<String,String> param, Model model) throws Exception{
    	
    	//System.out.println(param);
    	
    	int useSessionCnt = 1;	//처음한번, 로그인할때만 세션을 이용하기 위한 변수
		  					  //세션에 param을 담을시 이전값을 불러와서 문제가 생김 >> 카운팅해서 세션을 비워줌     	
    	if (param.isEmpty()) {
	    	//param = (Map<String, String>) session.getAttribute("presentParam");
	    	param = null;
	    	//System.out.println(param);
	    	useSessionCnt ++;
    	}
    	//System.out.println(useSessionCnt);
    	
    	Map<String, Object> carMap = rentService.selectSecondhandCarDetail(param);
    	Map<String, Object> estimateMap = estiService.getSecondhandEstimateInfo(param);
    	
    	//System.out.println(carMap);
    	//System.out.println(estimateMap);
    	
    	//고객이 선택 가능한 대여개월수 목록 추출(maxMonth 에 따라 다르다)    	
    	if (carMap != null && !carMap.equals("")) {
    		int maxMonth = Integer.parseInt(carMap.get("MAX_USE_MON").toString()); //ex) moxMonth = 48
    		int maxVal = maxMonth / 6; // ex) val = 8
    		if (maxMonth % 6 > 0) { maxVal += 1; }
    		int monthArray[] = new int[maxVal-1];
    		for (int i = 1; i < maxVal; i++){
    			monthArray[i-1] = 6*i; //ex) 6,12,18 ... 48
    		}
    		
    		//가격정보 넣기
    		if (param.get("brTo") != null) {
		    	
    			if (param.get("brTo").toString().equals("5")) {
    				carMap.put("brTo", "0");
    			} else {
    				carMap.put("brTo", param.get("brTo").toString());
    			}
		    }
    		carMap.putAll(rentService.makeSecondhandRentPriceTable(carMap));
    		
    		model.addAttribute("data", carMap);
    		model.addAttribute("estimateData", estimateMap);
    		model.addAttribute("monthData", monthArray);
    		model.addAttribute("minMonth", monthArray[0]);
    		model.addAttribute("paramData", param);
    	}
    	
        String referrer = request.getRequestURI(); //로그인시 현재의 페이지로 세팅
        request.getSession().setAttribute("presentPage", referrer);
        
        if (useSessionCnt == 1) {
        	session.setAttribute("presentParam", param);
        } else {
        	session.setAttribute("presentParam", null);
        }
        return "/rent/estimate/secondhand/estimate_step1";
    }
    
	/*@SuppressWarnings("unchecked")
	@RequestMapping(value="/estimate/secondhand/step1", method=RequestMethod.GET)
    public String getSecondhandEstimateBlankPage(HttpSession session, @RequestParam Map<String,String> param, Model model){
    	
    	if(param.isEmpty()){
    		param = (Map<String, String>) session.getAttribute("presentParam");
    	
    	}   	
    	
        return "/rent/estimate/secondhand/estimate_step1";
    }*/
    
    
    /* 재리스/재렌트 차량선택 리스트 불러오기 */
    @RequestMapping(value = "/estimate/secondhand/list")
    public String getSecondHandRentList(@RequestParam Map<String, Object> param, Model model) throws Exception{
        
    	//주행거리 값 없을 때 기본적으로 10,000km로 설정
	    if (param.get("dist") == "" || param.get("dist") == null) {
	        param.put("dist", "10000");
	    }
    	
    	List<Map<String, Object>> resultList = rentService.getSecondhandRentList(param);
        Map<String, Object> EstiCommVarSh = rentService.getEstiCommVarEstimateSh();
        
        model.addAttribute("list", resultList);
        model.addAttribute("EstiCommVarSh", EstiCommVarSh);
	    model.addAttribute("param", param);
        /*if(param != null) {
            model.addAttribute("param", param);
        }*/
        return "/rent/estimate/secondhand/estimateList";
    }
    
    
    /* 재리스/재렌트 견적요청, 차량예약  Step2 */
    @RequestMapping(value="/estimate/secondhand/step2")
    public String getSecondhandEstimateData2step(@RequestParam Map<String,String> param, Model model){
        Map<String, Object> estimateMap = estiService.selectSecondhandEstimateMap(param.get("estRegCode").toString());
        
        model.addAttribute("paramData",param);
        model.addAttribute("data",estimateMap);
        
        return "/rent/estimate/secondhand/estimate_step2";
    }
    
    /* 재리스/재렌트 견적요청, 차량예약  Step3 */
    /*@RequestMapping(value="/estimate/secondhand/step3")
    public String getSecondhandEstimateData3step(@RequestParam Map<String,String> param, Model model){
        try{
            param.put("type","secondhand");
            rentService.setEstimateCustomerInfo(param);
        }catch(Exception e){            
        }finally{
            Map<String, Object> estimateMap = estiService.selectSecondhandEstimateMap(param.get("regCode"));
            model.addAttribute("paramData", param);
            model.addAttribute("data",estimateMap);
            
            //담당직원에게 쿨메신저 알람
            userService.insertEstimateInfoToCoolMsg(param);
        }
        return "/rent/estimate/secondhand/estimate_step3";
    }*/
    
    
    //견적요청시 DB에 update, insert 안되면 메신져 안보내지게 조건 체크(나머지는 위(주석처리)와동일)
    /* 재리스/재렌트 견적요청, 차량예약  Step3 */
    @RequestMapping(value="/estimate/secondhand/step3")
    public String getSecondhandEstimateData3step(@RequestParam Map<String,String> param, Model model){
    	
        try{
            param.put("type","secondhand");            
            int checkResult = rentService.setEstimateCustomerInfo(param);
            
            if(checkResult ==1){
            	Map<String, Object> estimateMap = estiService.selectSecondhandEstimateMap(param.get("regCode"));
                model.addAttribute("paramData", param);
                model.addAttribute("data",estimateMap);
                
                //담당직원에게 쿨메신저 알람
                userService.insertEstimateInfoToCoolMsg(param);
            }
            
        }catch(Exception e){            
        }
        return "/rent/estimate/secondhand/estimate_step3";
    }
    
    //스마트 견적관리
    @SuppressWarnings("unchecked")
	@RequestMapping(value="/estimate/smart/step1")
    public String getSmartEstimate1step(HttpServletRequest request, HttpSession session, @RequestParam Map<String,String> param, Model model) throws Exception{
    	
    	int useSessionCnt = 1;//처음한번, 로그인할때만 세션을 이용하기 위한 변수
    						  //세션에 param을 담을시 이전값을 불러와서 문제가 생김 >> 카운팅해서 세션을 비워줌  	
    	/*if(param.isEmpty()){
    		param = (Map<String, String>) session.getAttribute("presentParam");
    		useSessionCnt ++;
    	}*/
        List<Map<String, Object>> carCompList = estiService.selectCarCompList();
        model.addAttribute("paramData", param);
        model.addAttribute("compList",carCompList);
        //String referrer = request.getHeader("Referer");
        //request.getSession().setAttribute("prevPage", referrer);
        
        String referrer = request.getRequestURI(); //로그인시 현재의 페이지로 세팅
        request.getSession().setAttribute("presentPage", referrer);
        
        if(useSessionCnt == 1){
        	session.setAttribute("presentParam", param);
        }else{
        	session.setAttribute("presentParam", null);
        }
        
        return "/rent/estimate/smart/estimate_step1";
    }
    
    //스마트 견적관리
    @SuppressWarnings("unchecked")
    @RequestMapping(value="/estimate/smart/step1_test")
    public String getSmartEstimate1stepWebTest(HttpServletRequest request, HttpSession session, @RequestParam Map<String,String> param, Model model){
    	
    	int useSessionCnt = 1;//처음한번, 로그인할때만 세션을 이용하기 위한 변수
    	//세션에 param을 담을시 이전값을 불러와서 문제가 생김 >> 카운팅해서 세션을 비워줌  	
    	if(param.isEmpty()){
    		param = (Map<String, String>) session.getAttribute("presentParam");
    		useSessionCnt ++;
    	}
    	List<Map<String, Object>> carCompList = estiService.selectCarCompList();
    	model.addAttribute("paramData", param);
    	model.addAttribute("compList",carCompList);
    	//String referrer = request.getHeader("Referer");
    	//request.getSession().setAttribute("prevPage", referrer);
    	
    	String referrer = request.getRequestURI(); //로그인시 현재의 페이지로 세팅
    	request.getSession().setAttribute("presentPage", referrer);
    	
    	if(useSessionCnt == 1){
    		session.setAttribute("presentParam", param);
    	}else{
    		session.setAttribute("presentParam", null);
    	}
    	
    	return "/rent/estimate/smart/estimate_step1_test";
    }
    
    //스마트 견적관리
    @RequestMapping(value="/estimate/smart/step2")
    public String getSmartEstimate2step(@RequestParam Map<String,String> param, Model model){
        Map<String, Object> resultMap = rentService.getEstimateData(param.get("estRegCode").toString());        
        model.addAttribute("data", resultMap);
        model.addAttribute("paramData",param);
        
        //System.out.println("data : " + resultMap);
        //System.out.println("paramData : " + param);
        
        return "/rent/estimate/smart/estimate_step2";
    }
    
    /* 월렌트 차량예약  */
    @SuppressWarnings("unchecked")
	@RequestMapping(value="/reserve/month/step1"/*, method = RequestMethod.POST*/)
    public String getMonthReserveData(HttpServletRequest request, HttpSession session, 
    		User user, @RequestParam Map<String,String> param, Model model) throws Exception{
    	
    	//System.out.println("before param : " + param);
    	//System.out.println("param.isEmpty() : " + param.isEmpty());
    	String userEmail = user.getEmail();
    	//처음한번, 로그인할때만 세션을 이용하기 위한 변수
    	int useSessionCnt = 1;
        //세션에 param을 담을시 이전값을 불러와서 문제가 생김 >> 카운팅해서 세션을 비워줌     
    	if(param.isEmpty()){
    		param = (Map<String, String>) session.getAttribute("presentParam");
    		useSessionCnt ++;
    	}
    	//System.out.println("useSessionCnt : " + useSessionCnt);
    	
    	Map<String, Object> carMap = rentService.selectMonthCarDetail(param);
        Map<String, Object> estimateMap = estiService.getSecondhandEstimateInfo(param);
        model.addAttribute("regCode", estimateMap.get("REG_CODE"));
        model.addAttribute("data", carMap);
        model.addAttribute("paramData", param);
        model.addAttribute("rentLocationCode", param.get("rentLocationCode"));
        model.addAttribute("rentManagedId", param.get("rentManagedId"));
        model.addAttribute("userEmail", userEmail);        
        
        //String referrer = "/rent/month"; //로그인시 현재의 페이지로 세팅
        String referrer = request.getRequestURI(); //로그인시 현재의 페이지로 세팅
        request.getSession().setAttribute("presentPage", referrer); 
        
        if (useSessionCnt == 1) {
        	session.setAttribute("presentParam", param);
        } else {
        	session.setAttribute("presentParam", null);
        }
        
        //System.out.println("after param : " + param);
        //System.out.println("presentParam : " + session.getAttribute("presentParam"));
        
        return "/rent/estimate/month/estimate_step1";
    }
    
    //월렌트 차량예약 step1 + step2 (2017.07.18)
    @RequestMapping(value="/reserve/month")
    public String reserveMonthRent2(@RequestParam Map<String,String> param, Model model) throws UnsupportedEncodingException, Exception{
    	
    	Map<String, Object> resResult = estiService.insertReserveInfo(param);
        String estId = (String) resResult.get("newEstimateId");
        String res_st_dt = (String) resResult.get("RES_ST_DT");
        String res_end_dt = (String) resResult.get("RES_END_DT");
        String carManagedId = param.get("carManagedId");
        String estEmail = param.get("estEmail");
        String rentManagedId = param.get("rentManagedId");
        String rentLocationCode = param.get("rentLocationCode");
        
        int result = estiService.checkReserveRank(carManagedId);
        Map<String, Object> customerMap = estiService.selectCustomerInfo(estId);
        
        //강제로 session 을 박는다 
        //session.setAttribute("","");
        //status.setComplete(); //sessionAttribute 날린다       
        
        /* 차량예약 확정처리 */
        param.put("rank", Integer.toString(result));
        param.put("estimateId", estId);
        
        boolean flag = estiService.checkExistReservation(estId);
        if(!flag){ //차량예약 중복이 아니면
            estiService.confirmReservation(param);
        }
        Map<String, Object> carMap = rentService.selectMonthCarDetail(param);
        List<Map<String, Object>> driverList = rentService.selectDriverList(estId);
        //String reserveSeq = estiService.selectShResSeq(param.get("estimateId"));
        Map<String, Object> branchMap = userService.getBranch(String.valueOf(carMap.get("BR_ID")));
        
        model.addAttribute("data",carMap);
        model.addAttribute("custData",customerMap);
        model.addAttribute("param",param);
        model.addAttribute("driverList",driverList);
        model.addAttribute("branch",branchMap);
        
        //model.addAttribute("rank", param.get("rank"));
        //model.addAttribute("reserveSeq",reserveSeq);
        param.put("res_end_dt", res_end_dt);
        param.put("car_no", (String) carMap.get("CAR_NO_R"));
		String br_nm = String.valueOf(branchMap.get("BR_NM"));
        String br_tel = String.valueOf(branchMap.get("TEL"));
        
        //차량 예약 확인 메일 발송
        String mailUrl = "http://fms1.amazoncar.co.kr/mailing/homepage/reserve_format.jsp?carManagedId=" + carManagedId + 
        		         "&rentManagedId=" + rentManagedId + "&rentLocationCode=" + rentLocationCode + "&rank="+result + 
        		         "&estId=" + estId + "&res_st_dt=" + res_st_dt + "&res_end_dt=" + res_end_dt+
        		         "&br_nm=" + URLEncoder.encode(br_nm, "EUC-KR") + "&br_tel=" + br_tel;
        
        boolean e_result = false;
    	String regex = "^[_a-z0-9-]+(.[_a-z0-9-]+)*@(?:\\w+\\.)+\\w+$";
    	Pattern p = Pattern.compile(regex); 
    	Matcher m = p.matcher(estEmail); 
    	if (m.matches()) {
    		e_result = true;
    	}
    	
    	if (e_result == true) {
    		mailHelper.sendMailforAuth("[아마존카]차량 예약 확인 메일입니다", estEmail, mailUrl, "monthRsv", estEmail);
    	}
        
        //차량 예약시 해당 영업 지점 직원들에게 쿨메신져
        userService.insertReserveMonthRentInfoToCoolMsg(param);
        
        //고객에게 문자 보내기
        userService.insertSendSMSForReserve(param);
        
        return "/rent/estimate/month/estimate_step3";        
        
    }    
    
    /* 월렌트 차량예약 취소 */
    @ResponseBody
    @RequestMapping(value="/cancel/month")
    public int cancelMonthRent(@RequestBody Map<String,String> param){
        int sResult = estiService.cancelMonthRent(param);
        return sResult;
    }
    
    /* 월렌트 차량 예약 */
    /*@RequestMapping(value="/reserve/month/step2", method=RequestMethod.GET)
    public String reserveMonthRentStep2(HttpSession session, @ModelAttribute("estId") String estId,@ModelAttribute("carManagedId") String carManagedId, @ModelAttribute("rentLocationCode") String rentLocationCode,
                                        @ModelAttribute("rentManagedId") String rentManagedId,@ModelAttribute("estEmail") String estEmail,
                                        @RequestParam Map<String,String> param, Model model, SessionStatus status){
        if(carManagedId == null || carManagedId.equals("")){
            model.addAttribute("message","잘못된 접근입니다");
            return "error";
        }else{
            int result = estiService.checkReserveRank(carManagedId);
            Map<String, Object> customerMap = estiService.selectCustomerInfo(estId);
            
            model.addAttribute("estimateId",estId);
            model.addAttribute("carManagedId",carManagedId);
            model.addAttribute("rentManagedId",rentManagedId);
            model.addAttribute("rentLocationCode",rentLocationCode);
           
            model.addAttribute("rank",result);
            model.addAttribute("data",customerMap);

            //차량 예약 확인 메일 발송
            String mailUrl = "http://fms1.amazoncar.co.kr/mailing/homepage/reserve_format.jsp?carManagedId=" + carManagedId + "&rentManagedId=" + rentManagedId + "&rentLocationCode=" + rentLocationCode + "&rank="+result + "&estId=" + estId;
            mailHelper.sendMailforAuth("[아마존카]차량 예약 확인 메일입니다",estEmail,mailUrl,"monthRsv",estEmail);
            
            //강제로 session 을 박는다 
            session.setAttribute("","");
            status.setComplete(); //sessionAttribute 날린다
            return "/rent/estimate/month/estimate_step2";
        }
    }*/
    
    /* 월렌트 차량예약  */
    /*@RequestMapping(value="/reserve/month/step3", method=RequestMethod.POST)
    public String reserveMonthRentStep3(@RequestParam Map<String,String> param, Model model){
         차량예약 확정처리 
        boolean flag = estiService.checkExistReservation(param.get("estimateId"));
        if(!flag){ //차량예약 중복이 아니면
            estiService.confirmReservation(param);
        }
        
        Map<String, Object> customerMap = estiService.selectCustomerInfo(param.get("estimateId"));
        Map<String, Object> carMap = rentService.selectMonthCarDetail(param);
        List<Map<String, Object>> driverList = rentService.selectDriverList(param.get("estimateId"));
        //String reserveSeq = estiService.selectShResSeq(param.get("estimateId"));
       
        model.addAttribute("data",carMap);
        model.addAttribute("custData",customerMap);
        model.addAttribute("param",param);
        model.addAttribute("driverList",driverList);
        
        //model.addAttribute("rank", param.get("rank"));
        //model.addAttribute("reserveSeq",reserveSeq);
        
        return "/rent/estimate/month/estimate_step3";
    }*/
    
    /* 월렌트 차량예약  */
    /*@RequestMapping(value="/reserve/month/step3", method=RequestMethod.GET)
    public String reserveMonthRentStep3get(@RequestParam Map<String,String> param, Model model){
        Map<String, Object> customerMap = estiService.selectCustomerInfo(param.get("estimateId"));
        Map<String, Object> carMap = rentService.selectMonthCarDetail(param);
        List<Map<String, Object>> driverList = rentService.selectDriverList(param.get("estimateId"));
        
        model.addAttribute("driverList",driverList);
        model.addAttribute("data",carMap);
        model.addAttribute("custData",customerMap);
        model.addAttribute("rank", param.get("rank"));
        model.addAttribute("param",param);
        
        return "/rent/estimate/month/estimate_step3";
    }*/
    
    /* 월렌트 차량예약  수정 */
    @RequestMapping(value="/reserve/month/step3/modify", method=RequestMethod.POST)
    public String modifyMonthRentStep3(@RequestParam Map<String,String> param, Model model){
        Map<String, Object> customerMap = estiService.selectCustomerInfo(param.get("estimateId"));
        Map<String, Object> carMap = rentService.selectMonthCarDetail(param);
        List<Map<String, Object>> driverList = rentService.selectDriverList(param.get("estimateId"));
        
        model.addAttribute("driverList",driverList);
        model.addAttribute("data",carMap);
        model.addAttribute("custData",customerMap);
        model.addAttribute("param",param);
        
        return "/rent/estimate/month/estimate_step3_modify";
    }
    
    /* 월렌트 차량예약  수정 */
    @RequestMapping(value="/modify/month/step3", method=RequestMethod.POST)
    public String modifyMonthCustomerInfo(@RequestParam Map<String,String> param, Model model){
        estiService.modifyCustomerInfo(param);
        estiService.deleteDriverInfo(param.get("estimateId"));
        estiService.insertDriverInfo(param);
        
        String url = "redirect:/reserve/month/step3?estimateId="+param.get("estimateId")+"&carManagedId="+param.get("carManagedId")+
                     "&rentManagedId="+param.get("rentManagedId") + "&rentLocationCode="+param.get("rentLocationCode");
        
        return url;
    }
    
    /* 견적 전에 견적 카운트 계산, 또는 상담 요청하면 마이너스 해주기 */
    @ResponseBody
    @RequestMapping(value="/auth/check", method=RequestMethod.POST)
    public boolean checkEstimateCount(@RequestBody Map<String,String> param){
        boolean flag = estiService.checkEstimateCount(param);
        return flag;
    }
    
    /* 신차 견적 계산*/
    @ResponseBody
    @RequestMapping(value="/calculate", method=RequestMethod.POST)
    public Map<String, Object> insertEstimateData(@RequestBody Map<String,String> param, Model model) throws Exception {
    	String print_type = param.get("print_type");
    	String a_a = param.get("a_a");
    	
    	if (print_type.equals("6")) {
    		if (a_a.equals("22") || a_a.equals("12")) { // 기본식일 경우 인수반납선택형
    			param.put("return_select", "0");
    		} else if (a_a.equals("21") || a_a.equals("11")) { // 일반식일 경우 반납형
    			param.put("return_select", "1");
    		}
    	} else {
    		param.put("return_select", "");
    	}
    	
        Map<String, Object> resultMap = new HashMap<String, Object>();
        
        //System.out.println(param);
        
        try{
            String regCode = estiService.insertEstimateData(param);
            resultMap = estiService.getEstimateFeePerMonth(regCode, "", "", "");            
        }catch(Exception e){
            resultMap.put("message",e.getMessage());
        }
        return resultMap;
    }
    
    /* 인수가 조정 견적 */
    @ResponseBody
    @RequestMapping(value="/recalculate", method=RequestMethod.POST)
    public Map<String, Object> updateEstimateData(@RequestBody Map<String,String> param, Model model) throws Exception{
        Map<String, Object> resultMap = new HashMap<String, Object>();
        try {
            estiService.updateEstimateData(param);
            resultMap = estiService.getEstimateFeePerMonth(param.get("regCode"), "recalculate","","");
        } catch(Exception e) {
            resultMap.put("message", e.getMessage());
        }
        return resultMap;
    }
    
    /* 중고차 견적 계산 */
    @ResponseBody
    @RequestMapping(value="/calculate/secondhand")
    public Map<String, Object> insertSecondhandEstimateData(@RequestBody Map<String, String> param, Model model) throws ParseException, Exception{
        
    	Map<String, Object> resultMap = new HashMap<String, Object>();
        Map<String, Object> estimateMap = estiService.getSecondhandEstimateInfo(param);
        
        estimateMap.putAll(param);
        String car_comp_id = (String)estimateMap.get("CAR_COMP_ID");
        String a_a = (String)estimateMap.get("A_A");
        
        //자차면책금 선택한 금액으로 견적되어지게 수정 2017.10.10(기존 : 선택한 자차면책금과는 무관하게 EATIMATE_SH 테이블의 정보대로 견적되어짐)
        if (!param.get("car_ja").equals("") && param.get("car_ja") != null) {
        	estimateMap.put("CAR_JA", param.get("car_ja"));
        }
        
        String br_from = "0";
        if (!param.get("brFrom").equals("") && param.get("brFrom") != null) {        	
			if (param.get("brFrom").equals("S1")) {
				br_from = "0";
			} else if (param.get("brFrom").equals("D1")) {
				br_from = "1";
			} else if (param.get("brFrom").equals("G1")) {
				br_from = "2";
			} else if (param.get("brFrom").equals("J1")) {
				br_from = "3";
			} else if (param.get("brFrom").equals("B1")) {
				br_from = "4";
			}
			estimateMap.put("BR_FROM", br_from);
        } else {
        	estimateMap.put("BR_FROM", br_from);
        }
        
        if (!param.get("brTo").equals("") && param.get("brTo") != null) {
        	if (param.get("brTo").equals("5")) {
        		estimateMap.put("BR_TO", "0");
        	} else {
        		estimateMap.put("BR_TO", param.get("brTo"));
        	}
        	estimateMap.put("BR_TO_ST", param.get("brTo"));
        } else {
        	estimateMap.put("BR_TO", "0");
        	estimateMap.put("BR_TO_ST", "0");
        }
        
        //System.out.println("calculate >>> " + estimateMap);
        
        String regCode = rentService.insertSecondhandEstimateInfo(estimateMap);
        //System.out.println("calculate >>> " + regCode);
        resultMap = estiService.getEstimateFeePerMonth(regCode, "secondhand", car_comp_id, a_a);
        
        return resultMap;
    }
    
    /* 스마트 견적에서 제조사 가져오기 */
    @ResponseBody
    @RequestMapping(value="/control/smart/carCompany", method=RequestMethod.POST)
    public List<Map<String, Object>> getCarCompanyList(){
    	List<Map<String, Object>> carCompMap = estiService.getCarCompanyList();
    	return carCompMap;
    }
    
    /* 스마트 견적에서 제조사에 따라 차명 갖고오기 */
    @ResponseBody
    @RequestMapping(value="/control/smart/carName", method=RequestMethod.POST)
    public List<Map<String, Object>> getCarNameList(@RequestBody Map<String, Object> param, Model model){
        List<Map<String, Object>> carNameMap = estiService.getCarNameList(param);
        return carNameMap;
    }
    
    /* 스마트 견적에서 제조사에 따라 차종 갖고오기 */
    @ResponseBody
    @RequestMapping(value="/control/smart/carDetail", method=RequestMethod.POST)
    public Map<String, Object> getCarDetailList(@RequestBody Map<String, Object> param, Model model){
        List<Map<String, Object>> carNameMap = estiService.getCarDetailList(param);
        //Map<String, Object> DCInfo = rentService.getCarDCAmt(param);
        //String DCAmt = estiService.getSmartCarDcAmt(param);
        
        Map<String,String> optionParam = new HashMap<String, String>();
        optionParam.put("carCode",param.get("carCode").toString());
        optionParam.put("carCompId",param.get("carCompId").toString());
        optionParam.put("type","smart");
       
        for(int i=0; i<carNameMap.size(); i++){ 
        	//사양보기 시에 선택사양도 보여지게 처리(2018.01.18)
            optionParam.put("carId",carNameMap.get(i).get("ID").toString());
            List<Map<String, Object>> optionList = rentService.getCarOption(optionParam);
            carNameMap.get(i).put("optionList",optionList);
            
            //상위 사양 뽑기
			if(carNameMap.get(i).get("CAR_B_INC_ID") != null){ //상위 사양 ID가 있으면
				Map<String,String> specParam = new HashMap<String,String>();
				specParam.put("parentCarId",carNameMap.get(i).get("CAR_B_INC_ID").toString());
				specParam.put("parentCarSeq",carNameMap.get(i).get("CAR_B_INC_SEQ").toString());
				List<Map<String, Object>> specList = rentService.selectParentSpec(specParam);
				carNameMap.get(i).put("specList",specList);
				carNameMap.get(i).put("spec",specList.get(0).get("CAR_NAME"));
			}
        }
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("carNameList",carNameMap);
                
        return resultMap;
    }
    
    /* 스마트 견적에서 차량 정보에 따라 DC 정보 갖고 오기 */
    @ResponseBody
    @RequestMapping(value="/control/smart/carDCAmt", method=RequestMethod.POST)
    public Map<String, Object> getSmartCarDcAmt(@RequestBody Map<String,String> param, Model model){
       Map<String, Object> dcInfo = new HashMap<String, Object>();
       dcInfo = estiService.getSmartCarDcAmt(param);
       return dcInfo; 
    }
    
    /* 스마트 견적에서 차량 정보에 따라 옵션 정보 갖고 오기 */
    @ResponseBody
    @RequestMapping(value="/control/smart/carOptions", method=RequestMethod.POST)
    public List<Map<String, Object>> getCarOptionList(@RequestBody Map<String,String> param, Model model){
        param.put("type","smart");        
        List<Map<String, Object>> optionList = rentService.getCarOption(param);
        return optionList; 
    }
    
    /* 스마트 견적에서 차량 정보에 따라 색상 정보 갖고 오기 */
    @ResponseBody
    @RequestMapping(value="/control/smart/carColors", method=RequestMethod.POST)
    public List<Map<String, Object>> getCarColorList(@RequestBody Map<String,String> param, Model model){
        List<Map<String, Object>> colorList = rentService.getCarColor(param);
        return colorList; 
    }
    
    /* 스마트 견적에서 차량 정보에 따라 메인 코드 정보 갖고 오기 */
    @ResponseBody
    @RequestMapping(value="/control/smart/carCodes", method=RequestMethod.POST)
    public Map<String, Object> getCarMainCode(@RequestBody Map<String,String> param, Model model){
        Map<String, Object> resultMap = estiService.getCarMainCode(param);
        return resultMap; 
    }
    
    // jjlim 재렌트/재리스 리스트 가져오기
    @ResponseBody
    @RequestMapping(value="/control/smart/secondhand/carlist", method=RequestMethod.POST)
    public List<Map<String, Object>> getSecondHandCarList(@RequestBody Map<String, Object> param) {
        List<Map<String, Object>> resultList = rentService.getSecondhandRentList(param);

        for (Map<String, Object> result1 : resultList) {
            result1.remove("E_ROWID");
            result1.remove("SR_ROWID");
        }
        return resultList;
    }

    // jjlim 재렌트/재리스 차량정보 가져오기
    @ResponseBody
    @RequestMapping(value="/control/smart/secondhand/carinfo", method=RequestMethod.POST)
    public Map<String, Object> getSecondHandCarInfo(@RequestBody Map<String, String> param) {
    	
        Map<String, Object> carInfo = rentService.selectSecondhandCarDetail(param);
        Map<String, Object> estimateInfo = estiService.getSecondhandEstimateInfo(param);

        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("car", carInfo);
        resultMap.put("esti", estimateInfo);
        
        return resultMap;
    }

    /* jjlim 상담요청 */
	@ResponseBody
    @RequestMapping(value={"/control/smart/consult/request"}, method=RequestMethod.POST)
    public int estiConsultRequest(@RequestBody Map<String,String> param) throws Exception{
        //Map<String, Object> estimateMap = null;
    	int result = 0;
    	
        // 인코딩
        String companyName = (param.get("companyName") != null) ? URLDecoder.decode(param.get("companyName"),"UTF-8") : " ";
        String carName = (param.get("carName") != null) ? URLDecoder.decode(param.get("carName"),"UTF-8") : " ";
        String carDetailName = (param.get("carDetailName") != null) ? URLDecoder.decode(param.get("carDetailName"),"UTF-8") : " ";
        String carDiesel = (param.get("carDiesel") != null) ? URLDecoder.decode(param.get("carDiesel"),"UTF-8") : " ";
        String estArea = (param.get("estArea") != null) ? URLDecoder.decode(param.get("estArea"),"UTF-8") : " ";
        String etc = (param.get("etc") != null) ? URLDecoder.decode(param.get("etc"),"UTF-8") : " ";
        String estBusiness = (param.get("estBusiness") != null) ? URLDecoder.decode(param.get("estBusiness"),"UTF-8") : " ";
        String estAgent = (param.get("estAgent") != null) ? URLDecoder.decode(param.get("estAgent"),"UTF-8") : " ";
        String estName = (param.get("estName") != null) ? URLDecoder.decode(param.get("estName"),"UTF-8") : " ";
        String estSido = (param.get("estSido") != null) ? URLDecoder.decode(param.get("estSido"),"UTF-8") : " ";
        String estGugun = (param.get("estGugun") != null) ? URLDecoder.decode(param.get("estGugun"),"UTF-8") : " ";
        
        param.put("companyName", companyName);
        param.put("carName", carName);
        param.put("carDetailName", carDetailName);
        param.put("carDiesel", carDiesel);
        param.put("estArea", estArea);
        param.put("etc", etc);
        param.put("estBusiness", estBusiness);
        param.put("estAgent", estAgent);
        param.put("estName", estName);
        param.put("estSido", estSido);
        param.put("estGugun", estGugun);

        try{
            result = rentService.setEstimateCustomerInfo(param);
            
            //담당직원에게 쿨메신저 알람
            userService.insertEstimateInfoToCoolMsg(param);
            
        }catch(Exception e){            
        }finally{
            //estimateMap = rentService.getEstimateData(param.get("regCode")); // <-- 인수가조정 견적을 가져오는건데 모바일 신차견적후 상담요청 에서는 잘됨.
            																   // 모바일 재렌트 견적 후 상담요청시 에러발생. 쿼리중 job = 'org' 때문인데
            											 					   // 결정적으로 소스는 있는데 이후에 조회한 데이터를 쓰는곳이 없음.(주석처리!!) (2017.11.29)
        												    				   // (객체선언형식 Map이었는데 int로 바꿈.)
            //담당직원에게 쿨메신저 알람
            // userService.insertEstimateInfoToCoolMsg(param);

            //메일발송
            //mailHelper.sendMail("[아마존카]차량 렌트 견적 상담 신청 확인 메일입니다",param.get("estEmail"),"test",param.get("estId"));
        }
        return result;
    }

    /* jjlim 월렌트 차량예약 (차정보 가져오기)  */
    @ResponseBody
    @RequestMapping(value="/control/smart/month/carinfo", method=RequestMethod.POST)
    public Map<String, Object> monthCarInfo(@RequestBody Map<String,String> param){
        Map<String, Object> resultMap;

        try {
            Map<String, Object> carMap = rentService.selectMonthCarDetail(param);
            Map<String, Object> estimateMap = estiService.getSecondhandEstimateInfo(param);

            resultMap = new HashMap<>();
            resultMap.put("car", carMap);
            resultMap.put("esti", estimateMap);

        } catch(Exception e){
            throw e;
        }

        return resultMap;
    }

    /* jjlim 월렌트 차량예약 (예약 정보) */
    /*@ResponseBody
    @RequestMapping(value="/control/smart/month/info", method = RequestMethod.POST)
    public String monthInfo(@RequestBody Map<String,String> param) throws Exception{
        String estId = "";

        // 인코딩
        String etc = (param.get("etc") != null) ? URLDecoder.decode(param.get("etc"),"UTF-8") : " ";
        String carName = (param.get("carName") != null) ? URLDecoder.decode(param.get("carName"),"UTF-8") : " ";
        String estArea = (param.get("estArea") != null) ? URLDecoder.decode(param.get("estArea"),"UTF-8") : " ";
        String estBusiness = (param.get("estBusiness") != null) ? URLDecoder.decode(param.get("estBusiness"),"UTF-8") : " ";
        String estBusinessYear = (param.get("estBusinessYear") != null) ? URLDecoder.decode(param.get("estBusinessYear"),"UTF-8") : " ";
        String driverYear = (param.get("driverYear") != null) ? URLDecoder.decode(param.get("driverYear"),"UTF-8") : " ";
        String estCEO = (param.get("estCEO") != null) ? URLDecoder.decode(param.get("estCEO"),"UTF-8") : " ";
        String estAgent = (param.get("estAgent") != null) ? URLDecoder.decode(param.get("estAgent"),"UTF-8") : " ";
        String estName = (param.get("estName") != null) ? URLDecoder.decode(param.get("estName"),"UTF-8") : " ";
        String addr1 = (param.get("addr1") != null) ? URLDecoder.decode(param.get("addr1"),"UTF-8") : " ";
        String addr2 = (param.get("addr2") != null) ? URLDecoder.decode(param.get("addr2"),"UTF-8") : " ";
      
        param.put("etc", etc);
        param.put("carName", carName);
        param.put("estArea", estArea);
        param.put("estBusiness", estBusiness);
        param.put("estBusinessYear", estBusinessYear);
        param.put("driverYear", driverYear);
        param.put("estCEO", estCEO);
        param.put("estAgent", estAgent);
        param.put("estName", estName);
        param.put("addr1", addr1);
        param.put("addr2", addr2);
        
        try {
            estId = estiService.insertReserveInfo(param);

        } catch(Exception e){
            throw e;
        }

        return estId;
    }*/

    /* jjlim 월렌트 차량예약 (추가 정보) */
    /*@ResponseBody
    @RequestMapping(value="/control/smart/month/reserve", method=RequestMethod.POST)
    public Map<String, Object> monthReserve(@RequestBody Map<String,String> param) throws Exception{
        Map<String, Object> resultMap;
        // 인코딩
        String bank = (param.get("bank") != null) ? URLDecoder.decode(param.get("bank"),"UTF-8") : " ";
        String driverName1 = (param.get("driverName1") != null) ? URLDecoder.decode(param.get("driverName1"),"UTF-8") : " ";
        String driverName2 = (param.get("driverName2") != null) ? URLDecoder.decode(param.get("driverName2"),"UTF-8") : " ";
        
        param.put("bank", bank);
        param.put("driverName1", driverName1);
        param.put("driverName2", driverName2);

        try {
             차량예약 확정처리 
            boolean flag = estiService.checkExistReservation(param.get("estimateId"));
            if (!flag) { //차량예약 중복이 아니면
                estiService.confirmReservation(param);
            }
            Map<String, Object> customerMap = estiService.selectCustomerInfo(param.get("estimateId"));
            Map<String, Object> carMap = rentService.selectMonthCarDetail(param);
            List<Map<String, Object>> driverList = rentService.selectDriverList(param.get("estimateId"));

            resultMap = new HashMap<>();
            resultMap.put("customer", customerMap);
            resultMap.put("car", carMap);
            resultMap.put("driver", driverList);

        } catch (Exception e) {
            throw e;
        }

        return resultMap;
    }*/
    
    //모바일(월렌트 차량예약)(인코딩 부분 등 hp와 상이한부분이 존재해 따로 만든듯)     
    @ResponseBody
    @RequestMapping(value="/control/smart/month/reserve2", method = {RequestMethod.POST, RequestMethod.GET})
    public Map<String, Object> monthReserve2(@RequestBody Map<String,String> param) throws Exception{
        String estId = "";

        // 인코딩
        String etc = (param.get("etc") != null) ? URLDecoder.decode(param.get("etc"),"UTF-8") : " ";
        String carName = (param.get("carName") != null) ? URLDecoder.decode(param.get("carName"),"UTF-8") : " ";
        String estArea = (param.get("estArea") != null) ? URLDecoder.decode(param.get("estArea"),"UTF-8") : " ";
        String estBusiness = (param.get("estBusiness") != null) ? URLDecoder.decode(param.get("estBusiness"),"UTF-8") : " ";
        String estBusinessYear = (param.get("estBusinessYear") != null) ? URLDecoder.decode(param.get("estBusinessYear"),"UTF-8") : " ";
        String driverYear = (param.get("driverYear") != null) ? URLDecoder.decode(param.get("driverYear"),"UTF-8") : " ";
        String estCEO = (param.get("estCEO") != null) ? URLDecoder.decode(param.get("estCEO"),"UTF-8") : " ";
        String estAgent = (param.get("estAgent") != null) ? URLDecoder.decode(param.get("estAgent"),"UTF-8") : " ";
        String estName = (param.get("estName") != null) ? URLDecoder.decode(param.get("estName"),"UTF-8") : " ";
        String addr1 = (param.get("addr1") != null) ? URLDecoder.decode(param.get("addr1"),"UTF-8") : " ";
        String addr2 = (param.get("addr2") != null) ? URLDecoder.decode(param.get("addr2"),"UTF-8") : " ";
        String driverName1 = (param.get("driverName1") != null) ? URLDecoder.decode(param.get("driverName1"),"UTF-8") : " ";
        String driverName2 = (param.get("driverName2") != null) ? URLDecoder.decode(param.get("driverName2"),"UTF-8") : " ";
        String driverNumber1 = (param.get("driverNumber1") != null) ? URLDecoder.decode(param.get("driverNumber1"),"UTF-8") : " ";
        String driverNumber2 = (param.get("driverNumber2") != null) ? URLDecoder.decode(param.get("driverNumber2"),"UTF-8") : " ";
        String carManagedId = (param.get("carManagedId") != null) ? URLDecoder.decode(param.get("carManagedId"),"UTF-8") : " ";
        String rentManagedId = (param.get("rentManagedId") != null) ? URLDecoder.decode(param.get("rentManagedId"),"UTF-8") : " ";
        String rentLocationCode = (param.get("rentLocationCode") != null) ? URLDecoder.decode(param.get("rentLocationCode"),"UTF-8") : " ";
        String estEmail = (param.get("estEmail") != null) ? URLDecoder.decode(param.get("estEmail"),"UTF-8") : " ";
        String car_use_addr1 = (param.get("car_use_addr1") != null) ? URLDecoder.decode(param.get("car_use_addr1"),"UTF-8") : " ";
        String car_use_addr2 = (param.get("car_use_addr2") != null) ? URLDecoder.decode(param.get("car_use_addr2"),"UTF-8") : " ";
        int result = estiService.checkReserveRank(carManagedId);
        
        param.put("etc", etc);
        param.put("carName", carName);
        param.put("estArea", estArea);
        param.put("estBusiness", estBusiness);
        param.put("estBusinessYear", estBusinessYear);
        param.put("driverYear", driverYear);
        param.put("estCEO", estCEO);
        param.put("estAgent", estAgent);
        param.put("estName", estName);
        param.put("addr1", addr1);
        param.put("addr2", addr2);
        param.put("driverName1", driverName1);
        param.put("driverName2", driverName2);
        param.put("driverNumber1", driverNumber1);
        param.put("driverNumber2", driverNumber2);
        param.put("car_use_addr1", car_use_addr1);
        param.put("car_use_addr2", car_use_addr2);
        
        Map<String, Object> resultMap;
        
        try {
        	Map<String, Object> resResult = estiService.insertReserveInfo(param);
        	estId = (String) resResult.get("newEstimateId");
        	String res_st_dt = (String) resResult.get("RES_ST_DT");
            String res_end_dt = (String) resResult.get("RES_END_DT");
            //estId = estiService.insertReserveInfo(param);
            param.put("estimateId", estId);
            param.put("res_end_dt", res_end_dt);
            
            // 차량예약 확정처리 
            //boolean flag = estiService.checkExistReservation(param.get("estimateId"));
            boolean flag = estiService.checkExistReservation(estId);
            if (!flag) { //차량예약 중복이 아니면
                estiService.confirmReservation(param);
            }
            Map<String, Object> customerMap = estiService.selectCustomerInfo(estId);
            Map<String, Object> carMap = rentService.selectMonthCarDetail(param);
            List<Map<String, Object>> driverList = rentService.selectDriverList(estId);
            param.put("car_no", (String) carMap.get("CAR_NO_R"));
            Map<String, Object> branchMap = userService.getBranch(String.valueOf(carMap.get("BR_ID")));
            String br_nm = String.valueOf(branchMap.get("BR_NM"));
            String br_tel = String.valueOf(branchMap.get("TEL"));
            
            //차량 예약 확인 메일 발송
            String mailUrl = "http://fms1.amazoncar.co.kr/mailing/homepage/reserve_format.jsp?carManagedId=" + carManagedId +
            				 "&rentManagedId=" + rentManagedId + "&rentLocationCode=" + rentLocationCode + "&rank="+result + 
            				 "&estId=" + estId + "&res_st_dt=" + res_st_dt + "&res_end_dt=" + res_end_dt +
            				 "&br_nm=" + URLEncoder.encode(br_nm, "EUC-KR") + "&br_tel=" + br_tel;
            
            boolean e_result = false;
        	String regex = "^[_a-z0-9-]+(.[_a-z0-9-]+)*@(?:\\w+\\.)+\\w+$";
        	Pattern p = Pattern.compile(regex);
        	Matcher m = p.matcher(estEmail);
        	if (m.matches()) {
        		e_result = true;
        	}
        	
        	if (e_result == true) {
        		mailHelper.sendMailforAuth("[아마존카]차량 예약 확인 메일입니다", estEmail, mailUrl, "monthRsv", estEmail);
        	}
            
            //차량 예약시 해당 영업 지점 직원들에게 쿨메신져
            userService.insertReserveMonthRentInfoToCoolMsg(param);
            
            //차량 예약시 고객에게 문자발송
            userService.insertSendSMSForReserve(param);
            
            resultMap = new HashMap<>();
            resultMap.put("customer", customerMap);
            resultMap.put("car", carMap);
            resultMap.put("driver", driverList);
            resultMap.put("branch", branchMap);
            
        } catch(Exception e) {
            throw e;
        } 
        
        return resultMap;
    }
    
    /*
     * 메일 인증하기
     * */
    @ResponseBody
    @RequestMapping(value="/estimate/auth", method=RequestMethod.POST)
    public Map<String, Object> sendEmailAuthLink(@RequestBody String email, String sendEmail) throws Exception{
        Map<String, Object> resultMap = new HashMap<String, Object>();
        
        resultMap = memberService.makeTokenToEmail(email);
        String token = (String) resultMap.get("token");
        resultMap.put("data",email);
        
        /*if(!sendEmail.equals("")){	//email이 sendEmail로 바뀐다(변수명 주의!!) - 소셜 로그인시 이메일정보 없을경우 때문에 추가
        	email = sendEmail;        	
        }*/
        
        boolean result = false;
    	String regex = "^[_a-z0-9-]+(.[_a-z0-9-]+)*@(?:\\w+\\.)+\\w+$";
    	Pattern p = Pattern.compile(regex); 
    	Matcher m = p.matcher(email); 
    	if (m.matches()) {
    		result = true;
    	}
    	
    	if (result == true) {    		
    		mailHelper.sendMail("[아마존카]본인 인증을 위한 메일입니다", email, "http://fms1.amazoncar.co.kr/mailing/homepage/auth_format.jsp?token="+resultMap.get("token").toString(), "emailAuth");
    	}	
        
        return resultMap;
    }
    
    /*
     * 실시간 견적을 위한 이메일 인증/회원가입시 본인인증을 위한 이메일 인증
     * */
    @RequestMapping(value="/estimate/auth/verify", method=RequestMethod.GET)
    public String verifyEmailAuth(@RequestParam String token, Model model) throws Exception{
        boolean flag = estiService.verifyToken(token);
        
        String message = "";
        String returnpage = "";
        
        if(flag){
            //message = "메일 인증이 완료되었습니다.<br/><br/>견적서 창의 '실시간 견적' 또는 '차량예약'버튼을 누르시면<br/>실시간 견적/차량예약을 이용하실 수 있습니다.";
            message = "메일 인증이 완료되었습니다.<br/><br/>";
            returnpage = "/common/email_auth";
        }else{
            message = "잘못된 인증입니다. 다시 시도해주세요.";
            returnpage = "/error";
        }
        
        model.addAttribute("message",message);
        return returnpage;
    }
    
    //비밀번호 재설정 메일인증
    @RequestMapping(value="/estimate/resetPassword", method=RequestMethod.GET)
    public String verifyEmailResetPassword(@RequestParam String token, Model model) throws Exception{
        String verifyToken = memberService.verifyTokenForPassword(token);
        String message = "";
        String returnpage = "";
        
        if(verifyToken != null && verifyToken != ""){            
        	message = "메일 인증이 완료되었습니다. 비밀번호를 재설정 해주세요.<br/><br/>";
            returnpage = "/member/resetPassword";            
        }else{
            message = "잘못된 인증입니다. 다시 시도해주세요.";
            returnpage = "/error";
        }
        model.addAttribute("email",verifyToken);
        model.addAttribute("message",message);
        return returnpage;
    }
    
    /*
     * 견적 10번 넘었는지 안넘었는 지 체크 
     * */
    @ResponseBody
    @RequestMapping(value="/estimate/auth/check", method=RequestMethod.POST)
    public Map<String, Object> checkEmailAuth(@RequestBody String email){
        
        Map<String, Object> resultMap = new HashMap<String, Object>();
        boolean flag = false;
        String message = "";
        
        int authFlag = estiService.checkExistEmail(email);
        if(authFlag > 0){
            flag = true;
        }else{
            message =  "인증되지 않은 이메일입니다. 이메일 본인인증을 해주세요";
        }
        
        resultMap.put("flag",flag);
        resultMap.put("message",message);
        
        return resultMap;
    }
    
    @ResponseBody
    @RequestMapping(value="/reserve/auth/check", method=RequestMethod.POST)
    public Map<String, Object> checkEmailAuthForReserve(@RequestBody /*String email*/ Map<String,String> param){
        boolean flag = false;
        String email = param.get("email");
        
        Map<String, Object> resultMap = new HashMap<String, Object>();
        //Map<String, Object> resultMap = checkEmailAuth(email);
        //if((boolean)resultMap.get("flag")){
            int reserveCount = estiService.checkExistReserveInfo(email);
            if(reserveCount == 0){
                flag = true;
            }else{
                flag = false;
                resultMap.put("message","차량 예약은 1인 당 1건 가능합니다\n\n월렌트 차량 추가예약을 원하시면 해당 지점에 문의해주세요.\n\n기존 예약의 취소는 마이페이지 > 견적/상담/예약 이력 에서\n\n직접 하실 수 있습니다.");
            }
        //}        
        resultMap.put("flag",flag);
        
        return resultMap;
    }
    
    /*@ResponseBody
    @RequestMapping(value="/reserve/auth/mcheck", method = RequestMethod.POST)
    public Map<String, Object> mCheckEmailAuthForReserve(@RequestBody Map<String,String> param){
	   
    	boolean flag = false;
    	String email = (param.get("email") != null)?param.get("email").toString():"";
    	Map<String, Object> resultMap = new HashMap<String, Object>();
    	//Map<String, Object> resultMap = checkEmailAuth(email);
    	//if((boolean)resultMap.get("flag")){
    	int reserveCount = estiService.checkExistReserveInfo(email);
    	if(reserveCount < 2){
    		flag = true;
    	}else{
    		flag = false;
    		resultMap.put("message","차량 예약은 1인 당 1건만 가능합니다\n\n기존 예약의 취소는 PC홈페이지 로그인 > 마이페이지 > 렌트/견적 에서\n\n직접 하실 수 있습니다.");
    	}
    	//}
    	
    	resultMap.put("flag",flag);
	   
    	return resultMap;
    }*/
    
    //차량 예약확인 Ajax
    @ResponseBody
    @RequestMapping(value="/reserve/car/check")
    public int reserveCarYn(@RequestBody Map<String, String> param) {
    	Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.putAll(param);
    	int reserveNum = rentDao.checkReserveCount(paramMap);    	
    	return reserveNum;
    }
    
    //정부, 지자체 구매보조금 계산 Ajax
    @ResponseBody
    @RequestMapping(value="/control/smart/setCarSubsidy", method = RequestMethod.POST)
    public Map<String, Object> setCarSubsidy(@RequestBody Map<String, Object> param ) {    	
    	String b_dt = estiService.getBDt();
    	param.put("b_dt", b_dt);
    	Map<String, Object> resultMap = estiService.getSubsidyData(param);
    	return resultMap;
    }
    
    /* 모바일-사고처리안내-내차보험사조회 */
    @ResponseBody
    @RequestMapping(value="/control/accid", method=RequestMethod.POST)
    public Map<String, Object> getAccidCarDetailAjax(@RequestBody Map<String, String> param, Model model) throws Exception {
    	String car_no = URLDecoder.decode(param.get("car_no").toString(), "UTF-8");
    	//String car_no = (param.get("car_no") != null) ? URLDecoder.decode(param.get("car_no"),"UTF-8") : " ";
        param.put("car_no", car_no);
    	Map<String, Object> carMap = rentService.selectAccidCarDetail(param);
        return carMap;        
    }
    
    /* 스마트 견적에서 차종 선택 시 정부 보조금 조회 */
    @ResponseBody
    @RequestMapping(value="/control/smart/getBk128", method=RequestMethod.POST)
    public Map<String, Integer> getBk128(@RequestBody Map<String,String> param, Model model){
        int result = estiService.getBk128(param);
        
    	Map<String, Integer> resultMap = new HashMap<String, Integer>();
    	resultMap.put("bk_128", result);
        
        return resultMap; 
    }
    
}
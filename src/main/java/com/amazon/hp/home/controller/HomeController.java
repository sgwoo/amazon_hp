package com.amazon.hp.home.controller;

import java.io.IOException;
import java.net.URISyntaxException;
import java.security.InvalidKeyException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.http.client.ClientProtocolException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.amazon.hp.home.service.HomeService;
import com.amazon.hp.rent.service.RentService;

@Controller
public class HomeController {
    
    @Autowired
    HomeService homeService;
    
    @Autowired
    RentService rentService;
    
    @RequestMapping(value = "/")
    public String home(Model model, String f, HttpServletRequest request) {
        Map<String, Object> infoData = homeService.getHomepageMainInfo();
        Map<String, Object> compInfoData = homeService.getHomepageMainCompInfo();
        model.addAttribute("from", f);
        /*model.addAttribute("info_car",infoData.get("VAR").toString().split(";")[0]);
        model.addAttribute("info_asset",infoData.get("VAR").toString().split(";")[1]);
        model.addAttribute("info_client",infoData.get("VAR").toString().split(";")[2]);
        model.addAttribute("info_year",infoData.get("VAR").toString().split(";")[3]);
        model.addAttribute("info_score",infoData.get("VAR").toString().split(";")[4]);*/
    	if (infoData != null) {
			model.addAttribute("info_car", infoData.get("VAR1"));
			model.addAttribute("info_asset", infoData.get("VAR2"));
			model.addAttribute("info_client", infoData.get("VAR3"));
			model.addAttribute("info_year",	 infoData.get("VAR4"));
			model.addAttribute("info_score", infoData.get("VAR5"));
        }
    	model.addAttribute("info_open_year", compInfoData.get("OPEN_YEAR"));
    	model.addAttribute("info_continue_year", compInfoData.get("CONTINUE_YEAR"));
    	
    	String ip = homeService.getBlockIp(request);
    	//System.out.println(ip);
    	
    	// 특별 할인 차량 조회
    	Map<String, Object> param = new HashMap<String, Object>(); // 특별할인차량 조회 위한 파라미터.
    	List<Map<String, Object>> discountList = rentService.getDiscountRentList(param);
    	int discount = discountList.size();
	    model.addAttribute("discount", discount);
	    model.addAttribute("discountList", discountList);
	    
	    // 채용공고 리스트 건 수 조회
	    List<Map<String, Object>> recruitList = homeService.getRecruitList();
	    int recruitSize = recruitList.size();
    	model.addAttribute("recruitSize", recruitSize);
    	
        return "index";
    }
    
    @RequestMapping(value="/client/ip")
    public String getBlockIp(Model model, String f, HttpServletRequest request) {
    	Map<String, Object> infoData = homeService.getHomepageMainInfo();
    	Map<String, Object> compInfoData = homeService.getHomepageMainCompInfo();
    	model.addAttribute("from", f);
    	/*model.addAttribute("info_car",infoData.get("VAR").toString().split(";")[0]);
        model.addAttribute("info_asset",infoData.get("VAR").toString().split(";")[1]);
        model.addAttribute("info_client",infoData.get("VAR").toString().split(";")[2]);
        model.addAttribute("info_year",infoData.get("VAR").toString().split(";")[3]);
        model.addAttribute("info_score",infoData.get("VAR").toString().split(";")[4]);*/
    	if (infoData != null) {
    		model.addAttribute("info_car", infoData.get("VAR1"));
    		model.addAttribute("info_asset", infoData.get("VAR2"));
    		model.addAttribute("info_client", infoData.get("VAR3"));
    		model.addAttribute("info_year",	 infoData.get("VAR4"));
    		model.addAttribute("info_score", infoData.get("VAR5"));
    	}
    	model.addAttribute("info_open_year", compInfoData.get("OPEN_YEAR"));
    	model.addAttribute("info_continue_year", compInfoData.get("CONTINUE_YEAR"));
    	
    	String ip = homeService.getBlockIp(request);
    	//System.out.println(ip);
    	
    	return "index";
    }
    
    /*
    @RequestMapping(value = "/user/login")
    public String login(Model model) {

        return "/user/login";
    }
    
    @RequestMapping(value = "/user/register")
    public String register(Model model) {

        return "/user/register";
    }
    */
   
    @RequestMapping(value = "/mailing/{fileName}/{imageName}.{ext}", headers = "Accept=image/jpeg, image/jpg, image/png, image/gif", method = RequestMethod.GET)
    public String getMailingImage(@PathVariable("fileName") String fileName, @PathVariable("imageName") String imageName, @PathVariable("ext") String ext) {
        String url = "/resources/mailing/"+fileName+"/"+imageName + "." + ext;
        
        return url;
    }
    
    /* 단일페이지들은 컨트롤러 별도 생성 없이 페이지명이 있으면 바로 넘긴다 */
    @RequestMapping(value="/single/{pageName}")
    public String getSinglePage(@PathVariable("pageName")String pageName){
        return "/single/"+pageName; 
    } 
    
    @RequestMapping(value="/utility/{year}/{gubun}")
    public String getUtility(@PathVariable("year")String year, @PathVariable("gubun")String gubun){
        return "/utility/"+year+"/utility_"+gubun;
    }
    
    /*
     * 불편합니다 Action
     * Ajax
     * */
    @RequestMapping(value="/feedback/sendFeedback", method=RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> sendFeedback(@RequestBody Map<String, Object> params){
        
        Map<String, Object> resultMap = new HashMap<String,Object>();
        boolean flag = homeService.insertComplainInfo(params);
        
        if(flag){
            resultMap.put("message", "불편을 드려 죄송합니다.빠른 시일 내 답변드리도록 하겠습니다.");
        }else{
            resultMap.put("message", "접수에 오류가 발생했습니다. 시스템 관리자에게 문의해주시기 바랍니다.");
        }
        
        return resultMap;
    }
    
    @RequestMapping(value="/common/analytics/print")
    public String printAnalytics(){
        return "/common/printAnalytics";
    }
    
    //프린트 여백자동설정을 위한 Active-X 설치
    @RequestMapping(value="/smsx.cab")
    public String printActiveX(){
    	return "/smsx.cab";
    }
    
    //요청시 외부 테스트 테이지(2018.03.22)
    @RequestMapping(value="/expense_test")
    public String testPage(){
    	return "/single/expense_test";
    }
    
    @RequestMapping(value="/carApi/carNumberCall")
    public String carNumberCall(){
        return "/api/car_api_call";
    }
    
    /*
     * 운전면허번호조회 Action Ajax
     * */
    @RequestMapping(value="/carApi/carNumberCallback")
    public String carNumberCallback(Model model, HttpServletRequest request) throws ClientProtocolException, IOException, InvalidKeyException, URISyntaxException{
        
        Map<String, Object> resultMap = new HashMap<String,Object>();
        
        String accesToken = "";
        String jsonString = "";
        
        //accesToken = homeService.getTokenTest();
        accesToken = homeService.getToken();
        System.out.println("accesToken >>> " + accesToken);
        jsonString = homeService.getOneValiDatorV2(accesToken);
        
        if (!accesToken.equals("")) {
        	jsonString = homeService.getOneValiDatorV2(accesToken);
        	resultMap.put("data", jsonString);
        } else {
        	resultMap.put("data", "fail");
        }
        
        //resultMap.put("data", homeService.getAuthHeader());
        model.addAttribute("data", resultMap);
        
        return "/api/car_api_call_ajax";
    }
    
    
}

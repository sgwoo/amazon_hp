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
    	
    	// ?????? ?????? ?????? ??????
    	Map<String, Object> param = new HashMap<String, Object>(); // ?????????????????? ?????? ?????? ????????????.
    	List<Map<String, Object>> discountList = rentService.getDiscountRentList(param);
    	int discount = discountList.size();
	    model.addAttribute("discount", discount);
	    model.addAttribute("discountList", discountList);
	    
	    // ???????????? ????????? ??? ??? ??????
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
    
    /* ????????????????????? ???????????? ?????? ?????? ?????? ??????????????? ????????? ?????? ????????? */
    @RequestMapping(value="/single/{pageName}")
    public String getSinglePage(@PathVariable("pageName")String pageName){
        return "/single/"+pageName; 
    } 
    
    @RequestMapping(value="/utility/{year}/{gubun}")
    public String getUtility(@PathVariable("year")String year, @PathVariable("gubun")String gubun){
        return "/utility/"+year+"/utility_"+gubun;
    }
    
    /*
     * ??????????????? Action
     * Ajax
     * */
    @RequestMapping(value="/feedback/sendFeedback", method=RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> sendFeedback(@RequestBody Map<String, Object> params){
        
        Map<String, Object> resultMap = new HashMap<String,Object>();
        boolean flag = homeService.insertComplainInfo(params);
        
        if(flag){
            resultMap.put("message", "????????? ?????? ???????????????.?????? ?????? ??? ?????????????????? ???????????????.");
        }else{
            resultMap.put("message", "????????? ????????? ??????????????????. ????????? ??????????????? ?????????????????? ????????????.");
        }
        
        return resultMap;
    }
    
    @RequestMapping(value="/common/analytics/print")
    public String printAnalytics(){
        return "/common/printAnalytics";
    }
    
    //????????? ????????????????????? ?????? Active-X ??????
    @RequestMapping(value="/smsx.cab")
    public String printActiveX(){
    	return "/smsx.cab";
    }
    
    //????????? ?????? ????????? ?????????(2018.03.22)
    @RequestMapping(value="/expense_test")
    public String testPage(){
    	return "/single/expense_test";
    }
    
    @RequestMapping(value="/carApi/carNumberCall")
    public String carNumberCall(){
        return "/api/car_api_call";
    }
    
    /*
     * ???????????????????????? Action Ajax
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

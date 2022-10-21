package com.amazon.hp.rent.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.MapUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.UrlPathHelper;

import com.amazon.hp.model.CarDetail;
import com.amazon.hp.rent.dao.RentDAO;
import com.amazon.hp.rent.service.EstimateService;
import com.amazon.hp.rent.service.RentService;
import com.amazon.hp.util.SendMailHelper;

@Controller
public class RentController {
	
	@Autowired RentDAO rentDao;
	@Autowired RentService rentService;
	@Autowired EstimateService estiService;
	@Autowired SendMailHelper mailHelper;
	
	@RequestMapping(value = "/rent/domestic")
	public String getDomesticRentList(@RequestParam Map<String, Object> param, Model model, String f) throws Exception{
	    param.put("mode", "rent");
	    param.put("from", f);

	    //차량명 디코딩
	    if (param.get("carName") != null) {
	    	String carName = URLDecoder.decode(param.get("carName").toString(), "UTF-8");
	    	param.put("carName", carName);
	    	model.addAttribute("carName", carName);
	    }
	    
	    String tempFuelKd = "";
	    int fuelKdListSize = 0;
	    int temp_count = 0;
	    
	    String tempCompNm = param.get("tempCompNm") != null ? param.get("tempCompNm").toString() : "";	// 이전 제조사 파라미터화.
	    String carCompId = param.get("companyName") != null ? param.get("companyName").toString() : "";
	    String tempCompId = "";
	    
	    // 제조사 및 차명 검색_2022.05.17.
	    // 차명 우선 선택 후 타 제조사 선택 시 타 제조사 차량 전체 검색. 차명 우선 선택 후 동 제조사 선택 시 동 제조사의 해당 차명 단일 검색.
	    // 선택 차명의 제조사 조회
	    if( param.get("carName") != null ){
	    	tempCompId = rentService.getCompIdByCarName(param.get("carName").toString());
	    	tempCompId = tempCompId == null ? "" : tempCompId;
	    }
	    
	    // 차명 우선 선택 후 타 제조사 선택 시 타 제조사의 차량 전체 검색
	    if(!tempCompId.equals("") && !carCompId.equals("") && !tempCompId.equals(carCompId)){
	    	param.put("carName", "");
	    }
	    
	    // 차명 선택 후 제조사 전체 검색 시 차명 초기화
    	if ( !tempCompNm.equals("") && carCompId.equals("") ) {
    		param.put("carName", "");
    	}
    	
        List<Map<String, Object>> searchFuelKdList = rentService.getDomesticRentSearchFuelKdList(param);        
	    fuelKdListSize = searchFuelKdList.size();
	    
	    //제조사에따른 연료리스트를 가져와 입력받은 연료와 비교후 리스트에 연료가 없는경우에는 전체조회 될수있도록 한다.
	    // 위 내용 제외. 20210624
	    /*if (param.get("fuelKd") != null && !param.get("fuelKd").equals("")) {
	    	tempFuelKd = param.get("fuelKd").toString();
	    	for (int i = 0; i < fuelKdListSize; i++) {
	    		String tempFuelKdValue = searchFuelKdList.get(i).get("FUEL_KD").toString();
	    		if (tempFuelKd.equals(tempFuelKdValue)) {
	    			temp_count++;
	    		}
	    	}	    	
	    	if (temp_count == 0) {
	    		param.put("fuelKd", "");
	    	}
	    }*/
        
	    List<Map<String, Object>> domesticList = rentService.getDomesticRentList(param);
	    List<Map<String, Object>> searchList = rentService.getDomesticRentSearchList(param);
	    List<Map<String, Object>> discountList = rentService.getDiscountRentList(param);
        int discount = discountList.size();
	    model.addAttribute("discount", discount);
	    
	    model.addAttribute("list", domesticList);
	    model.addAttribute("searchList", searchList);
	    model.addAttribute("searchFuelKdList", searchFuelKdList);
	    model.addAttribute("tempCarName", param.get("carName"));
	    
	    if (param != null) {
	        model.addAttribute("param", param);
	    }
	    
	    return "/rent/list/domesticRent";
	}
	
	@RequestMapping(value = "/rent/imports")
    public String getImportsRentList(@RequestParam Map<String, Object> param, Model model) throws Exception{
	    param.put("mode", "rent");   
	    
	    String tempCompNm = param.get("tempCompNm") != null ? param.get("tempCompNm").toString() : "";	// 이전 제조사 파라미터화.
	    String carCompId = param.get("carCompId") != null ? param.get("carCompId").toString() : "";
	    String tempCompId = "";
	    
	    // 제조사 및 차명 검색_2022.05.17.
	    // 차명 우선 선택 후 타 제조사 선택 시 타 제조사 차량 전체 검색. 차명 우선 선택 후 동 제조사 선택 시 동 제조사의 해당 차명 단일 검색.
	    // 선택 차명의 제조사 조회
	    if( param.get("carName") != null ){
	    	tempCompId = rentService.getCompIdByCarName(param.get("carName").toString());
	    	tempCompId = tempCompId == null ? "" : tempCompId;
	    }
	    
	    // 차명 우선 선택 후 타 제조사 선택 시 타 제조사의 차량 전체 검색
	    if(!tempCompId.equals("") && !carCompId.equals("") && !tempCompId.equals(carCompId)){
	    	param.put("carName", "");
	    }
	    
	    // 차명 선택 후 제조사 전체 검색 시 차명 초기화
    	if ( !tempCompNm.equals("") && carCompId.equals("") ) {
    		param.put("carName", "");
    	}
	    
        //차량명 디코딩
        if(param.get("carName") != null){
            String carName = URLDecoder.decode(param.get("carName").toString(), "UTF-8");
            param.put("carName", carName);
            model.addAttribute("carName", carName);
        }
		List<Map<String, Object>> resultList = rentService.getImportsRentList(param);
		List<Map<String, Object>> searchList = rentService.getImportsRentSearchList(param);
		List<Map<String, Object>> discountList = rentService.getDiscountRentList(param);
        int discount = discountList.size();
	    model.addAttribute("discount", discount);
		
		model.addAttribute("list",resultList);
		model.addAttribute("searchList", searchList);
		
		List<Map<String, Object>> carCompMap = estiService.getCarCompanyList();		// 제조사 리스트 가져오기
		model.addAttribute("carCompany", carCompMap);
		
        if(param != null) {
            model.addAttribute("param", param);
        }
        return "/rent/list/importsRent";
    }

	@RequestMapping(value={"/rent/discount", "/lease/discount"})
	public ModelAndView getDiscountRentList(@RequestParam Map<String, Object> param, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{
		String mapping_value = request.getServletPath();
		int discount = 0;
	    
		List<Map<String, Object>> discountList = new ArrayList<Map<String, Object>>();
		
	    //discountList = rentService.getDiscountRentList(param);
	    //discountList = rentService.getDiscountLeaseList(param);
	    
	    ModelAndView mv = new ModelAndView();
	    
	    if (mapping_value.equals("/rent/discount")) {
	    	discountList = rentService.getDiscountRentList(param);
	    	discount = discountList.size();
	    	
	    	if (discount > 0) {
	    		mv.addObject("mode", "rent");
	    		mv.addObject("discount", discount);
	    		mv.addObject("resultList", discountList);
	    		mv.setViewName("/rent/list/discount");
	    	} else {
	    		mv.setViewName("redirect:/rent/domestic");
	    	}
	    	
    	} else {
    		discountList = rentService.getDiscountLeaseList(param);
    		discount = discountList.size();
    		
	    	if (discount > 0) {
	    		mv.addObject("mode", "lease");
	    		mv.addObject("discount", discount);
	    		mv.addObject("resultList", discountList);
	    		mv.setViewName("/rent/list/discount");
	    	} else {
	    		mv.setViewName("redirect:/lease/domestic");
	    	}
    	}
	    
		return mv;
	}
	
	@RequestMapping(value={"/lease/discountPopup"})
	public ModelAndView getDiscountRentListPop(@RequestParam Map<String, Object> param, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{
		int discount = 0;
		List<Map<String, Object>> discountList = new ArrayList<Map<String, Object>>();
		
		ModelAndView mv = new ModelAndView();
		
		discountList = rentService.getDiscountLeaseList(param);
		discount = discountList.size();
			
		if (discount > 0) {
			mv.addObject("discount", discount);
			mv.addObject("resultList", discountList);
			mv.setViewName("/rent/list/discountPopup");
		} else {
			mv.setViewName("redirect:/lease/domestic");
		}
		
		return mv;
	}
	
   @RequestMapping(value = "/lease/domestic")
    public String getDomesticLeaseList(@RequestParam Map<String, Object> param, Model model, String f) throws Exception{
        param.put("mode", "lease");
        param.put("from", f);

        //차량명 디코딩
        if (param.get("carName") != null) {
            String carName = URLDecoder.decode(param.get("carName").toString(), "UTF-8");
            param.put("carName", carName);
            model.addAttribute("carName", carName);
        }
        
	    String tempFuelKd = "";
	    int fuelKdListSize = 0;
	    int temp_count = 0;
	    
	    String tempCompNm = param.get("tempCompNm") != null ? param.get("tempCompNm").toString() : "";	// 이전 제조사 파라미터화.
	    String carCompId = param.get("companyName") != null ? param.get("companyName").toString() : "";
	    String tempCompId = "";
	    
	    // 제조사 및 차명 검색_2022.05.17.
	    // 차명 우선 선택 후 타 제조사 선택 시 타 제조사 차량 전체 검색. 차명 우선 선택 후 동 제조사 선택 시 동 제조사의 해당 차명 단일 검색.
	    // 선택 차명의 제조사 조회
	    if( param.get("carName") != null ){
	    	tempCompId = rentService.getCompIdByCarName(param.get("carName").toString());
	    	tempCompId = tempCompId == null ? "" : tempCompId;
	    }
	    
	    // 차명 우선 선택 후 타 제조사 선택 시 타 제조사의 차량 전체 검색
	    if(!tempCompId.equals("") && !carCompId.equals("") && !tempCompId.equals(carCompId)){
	    	param.put("carName", "");
	    }
	    
	    // 차명 선택 후 제조사 전체 검색 시 차명 초기화
	    if ( !tempCompNm.equals("") && carCompId.equals("") ) {
    		param.put("carName", "");
    	}
        
        
        List<Map<String, Object>> searchFuelKdList = rentService.getDomesticRentSearchFuelKdList(param);        
	    fuelKdListSize = searchFuelKdList.size();
	    
	    // 제조사에따른 연료리스트를 가져와 입력받은 연료와 비교후 리스트에 연료가 없는경우에는 전체조회 될수있도록 한다.
	    // 위 내용 제외. 20210624
	    /*if (param.get("fuelKd") != null && !param.get("fuelKd").equals("")) {
	    	tempFuelKd = param.get("fuelKd").toString();
	    	for (int i = 0; i < fuelKdListSize; i++) {
	    		String tempFuelKdValue = searchFuelKdList.get(i).get("FUEL_KD").toString();
	    		if (tempFuelKd.equals(tempFuelKdValue)) {
	    			temp_count++;
	    		}
	    	}
	    	if (temp_count == 0) {
	    		param.put("fuelKd", "");
	    	}
	    }*/
        
        List<Map<String, Object>> domesticList = rentService.getDomesticLeaseList(param);
        List<Map<String, Object>> searchList = rentService.getDomesticRentSearchList(param);
        List<Map<String, Object>> discountList = rentService.getDiscountLeaseList(param);
        int discount = discountList.size();
	    model.addAttribute("discount", discount);
        
        model.addAttribute("list", domesticList);
        model.addAttribute("searchList", searchList);
        model.addAttribute("searchFuelKdList", searchFuelKdList);
        model.addAttribute("tempCarName", param.get("carName"));
        
        if (param != null) {
            model.addAttribute("param", param);
        }
        
        return "/rent/list/domesticLease";
    }
    
    @RequestMapping(value = "/lease/imports")
    public String getImportsLeaseList(@RequestParam Map<String, Object> param, Model model) throws Exception{
        param.put("mode", "lease");
        	
        String tempCompNm = param.get("tempCompNm") != null ? param.get("tempCompNm").toString() : "";	// 이전 제조사 파라미터화.
	    String carCompId = param.get("carCompId") != null ? param.get("carCompId").toString() : "";
	    String tempCompId = "";
        
	    // 제조사 및 차명 검색_2022.05.17.
	    // 차명 우선 선택 후 타 제조사 선택 시 타 제조사 차량 전체 검색. 차명 우선 선택 후 동 제조사 선택 시 동 제조사의 해당 차명 단일 검색.
	    // 선택 차명의 제조사 조회
	    if( param.get("carName") != null ){
	    	tempCompId = rentService.getCompIdByCarName(param.get("carName").toString());
	    	tempCompId = tempCompId == null ? "" : tempCompId;
	    }
	    
	    // 차명 우선 선택 후 타 제조사 선택 시 타 제조사의 차량 전체 검색
	    if(!tempCompId.equals("") && !carCompId.equals("") && !tempCompId.equals(carCompId)){
	    	param.put("carName", "");
	    }
	    
	    // 차명 선택 후 제조사 전체 검색 시 차명 초기화
    	if ( !tempCompNm.equals("") && carCompId.equals("") && !tempCompNm.equals(carCompId) ) {
    		param.put("carName", "");
    	}
	    
        //차량명 디코딩
        if(param.get("carName") != null){
            String carName = URLDecoder.decode(param.get("carName").toString(), "UTF-8");
            param.put("carName", carName);
            model.addAttribute("carName", carName);
        }
        
        List<Map<String, Object>> resultList = rentService.getImportsRentList(param);
        List<Map<String, Object>> searchList = rentService.getImportsRentSearchList(param);
        List<Map<String, Object>> discountList = rentService.getDiscountLeaseList(param);
        int discount = discountList.size();
	    model.addAttribute("discount", discount);
        
        model.addAttribute("list", resultList);
        model.addAttribute("searchList", searchList);
        
        List<Map<String, Object>> carCompMap = estiService.getCarCompanyList();		// 제조사 리스트 가져오기
		model.addAttribute("carCompany", carCompMap);
        
        if (param != null) {
            model.addAttribute("param", param);
        }
        return "/rent/list/importsLease";
    }
    
	@RequestMapping(value = "/rent/secondhand")
    public String getSecondHandRentList(@RequestParam Map<String, Object> param, Model model, String f) throws Exception {
		
		param.put("from", f);
		
	    //주행거리 값 없을 때 기본적으로 10,000km로 설정
	    if (param.get("dist") == "" || param.get("dist") == null) {
	        param.put("dist", "10000");
	    }
	    
	    List<Map<String, Object>> resultList = rentService.getSecondhandRentList(param);
	    Map<String, Object> EstiCommVarSh = rentService.getEstiCommVarEstimateSh();
	    
	    model.addAttribute("list", resultList);
	    model.addAttribute("EstiCommVarSh", EstiCommVarSh);
	    model.addAttribute("param", param);
	    
        return "/rent/list/secondhandRent";
    }
	
	
	@RequestMapping(value= "/rent/month")
	public String getMonthRentList(@RequestParam Map<String, Object> param, Model model, String f) throws Exception {
	    
		param.put("from", f);
		
	    //대기상황 Default 즉시가능으로 셋팅
	    if(param.get("carStatus") == null || param.get("carStatus") == ""){
	        param.put("carStatus", "1");
	    }
	    
	    //지역 Detault 수도권으로 셋팅
	    if(param.get("region") == null){
	        param.put("region", "S1");
	    }
	    
	    List<Map<String, Object>> resultList = rentService.selectMonthCarList(param);
	    model.addAttribute("list",resultList);
        model.addAttribute("param", param);        

        return "/rent/list/monthRent";
	}
	
	/* 재렌트/재리스, 월렌트 상세 페이지 */
	@RequestMapping(value={"/rent/secondhand/detail", "/rent/month/detail"})
    public String getUsedCarRentDetail(@RequestParam Map<String, String> param, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {		
	    Map<String, Object> carMap = new HashMap<String, Object>();
	    String returnUrl = "";
	    String mapping_value = request.getServletPath();
	    DecimalFormat df = new DecimalFormat("#,##0");
	    
	    if (param.get("locationId") == "" || param.get("locationId") == null) { //재리스
	        carMap = rentService.selectSecondhandCarDetail(param);
	        if (MapUtils.isEmpty(carMap)) {
				/*response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('해당차종의 새로 견적된 내용을 확인해주세요. 리스트로 이동합니다.'); location.href='/rent/secondhand';</script>");
				out.flush();				
				returnUrl = "/rent/list/secondhandRent";*/
	        	if (mapping_value.equals("/rent/secondhand/detail")) {
	        		returnUrl = "redirect:/rent/secondhand";
	        	} else if (mapping_value.equals("/rent/month/detail")) {
	        		returnUrl = "redirect:/rent/month";
	        	}
	        	
			} else {
				Map<String, Object> depositMap = rentService.selectSecondhandDepositInfo(carMap);
				if (depositMap != null) {
					carMap.putAll(depositMap);
				}
				returnUrl = "/rent/detail/secondhandRent";
			}
	        
	    } else { //월렌트
	        carMap = rentService.selectMonthCarDetail(param);
	        if (MapUtils.isEmpty(carMap)) {
				/*response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('해당차종의 새로 견적된 내용을 확인해주세요. 리스트로 이동합니다.'); location.href='/rent/month';</script>");
				out.flush();				
				returnUrl = "/rent/list/monthRent";*/
	        	if (mapping_value.equals("/rent/secondhand/detail")) {
	        		returnUrl = "redirect:/rent/secondhand";
	        	} else if (mapping_value.equals("/rent/month/detail")) {
	        		returnUrl = "redirect:/rent/month";
	        	}
	        	
			} else {
				boolean validTimeFlag = rentService.isValidWorkingTime();
				model.addAttribute("validTimeFlag", validTimeFlag);
				returnUrl = "/rent/detail/monthRent";
			}
	    }
	    
	    if (MapUtils.isNotEmpty(carMap)) {
	    	
	    	//System.out.println(carMap);
	    	
		    if(carMap != null && carMap.get("IMGFILE6") != null){  //이미지 정보
	    	//if(carMap != null){  //이미지 정보
		        List<Map<String, Object>> imageList = rentService.selectAttachFileList("APPRSL", param.get("carManagedId").toString());
		        model.addAttribute("imageList", imageList);
		        //System.out.println(imageList);
		    }
		    
		    if (carMap != null && carMap.get("CAR_B_INC_ID") != null) { //편의사양 정보
		        Map<String,String> specParam = new HashMap<String,String>();
		        specParam.put("parentCarId", carMap.get("CAR_B_INC_ID").toString());
		        specParam.put("parentCarSeq", carMap.get("CAR_B_INC_SEQ").toString());
	            List<Map<String, Object>> specList = rentService.selectParentSpec(specParam);
	            model.addAttribute("spec", specList.get(0).get("CAR_NAME"));
	            model.addAttribute("specList", specList);
	        }
		    
	    	List<Map<String, Object>> historyMap = rentService.selectCarHistory(param.get("carManagedId"));
	    	List<Map<String, Object>> accidentMap = rentService.selectAccidentHistory(param.get("carManagedId"));
	    	List<Map<String, Object>> serviceMap = rentService.selectServiceHistory(param.get("carManagedId"));
	    	Map<String, Object> receiveMap = rentService.selectReceiveHistory(param.get("carManagedId"));
	    	
	    	//가격정보 넣기
	    	if (!param.containsKey("brTo")) {
	    		param.put("brTo", "");
	     	}
	    	
	    	String temp_br_from = carMap.get("BR_ID").toString();
	        String br_from = "0";
	        String temp_br_to = param.get("brTo").toString();
	        String br_to = "0";
	        
	        if (temp_br_from.equals("S1")) {
	    		br_from = "0";
	    	} else if (temp_br_from.equals("D1")) {
	    		br_from = "1";
	    	} else if (temp_br_from.equals("G1")) {
	    		br_from = "2";
	    	} else if (temp_br_from.equals("J1")) {
	    		br_from = "3";
	    	} else if (temp_br_from.equals("B1")) {
	    		br_from = "4";
	    	}	        
	        
	        if (temp_br_to.equals("")) {
	    		br_to = br_from;
	    	} else if (!(temp_br_to.equals("0") || temp_br_to.equals("1") || temp_br_to.equals("2") || temp_br_to.equals("3") || temp_br_to.equals("4") || temp_br_to.equals("5"))) {
	    		br_to = br_from;
	    	}else {
	    		if (temp_br_to.equals("5")) {
	    			br_to = "0";
	    		} else {
	    			br_to = temp_br_to;
	    		}
	    	}
	        
	        carMap.put("brTo", br_to);
	    	carMap.putAll(rentService.makeSecondhandRentPriceTable(carMap));
	    	
	    	model.addAttribute("data", carMap);
	    	model.addAttribute("historyData", historyMap);
	    	model.addAttribute("accidentData", accidentMap);
	    	model.addAttribute("serviceData", serviceMap);
	    	model.addAttribute("paramData", param);
	    	model.addAttribute("receiveData", receiveMap);
	    }
	    
	    return returnUrl;
    }
	
	/*  월렌트 상품 상세설명 보기    */
	@RequestMapping(value="/rent/month/desc")
	public String getMonthRentDesc(){
	    return "/rent/desc/monthRent";
	}
	
	/*  장기렌트 상품 상세설명 보기    */
    @RequestMapping(value="/rent/desc")
    public String getNewCarRentDesc(){
        return "/rent/desc/commonRent";
    }

    /*  자동차리스 상품 상세설명 보기    */
    @RequestMapping(value="/lease/desc")
    public String getNewCarLeaseDesc(){
        return "/rent/desc/commonLease";
    }

    /*  재렌트,재리스 상품 상세설명 보기    */
    @RequestMapping(value="/rent/secondhand/desc")
    public String getSecondhandRentDesc(){
        return "/rent/desc/secondhandRent";
    }
    
    /* 친환경차 상세설명 보기  */
    @RequestMapping(value="/rent/green/desc")
    public String getGreenCarDesc(){
        return "/rent/desc/greenRent";
    }
    
    /* 국산/수입 렌트 상품 디테일로 이동  */
	@RequestMapping(value = {"/rent/domestic/detail", "/rent/imports/detail"}, method = RequestMethod.GET)
	public String getNewCarRentDetail(@RequestParam Map<String, String> param, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, Object> estimateMap = rentDao.selectDomesticRentEstimateDetail(param.get("estimateId").toString());
				
		String return_page = "/rent/detail/newCarRent";
		String mapping_value = request.getServletPath();
		
		if (MapUtils.isEmpty(estimateMap)) {
			/*response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('해당차종의 새로 견적된 내용을 확인해주세요. 리스트로 이동합니다.'); location.href='/rent/domestic';</script>");		 
			out.flush();
			
			return_page = "/rent/list/domesticRent";*/
			
			if (mapping_value.equals("/rent/domestic/detail")) {
				return_page = "redirect:/rent/domestic";
			} else if (mapping_value.equals("/rent/imports/detail")) {
				return_page = "redirect:/rent/imports";
			}
			
		} else {
			UrlPathHelper urlPathHelper = new UrlPathHelper();
			String requestURL = urlPathHelper.getOriginatingRequestUri(request);
			param.put("requestURL", requestURL);
			CarDetail carDetail = rentService.getNewCarRentDetail(param);
			
			Map<String, String> paramData = new HashMap<String, String>();
			paramData.put("carCode", carDetail.getMainMap().get("CAR_CD").toString());
			paramData.put("carCompId", carDetail.getMainMap().get("CAR_COMP_ID").toString());
			paramData.put("carId", carDetail.getDetailMap().get("CAR_ID").toString());
			
			List<Map<String, Object>> optionList = rentService.getCarOption(paramData);
			
			model.addAttribute("mainData", carDetail.getMainMap());
			model.addAttribute("priceList", carDetail.getPriceMap());
			model.addAttribute("estimateData", carDetail.getEstimateMap());
			model.addAttribute("detailData", carDetail.getDetailMap());
			model.addAttribute("optionList", optionList);
			model.addAttribute("param", param);
			
			//상위 사양 뽑기
			if (carDetail.getDetailMap().get("CAR_B_INC_ID") != null) { //상위 사양 ID가 있으면
				Map<String,String> specParam = new HashMap<String,String>();
				specParam.put("parentCarId", carDetail.getDetailMap().get("CAR_B_INC_ID").toString());
				specParam.put("parentCarSeq", carDetail.getDetailMap().get("CAR_B_INC_SEQ").toString());
				List<Map<String, Object>> specList = rentService.selectParentSpec(specParam);
				
				model.addAttribute("specList", specList);
				model.addAttribute("spec", specList.get(0).get("CAR_NAME")); //최상위 스펙 이름
			}
		}
		//System.out.println(return_page);
	    //return "/rent/detail/newCarRent";
	    return return_page;
	}
	
	//신차 사양정보 가져오기
	@ResponseBody
    @RequestMapping(value="/control/newCarInfoDetail", method=RequestMethod.POST)
    public Map<String, Object> newCarInfo(@RequestBody Map<String,String> param) throws Exception {
        Map<String, Object> resultMap;
        try {
        	resultMap = new HashMap<>();
        	CarDetail carDetail = rentService.getNewCarRentDetail(param);
        	
        	Map<String,String> paramData = new HashMap<String,String>();
    	    paramData.put("carCode",carDetail.getMainMap().get("CAR_CD").toString());
    	    paramData.put("carCompId",carDetail.getMainMap().get("CAR_COMP_ID").toString());
    	    paramData.put("carId",carDetail.getDetailMap().get("CAR_ID").toString());
    	    
    	    List<Map<String, Object>> optionList = rentService.getCarOption(paramData);
    	    
    	    //상위 사양 가져오기
    	    if(carDetail.getDetailMap().get("CAR_B_INC_ID") != null){ //상위 사양 ID가 있으면
    	        Map<String,String> specParam = new HashMap<String,String>();
    	        specParam.put("parentCarId",carDetail.getDetailMap().get("CAR_B_INC_ID").toString());
    	        specParam.put("parentCarSeq",carDetail.getDetailMap().get("CAR_B_INC_SEQ").toString());
    	        List<Map<String, Object>> specList = rentService.selectParentSpec(specParam);
               
    	        resultMap.put("specList", specList);
    	        resultMap.put("spec",specList.get(0).get("CAR_NAME"));
    	    }
    	    resultMap.put("detailData", carDetail.getDetailMap());
    	    resultMap.put("optionList", optionList);
        } catch(Exception e){
            throw e;
        }

        return resultMap;
    }
	
	//재리스,재렌트 차량 사양정보 가져오기
	@ResponseBody
    @RequestMapping(value="/control/shCarInfoDetail", method=RequestMethod.POST)
    public Map<String, Object> shCarInfo(@RequestBody Map<String,String> param) throws Exception {
		Map<String, Object> resultMap= new HashMap<String, Object>();
        try {
    	    Map<String, Object> carMap = new HashMap<String, Object>();
	        carMap = rentService.selectSecondhandCarDetail(param);
	        Map<String, Object> depositMap = rentService.selectSecondhandDepositInfo(carMap);
	        if(depositMap != null){
	            carMap.putAll(depositMap);
	        }
        	Map<String,String> paramData = new HashMap<String,String>();
    	    paramData.put("carCode",carMap.get("CAR_CD").toString());
    	    paramData.put("carCompId",carMap.get("CAR_COMP_ID").toString());
    	    paramData.put("carId",carMap.get("CAR_ID").toString());
    	    
    	    List<Map<String, Object>> optionList = rentService.getCarOption(paramData);
    	    
    	    //상위 사양 가져오기
    		if(carMap != null && carMap.get("CAR_B_INC_ID") != null){ //상위 사양 ID가 있으면	
    	        Map<String,String> specParam = new HashMap<String,String>();
    	        specParam.put("parentCarId",carMap.get("CAR_B_INC_ID").toString());
    	        specParam.put("parentCarSeq",carMap.get("CAR_B_INC_SEQ").toString());
    	        List<Map<String, Object>> specList = rentService.selectParentSpec(specParam);
               
    	        resultMap.put("specList", specList);
    	        resultMap.put("spec",specList.get(0).get("CAR_NAME"));
    	    }
    	    resultMap.put("detailData", carMap);
    	    resultMap.put("optionList", optionList);
    	    //resultMap.put("mainData",carDetail.getMainMap());
        } catch(Exception e){
            throw e;
        }
        return resultMap;

    }
	
	/* 국산/수입 리스 상품 디테일로 이동  */
    @RequestMapping(value = {"/lease/domestic/detail","/lease/imports/detail"}, method=RequestMethod.GET)
    public String getNewCarLeaseDetail(@RequestParam Map<String, String> param, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        UrlPathHelper urlPathHelper = new UrlPathHelper();
        String requestURL = urlPathHelper.getOriginatingRequestUri(request);
        param.put("requestURL", requestURL);
        
        String return_page = "/rent/detail/newCarLease";
        String mapping_value = request.getServletPath();
        
        Map<String, Object> estimateMap = rentDao.selectDomesticRentEstimateDetail(param.get("estimateId").toString());
		
		if (MapUtils.isEmpty(estimateMap)) {
			/*response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('해당차종의 새로 견적된 내용을 확인해주세요. 리스트로 이동합니다.'); location.href='/lease/domestic';</script>");
			out.flush();
			
			return_page = "/rent/list/domesticLease";*/
			
			if (mapping_value.equals("/lease/domestic/detail")) {
				return_page = "redirect:/lease/domestic";
			} else if (mapping_value.equals("/lease/imports/detail")) {
				return_page = "redirect:/lease/imports";
			}
			
		} else {
			
			CarDetail carDetail = rentService.getNewCarLeaseDetail(param);
			
			Map<String,String> paramData = new HashMap<String,String>();
			paramData.put("carCode",carDetail.getMainMap().get("CAR_CD").toString());
			paramData.put("carCompId",carDetail.getMainMap().get("CAR_COMP_ID").toString());
			paramData.put("carId",carDetail.getDetailMap().get("CAR_ID").toString());
			
			List<Map<String, Object>> optionList = rentService.getCarOption(paramData);
			
			model.addAttribute("mainData",carDetail.getMainMap());
			model.addAttribute("priceList",carDetail.getPriceMap());
			model.addAttribute("estimateData",carDetail.getEstimateMap());
			model.addAttribute("detailData",carDetail.getDetailMap());
			model.addAttribute("optionList",optionList);
			model.addAttribute("param", param);
			
			//상위 사양 뽑기
			if(carDetail.getDetailMap().get("CAR_B_INC_ID") != null){ //상위 사양 ID가 있으면
				Map<String,String> specParam = new HashMap<String,String>();
				specParam.put("parentCarId",carDetail.getDetailMap().get("CAR_B_INC_ID").toString());
				specParam.put("parentCarSeq",carDetail.getDetailMap().get("CAR_B_INC_SEQ").toString());
				List<Map<String, Object>> specList = rentService.selectParentSpec(specParam);
				
				model.addAttribute("specList",specList);
				model.addAttribute("spec",specList.get(0).get("CAR_NAME")); //최상위 스펙 이름
			}
		}

        return return_page;
    }
    
    /* 비교견적창에 국산,수입 렌트/리스 상품 Detail 정보 리턴  */
    @ResponseBody
    @RequestMapping(value = {"/rent/domestic/detail","/rent/imports/detail","/lease/domestic/detail","/lease/imports/detail"}, method=RequestMethod.POST)
    public Map<String, Object> getNewCarDetailtoAjax(@RequestParam Map<String, String> param, Model model, HttpServletRequest request) {
        UrlPathHelper urlPathHelper = new UrlPathHelper();
        String requestURL = urlPathHelper.getOriginatingRequestUri(request);
        param.put("requestURL", requestURL);
        
        CarDetail carDetail = rentService.getNewCarRentDetail(param);
        DecimalFormat df = new DecimalFormat("#,##0");
        
        //compare Data에 쓰이는 만큼만 리턴한다
        Map<String, Object> resultMap = new HashMap<String, Object>(); 
        resultMap.put("companyName",carDetail.getMainMap().get("COMP_FULL_NM")); //회사명
        resultMap.put("carFuel",carDetail.getMainMap().get("DIESEL")); //연료
        resultMap.put("color","미선택"); //색상
        resultMap.put("year","신차"); //연식
        resultMap.put("dist","신차"); //주행거리
        resultMap.put("dpm",Integer.parseInt(carDetail.getDetailMap().get("DPM").toString())+"cc"); //배기량
        resultMap.put("carAmt", carDetail.getEstimateMap().get("CAR_AMT")); //신차자격 
        resultMap.put("depositAmt", carDetail.getEstimateMap().get("RG_8_AMT")); //보증금 
        resultMap.put("agreeDist", carDetail.getEstimateMap().get("AGREE_DIST")); //연간약정운행거리
        
        //가격정보 넣기
        String[] columnArray = {"LB60_AMT","LB48_AMT","LB36_AMT","LS60_AMT","LS48_AMT","LS36_AMT",
                                "RB60_AMT","RB48_AMT","RB36_AMT","RS60_AMT","RS48_AMT","RS36_AMT"};
        
        int agreeDistFoundCount = 0;
        
        String paramAgreeDist = carDetail.getEstimateMap().get("AGREE_DIST").toString();
        String priceMapAgreeDist = "";
        
        for (int i = 0; i < carDetail.getPriceMap().size(); i++) {
        	priceMapAgreeDist = carDetail.getPriceMap().get(i).get("AGREE_DIST").toString();
        	if (priceMapAgreeDist.equals(paramAgreeDist)) {
        		agreeDistFoundCount = i;
        	}
        }
        
        for(String column : columnArray){
            String price = carDetail.getPriceMap().get(agreeDistFoundCount).get(column).toString();
            if(price.equals("0")){
                resultMap.put(column,"이용 불가");
            }else{
                resultMap.put(column,df.format(Integer.parseInt(price)));
            }
        }
        return resultMap;
    }
    
    /* 비교견적창에 재렌트/재리스 상품 Detail 정보 리턴  */
    @ResponseBody
    @RequestMapping(value = "/rent/secondhand/detail", method=RequestMethod.POST)
    public Map<String, Object> getSecondhandCarDetailtoAjax(@RequestParam Map<String, String> param, Model model) throws Exception {
    	
        Map<String, Object> carMap = rentService.selectSecondhandCarDetail(param);
        Map<String, Object> depositMap = rentService.selectSecondhandDepositInfo(carMap);
        DecimalFormat df = new DecimalFormat("#,##0");
        
        //compare Data에 쓰이는 만큼만 리턴한다
        Map<String, Object> resultMap = new HashMap<String, Object>(); 
        if(carMap != null){
            resultMap.put("companyName",carMap.get("CAR_COMP_NM")); //회사명
            resultMap.put("carFuel",carMap.get("FUEL_KD")); //연료
            resultMap.put("color",carMap.get("COLO")); //색상
            resultMap.put("year",carMap.get("CAR_Y_FORM")+"년 형"); //연식
            resultMap.put("dist",df.format(Integer.parseInt(carMap.get("REAL_KM").toString()))+"km"); //주행거리
            resultMap.put("dpm",Integer.parseInt(carMap.get("DPM").toString())+"cc"); //배기량
            resultMap.put("carAmt", carMap.get("TOT_AMT")); //차가
            resultMap.put("depositAmt", depositMap.get("RG_8_AMT")); //보증금
            resultMap.put("maxMonth",carMap.get("MAX_USE_MON")); //최대 개월수
            resultMap.put("agreeDist", carMap.get("AGREE_DIST")); //약정주행거리
            //가격정보 넣기
            if (param.get("brTo") != null) {
		    	if (param.get("brTo").toString().equals("5")) {
		    		carMap.put("brTo", "0");
		    	} else {		    		
		    		carMap.put("brTo", param.get("brTo").toString());
		    	}
		    }
            resultMap.put("priceMap", rentService.makeSecondhandRentPriceTable(carMap));
            
            //가격정보 넣기
            String[] columnArray = {
        		"LB36", "LB24", "LB12", "LS36", "LS24", "LS12",
                "RB36", "RB24", "RB12", "RS36", "RS24", "RS12"
            };
            
            for (String column : columnArray) {
                int price = Integer.parseInt(carMap.get(column).toString());
                if (price <= 0) {
                    resultMap.put(column, "이용 불가");
                } else {
                    resultMap.put(column, df.format(price));
                }
            }
        }
        
        return resultMap;
        
    }
    
    
    /* 신차 견적서 보기  */
    @RequestMapping(value={"/rent/print", "/lease/print"}, method=RequestMethod.GET)
    public String getNewCarEstimatePrintPage(@RequestParam Map<String,String> param, Model model) throws Exception{
    	
    	String return_url = "/rent/estimate/newCar/estimateRM";
    	
        CarDetail car = estiService.getCreatedEstimateInfo(param);
        model.addAttribute("detailData", car.getDetailMap());
        model.addAttribute("data", car.getEstimateMap());
        model.addAttribute("mainData", car.getMainMap());
        
        Map<String,String> jgParam = new HashMap<String,String>();
        jgParam.put("carCompId", car.getDetailMap().get("CAR_COMP_ID").toString());
        jgParam.put("carCode", car.getDetailMap().get("CAR_CODE").toString());
        jgParam.put("carSeq", car.getDetailMap().get("CAR_SEQ").toString());
        jgParam.put("carId", car.getDetailMap().get("CAR_ID").toString());
                
        Map<String, Object> jgMap = estiService.getCarMainCode(jgParam);
        Map<String, Object> examMap = estiService.getEstiExamHp(param.get("estimateId"));
        //비용비교 데이터
        Map<String, Object> compareMap = rentService.getCompareData(car.getEstimateMap().get("EST_ID").toString(),"main");
                
        //공통변수 선수금반영 적용이자율
        String b_dt = estiService.getBDt();
    	String a_a = car.getEstimateMap().get("A_A").toString().substring(0, 1);
    	
    	Map<String, Object> subsidyParam = new HashMap<String, Object>();
    	subsidyParam.put("a_a", a_a);
    	subsidyParam.put("b_dt", b_dt);    	
    	Map<String, Object> subsidyMap = estiService.getSubsidyData(subsidyParam);
        
        model.addAttribute("compareData", compareMap);
        model.addAttribute("paramData", param);
        model.addAttribute("jgData", jgMap);
        model.addAttribute("examData", examMap);
        model.addAttribute("subsidyData", subsidyMap);        
        
        if (car.getMainMap().get("JG_G_7") != null && !car.getMainMap().get("JG_G_7").equals("")) {
        	//친환경차는 200억 초과 손비처리액 계산 하지 않음
        	if (!car.getMainMap().get("JG_G_7").equals("1") && !car.getMainMap().get("JG_G_7").equals("2") && !car.getMainMap().get("JG_G_7").equals("4")) {
        		//200억 초과 손비처리액 계산
        		if (compareMap.get("AE91") != null) {
        			Double ae91 = Double.parseDouble(compareMap.get("AE91").toString());
        			model.addAttribute("calculAE", ae91*0.11);
        		}
        	}
        } else {
        	//200억 초과 손비처리액 계산
    		Double ae91 = Double.parseDouble(compareMap.get("AE91").toString());
    		model.addAttribute("calculAE", ae91*0.11);
        }
        
        //System.out.println(car.getDetailMap().get("JG_CODE"));
        //전기차,수소차 신규 견적서 -- 테슬라는 전기차 견적을 하지 않는다.
        //if (!jgParam.get("carCompId").toString().equals("0056") && !car.getDetailMap().get("JG_CODE").toString().equals("9133")) {
    	/*if ((jgMap.get("JG_G_7")!=null && 
    			(String.valueOf(jgMap.get("JG_G_7")).equals("3") || String.valueOf(car.getMainMap().get("JG_G_7")).equals("3"))) || 
    			(String.valueOf(car.getMainMap().get("PRINT_TYPE")).equals("6"))) {
    		//if(car.getEstimateMap().get("PRINT_TYPE")!=null && String.valueOf(car.getEstimateMap().get("PRINT_TYPE")).equals("6")){
    		param.put("from_page", "/rentLease/print");
    		Map<String, Object> othersEstiMap = rentService.setEstimateEHInfo(param);
    		for (int i = 1; i <= 4; i++) {
    			model.addAttribute("data"+i, othersEstiMap.get("data"+i));
    		}
    		if (othersEstiMap.get("data1")==null) {
    			model.addAttribute("data2", car.getEstimateMap());
    		}
    		
    		return_url = "/rent/estimate/newCar/estimateRM_eh";
    		//return "/rent/estimate/newCar/estimateRM_eh";
    	}*/
        //}
        
        //return "/rent/estimate/newCar/estimateRM";
        return return_url;
    }
    
    
    //견적서 보기(현재, 모바일의 모든 견적서는 /smart/print 를 이용)
    @RequestMapping(value="/smart/print", method=RequestMethod.GET)
    public String getSmartEstimatePrintPage(@RequestParam Map<String,String> param, Model model) throws Exception{
    	CarDetail car = estiService.getCreatedEstimateInfoForSmart(param);
    	
        Map<String,String> jgParam = new HashMap<String,String>();        
        jgParam.put("carCompId", car.getDetailMap().get("CAR_COMP_ID").toString());
        jgParam.put("carCode", car.getDetailMap().get("CAR_CODE").toString());
        jgParam.put("carSeq", car.getDetailMap().get("CAR_SEQ").toString());
        jgParam.put("carId", car.getDetailMap().get("CAR_ID").toString());
        
        if (car.getEstimateMap().get("MGR_NM") != null ) {
        	param.put("carManagedId", car.getEstimateMap().get("MGR_NM").toString());        	        	 
        }
        
        Map<String, Object> detailMap = new HashMap<String, Object>();
        
        if (car.getEstimateMap().get("EST_FROM") != null ) {
	    	if (car.getEstimateMap().get("EST_FROM").toString().equals("secondhand")) {
	        	detailMap = rentService.selectSecondhandCarDetail(param);
	        	model.addAttribute("detailData", detailMap);
	    	} else {
	    		model.addAttribute("detailData", car.getDetailMap());
	    	}
        } else {
        	model.addAttribute("detailData", car.getDetailMap());	        	
        }
        
        //공통변수 선수금반영 적용이자율
        String b_dt = estiService.getBDt();
    	String a_a = car.getEstimateMap().get("A_A").toString().substring(0,1);
    	
    	Map<String, Object> subsidyParam = new HashMap<String, Object>();
    	subsidyParam.put("a_a", a_a);
    	subsidyParam.put("b_dt", b_dt);    	
    	Map<String, Object> subsidyMap = estiService.getSubsidyData(subsidyParam);        
        
        Map<String, Object> jgMap = estiService.getCarMainCode(jgParam);
        Map<String, Object> examMap = estiService.getEstiExamCu(param.get("estimateId"));        
        
        model.addAttribute("data", car.getEstimateMap());
        model.addAttribute("mainData", car.getMainMap());
        model.addAttribute("smartFlag", true);
        model.addAttribute("ecarFlag", param.get("ecarFlag"));
        model.addAttribute("jgData", jgMap);
        model.addAttribute("examData", examMap);
        model.addAttribute("subsidyData", subsidyMap);
        
        if (car.getEstimateMap().get("EST_FROM") != null ) {
            if (car.getEstimateMap().get("EST_FROM").toString().equals("secondhand")) {
            	if (car.getEstimateMap().get("MGR_SSN").toString().equals("rm1")) {
            		return "/rent/estimate/month/estimateRM";
            	} else {
            		return "/rent/estimate/secondhand/estimateRM";
            	}
            }            
        }
        
        //전기차,수소차 신규 견적서 테스트(20190125)
        /*if(jgMap.get("JG_G_7")!=null && 
        	(String.valueOf(jgMap.get("JG_G_7")).equals("3") || String.valueOf(jgMap.get("JG_G_7")).equals("4") ||	
        	 String.valueOf(car.getMainMap().get("JG_G_7")).equals("3") || String.valueOf(car.getMainMap().get("JG_G_7")).equals("4"))
        	){*/
        if(String.valueOf(car.getEstimateMap().get("PRINT_TYPE")).equals("6")){
    		param.put("from_page", "/smart/print");
    		param.put("set_code", car.getEstimateMap().get("SET_CODE").toString());
    		if(car.getEstimateMap().get("EH_CODE")!=null){
    			param.put("eh_code", car.getEstimateMap().get("EH_CODE").toString());
    		}else{
    			param.put("eh_code","");
    		}
    		Map<String, Object> othersEstiMap = rentService.setEstimateEHInfo(param);
    		for(int i=1;i<=4;i++){
    			model.addAttribute("data"+i, othersEstiMap.get("data"+i));
    		}
    		if(othersEstiMap.get("data2")==null){
        		model.addAttribute("data1", null);
        		model.addAttribute("data2", car.getEstimateMap());
        	}
    		return "/rent/estimate/newCar/estimateRM_eh";
        }
        
        return "/rent/estimate/newCar/estimateRM";
    }
    
    
    /* 재렌트,재리스,월렌트 견적서 보기  */
    @RequestMapping(value={"/rent/secondhand/print", "/rent/month/print"}, method=RequestMethod.GET)
    public String getSecondhandEstimatePrintPage(@RequestParam Map<String, String> param, Model model) throws Exception {
        String type = param.get("type");
        String returnUrl = "/rent/estimate/" + type + "/estimateRM";
        
        Map<String, Object> estimateMap = estiService.getSecondhandEstimateInfo(param);
        
        param.put("rentDate", estimateMap.get("RENT_DT").toString());
        
        if (type.equals("secondhand")) { //재리스
            if (Integer.parseInt(estimateMap.get("A_B").toString()) < 12) { //12개월 미만이면 해당 개월수에 해당하는 주행거리 값을 보여준다
                float agreeDist = Float.parseFloat(estimateMap.get("AGREE_DIST").toString());
                float a_b = Float.parseFloat(estimateMap.get("A_B").toString());
                model.addAttribute("divisionDist", Math.round(agreeDist/12*a_b));
            }
            
            Map<String, Object> detailMap = rentService.selectSecondhandCarDetail(param);
            Map<String, Object> compareMap = rentService.getCompareData(estimateMap.get("EST_ID").toString(), "secondhand"); //비용비교 데이터
            Map<String, Object> baseMap = rentService.getSecondhandBaseData(param.get("carManagedId"));
            Map<String, Object> EstiCommVarSh = rentDao.selectEstiCommVarEstimateSh();
            Map<String, Object> shData = rentDao.selectSecondhandData(estimateMap.get("REG_CODE").toString());
            
            String str_ag = "";
            String br_from = "0";
            String br_to = "0";
            int br_cons = 0;
            int price = Integer.parseInt(estimateMap.get("FEE_S_AMT").toString());
            int feeAg = 0;
            int to_fee_s_amt = 0;
            int to_fee_v_amt = 0;
            
            if (param.get("refer") != null) {
            	
            	if (param.get("brFrom").toString().equals("S1")) {
            		br_from = "0";
            	} else if (param.get("brFrom").toString().equals("D1")) {
            		br_from = "1";
            	} else if (param.get("brFrom").toString().equals("G1")) {
            		br_from = "2";
            	} else if (param.get("brFrom").toString().equals("J1")) {
            		br_from = "3";
            	} else if (param.get("brFrom").toString().equals("B1")) {
            		br_from = "4";
            	}            	
            	
            	if (param.get("brTo").toString().equals("")) {
    	    		br_to = br_from;
    	    	} else if (!(param.get("brTo").toString().equals("0") || param.get("brTo").toString().equals("1") || param.get("brTo").toString().equals("2") || param.get("brTo").toString().equals("3") || param.get("brTo").toString().equals("4") || param.get("brTo").toString().equals("5"))) {
    	    		br_to = br_from;
    	    	}else {
    	    		if (param.get("brTo").toString().equals("5")) {
    	    			br_to = "0";
    	    		} else {
    	    			br_to = param.get("brTo").toString();
    	    		}
    	    	}
            	
            	br_cons = Integer.parseInt(EstiCommVarSh.get("BR_CONS_" + br_from + br_to).toString());
            	str_ag = estimateMap.get("MGR_SSN").toString().toUpperCase() + "_AG";
            	feeAg = Integer.parseInt(shData.get(str_ag).toString());
            	
            	to_fee_s_amt = price + (int)Math.round(((double)br_cons / 100000 * feeAg) / 100) * 100;
            	to_fee_v_amt = (int)(to_fee_s_amt * 0.1);
            	
            	estimateMap.put("TO_FEE_S_AMT", to_fee_s_amt);
            	estimateMap.put("TO_FEE_V_AMT", to_fee_v_amt);
            	
            	estimateMap.put("BR_TO_ST", param.get("brTo").toString());
            	
            } else {
            	estimateMap.put("TO_FEE_S_AMT", estimateMap.get("FEE_S_AMT").toString());
            	estimateMap.put("TO_FEE_V_AMT", estimateMap.get("FEE_V_AMT").toString());
            }            
            
            Map<String, String> jgParam = new HashMap<String, String>();
            jgParam.put("carCompId", detailMap.get("CAR_COMP_ID").toString());
            jgParam.put("carCode", detailMap.get("CAR_CD").toString());
            jgParam.put("carSeq", detailMap.get("CAR_SEQ").toString());
            jgParam.put("carId", detailMap.get("CAR_ID").toString());
            Map<String, Object> jgMap = estiService.getCarMainCode(jgParam);
            
            model.addAttribute("detailData", detailMap);
            model.addAttribute("compareData", compareMap); 
            model.addAttribute("baseData", baseMap); //SH_BASE 데이터
            model.addAttribute("jgData", jgMap);
           
        } else { //월렌트
            CarDetail carMap = rentService.selectMonthCarDetailforPrint(param);
            boolean validTimeFlag = rentService.isValidWorkingTime();
            
            model.addAttribute("detailData", carMap.getMainMap());
            model.addAttribute("shortFeeData", carMap.getEstimateMap());
            model.addAttribute("validTimeFlag", validTimeFlag);
        }
        
        model.addAttribute("data", estimateMap);
        model.addAttribute("paramData", param);
        
        return returnUrl;
    }     
    
    @ResponseBody
    @RequestMapping(value="/print/send/email", method=RequestMethod.POST)
    public String sendEmailForPrint(@RequestBody Map<String,String> param) throws UnsupportedEncodingException{
        //메일발송
        String message = "메일 발송이 완료되었습니다";
        String url = "http://fms1.amazoncar.co.kr/mailing/homepage/estimate_format.jsp?title="+URLEncoder.encode(param.get("title"), "EUC-KR")+"&url="+URLEncoder.encode(param.get("url"), "EUC-KR");
        
        boolean result = false;
    	String regex = "^[_a-z0-9-]+(.[_a-z0-9-]+)*@(?:\\w+\\.)+\\w+$";
    	Pattern p = Pattern.compile(regex); 
    	Matcher m = p.matcher(param.get("email").toString()); 
    	if (m.matches()) {
    		result = true;
    	}
        
        try{
            if (result == true) {            	
            	mailHelper.sendMail("[아마존카]고객님의 견적서입니다", param.get("email"), url, param.get("estimateId"));
            }
        }catch(Exception e){
            message= "오류가 발생했습니다. 관리자에게 문의해주세요";
        }
        
        return message;
    }

}   


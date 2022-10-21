package com.amazon.hp.company.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.amazon.hp.home.service.HomeService;

@Controller
public class companyController {
    
	@Autowired
    HomeService homeService;
	
    @RequestMapping("/company/branch")
    public String showBranchPage(Model model){
        return "/company/branch";
    }
    
    @RequestMapping("/company/garage")
    public String showGaragePage(Model model){
    	return "/company/garage";
    }
    
    @RequestMapping("/company/introduce")
    public String showCompanyPage(Model model){
    	Map<String,Object> infoData = homeService.getHomepageMainInfo();
    	Map<String, Object> compInfoData = homeService.getHomepageMainCompInfo();
        /*model.addAttribute("info_car",infoData.get("VAR").toString().split(";")[0]);
        model.addAttribute("info_asset",infoData.get("VAR").toString().split(";")[1]);
        model.addAttribute("info_client",infoData.get("VAR").toString().split(";")[2]);
        model.addAttribute("info_year",infoData.get("VAR").toString().split(";")[3]);
        model.addAttribute("info_score",infoData.get("VAR").toString().split(";")[4]);*/
    	if(infoData !=null){
			model.addAttribute("info_car", 	 infoData.get("VAR1"));
			model.addAttribute("info_asset", infoData.get("VAR2"));
			model.addAttribute("info_client",infoData.get("VAR3"));
			model.addAttribute("info_year",	 infoData.get("VAR4"));
			model.addAttribute("info_score", infoData.get("VAR5"));
        }
    	model.addAttribute("info_open_year", compInfoData.get("OPEN_YEAR"));
    	model.addAttribute("info_continue_year", compInfoData.get("CONTINUE_YEAR"));
    	
        Map<String,Object> infoList = homeService.getHomepageMainInfo2();
        model.addAttribute("info_date", infoList);
        
        return "/company/company";
    }
    
    @RequestMapping("/company/recruit")
    public String showRecruitPage(Model model){
    	
    	Map<String,Object> comInfo = homeService.getComInfo();
    	model.addAttribute("comInfo", comInfo);
    	
    	List<Map<String, Object>> recruitmentList = homeService.getRecruitmentList();
    	model.addAttribute("recruitmentList", recruitmentList);
    	
    	List<Map<String, Object>> qualificationList = homeService.getQualificationList();
    	model.addAttribute("qualificationList", qualificationList);
    	
    	List<Map<String, Object>> benefitList = homeService.getBenefitList();
    	model.addAttribute("benefitList", benefitList);
    	
    	List<Map<String, Object>> recruitList = homeService.getRecruitList();
    	model.addAttribute("recruitList", recruitList);
        
        return "/company/newRecruit";
    }
    
}

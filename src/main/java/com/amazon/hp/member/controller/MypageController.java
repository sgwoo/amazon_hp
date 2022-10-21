package com.amazon.hp.member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import com.amazon.hp.home.service.HomeService;
import com.amazon.hp.member.service.MemberService;

import org.apache.catalina.connector.ClientAbortException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.amazon.hp.member.util.exception.CustomAuthException;
import com.amazon.hp.member.util.social.FrontUserDetail;
import com.amazon.hp.util.PagingUtil;

import net.sf.json.JSONArray;

@Controller
public class MypageController {

    @Autowired
    MemberService memberService;

    /*
     * 견적 리스트 메뉴 이동 (마이페이지 기본 메뉴)
     * */
    @RequestMapping(value = "/mypage/rent/list") 
    public String mypage(@AuthenticationPrincipal FrontUserDetail userDetail, Model model
    		,@RequestParam(value="pageNum",defaultValue="1") int currentPage
    		,@RequestParam(value="searchText", defaultValue="") String searchText
    		,@RequestParam(value="esti_type", defaultValue="") String esti_type
    		,@RequestParam(value="esti_stat", defaultValue="") String esti_stat
    		) throws CustomAuthException {

        if(userDetail == null){
            throw new CustomAuthException("로그인이 필요한 서비스입니다");
        }
        
        HashMap<String, Object> params = new HashMap<String, Object>();
        params.put("email", userDetail.getEmail());
		List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();		
		
		int rowCount = 10;
		int pageCount = 10;		
		params.put("email", userDetail.getEmail());
		params.put("searchText", searchText);
		params.put("esti_type", esti_type);
		params.put("esti_stat", esti_stat);
		//총 리스트갯수 또는 검색된 건의 갯수
		int count = memberService.selectEstimateListCnt(params);
		
		PagingUtil page = new PagingUtil(searchText, esti_type, esti_stat, currentPage, count, rowCount, pageCount,"/mypage/rent/list");	
		params.put("startnum", page.getStartCount());
		params.put("endnum", page.getEndCount());
		
        resultList = memberService.selectEstimateList(params);        
        
        model.addAttribute("list", resultList);
        model.addAttribute("list_cnt", count);
        model.addAttribute("pageStr", page.getPagingHtml());
        model.addAttribute("searchText", searchText);
        model.addAttribute("esti_type", esti_type);
        model.addAttribute("esti_stat", esti_stat);
        
        return "/member/rentList";
    }

    /*
     * 회원정보 메뉴 이동
     * */
    @RequestMapping(value = "/mypage/info")
    public String mypageRentList(@AuthenticationPrincipal FrontUserDetail userDetail, Model model) throws CustomAuthException {

        if(userDetail == null){
            throw new CustomAuthException("로그인이 필요한 서비스입니다");
        }

        Map<String, Object> userInfo = memberService.selectUserInfo(userDetail.getEmail()); //Email 二쇱냼 �뀑�똿
        model.addAttribute("userInfo", userInfo);

        return "/member/info";
    }

    /*
     * 불편합니다 접수내역 보기
     * */
    
    @RequestMapping(value="/mypage/feedback/list")
    public String showFeedbackList(@AuthenticationPrincipal FrontUserDetail userDetail, Model model) throws CustomAuthException {

        if(userDetail == null){
            throw new CustomAuthException("로그인이 필요한 서비스입니다");
        }

        List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();

        // FOR TEST
        //resultList = memberService.selectComplainList("ejrgudoxd203@naver.com");
        resultList = memberService.selectComplainList(userDetail.getEmail());
        model.addAttribute("list", resultList);

//        Map<String, Object> userInfo = memberService.selectUserInfo(userDetail.getEmail()); //Email 二쇱냼 �뀑�똿
//        model.addAttribute("userInfo", userInfo);


        return "/member/feedbackList";

    }


    /*
     * 회원정보수정 action
     * Ajax
     * */
    @RequestMapping(value="/mypage/updateUser", method=RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> updateUserInfo(@RequestBody Map<String, Object> params, @AuthenticationPrincipal FrontUserDetail userDetail){
        
        Map<String, Object> resultMap = new HashMap<String,Object>();
        
        try{
            memberService.updateUserInfo(params, userDetail);
            
        }catch(Exception e){
            resultMap.put("message",e.getMessage());
            return resultMap;
        }
        
        resultMap.put("message", "회원 정보가 정상적으로 변경되었습니다");
        return resultMap;
    }
    

    /*
     * 회원탈퇴 Action 
     * */
    @RequestMapping(value="/mypage/deleteUser")
    public String deleteUser(@AuthenticationPrincipal FrontUserDetail userDetail){
        
        return "index";
    }
    

    /*
     * 불편합니다 메뉴 이동
     * */
    @RequestMapping(value="/feedback")
    public String feedback(@AuthenticationPrincipal FrontUserDetail userDetail, Model model) throws CustomAuthException {
        
        if(userDetail == null){
            throw new CustomAuthException("로그인이 필요한 서비스입니다");
        }
        
        Map<String, Object> userInfo = memberService.selectUserInfo(userDetail.getEmail()); //Email 二쇱냼 �뀑�똿
        model.addAttribute("userInfo", userInfo);
        
        return "/member/feedback";
    }
    
    //예약 취소 Ajax
    @ResponseBody
    @RequestMapping(value="/cancelReservation")
    public int cancelReservation(@RequestBody Map<String, Object> param){
    	String car_mng_id = (String) param.get("car_mng_id");
    	String seq = (String) param.get("seq");
    	
    	Map<String, Object> params = new HashMap<String,Object>();
    	params.put("CAR_MNG_ID", car_mng_id);
    	params.put("SEQ", seq);
    	
    	int result = memberService.cancelReservation(params);
    	
    	return result;
    }
    
    //회원탈퇴 Ajax
    @ResponseBody
    @RequestMapping(value="/withdrawMember")
    public int withdrawMember(HttpServletResponse response,
    		@RequestParam(value="w_email") String email,
    		@RequestParam(value="flowPath", defaultValue="") String flowPath
    		){    	
    	int result = memberService.withdrawMember(email);
    	
    	//모바일에서 온 경우 
    	if(flowPath.equals("mobile")){    		    		
    		if(result==1){
    			String withdraw = "success";
    			try {
					response.sendRedirect("https://www.amazoncar.co.kr/home/mobile/myinfo.jsp?withdraw="+withdraw);
    			} catch (ClientAbortException cae) {
    				System.out.println(cae.getMessage());
				} catch (IOException e) {					
					e.printStackTrace();
				}
    		}
    	}
    	return result;
    }
    
    //마이페이지 견적리스트에서 견적건 사용안함 처리 Ajax
    @ResponseBody
    @RequestMapping(value="/deleteMyEstimate")
    public int deleteMyEstimate(@RequestBody Map<String, Object> param){
    	String est_id = (String) param.get("est_id");
    	int result = memberService.deleteMyEstimate(est_id);
    	return result;
    }
    
    // 마이페이지 > 견적리스트 선택 삭제
    @SuppressWarnings("unchecked")
	@ResponseBody
    @RequestMapping(value="/deleteSelectedEstimate")
    public int deleteSelectedEstimate(@RequestBody String param){
    	List<Map<String, Object>> resultMap = new ArrayList<Map<String, Object>>();
    	resultMap = JSONArray.fromObject(param);
    	int result = 0;
    	for(Map<String, Object> map : resultMap) {
    		String est_id = (String) map.get("est_id");
    		result += memberService.deleteMyEstimate(est_id);
    	}
    	return result;
    }
    

}

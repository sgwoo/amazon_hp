package com.amazon.hp.home.service;

import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amazon.hp.home.dao.HomeDAO;
import com.amazon.hp.home.dao.UserDAO;
import com.amazon.hp.rent.dao.RentDAO;
import com.amazon.hp.util.SendMessengerHelper;

@Service
public class UserService {
    
    @Autowired
    UserDAO userDAO;
    HomeDAO homeDAO;
    
    @Autowired
    RentDAO rentDAO;
    
    @Autowired
    SendMessengerHelper msgHelper;
    
    private static final String KEY = "d370da99bbf9866897f99b463fa619ca9001ce20";  //아마존카_알림
    
    /*
     * 사전예약 신청 내역 쿨메신저 메세지 발송
     */
    @Transactional
    public boolean insertEstimateReserveInfoToCoolMsg(Map<String, String> params){
    	List<Map<String,Object>> empList = searchDamdangEmpList(params.get("estArea").split("/")[0], params.get("estArea").split("/")[1]);
        Map<String, Object> dangjikMap = new HashMap<String,Object>();
        
        String subject = "전기차 수소차 사전예약 등록";
        String content = "전기차 수소차 사전예약 - "+ params.get("estArea") + "-" + params.get("est_nm") +" 에 대한 사전예약이 등록되었습니다.";
        String sender = "";
        String xmlData = "";
        boolean flag;
        
        if(empList.size() > 0){
            for(Map<String,Object> user : empList){
                xmlData += "<TARGET>" + user.get("ID") + "</TARGET>";
            }
        }        
        
        //해당 지점 당직자 리스트 뽑기
        String brId = searchBrId(params.get("estArea").split("/")[0], params.get("estArea").split("/")[1]);
        
        //시간대에 따른 분류
        Date today = new Date();        
        SimpleDateFormat date = new SimpleDateFormat("yyyyMMdd");
        SimpleDateFormat time = new SimpleDateFormat("hhmmss");
        
        String year  = String.valueOf(date.format(today)).substring(0,4);
        String month = String.valueOf(date.format(today)).substring(4,6);
        String day   = String.valueOf(date.format(today)).substring(6,8);
        String hms   = time.format(today);
        
        if(Integer.parseInt(String.valueOf(hms))>180000){
            day = String.valueOf(Integer.parseInt(day) + 1);
            if(Integer.parseInt(day)<10){
                day = "0" + day;
            }
        }
        dangjikMap = makeDangjikParam(brId, year, month, day);
        
        /*while (dangjikMap.get("target_1")==null) {
            day = String.valueOf(Integer.parseInt(day)+1);
            dangjikMap = makeDangjikParam(brId,year,month,day);
            
            if (day.equals("20")) {
            	break;
            }
        }*/
        
        if(dangjikMap != null){
            xmlData += "<TARGET>" + dangjikMap.get("target_1") + "</TARGET>";
            if(dangjikMap.get("target_2")!=null){
                xmlData += "<TARGET>" + dangjikMap.get("target_2") + "</TARGET>";
            }
            flag = msgHelper.createXmlData(subject, content, "http://fms1.amazoncar.co.kr/acar/estimate_mng/esti_spe_grid_big_frame", "", sender, xmlData);
        } else {
        	System.out.println("당직자 조회결과 없음 - 당직자 입력필요");
        	flag = true;
        }
        
        return flag;
    }
    
    
    /*
     * 쿨메신저 알람으로 견적상담 신청 내역 알려주기
     */
    @Transactional
    public boolean insertEstimateInfoToCoolMsg(Map<String, String> params){
    	List<Map<String,Object>> empList = searchDamdangEmpList(params.get("estArea").split("/")[0], params.get("estArea").split("/")[1]);
    	Map<String, Object> dangjikMap = new HashMap<String,Object>();
    	
    	String subject = "스마트견적 등록";
    	String content = "스마트견적 - "+ params.get("estArea") + "-" + params.get("estName") +" 에 대한 스마트 견적이 등록되었습니다.";
    	String sender = "";
    	String xmlData = "";
    	boolean flag;
    	
    	if(empList.size() > 0){
    		for(Map<String,Object> user : empList){
    			xmlData += "<TARGET>" + user.get("ID") + "</TARGET>";
    		}
    	}
    	
    	//해당 지점 당직자 리스트 뽑기
    	String brId = searchBrId(params.get("estArea").split("/")[0], params.get("estArea").split("/")[1]);
    	
    	//시간대에 따른 분류
    	Date today = new Date();        
    	SimpleDateFormat date = new SimpleDateFormat("yyyyMMdd");
    	SimpleDateFormat time = new SimpleDateFormat("hhmmss");
    	
    	String year  = String.valueOf(date.format(today)).substring(0,4);
    	String month = String.valueOf(date.format(today)).substring(4,6);
    	String day   = String.valueOf(date.format(today)).substring(6,8);
    	String hms   = time.format(today);
    	
    	if(Integer.parseInt(String.valueOf(hms))>180000){
    		day = String.valueOf(Integer.parseInt(day) + 1);
    		if(Integer.parseInt(day)<10){
    			day = "0" + day;
    		}
    	}
    	dangjikMap = makeDangjikParam(brId, year, month, day);
    	
    	/*while (dangjikMap.get("target_1")==null) {
    		day = String.valueOf(Integer.parseInt(day)+1);    
    		dangjikMap = makeDangjikParam(brId,year,month,day);
    		
    		if (day.equals("20")) {
            	break;
            }
    	}*/
    	
    	if(dangjikMap != null){
    		xmlData += "<TARGET>" + dangjikMap.get("target_1") + "</TARGET>";
    		if(dangjikMap.get("target_2")!=null){
    			xmlData += "<TARGET>" + dangjikMap.get("target_2") + "</TARGET>";
    		}
    		flag = msgHelper.createXmlData(subject, content, "http://fms1.amazoncar.co.kr/acar/estimate_mng/esti_spe_grid_big_frame", "", sender, xmlData);
    	} else {
    		System.out.println("당직자 조회결과 없음 - 당직자 입력필요");
    		flag = true;
    	}
    	
    	return flag;
    }
    
    /*
     * 지역으로 지점 찾기
     * */
    public String searchBrId(String estArea, String county){
        String BrId = "";
        
        if(estArea.equals("서울")){
            if(county.equals("강남구")||county.equals("서초구")||county.equals("성동구")){
                BrId = "S2"; //강남
            }else if(county.equals("종로구")||county.equals("동대문구")||county.equals("중구")||county.equals("용산구")||county.equals("중랑구")||county.equals("성북구")||county.equals("노원구")||county.equals("서대문구")||county.equals("은평구")||county.equals("도봉구")||county.equals("강북구")){
                BrId = "S5"; //강북
            }else if(county.equals("송파구")||county.equals("강동구")||county.equals("광진구")){
                BrId = "S6"; //송파    
            }else{
                BrId = "S1"; //본사
            }
        }else if(estArea.equals("경기")){
            if(county.equals("과천시")){
                BrId = "S2"; //강남
            }else if(county.equals("김포시")||county.equals("부천시")||county.equals("시흥시")){
                BrId = "I1"; //인천
            }else if(county.equals("고양시")||county.equals("광명시")||county.equals("안양시")||county.equals("파주시")){
                BrId = "S1"; //본사
            }else if(county.equals("군포시")||county.equals("수원시")||county.equals("안산시")||county.equals("안성시")||county.equals("여주군")||county.equals("오산시")||county.equals("용인시")||county.equals("의왕시")||county.equals("이천시")||county.equals("평택시")||county.equals("화성시")){
                BrId = "K3"; //수원
            }else if(county.equals("성남시")||county.equals("하남시")||county.equals("광주시")||county.equals("가평군")||county.equals("구리시")||county.equals("남양주시")||county.equals("양평군")){
                BrId = "S6"; //송파
            }else if(county.equals("동두천시")||county.equals("양주시")||county.equals("연천군")||county.equals("의정부시")||county.equals("포천시")){
                BrId = "S5"; //강북지점
            }
        }else if(estArea.equals("인천")){
            BrId = "I1";
        }else if(estArea.equals("강원")){
            if(county.equals("춘천시")||county.equals("양구군")||county.equals("철원군")||county.equals("화천군")||county.equals("홍천군")||county.equals("인제군")||county.equals("고성군")||county.equals("속초시")||county.equals("양양군")){
                BrId = "S6"; //송파
            }else if(county.equals("원주시")||county.equals("횡성군")||county.equals("평창군")||county.equals("강릉시")||county.equals("정선군")||county.equals("영월군")||county.equals("태백시")||county.equals("동해시")||county.equals("삼척시")){
                BrId = "K3"; //수원
            }
        }else if(estArea.equals("경남")||estArea.equals("부산")||estArea.equals("울산")){
            BrId = "B1"; //부산
        }else if(estArea.equals("전남")||estArea.equals("광주")||estArea.equals("제주")||estArea.equals("전북")){
            BrId = "J1"; //광주
        }else if(estArea.equals("경북")||estArea.equals("대구")){
                BrId = "G1"; //대구
        }else if(estArea.equals("충남")||estArea.equals("충북")||estArea.equals("대전")||estArea.equals("세종")){
            BrId = "D1"; //대전 
        }
        return BrId;
    }
    
    /*
     * 지역에 따라 담당자 찾기 
     * */
    public List<Map<String,Object>> searchDamdangEmpList(String estArea, String county){
        String mode = "MESSAGE_";
        String brId = searchBrId(estArea,county);
        
        HashMap<String,Object> param = new HashMap<String,Object>();
        param.put("mode",mode+brId);
        List<Map<String,Object>> damdangList = userDAO.selectDamdangEmpList(param);
        
        return damdangList;
    }
    
    /*
     * 사전예약 지역에 따라 담당자 찾기 
     * */
    public List<Map<String,Object>> searchDamdangEmpList2(String est_area){
    	String mode = "MESSAGE_";
    	String brId = est_area;
    	
    	HashMap<String,Object> param = new HashMap<String,Object>();
    	param.put("mode",mode+brId);
    	List<Map<String,Object>> damdangList = userDAO.selectDamdangEmpList2(param);
    	
    	return damdangList;
    }
    
    /*
     * 쿨메신저 알람으로 월렌트 예약 내역 알려주기
     */
    //@Transactional
    public boolean insertReserveMonthRentInfoToCoolMsg(Map<String, String> params){
        List<Map<String,Object>> empList = searchDamdangEmpList(params.get("estArea").split("/")[0], params.get("estArea").split("/")[1]);
        
        //차량 현재위치 구해서 해당 지역 지점 담당자들에게도 메신져 보내기(2017.12.15)
        HashMap<String,Object> param = new HashMap<String,Object>();
        Map<String, Object> dangjikMap = new HashMap<String,Object>();
        param.put("mode", "MESSAGE_" + params.get("br_id"));
        List<Map<String,Object>> empList2 = userDAO.selectDamdangEmpList(param);
        String subject = "월렌트 차량예약";
        String content = "월렌트 차량예약 - "+ params.get("estArea") + "-" + params.get("estName") +" 에 대한 월렌트 차량예약이 등록되었습니다.";
        String sender = "";
        String xmlData = "";
        boolean flag;
        
        if(empList.size() > 0){    //고객이 입력한 지역의 담당자
            for(Map<String,Object> user : empList){
                xmlData += "<TARGET>" + user.get("ID") + "</TARGET>";
            }
        }
        if(empList2.size() > 0){ //차량의 현재위치 지역의 담당자
            for(Map<String,Object> user : empList2){
                xmlData += "<TARGET>" + user.get("ID") + "</TARGET>";
            }
        }
        
        //해당 지점 당직자 리스트 뽑기
        String brId = searchBrId(params.get("estArea").split("/")[0], params.get("estArea").split("/")[1]);
        
        //시간대에 따른 분류
        Date today = new Date();        
        SimpleDateFormat date = new SimpleDateFormat("yyyyMMdd");
        SimpleDateFormat time = new SimpleDateFormat("HHmmss");
        
        String year  = String.valueOf(date.format(today)).substring(0,4);
        String month = String.valueOf(date.format(today)).substring(4,6);
        String day   = String.valueOf(date.format(today)).substring(6,8);
        String hms   = time.format(today);
        
        if(Integer.parseInt(String.valueOf(hms))>180000){
            day = String.valueOf(Integer.parseInt(day) + 1);
            if(Integer.parseInt(day)<10){
                day = "0" + day;
            }
        }
        dangjikMap = makeDangjikParam(brId, year, month, day);
        
        /*while (dangjikMap.get("target_1")==null) {
            day = String.valueOf(Integer.parseInt(day)+1);    
            dangjikMap = makeDangjikParam(brId,year,month,day);
            
            if (day.equals("31")) {
            	break;
            }
        }*/
        
        if(dangjikMap != null){
            xmlData += "<TARGET>" + dangjikMap.get("target_1") + "</TARGET>";
            if(dangjikMap.get("target_2")!=null){
                xmlData += "<TARGET>" + dangjikMap.get("target_2") + "</TARGET>";
            }
            flag = msgHelper.createXmlData(subject, content, "http://fms1.amazoncar.co.kr/acar/estimate_mng/esti_spe_grid_big_frame", "", sender, xmlData);
        } else {
        	System.out.println("당직자 조회결과 없음 - 당직자 입력필요");
        	flag = true;
        }        
        
        return flag;
    }
    
    /*
     *  문자SMS 전송(월렌트 예약시 고객에게 전송)
     *  FMS 카카오 알림톡 템플릿에 맞게 수정(2017.12.27)
     */
    @Transactional
    public int insertSendSMSForReserve(Map<String, String> params){
        
        String send_phone = "02-392-4242";
        String dest_phone = params.get("estTel");
        String dest_name = params.get("estName");
        String carName = params.get("carName");
        String carNum = params.get("car_no");
        //예약기한 formating
        String res_end_dt = params.get("res_end_dt");
        res_end_dt = res_end_dt.substring(0,4) + "년 " + res_end_dt.substring(4,6) + "월 " + res_end_dt.substring(6,8) + "일 16시";
        
        //월렌트 예약확인 메일 템플릿 컨텐츠를 FETCH
        HashMap<String,Object> templateMap = (HashMap<String, Object>) userDAO.getTemplateList();
        String content = (String) templateMap.get("CONTENT");
        //템플릿 컨텐츠 필드값에 고객, 차량정보 적용
        content = content.replace("#{customer_name}", dest_name);
        content = content.replace("#{car_name}", carName);
        content = content.replace("#{car_num}", carNum);
        content = content.replace("#{expiration_date}", res_end_dt);
        
        HashMap<String, Object> param = new HashMap<String, Object>();
        
        param.put("template_code", "acar0097");    //월렌트예약확인(홈페이지) 템플릿코드
        param.put("date_client_req", new java.util.Date());  //문자 발송 시간은 현재시간
        param.put("subject", " ");
        param.put("content", content);
        param.put("dest_phone", dest_phone);        
        param.put("send_phone", send_phone);
        param.put("l_cd", "");
        param.put("send_name", "999999");    
        param.put("sender_key", KEY);        
        
        int flag = userDAO.insertConfResEmail(param);
        
        return flag;
    }
    
    
    //FMS당직일지 기준으로 당직자 찾기
    public Map<String,Object> searchDangjikList(Map<String, Object> param){
        Map<String,Object> dangjikMap = userDAO.selectDangjikList(param);
        return dangjikMap;
    }
    
    //지점 정보를 fetch
    public Map<String,Object> getBranch(String br_id){
        Map<String,Object> branchMap = userDAO.selectBranch(br_id);
        return branchMap;
    }
    
    //해당 지점 당직자 리스트 뽑기
    public Map<String,Object> makeDangjikParam(String br_id, String year, String month, String day){
        
        Map<String,Object> param      = new HashMap<String,Object>();
        Map<String,Object> resultMap = new HashMap<String,Object>();
        String watch_type = "1";
        
        //지역에 따른 분류
        if(br_id.equals("S1")||br_id.equals("S5")||br_id.equals("S6")){
            watch_type = "1";
        }else if(br_id.equals("S2")||br_id.equals("I1")||br_id.equals("K3")){
            watch_type = "5";
        }else if(br_id.equals("B1")||br_id.equals("G1")){
            watch_type = "3";
        }else if(br_id.equals("D1")||br_id.equals("J1")){
            watch_type = "4";    
        }
        
        param.put("year", year);
        param.put("month", month);
        param.put("date", day);
        param.put("watch_type", watch_type);
        
        Map<String,Object> dangjikMap = searchDangjikList(param);
        if(dangjikMap != null){
            
            if(br_id.equals("S1")){
                resultMap.put("target_1", dangjikMap.get("ID3"));    //본사 주간당직자1
                resultMap.put("target_2", dangjikMap.get("ID4"));    //본사 주간당직자2
            }else if(br_id.equals("S5")){
                resultMap.put("target_1", dangjikMap.get("ID7"));    //강북(종로) 주간당직자
            }else if(br_id.equals("S6")){
                resultMap.put("target_1", dangjikMap.get("ID8"));    //송파 주간당직자
            }else if(br_id.equals("S2")){
                resultMap.put("target_1", dangjikMap.get("ID5"));    //강남 주간당직자
            }else if(br_id.equals("I1")){
                resultMap.put("target_1", dangjikMap.get("ID3"));    //인천 주간당직자
            }else if(br_id.equals("K3")){
                resultMap.put("target_1", dangjikMap.get("ID4"));    //수원 주간당직자
            }else if(br_id.equals("B1")){
                resultMap.put("target_1", dangjikMap.get("ID5"));    //부산 주간당직자
            }else if(br_id.equals("G1")){
                resultMap.put("target_1", dangjikMap.get("ID6"));    //대구 주간당직자
            }else if(br_id.equals("D1")){
                resultMap.put("target_1", dangjikMap.get("ID5"));    //대전 주간당직자
            }else if(br_id.equals("J1")){
                resultMap.put("target_1", dangjikMap.get("ID6"));    //광주 주간당직자
            }
        }
        return resultMap;
    }

}
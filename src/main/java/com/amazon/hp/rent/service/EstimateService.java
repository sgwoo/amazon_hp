package com.amazon.hp.rent.service;

import java.net.URLDecoder;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;

import com.amazon.hp.home.dao.UserDAO;
import com.amazon.hp.member.dao.MemberDAO;
import com.amazon.hp.model.CarDetail;
import com.amazon.hp.rent.dao.EstimateDAO;
import com.amazon.hp.rent.dao.RentDAO;
import com.amazon.hp.util.CryptoUtil;


@Service
public class EstimateService{
    
    @Autowired  RentDAO rentDao;
    @Autowired  EstimateDAO estiDao;
    @Autowired  private Environment env;
    @Autowired  UserDAO userDao;
    @Autowired  MemberDAO memberDao;

    /* 견적 데이터 넣기 */
    @Transactional
    public String insertEstimateData(Map<String, String> param) throws Exception {
    	//인코딩한 옵션 정보 디코딩하기
        String optionName = URLDecoder.decode(param.get("optName"), "UTF-8");
        String contiRat = URLDecoder.decode(param.get("contiRat"), "UTF-8");
        String colorName = URLDecoder.decode(param.get("colorName"), "UTF-8");
        String car_etc = URLDecoder.decode(param.get("car_etc"), "UTF-8");
        String dc_bigo = URLDecoder.decode(param.get("dc_bigo"), "UTF-8");
        String esti_d_etc = URLDecoder.decode(param.get("esti_d_etc"), "UTF-8");
        
        String print_type = param.get("print_type");
        String a_a = param.get("a_a");
        
        param.put("optName", optionName);
        param.put("contiRat", contiRat);
        param.put("colorName", colorName);
        param.put("car_etc", car_etc);
        param.put("dc_bigo", dc_bigo);
        param.put("esti_d_etc", esti_d_etc);
        
        //스마트 견적 관리인 경우 DC 가격 갖고 오기
        if(param.get("dcAmt") == null || param.get("dcAmt") == ""){
            Map<String, Object> dcInfo = estiDao.selectSmartDCprice(param);
            param.put("dcAmt", dcInfo.get("CAR_D_P").toString());   
        }
        
        //보증금이나 선납금 가운데 둘 중 하나라도 있으면 pp_st 값 변경
        int rgAmt = Integer.parseInt(param.get("rg_8_amt"));
        int ppAmt = Integer.parseInt(param.get("pp_amt"));
        String ppStatus = "0";
        if (ppAmt > 0 || rgAmt > 0) {
            ppStatus = "2";
        }
        param.put("ppStatus", ppStatus);
        String[] jobArray = {"org", "cls"};
        String regCode = Long.toString(System.currentTimeMillis());
        
        int udt_st = 4;
        int loc_st = Integer.parseInt(param.get("loc_st").toString());

        //차량인도지역에 따라 차량인수지가 달라진다
        if(loc_st == 7) { udt_st = 2; }
        else if (loc_st == 6) { udt_st = 5; }
        else if (loc_st == 5) { udt_st = 6; }        
        else if (loc_st == 4) { udt_st = 3; }
        else if (loc_st == 3 || loc_st == 2 || loc_st == 1) { udt_st = 1; }
        param.put("udt_st", String.valueOf(udt_st));
        
        //견적 데이터를 각각 다른 job 값을 넣어 두개 별도로 넣는다. 
        for (int i = 1; i < 3; i++) {
            
            //estimateId를 regCode에 1,2를 붙여 생성한다
            String estimateId = regCode + "" + i;
            
            DateFormat updateFormat = new SimpleDateFormat("yyyyMMdd");
            DateFormat regFormat = new SimpleDateFormat("yyyyMMddHHss");
            Date today = new Date();
            
            param.put("estId", estimateId);
            param.put("regCode", regCode);
            param.put("regDate", regFormat.format(today).toString());
            param.put("updateDate", updateFormat.format(today).toString());
            param.put("rentDate", updateFormat.format(today).toString());
            param.put("estType", "F");
            param.put("job", jobArray[i-1]);
            
            /*if (print_type.equals("6")) {
            	param.put("eh_code", regCode);
            } else {
            	param.put("eh_code", "");
            }*/
            
            if (jobArray[i-1] == "cls") { //job이 cls면 개월 수를 절반만 넣어준다. 위약금계산을 위한 데이터
                int clsMonth = Integer.parseInt(param.get("a_b"))/2;
                clsMonth = Math.round(clsMonth);		// clsMonth 반올림 처리. 2021.02.19.
                param.put("a_b", String.valueOf(clsMonth));
            }
            
            estiDao.insertEstimateData(param);
            estiDao.insertEstiExamData(estimateId);
            estiDao.insertEstiCompareData(estimateId);
        }
        
        Map<String, Object> paramMap = new HashMap<String, Object>();
        List<Map<String, Object>> standardDateList = rentDao.selectStarndardDate(); //기준날짜 뽑기
        
        //기준 날짜 뽑아온 것을 table 형태에서 map 형태로 바꾼다
        for (int z = 0; z < standardDateList.size(); z++) {
            String targetDateString = standardDateList.get(z).get("STD_DT").toString();
            paramMap.put(standardDateList.get(z).get("GUBUN").toString(), targetDateString);
        }
        
        paramMap.put("estTable", "");
        
        if (print_type.equals("6")) {
        	if (a_a.equals("22") || a_a.equals("12")) { // 기본식일 경우 인수반납선택형        		
        		try {
        			paramMap.put("regCode", regCode);
        			estiDao.ExecEstimateRegEv(paramMap);
					
				} catch (Exception e) {
					System.out.println(e);
				}
        	}
        }
        
        return regCode;
    }
    
    /* 월대여료,잔가,위약금 계산 */
    public Map<String, Object> getEstimateFeePerMonth(String regCode, String type, String car_comp_id, String a_a) throws ParseException{
        Map<String, Object> paramMap = new HashMap<String, Object>();
        List<Map<String, Object>> standardDateList = rentDao.selectStarndardDate(); //기준날짜 뽑기
        
        //기준 날짜 뽑아온 것을 table 형태에서 map 형태로 바꾼다
        for (int i = 0; i < standardDateList.size(); i++) {
            String targetDateString = standardDateList.get(i).get("STD_DT").toString();
            paramMap.put(standardDateList.get(i).get("GUBUN").toString(),targetDateString);
        }
        
        paramMap.put("regCode", regCode);
        paramMap.put("estTable", "");
        
        Map<String, Object> estiMap = new HashMap<String, Object>();
        if (type == "secondhand") { 	//재렌트 재리스 견적 요청이면
        	if (Integer.parseInt(car_comp_id) > 5) {	//수입차 리스이면 INS_PER 값을 2로 세팅(수입차 리스 보험미포함, 견적불가 -> 가능하게 처리, 2017.06.01)
        		if (a_a.equals("12") || a_a.equals("11")) {
	        		//20200508 수입차 리스 보험포함이기 때문에 업데이트를 타지 않도록 주석처리.
        			//estiDao.updateInsPerSetting(paramMap);
        		}
        	}
        	//System.out.println(paramMap);
            estiDao.ExecSecondhandEstimateAmt(paramMap);
            estiDao.ExecSecondhandEstimateFee(paramMap);
            estiMap = rentDao.selectSecondhandEstimateData(regCode);
            //System.out.println(estiMap);
            
        } else if (type == "recalculate") { //인수가 조정 견적이면
            estiDao.ExecEstimateFee(paramMap);
            estiDao.ExecEstimateClsper(paramMap); // <--위약금 조정 부분 추가
            estiMap = rentDao.selectEstimateData(regCode);

        } else { //국산신차면
        	
            estiDao.ExecEstimateJanga(paramMap);
            estiDao.ExecEstimateFee(paramMap);
            estiDao.ExecEstimateClsper(paramMap);
            estiMap = rentDao.selectEstimateData(regCode);
        }
        
        Map<String, Object> resultMap = new HashMap<String, Object>();
        DecimalFormat df = new DecimalFormat("#,##0");
        /*int supplyAmt = Integer.parseInt(estiMap.get("FEE_S_AMT").toString()); //공급가 숫자 형식 맞추기(세자리마다 콤마)        
        int vatAmt = Integer.parseInt(estiMap.get("FEE_V_AMT").toString()); //부가세 숫자 형식 맞추기(세자리마다 콤마)*/
        int supplyAmt = 0;        
        int vatAmt = 0;
        
        if (estiMap.get("FEE_S_AMT") != null) {
        	supplyAmt = Integer.parseInt(estiMap.get("FEE_S_AMT").toString()); //공급가 숫자 형식 맞추기(세자리마다 콤마)
        }
        
        if (estiMap.get("FEE_V_AMT") != null) {
        	vatAmt = Integer.parseInt(estiMap.get("FEE_V_AMT").toString()); //부가세 숫자 형식 맞추기(세자리마다 콤마)
        }
        
        if (estiMap.get("RO_13_AMT") != null) { //매입옵션 가격이 있으면 
            int roAmt =  Integer.parseInt(estiMap.get("RO_13_AMT").toString());
            resultMap.put("roAmt", df.format(roAmt));
        }
        
        if (estiMap.get("CLS_PER") == null) {
        	resultMap.put("cls_per", "");
        } else {
        	resultMap.put("cls_per", estiMap.get("CLS_PER"));
        }
        
        resultMap.put("supplyAmt", df.format(supplyAmt));
        resultMap.put("vatAmt", df.format(vatAmt));
        resultMap.put("totalPrice", df.format(supplyAmt+vatAmt));        
        resultMap.put("regCode", regCode);
        resultMap.put("estimateId", estiMap.get("EST_ID"));
        resultMap.put("print_type", estiMap.get("PRINT_TYPE"));
        
        //전기차, 수소차 견적값추가(20190225)
        if (!type.equals("secondhand")) {
        	if (String.valueOf(estiMap.get("PRINT_TYPE")).equals("6") && estiMap.get("EH_CODE") != null) {
        		Map<String, Object> estiMap2 = new HashMap<String, Object>();
        		estiMap2 = rentDao.selectEstimateData(String.valueOf(estiMap.get("EH_CODE")));
        		
        		int supplyAmt2 = Integer.parseInt(estiMap2.get("FEE_S_AMT").toString()); //공급가 숫자 형식 맞추기(세자리마다 콤마)        
                int vatAmt2 = Integer.parseInt(estiMap2.get("FEE_V_AMT").toString()); //부가세 숫자 형식 맞추기(세자리마다 콤마)
                
                if (estiMap2.get("RO_13_AMT") != null) { //매입옵션 가격이 있으면 
                    int roAmt2 =  Integer.parseInt(estiMap2.get("RO_13_AMT").toString());
                    resultMap.put("roAmt2", df.format(roAmt2));
                }
                if (estiMap2.get("EST_ID") != null) {
	                resultMap.put("supplyAmt2", df.format(supplyAmt2));
	                resultMap.put("vatAmt2", df.format(vatAmt2));
	                resultMap.put("totalPrice2", df.format(supplyAmt2+vatAmt2));
	                resultMap.put("regCode2", estiMap.get("EH_CODE"));
	                resultMap.put("estimateId2", estiMap2.get("EST_ID"));
                } else {
                	resultMap.put("estimateId2", "");
                }
        	} else {
        		resultMap.put("estimateId2", "");
        	}
        }
        
        return resultMap;
    }
    
    /* 이미 만들어져 있는 견적 정보와 차 정보를 갖고온다 - 신차 디테일 화면에서 견적서 보기 눌렀을 때 */
    public CarDetail getCreatedEstimateInfo(Map<String,String> param) {
        
        Map<String, Object> paramMap = new HashMap<String, Object>();
        Map<String, Object> resultMap = estiDao.selectCreatedEstimateInfo(param.get("estimateId"));
        /*if(resultMap.get("OPT_CHK")==null || resultMap.get("OPT_CHK")==""){
        	//estimate_hp 에서 조회시 opt_chk 값이 없으면 1로 세팅(대차서비스 멘트 위해) 2017.09.19
        	resultMap.put("OPT_CHK", "1");
        }*/
        
        paramMap.put("carId", resultMap.get("CAR_ID").toString());
        paramMap.put("carSeq", resultMap.get("CAR_SEQ").toString());
        
        Map<String, Object> carMap = rentDao.selectCommonCarDetail(paramMap);
        Map<String, Object> carMainMap = rentDao.selectDomesticRentMainInfo(param);
        
        carMap.put("CAR_JNM", carMap.get("CAR_NM").toString());
        
        CarDetail car = new CarDetail();
        car.setEstimateMap(resultMap);
        car.setDetailMap(carMap);
        car.setMainMap(carMainMap);
        
        return car;
    }

    /* 스마트 견적 관리에서 견적서 보기 눌렀을 때 */
    public CarDetail getCreatedEstimateInfoForSmart(Map<String, String> param) {
        
        Map<String, Object> paramMap = new HashMap<String, Object>();
        Map<String, Object> resultMap = estiDao.selectCreatedEstimateInfo(param.get("estimateId"));
        
        Map<String, Object> EstiCommVarSh = rentDao.selectEstiCommVarEstimateSh();
        Map<String, Object> shData = rentDao.selectSecondhandData(resultMap.get("REG_CODE").toString());
                
        //EST_FROM=secondhand
        //System.out.println(param);
        //System.out.println(resultMap);
        //System.out.println(shData);
        
        /*if (resultMap.containsKey("BR_TO")) {
        	
        	String br_from = resultMap.get("BR_FROM").toString();
        	String br_to = resultMap.get("BR_TO").toString();
        	String ag_key = resultMap.get("MGR_SSN").toString().toUpperCase() + "_AG";
        	
        	System.out.println(resultMap.get("FEE_S_AMT").toString());
        	int price = Integer.parseInt(resultMap.get("FEE_S_AMT").toString());
        	System.out.println(price);
        	int br_cons = Integer.parseInt(EstiCommVarSh.get("BR_CONS_" + br_from + br_to).toString());
        	int ag_amt = Integer.parseInt(shData.get(ag_key).toString());
        	
        	int to_fee_s_amt = price + (int)Math.round(((double)br_cons / 100000 * ag_amt) / 100) * 100;
        	int to_fee_v_amt = (int)(to_fee_s_amt * 0.1);
        	
        	resultMap.put("TO_FEE_S_AMT", to_fee_s_amt);
        	resultMap.put("TO_FEE_V_AMT", to_fee_v_amt);
        } else {
        	resultMap.put("TO_FEE_S_AMT", resultMap.get("FEE_S_AMT").toString());
        	resultMap.put("TO_FEE_V_AMT", resultMap.get("FEE_V_AMT").toString());
        }*/
        
        resultMap.put("TO_FEE_S_AMT", resultMap.get("FEE_S_AMT").toString());
    	resultMap.put("TO_FEE_V_AMT", resultMap.get("FEE_V_AMT").toString());
        
        paramMap.put("carId", resultMap.get("CAR_ID").toString());
        paramMap.put("carSeq", resultMap.get("CAR_SEQ").toString());
        
        Map<String, Object> carMap = rentDao.selectCommonCarDetail(paramMap);
        Map<String, Object> carMainMap = rentDao.selectSmartCarDetail(paramMap);
        
        carMap.put("CAR_JNM", carMap.get("CAR_NM").toString());
        
        CarDetail car = new CarDetail();
        car.setEstimateMap(resultMap);
        car.setDetailMap(carMap);
        car.setMainMap(carMainMap);     
        
        return car;
    }
    
    public Map<String, Object> getSecondhandEstimateInfo(Map<String, String> param) {
    	
    	String estimateId = "";    	
        Map<String, Object> resultMap = null;
        
        if (param != null && !param.equals("")) {
        	if (param.get("estimateId") == null || param.get("estimateId").isEmpty()) {
        		if (param.get("a_a") == null || param.get("a_a").isEmpty()) { //재리스 재렌트 차량 선택 목록에서 넘어왔으면
        			estimateId = estiDao.selectRecentSecondhandEstimateId(param);
        		} else { //디테일에서 넘어왔으면
        			estimateId = estiDao.selectSecondhandEstimateId(param);
        		}
        	} else {
        		estimateId = param.get("estimateId");
        	}
        	
        	resultMap = estiDao.selectSecondhandEstimateInfo(estimateId);
        }
        
        return resultMap;
    }
    
    /* 재렌트 데이터 조회 */
    public Map<String, Object> selectSecondhandEstimateMap(String regCode){
        Map<String, Object> resultMap = rentDao.selectSecondhandEstimateData(regCode);
        return resultMap;
    }
    
    public List<Map<String, Object>> selectCarCompList(){
        List<Map<String, Object>> resultMap = rentDao.selectCarCompList();
        return resultMap;
    }

    public List<Map<String, Object>> getCarNameList(Map<String, Object> param) {
        List<Map<String, Object>> resultMap = rentDao.selectCarNameList(param.get("carCompId").toString());
        return resultMap;
    }

    public List<Map<String, Object>> getCarDetailList(Map<String, Object> param) {
        List<Map<String, Object>> resultMap = rentDao.selectCarDetailList(param);
        DecimalFormat df = new DecimalFormat("#,##0");
        
        for(Map<String, Object> map : resultMap){
            int amt = Integer.parseInt(map.get("AMT").toString());
            int duty_free_amt = Integer.parseInt(map.get("DUTY_FREE_AMT").toString());
            int hyundai_duty_free_amt = Integer.parseInt(map.get("HYUNDAI_DUTY_FREE_AMT").toString());
            map.put("AMT", df.format(amt)); //3자리마다 컴마 찍기
            map.put("DUTY_FREE_AMT", df.format(duty_free_amt)); //3자리마다 컴마 찍기
            map.put("HYUNDAI_DUTY_FREE_AMT", df.format(hyundai_duty_free_amt)); //3자리마다 컴마 찍기
        }
        
        return resultMap;
    }

    public Map<String, Object> getCarMainCode(Map<String, String> param) {
        Map<String, Object> resultMap = rentDao.selectCarMainCode(param);
        return resultMap;
    }
    
    /* 월렌트 차량 예약 */
    @Transactional
    public Map<String, Object> insertReserveInfo(Map<String,String> param){
        
        String regCode = Long.toString(System.currentTimeMillis());
        Date date = new Date();
        String regDate= new SimpleDateFormat("yyyyMMdd").format(date);
        String regSysDate = new SimpleDateFormat("yyyyMMddHHmm").format(date); 
        String newEstimateId = regCode + "1";
        
        //현재 있는 견적서 정보를 estimate_sh 에서 추출하여 estimate 에 복사한다
        Map<String, Object> estiParam = new HashMap<String, Object>();
        estiParam.put("estCode",param.get("regCode"));
        estiParam.put("carManagedId",param.get("carManagedId"));
        estiParam.put("estimateId",newEstimateId); //새로운 estimate Id 할당
        estiParam.put("regCode",regCode);
        estiParam.put("estName",param.get("estName"));
        estiParam.put("estTel",param.get("estTel"));
        estiParam.put("estEmail",param.get("estEmail"));//이메일 추가
        estiParam.put("hpKey",param.get("hpKey"));//이메일 추가
        
        param.put("regDate",regDate);
        param.put("regSysDate", regSysDate); //ESTI_SPE 에는 REG_DT 를 yyyyMMddHHmm 형태로 넣어준다 
        param.put("estId",newEstimateId);
        param.put("estGubun","PM"+param.get("estGubun")); //PC+MONTH+개인/사업자 여부
        param.put("regCode",regCode);

        //기존고객인지 체크 로직 추가(2017.09.04) 기존로직에서 수정(2017.09.20)
        /*Map<String, Object> userMap = memberDao.selectUserInfo(param.get("estEmail"));
        String client_id = (String) userMap.get("CLIENT_ID");*/
        
        String client_id = memberDao.selectClientId(param);
        
        if(client_id != null && !client_id.equals("")){
        	param.put("client_yn","Y");
        }else{
        	param.put("client_yn","");
        }
        
        Map<String, Object> resResult = new HashMap<String, Object>();
        try{
            
            estiDao.insertEsimateInfoForMonth(estiParam);
            estiDao.insertEsimateExamForMonth(estiParam);
            estiDao.insertCustomerInfo(param);
            estiDao.insertReserveInfo(param);
            
            //모든 정보를 insert한 뒤 프로시저 호출
            Map<String, Object> resParam = new HashMap<String, Object>();
            String resSeq = estiDao.selectShResSeq(newEstimateId);
            
            resParam.put("carManagedId",param.get("carManagedId"));
            resParam.put("insertFlag","i");
            resParam.put("resSeq",resSeq);
            estiDao.ExecMonthReserve(resParam);
            
            resResult = estiDao.selectReservePeriod(resParam);
            resResult.put("newEstimateId", newEstimateId);            
            
        }catch(Exception e){
            throw e;
        }
        
        return resResult;
    }
    
    public int checkReserveRank(String carManagedId){
        int rank = estiDao.checkReserveRank(carManagedId);
        return rank;
    }

    //ESTI_SPE 테이블에 있는 고객 정보 리턴
    public Map<String, Object> selectCustomerInfo(String estId) {
        Map<String, Object> resultMap = estiDao.selectCustomerInfo(estId);
        return resultMap;
    }

    //이메일 인증을 위한 토큰 생성하기
    public Map<String, Object> generateTokenToEmail(String email) throws Exception {
        
        String token = null;
        CryptoUtil crypto = new CryptoUtil();
        String key = env.getProperty("amazoncar.user.key");
        String message = "";
        Map<String, Object> resultMap = new HashMap<String, Object>();
        
        //토큰 유효성 체크를 위한 current day 넘기기       
        SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat("yyyyMMddhhmm", Locale.KOREA);
        Date currentTime = new Date();
        String mTime = mSimpleDateFormat.format(currentTime);
        String paramForToken = email + ":" + mTime;
        
         //토큰 생성
        try{
            token= crypto.encrypt(key, paramForToken);
        }catch(Exception e){
            throw e;
        }
        
        //파라미터 생성
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("email",email);
        params.put("token",token);
        params.put("tokenDate",mTime);
        
        //DB insert
        int checkResult = checkExistEmail(email);
        if(checkResult == 0){
            userDao.insertAuthRequestEmail(params);
            resultMap.put("token",token);
            message = "인증 메일이 발송되었습니다.메일을 확인해주세요.";
        }else if(checkResult > 0){            
            message ="이미 인증 받은 이메일입니다.\n실시간 견적 버튼을 눌러주세요";
        }
        
        resultMap.put("message",message);
        return resultMap;
    }
    
    public int checkExistEmail(String email){
        int checkResult = userDao.checkEmailExists(email);
        return checkResult;
    }
    
    /*
     * 토큰 검증
     * */
    public boolean verifyToken(String token) throws Exception{
        
        boolean flag = false;
        CryptoUtil crypto = new CryptoUtil();
        String key = env.getProperty("amazoncar.user.key");
        String[] verifyArray = crypto.decrypt(key, token).split(":");
        
        Map<String, Object> tokenMap = new HashMap<String, Object>();

        //토큰 유효기간 체크
        SimpleDateFormat transFormat = new SimpleDateFormat("yyyyMMddHHmm");
        Date tokenDate = transFormat.parse(verifyArray[1]); //토큰의 날짜
        Date currentTime = new Date();
        String today = transFormat.format(currentTime);
        Date todayDate = transFormat.parse(today); //오늘 날짜
        
        //밀리세컨으로 계산됨. 1시간 = 60분 * 60초 * 1000(밀리세컨) = 3,600,000
        //토큰 발급 시간이 24시간 이상이면
        if((todayDate.getTime() - tokenDate.getTime())/3600000 > 24){
            throw new Exception("인증 유효기간이 만료되었습니다. 다시 인증을 요청해주시기 바랍니다.");
        }
        
        tokenMap.put("token",token);
        tokenMap.put("email",verifyArray[0]);
        tokenMap.put("tokenDate",verifyArray[1]);
        
        //토큰 검증
        Map<String, Object> verifyToken = userDao.selectAuthTokenInfo(tokenMap);
        if(verifyToken != null){
            flag = true;
            userDao.updateAuthInfo(tokenMap);
        }else{
            throw new Exception("잘못된 접근입니다");
        }
        return flag;
    }

    public boolean checkEstimateCount(Map<String,String> paramMap) {
        boolean flag = false;
        
        int count = userDao.selectEstimateCount(paramMap.get("email"));
        if(count < 10 && paramMap.get("type").equals("step1")){ //견적요청이면 count를 더한다
            flag = true;
            userDao.updateEstimateCount(paramMap);
        }else if(paramMap.get("type").equals("step2")){ //상담요청 하면 count 를 빼준다
            flag = true;
            userDao.updateEstimateCount(paramMap);
        }
        
        return flag;
    }

    public int checkExistReserveInfo(String email) {
        int count = userDao.selectReserveCount(email);
        return count;
    }

    public void updateEstimateData(Map<String, String> param) {
        estiDao.updateRoAmt(param);
    }
    
    @Transactional
    public void modifyCustomerInfo(Map<String, String> param) {
        estiDao.updateCustomerInfoToShres(param);
        estiDao.updateCustomerInfoToEsti(param);
    }

    public String selectShResSeq(String estimateId) {
        return estiDao.selectShResSeq(estimateId);
    }

    public int cancelMonthRent(Map<String, String> param) {
        int sResult = estiDao.cancelMonthRent(param);
        return sResult;
    }

    /* 예약 확정하기 */
    @Transactional
    public void confirmReservation(Map<String, String> param) {
        //컨펌
        estiDao.updateReserveSituation(param.get("estimateId"));
        //계좌번호 넣기
        //estiDao.updateCustomerAccountInfo(param);
        insertDriverInfo(param);
    }

    /* 운전자 정보 등록 */
    public void insertDriverInfo(Map<String,String> param){  
    	
        int count = 0;
        //운전자 정보 넣기
        String[] columnArray = {"driverName","driverNumber","driverCell"}; 
        while(count < Integer.parseInt(param.get("driverCount"))){
            count++;
            Map<String,String> driverInfo = new HashMap<String,String>();
            
            for(String column : columnArray){
                String columnName = column + count;    
                if(param.get(columnName) != null || param.get(columnName) != ""){
                    driverInfo.put(column, param.get(columnName));            
                }
            }
            
            driverInfo.put("seq", String.valueOf(count));
            driverInfo.put("estimateId", param.get("estimateId"));
            estiDao.insertDriverInfo(driverInfo);
        }
    }
    
    public boolean checkExistReservation(String estimateId) {
        boolean flag = false;
        String situation = rentDao.checkExistReservation(estimateId);
        if(situation.equals("2")){
            flag = true;
        }
        return flag;
    }

    public void deleteDriverInfo(String estimateId) {
        estiDao.deleteDriverInfo(estimateId);
    }

    public Map<String, Object> getSmartCarDcAmt(Map<String, String> param) {
        Map<String, Object> resultMap = new HashMap<String, Object>();
        Map<String, Object> DcInfo = estiDao.selectSmartDCprice(param);
        if(DcInfo != null){
            resultMap.putAll(DcInfo);
            resultMap.put("result",1);
        }else{
            resultMap.put("result",0);
        }
        return resultMap;
    }
    
    public Map<String, Object> getSmartCarDcEtc(Map<String, String> param) {
    	Map<String, Object> resultMap = new HashMap<String, Object>();
    	Map<String, Object> DcInfo = estiDao.selectSmartCarDcEtc(param);
    	if(DcInfo != null){
    		resultMap.putAll(DcInfo);
    		resultMap.put("result",1);
    	}else{
    		resultMap.put("result",0);
    	}
    	return resultMap;
    }
    
    public Map<String, Object> getSmartCarDcAmt2(Map<String, String> param) {
    	Map<String, Object> resultMap = new HashMap<String, Object>();
    	Map<String, Object> DcInfo = estiDao.selectSmartDCprice2(param);
    	if(DcInfo != null){
    		resultMap.putAll(DcInfo);
    		resultMap.put("result",1);
    	}else{
    		resultMap.put("result",0);
    	}
    	return resultMap;
    }
    
    // 정부,지자체 보조금 계산을 위해 프로시져 최근 구동일을 fetch (2018.01.12)
    public String getBDt(){
        return estiDao.getBDt();
    }
    
    // 정부,지자체 보조금 계산을 위해 기본데이터를 fetch (2018.01.12)
    public Map<String, Object> getSubsidyData(Map<String, Object> param){
    	Map<String, Object> resultMap = estiDao.getSubsidyData(param);
        return resultMap;
    }
    
    //ESTI_EXAM_CU 테이블 1건 조회
    public Map<String, Object> getEstiExamCu(String estimateId){
    	Map<String, Object> resultMap = estiDao.getEstiExamCu(estimateId);
        return resultMap;
    }
    
    //ESTI_EXAM_HP 테이블 1건 조회
    public Map<String, Object> getEstiExamHp(String estimateId){
    	Map<String, Object> resultMap = estiDao.getEstiExamHp(estimateId);
        return resultMap;
    }

	public List<Map<String, Object>> getCarCompanyList() {
		List<Map<String, Object>> resultMap = rentDao.getCarCompanyList();
        return resultMap;
	}

	public int getBk128(Map<String, String> param) {
		return estiDao.getBk128(param);
	}
}

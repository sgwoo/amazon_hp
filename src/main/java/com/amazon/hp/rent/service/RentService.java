package com.amazon.hp.rent.service;

import com.amazon.hp.member.dao.MemberDAO;
import com.amazon.hp.model.CarDetail;
import com.amazon.hp.rent.dao.EstimateDAO;
import com.amazon.hp.rent.dao.RentDAO;
import com.amazon.hp.util.HolidayHelper;
import org.apache.commons.lang3.time.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class RentService {
    
	@Autowired RentDAO rentDao;
	@Autowired EstimateDAO estiDao;
	@Autowired EstimateService estiService;
	@Autowired MemberDAO memberDao;
	@Autowired HolidayHelper holidayHelper;
    
	
    public List<Map<String, Object>> getDomesticRentList(Map<String, Object> param) {
        //주행거리 셋팅
        if (param.get("agreeDist") == null || param.get("agreeDist").equals("")) {
            param.put("agreeDist","10000");
        }
        
        String srchPrice = "";
        //금액검색 셋팅 
        if (param.get("priceStd") != null && param.get("priceSearch") != null) {
            srchPrice = param.get("priceStd").toString() + "-" + param.get("priceSearch").toString();
        }
        param.put("srchPrice",srchPrice);
        
        List<Map<String, Object>> resultMap = rentDao.selectDomesticList(param);
        return resultMap;
    }
	
	public List<Map<String, Object>> getDomesticLeaseList(Map<String, Object> param) {
        //주행거리 셋팅
        if (param.get("agreeDist") == null || param.get("agreeDist").equals("")) {
            param.put("agreeDist","10000");
        }
        
        String srchPrice = "";
        //금액검색 셋팅 
        if (param.get("priceStd") != null && param.get("priceSearch") != null) {
            srchPrice = param.get("priceStd").toString() + "-" + param.get("priceSearch").toString();
        }
        param.put("srchPrice",srchPrice);
        
        List<Map<String, Object>> resultMap = rentDao.selectDomesticLeaseList(param);
        return resultMap;
    }
    
    public List<Map<String, Object>> getDomesticRentSearchList(Map<String, Object> param) {
       //DPM 셋팅
        if (param.get("dpm") != null && !param.get("dpm").equals("")) {
            String[] dpmArray = {"0","1000","1600","2000","3000"};
            int dpm = Integer.parseInt(param.get("dpm").toString());
            if (dpm != 5) {
                param.put("dpmMax",dpmArray[dpm]);
                param.put("dpmMin",dpmArray[dpm-1]);
            } else{
                param.put("dpmMin",dpmArray[dpm-1]);
            }
        }
        //주행거리 셋팅
        if (param.get("agreeDist") == null || param.get("agreeDist").equals("")) {
            param.put("agreeDist","10000");
        }
        
        List<Map<String, Object>> resultMap = rentDao.selectDomesticListForSearch(param);
        return resultMap;
    }
    
    public List<Map<String, Object>> getDomesticRentSearchFuelKdList(Map<String, Object> param) {
    	List<Map<String, Object>> resultMap = rentDao.selectDomesticFuelKdListForSearch(param);
    	return resultMap;
    }
    
    public List<Map<String, Object>> getImportsRentList(Map<String, Object> param) {
       //주행거리 셋팅
        if (param.get("agreeDist") == null || param.get("agreeDist").equals("")) {
            param.put("agreeDist","10000");
        }
        List<Map<String, Object>> resultMap = rentDao.selectImportsCarList(param);
        return resultMap;
    }
    
    public List<Map<String, Object>> getDiscountRentList(Map<String, Object> param) {
    	List<Map<String, Object>> resultMap = rentDao.selectDiscountRentCarList(param);
    	return resultMap;
    }
    
    public List<Map<String, Object>> getDiscountLeaseList(Map<String, Object> param) {
    	List<Map<String, Object>> resultMap = rentDao.selectDiscountLeaseCarList(param);
    	return resultMap;
    }
    
    public List<Map<String, Object>> selectMonthCarList(Map<String, Object> param) {
    	List<Map<String, Object>> carList = rentDao.selectMonthCarList(param);
        /*
		String link = "";
        for (int i=0; i<carList.size(); i++) {
            String carManageId = carList.get(i).get("CAR_MNG_ID").toString();
            String rentManageId =  carList.get(i).get("RENT_MNG_ID").toString();
            String rentLcode = carList.get(i).get("RENT_L_CD").toString();
            String locationId = carList.get(i).get("BR_ID").toString();
            String detailLink = "'"+rentManageId+"','"+rentLcode+"','"+carManageId+"','"+locationId+"'";
            
            carList.get(i).put("detailLink",detailLink);
        }
        */
        return carList;
    }

	public Map<String, Object> selectMonthCarDetail(Map<String, String> param) {
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.putAll(param);
        //int reserveRank = estiDao.checkReserveRank(param.get("carManagedId"));
        
        Map<String, Object> resultMap = rentDao.selectMonthCarDetail(paramMap);
        
        if (resultMap != null) {
        	//resultMap.put("rankData", reserveRank); //예약순위
        	int reserveFlag = rentDao.checkReserveCount(paramMap);        	
        	resultMap.put("reserveFlag", reserveFlag);
        }
        
        return resultMap;
    }


    public List<Map<String, Object>> selectCarHistory(String param) {
        List<Map<String, Object>> resultMap = rentDao.selectCarHistory(param);
        return resultMap;
    }

    public List<Map<String, Object>> selectAccidentHistory(String param) {
        List<Map<String, Object>> resultMap = rentDao.selectAccidentHistory(param);
        return resultMap;
    }

    public List<Map<String, Object>> selectServiceHistory(String param) {
        List<Map<String, Object>> resultMap = rentDao.selectServiceHistory(param);
        return resultMap;
    }

    public CarDetail getNewCarRentDetail(Map<String, String> param) {
        
        Map<String, Object> estimateMap = rentDao.selectDomesticRentEstimateDetail(param.get("estimateId").toString());
        List<Map<String, Object>> priceMap = rentDao.selectDomesticRentPriceDetail(param.get("seq".toString()));
        Map<String, Object> mainMap = rentDao.selectDomesticRentMainInfo(param);
        
        Map<String, Object> detailParam = new HashMap<String, Object>();
        detailParam.put("carId",estimateMap.get("CAR_ID").toString());
        detailParam.put("carSeq",estimateMap.get("CAR_SEQ").toString());
        
        //연료 구분에 따라 표준약정거리 계산
        /*String[] columnArray = {"LB60_AMT","LB48_AMT","LB36_AMT","LS60_AMT","LS48_AMT","LS36_AMT",
                                "LB60_ID","LB48_ID","LB36_ID","LS60_ID","LS48_ID","LS36_ID"};
        if (param.get("requestURL") != null && param.get("requestURL").contains("imports")) {
            for (Map<String, Object> item : priceMap) {
                for (int i=0; i<columnArray.length;i++) {
                    String columnName = columnArray[i]+"2";
                    item.put(columnArray[i],item.get(columnName).toString());
                }
            }
        }*/
        
        int fuelCode = Integer.parseInt(priceMap.get(0).get("JG_B").toString());
        int stdAgreeDist = 30000;
        if (fuelCode == 1) { stdAgreeDist += 5000; } 
        if (fuelCode == 2) { stdAgreeDist += 10000;}
        mainMap.put("stdAgreeDist", stdAgreeDist);
        
        Map<String, Object> carDetailMap = rentDao.selectCommonCarDetail(detailParam);
        
        CarDetail carDetail = new CarDetail();
        carDetail.setPriceMap(priceMap);
        carDetail.setEstimateMap(estimateMap);
        carDetail.setDetailMap(carDetailMap);
        carDetail.setMainMap(mainMap);
        
        return carDetail;
        
    }
    
    /* 차량 옵션 정보 가져오긴*/
    public List<Map<String, Object>> getCarOption(Map<String,String> param) {
        Map<String,String> paramMap = new HashMap<String,String>();
        
        paramMap.put("carId",param.get("carId").toString());
        paramMap.put("carCode",param.get("carCode").toString());
        paramMap.put("carCompId",param.get("carCompId").toString());
        
        List<Map<String, Object>> optionList = rentDao.selectCarOption(paramMap);        
        //스마트견적관리에서 넘어왔으면
        if (param.get("type") == "smart") {
            DecimalFormat df = new DecimalFormat("#,##0");
            for (Map<String, Object> map : optionList) {
                //금액 형식 맞춰주기
                int amt = Integer.parseInt(map.get("AMT").toString());
                map.put("DISPLAY_AMT", df.format(amt)); //3자리마다 컴마 찍기                
                
                //JG_OPT_ST 가 있을 경우 JG_OPT 설명 추가해주기
                if (map.get("JG_OPT_ST") != null && map.get("JG_OPT_ST") != "") {
                    String jgStatus = map.get("JG_OPT_ST").toString();
                    param.put("JG_OPT_ST", jgStatus);
                    Map<String, Object> jgMap = rentDao.selectJGCarOption(param);
                    if( jgMap != null ) map.putAll(jgMap);
                }
            }
        }
        
        return optionList;
    }
    
    /* 차량 색상 정보 가져오기 */
    public List<Map<String, Object>> getCarColor(Map<String,String> param) {
    	
        Map<String,String> paramMap = new HashMap<String,String>();
        
        paramMap.put("carCode",param.get("carCode").toString());
        paramMap.put("carCompId",param.get("carCompId").toString());
        paramMap.put("carId", param.get("carId").toString());
        
        List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();
        List<Map<String, Object>> optionList = rentDao.selectCarColor(paramMap);
        
        Map<String, Object> attachParam = new HashMap<String, Object>();
        attachParam.put("contentCode", "CAR_COL");
        
        for (Map<String, Object> color:optionList) {
            String colorName = color.get("NM").toString();
            if (colorName.contains("(")) { //색상명에 '(' 포함되어 있으면 제거하기 ex)화이트크림(WC) => 화이트크림
                color.put("NM",colorName.split("\\(")[0]);
            }
            if (colorName.contains("[")) { //색상명에 '[' 포함되어 있으면 제거하기 ex)화이트크림[WC] => 화이트크림
                color.put("NM",colorName.split("\\[")[0]);
            }
            String contentSeq = param.get("carCompId") + "^" + param.get("carCode") + "^" + color.get("SEQ") + "^" + color.get("ID");
            attachParam.put("contentSeq", contentSeq);
            Map<String, Object> attachMap = rentDao.selectAttachFile(attachParam);
            if (attachMap != null) {
                color.putAll(attachMap);
            }
            
            //DB의 색상 비고 가져오기
            if (color.get("JG_OPT_ST")!=null) {
            	
            	String jgCode = rentDao.selectJangaCode(paramMap.get("carId"));
            	if (jgCode != null) {            		
            		Map<String, Object> jgVarMap = rentDao.selectEstiJgVar(jgCode);            	
            		paramMap.put("jgCode", jgCode);
            		paramMap.put("seq", (String) jgVarMap.get("SEQ"));
            		paramMap.put("jgOptSt", (String)color.get("JG_OPT_ST"));
            		
            		if (paramMap.get("jgOptSt") != null || paramMap.get("jgOptSt") != "0") {
            			Map<String, Object> jgOptVarMap = rentDao.selectEstiJgOptVar(paramMap);
            			if (jgOptVarMap != null) {
            				if (jgOptVarMap.get("JG_OPT_9") != null) {
            					color.put("JG_OPT_9", jgOptVarMap.get("JG_OPT_9"));
            				}
            			} else {
            				color.put("JG_OPT_9", "");
            			}
            		} else {
            			color.put("JG_OPT_9", "");
            		}
            	}
        	}
            resultList.add(color);
        }
        
        return optionList;
        
    }    
    
    /* 재렌트 리스트 불러오기 */
    public List<Map<String, Object>> getSecondhandRentList(Map<String, Object> param) {
        String searchPrice = "";
        //System.out.println("getSecondhandRentList >>> " + param);
        
        if (param.get("priceStd") != null) {
            searchPrice = param.get("priceStd").toString() + "-" + param.get("searchPrice").toString();
        }
        
        if (!param.containsKey("brTo")) {
    		param.put("brTo", "");
    	}
        String br_to = param.get("brTo").toString();
        
        param.put("srchPrice", searchPrice);
        List<Map<String, Object>> resultList = rentDao.selectSecondhandCarList(param);
        Map<String, Object> EstiCommVarSh = rentDao.selectEstiCommVarEstimateSh();
        
        DecimalFormat df = new DecimalFormat("#,##0");
        
        for (int i = 0; i < resultList.size(); i++) {
        	
        	String temp_br_from = resultList.get(i).get("BR_FROM").toString();
        	String br_from = "0";
        	
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
        	
        	if (br_to.equals("")) {
        		br_to = br_from;
        	} else if (!(br_to.equals("0") || br_to.equals("1") || br_to.equals("2") || br_to.equals("3") || br_to.equals("4") || br_to.equals("5"))) {
        		br_to = br_from;
        	}else {
        		if (br_to.equals("5")) {
        			br_to = "0";
        		}
        	}
        	
        	int maxAmt = Integer.parseInt(resultList.get(i).get("MAX_AMT").toString());
        	int maxAg = 0;
        	if (resultList.get(i).get("MAX_AMT_AG") != null) {
        		maxAg = Integer.parseInt(resultList.get(i).get("MAX_AMT_AG").toString());
        	}
        	int br_cons = 0;
        	if (EstiCommVarSh.get("BR_CONS_" + br_from + br_to) != null) {
        		br_cons = Integer.parseInt(EstiCommVarSh.get("BR_CONS_" + br_from + br_to).toString());
        	}
        	int to_max_amt = maxAmt + (int)Math.round(((double)br_cons / 100000 * maxAg) / 100) * 100;
        	
        	resultList.get(i).put("TO_MAX_AMT", to_max_amt);        	
        	
        	for (int j = 1; j <= 3; j++) {
               int month = j * 12;
               
               int feeLbAmt = Integer.parseInt(resultList.get(i).get("LB" + month).toString());
               int feeLbAg = 0;
               if (resultList.get(i).get("LB" + month + "_AG") != null) {
            	   feeLbAg = Integer.parseInt(resultList.get(i).get("LB" + month + "_AG").toString());            	   
               }
               int toLbAmt = feeLbAmt + (int)Math.round(((double)br_cons / 100000 * feeLbAg) / 100) * 100;
               resultList.get(i).put("TO_LB" + month, toLbAmt);
               
               int feeRbAmt = Integer.parseInt(resultList.get(i).get("RB" + month).toString());
               int feeRbAg = 0;
               if (resultList.get(i).get("RB" + month + "_AG") != null) {
            	   feeRbAg = Integer.parseInt(resultList.get(i).get("RB" + month + "_AG").toString());
               }
               
               if (feeRbAmt == 0 || feeRbAmt == -1) {
                   resultList.get(i).put("RB"+month, "-"); //가격이 0원 이면 '-' 로 출력하기
                   resultList.get(i).put("TO_RB" + month, "-");
               } else {
                   resultList.get(i).put("RB" + month, df.format(feeRbAmt)); //3자리 숫자마다 콤마 찍기             
                   int toRbAmt = feeRbAmt + (int)Math.round(((double)br_cons / 100000 * feeRbAg) / 100) * 100;                   
                   resultList.get(i).put("TO_RB" + month, df.format(toRbAmt));
               }
        	}
        }
        
        return resultList;
    }

    public Map<String, Object> selectSecondhandCarDetail(Map<String, String> param) {    	
    	Map<String, Object> resultMap = null; 
    	if (param != null && !param.equals("")) {
	        if (param.get("agreeDist") == null || param.get("agreeDist") == "") {	        	
	            param.put("agreeDist", "10000");
	        }
	        resultMap = rentDao.selectSecondHandCarDetail(param);       
    	}
        return resultMap;
    }
    
    public Map<String, Object> selectSecondhandDepositInfo(Map<String, Object> param) {
        Map<String, Object> depositMap = estiDao.selectSecondhandDepositInfo(param);
        return depositMap;
    }
    
    public Map<String, Object> selectEstiCommVarSh() {
    	Map<String, Object> EstiCommVarSh = rentDao.selectEstiCommVarEstimateSh();
    	return EstiCommVarSh;
    }
    
    public CarDetail selectMonthCarDetailforPrint(Map<String, String> param) {
        CarDetail car = new CarDetail();
        if (param.get("dist") == null) {
            param.put("dist", "20000");
        }
        Map<String, Object> resultMap = rentDao.selectSecondHandCarDetail(param);
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("carId",resultMap.get("CAR_ID").toString());
        paramMap.put("carSeq",resultMap.get("CAR_SEQ").toString());
        
        Map<String, Object> detailMap = rentDao.selectCommonCarDetail(paramMap);
        paramMap.put("rentDate",param.get("rentDate"));
        paramMap.put("jgCode",detailMap.get("JG_CODE").toString());
        
        Map<String, Object> shortFeeMap = rentDao.selectShortRentFee(paramMap);
        
        car.setMainMap(resultMap);
        car.setDetailMap(detailMap);
        car.setEstimateMap(shortFeeMap);
        
        return car;
    }

    public Map<String, Object> getEstimateData(String regCode) {
    	
        Map<String, Object> resultMap = rentDao.selectEstimateData(regCode);
        
        DecimalFormat df = new DecimalFormat("#,##0");
        int supplyAmt = Integer.parseInt(resultMap.get("FEE_S_AMT").toString());
        int vatAmt = Integer.parseInt(resultMap.get("FEE_V_AMT").toString());
        
        resultMap.put("totalPrice", df.format(supplyAmt+vatAmt)); //총액 계산해서 넘겨주기
        
        return resultMap;
    }

    /*@Transactional
    public void setEstimateCustomerInfo(Map<String, String> param) throws Exception {
        try{
            
            DateFormat regFormat = new SimpleDateFormat("yyyyMMddHHss");
            Date today = new Date();
            String regDate = regFormat.format(today).toString();
            param.put("regSysDate", regDate);
            
            String gubun = param.get("estGubun"); //1,2,3(법인사업자/개인사업자/개인)
            
            param.put("docType",gubun);
            
            estiDao.updateCustomerInfo(param); //ESTIMATE 테이블에 update
          
            if (param.get("mobile").equals("Y")) {
            	param.put("estGubun","MS"+gubun); //모바일 일때,	
            } else{
            	param.put("estGubun","PS"+gubun); //신차면 PS1~3
            	
            }
            
            if (param.get("type").equals("secondhand")) {
                String carName = "[재렌트]" + param.get("carName") + " / " + param.get("carNumber"); 
                param.put("carName",carName);
                
                if (param.get("mobile").equals("Y")) {
                	param.put("estGubun","MJ"+gubun); //모바일 일때,
                	
                } else{
                	param.put("estGubun","PJ"+gubun); //재리스면 PJ1~3
                	
                }
                
            }
            estiDao.insertCustomerInfo(param);
            
        }catch(Exception e) {
            throw e;
        }
    }*/
    
    //견적요청시 DB에 update, insert 안되면 메신져 안보내지게 조건 체크(나머지는 위(주석처리)와동일) 
    @Transactional
    public int setEstimateCustomerInfo(Map<String, String> param) throws Exception {
    	int chkFinResult = 0;
        try {
            DateFormat regFormat = new SimpleDateFormat("yyyyMMddHHss");
            Date today = new Date();
            String regDate = regFormat.format(today).toString();
            param.put("regSysDate", regDate);
            String gubun = param.get("estGubun"); //1,2,3(법인사업자/개인사업자/개인)
            param.put("docType", gubun);
            
            estiDao.updateCustomerInfo(param); //ESTIMATE 테이블에 update            
            
            if (param.get("mobile")!= null && param.get("mobile").equals("Y")) {
            	
            	param.put("estGubun", "MS"+gubun); //모바일 일때,	
            } else {
            	param.put("estGubun", "PS"+gubun); //신차면 PS1~3	            	
            }
            
            if (param.get("type") != null && param.get("type").equals("secondhand")) {
            	String carName = "[재렌트]" + param.get("carName") + " / " + param.get("carNumber"); 
                param.put("carName", carName);
                if (param.get("mobile") != null && param.get("mobile").equals("Y")) {
                	param.put("estGubun", "MJ"+gubun); //모바일 일때,
                } else {
                	param.put("estGubun", "PJ"+gubun); //재리스면 PJ1~3                	
                }             
            }
            
            //기존고객인지 체크 로직 추가(2017.09.04) 기존로직에서 수정(2017.09.20)
            /*Map<String, Object> userMap = memberDao.selectUserInfo(param.get("estEmail"));
            String client_id = (String) userMap.get("CLIENT_ID");*/
            
            String client_id = memberDao.selectClientId(param);
            
            if (client_id != null && !client_id.equals("")) {
            	param.put("client_yn", "Y");
            } else {
            	param.put("client_yn", "");
            }
            
            estiDao.insertCustomerInfo(param);
            
            int checkResult = estiDao.checkCustomerInfo(param);
            int checkResult2 = estiDao.checkCustomerInfo2(param);
            
            if (checkResult == 1 && checkResult2 == 1) {
            	chkFinResult = 1;
            }
            
        } catch (Exception e) {
            throw e;
        }
        
        return chkFinResult;
    }


    /* 국산신차, 수입신차 Detail 데이터 가져오기 */
    public CarDetail getNewCarLeaseDetail(Map<String, String> param) {
        
        Map<String, Object> estimateMap = rentDao.selectDomesticRentEstimateDetail(param.get("estimateId").toString());
        List<Map<String, Object>> priceMap = rentDao.selectDomesticRentPriceDetail(param.get("seq".toString()));
        Map<String, Object> mainMap = rentDao.selectDomesticRentMainInfo(param);
        
        Map<String, Object> detailParam = new HashMap<String, Object>();
        detailParam.put("carId",estimateMap.get("CAR_ID").toString());
        detailParam.put("carSeq",estimateMap.get("CAR_SEQ").toString());
        
        //수입신차면 ex) LS60_AMT 를 LS60_AMT2의 value 로 변경한다.
        /*
        String[] columnArray = {"LB60_AMT","LB48_AMT","LB36_AMT","LS60_AMT","LS48_AMT","LS36_AMT",
                                "LB60_ID","LB48_ID","LB36_ID","LS60_ID","LS48_ID","LS36_ID"};
        if (param.get("requestURL").contains("imports")) {
        for (Map<String, Object> item : priceMap) {
            for (int i=0; i<columnArray.length;i++) {
                String columnName = columnArray[i]+"2";
                    item.put(columnArray[i],item.get(columnName).toString());
                }
            }
        }
        */
        
        //연료 구분에 따라 표준약정거래 계산
        int fuelCode = Integer.parseInt(priceMap.get(0).get("JG_B").toString());
        int stdAgreeDist = 30000;
        if (fuelCode == 1) { stdAgreeDist += 5000; } 
        if (fuelCode == 2) { stdAgreeDist += 10000;}
        mainMap.put("stdAgreeDist", stdAgreeDist);
        
        Map<String, Object> carDetailMap = rentDao.selectCommonCarDetail(detailParam);
        
        CarDetail carDetail = new CarDetail();
        carDetail.setPriceMap(priceMap);
        carDetail.setEstimateMap(estimateMap);
        carDetail.setDetailMap(carDetailMap);
        carDetail.setMainMap(mainMap);
        
        return carDetail;
    }

    public String insertSecondhandEstimateInfo(Map<String, Object> param) {
        
        String regCode = Long.toString(System.currentTimeMillis());
        
        //param.put("CAR_JA",300000); //재렌트 재리스는 기본 자차면책금 30만원으로 셋팅한다
        //^^국산: 300,000(defalut) 200,000 선택가능, 수입 : 500,000 고정 이라서 주석처리(2017.09.27)
        
        int udt_st = 4;
        param.put("udt_st", udt_st);
        param.put("FEE_S_AMT", "0");
        param.put("FEE_V_AMT", "0");
        param.put("EST_ST", "1");
        param.put("DC_AMT", "0");
        
        //estimateId를 regCode에 1,2를 붙여 생성한다
        String estimateId = regCode + "" + 1;
        
        DateFormat updateFormat = new SimpleDateFormat("yyyyMMdd");
        DateFormat regFormat = new SimpleDateFormat("yyyyMMddHHss");
        Date today = new Date();
        
        param.put("EST_ID", estimateId);
        param.put("REG_CODE", regCode);
        param.put("REG_DT", regFormat.format(today).toString());
        param.put("UPDATE_DT", updateFormat.format(today).toString());
        param.put("RENT_DT", updateFormat.format(today).toString());
        param.put("EST_TYPE", "S");
        
        //System.out.println("rentService >> " + param);

        estiDao.insertSecondhandEstimateInfo(param);
        estiDao.insertEstiExamData(estimateId);
        estiDao.insertEstiCompareData(estimateId);
        
        return regCode;        
    }
    
    /*스마트견적관리에서 차종 갖고오기*/
    public List<Map<String, Object>> selectCarDetailList(Map<String, Object> paramMap) {
        List<Map<String, Object>> resultMap = rentDao.selectCarDetailList(paramMap);
        return resultMap;
    }
    
    /*최상위 편의사양 정보 갖고오기*/
    public List<Map<String, Object>> selectParentSpec(Map<String, String> param) {
        List<Map<String, Object>> specList = new ArrayList<Map<String, Object>>();
        boolean flag = false;
        
        Map<String, Object> spec = null;
        int count = 0;
        while(!flag){
        	spec = rentDao.selectParentSpec(param);
        	String parentCarName = "";
        	
        	if( !(spec.get("CAR_B_INC_ID") == null || spec.get("CAR_B_INC_ID") == "") ){
        		parentCarName = spec.get("CAR_NAME").toString();
        		spec.put("parentCarName",parentCarName);
        		specList.add(spec);
        		
        		param.put("parentCarId", String.valueOf(spec.get("CAR_B_INC_ID")));
        		param.put("parentCarSeq", String.valueOf(spec.get("CAR_B_INC_SEQ").toString()));
        	} else {
        		parentCarName = spec.get("CAR_NAME").toString();
        		spec.put("parentCarName",parentCarName);
        		specList.add(spec);
        		
        		flag = true;
        		break;
        	}
        	
        	count++;
        	if(count == 7) {
        		flag = true;
        		break;
        	}
        }
        
       /* //최상위 편의사양 정보까지 반복하기
        while (!flag) {
            Map<String, Object> spec = rentDao.selectParentSpec(param);
            String parentCarName = "";
            
            if (spec.get("CAR_B_INC_ID") == null || spec.get("CAR_B_INC_ID") == "") {
                spec.put("parentCarName",parentCarName);
                specList.add(spec);
                
                flag = true;
                break;
                
            } else {
                
                Map<String, Object> parentMap = rentDao.selectParentSpec(param);
                parentCarName = parentMap.get("CAR_NAME").toString();
                
                spec.put("parentCarName",parentCarName);
                specList.add(spec);
                
                flag = true;
                break;                
            }
        }*/
       
        return specList;
    }

    public Map<String, Object> getCompareData(String estimateId, String type) {
        Map<String, Object> result = new HashMap<String, Object>(); 
        if (type == "secondhand") {
            result = rentDao.selectSecondhandCompareData(estimateId);
        } else{
            result = rentDao.selectMainCarCompareData(estimateId); 
        }
        return result;
    }
    
    /* 재렌트 데이터(SH_BASE) 갖고 오기 */
    public Map<String, Object> getSecondhandBaseData(String carManagedId) {
        return rentDao.selectSecondhandBaseData(carManagedId);
    }
    
    /*
     * 워킹타임이 아닌 경우 false 리턴
     * */
    public boolean isValidWorkingTime() throws ParseException{
        Date date = new Date();
        SimpleDateFormat sdformat = new SimpleDateFormat("yyyyMMdd");
        String todayDate = sdformat.format(date).toString();
        long paramDate = DateUtils.parseDate(todayDate, "yyyyMMdd").getTime();
        
        boolean flag = holidayHelper.isHoliday(paramDate);
        
        if (flag) { //공휴일, 주말인 경우
            return false;
            
        } else{ //업무일인 경우

            //working time 구하기
            java.util.Date d = new java.util.Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy'-'MM'-'dd'-'HH'-'mm'-'ss");
            String ch = sdf.format(d);
            
            int t_time = Integer.parseInt(ch.substring(11,13) + ch.substring(14,16));
            if ( t_time >= 801 && t_time <= 2001 ) { //워킹타임인 경우
                flag = true;
            } else{
                flag = false;
            }
            
            return flag;
        }
    }
    
    public Map<String, Object> getCarDCAmt(Map<String, Object> param) {
        Map<String, Object> result = rentDao.selectCarDcAmt(param);
        return result;
    }
    
    public Map<String, Object> getEstiCommVarEstimateSh() {
    	Map<String, Object> result = rentDao.selectEstiCommVarEstimateSh();
    	return result;
    }

    public Map<String, Object> selectReceiveHistory(String param) {
        Map<String, Object> result = rentDao.selectReceiveHistory(param);
        return result;
    }
    
    public Map<String, Object> makeSecondhandRentPriceTable(Map<String, Object> carMap) {
    	DecimalFormat df = new DecimalFormat("#,##0");
        ArrayList<String> columnArray = new ArrayList<String>();
        ArrayList<String> agArray = new ArrayList<String>();
        Map<String, Object> priceMap = new LinkedHashMap<String, Object>();
        Map<String, Object> EstiCommVarSh = rentDao.selectEstiCommVarEstimateSh();
        
        int maxMonth = Integer.parseInt(carMap.get("MAX_USE_MON").toString());
        int idx = maxMonth/12; 
        int month = 0;
        String[] titleArray = {"LB", "LS", "RB", "RS"};
        
        //maxMonth 가 12의 배수일 경우, maxMonth 도 나오고 12의 배수로도 나와 중복 출력되는 문제가 있어 로직 추가
        if (maxMonth % 12 == 0) {
            idx = idx-1;
        }
        
        columnArray.add("LBMAX");
        columnArray.add("LSMAX");
        columnArray.add("RBMAX");
        columnArray.add("RSMAX");
        
        agArray.add("LBMAX_AG");
        agArray.add("LSMAX_AG");
        agArray.add("RBMAX_AG");
        agArray.add("RSMAX_AG");
           
        for (int i = idx; i >= 0; i--) {
            if (i == 0) { 
                month = 6;
            } else {
                month = i*12;
            }
            
            for (int j = 0; j < titleArray.length; j++) {
                String column = titleArray[j] + month;
                String column2 = titleArray[j] + month + "_AG";
                columnArray.add(column);
                agArray.add(column2);
            }
        }
        
        //System.out.println(carMap);
        //System.out.println(columnArray);
        //System.out.println(agArray);
        
		//String[] columnArray = {"LBMAX","LB36","LB24","LB12","LSMAX","LS36","LS24","LS12",
		//"RBMAX","RB36","RB24","RB12","RSMAX","RS36","RS24","RS12"};
    	if (!carMap.containsKey("brTo")) {
        	carMap.put("brTo", "");
     	}
        
        String temp_br_from = carMap.get("BR_ID").toString();
        String br_from = "0";
        String temp_br_to = carMap.get("brTo").toString();
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
        
        int br_cons = Integer.parseInt(EstiCommVarSh.get("BR_CONS_" + br_from + br_to).toString());
        
        for (String column : columnArray) {
        	
        	if (carMap.get(column) != null) {
                int price = Integer.parseInt(carMap.get(column).toString());
                int feeAg = 0;
                int toAmt = 0;
                for (String ag : agArray) {
                	if (ag.equals(column + "_AG")) {
            			if (carMap.get(ag) != null) {
            				feeAg = Integer.parseInt(carMap.get(ag).toString());
            			}
            		}
                	toAmt = price + (int)Math.round(((double)br_cons / 100000 * feeAg) / 100) * 100;
            	}
                
                if (price <= 0) {
                    priceMap.put(column, "이용 불가");
                    priceMap.put("TO_" + column, "이용 불가");
                } else {
                    priceMap.put(column, df.format(price) + "원");
                    priceMap.put("TO_" + column, df.format(toAmt) + "원");
                }
            } else {
                priceMap.put(column, "이용 불가");
            }
        }
        
        return priceMap;
        
    }

    public List<Map<String, Object>> getImportsRentSearchList(Map<String, Object> param) {
        //DPM 셋팅
        if (param.get("dpm") != null && !param.get("dpm").equals("")) {
            String[] dpmArray = {"0","1000","1600","2000","3000"};
            int dpm = Integer.parseInt(param.get("dpm").toString());
            if (dpm != 5) {
                param.put("dpmMax",dpmArray[dpm]);
                param.put("dpmMin",dpmArray[dpm-1]);
            } else{
                param.put("dpmMin",dpmArray[dpm-1]);
            }
        }
        //주행거리 셋팅
        if (param.get("agreeDist") == null || param.get("agreeDist").equals("")) {
            param.put("agreeDist","10000");
        }
        
        List<Map<String, Object>> resultMap = rentDao.selectImportsListForSearch(param);
        return resultMap;
    }

    public List<Map<String, Object>> selectAttachFileList(String contentCode, String contentSeq) {
        Map<String, Object> paramMap = new HashMap<String, Object>();
        
        paramMap.put("contentCode", contentCode);
        paramMap.put("contentSeq", contentSeq);
        
        List<Map<String, Object>> resultMap = rentDao.selectAttachFileList(paramMap);
        return resultMap;
    }

    public List<Map<String, Object>> selectDriverList(String estimateId) {
        List<Map<String, Object>> driverList = rentDao.selectDriverList(estimateId);
        return driverList;
    }
    
    /*전기차, 수소차 사전예약등록*/
    @Transactional
    public void setSimpleEstimateReserveCustomerInfo(Map<String, String> param) throws Exception {
    	try{        	
    		estiDao.insertCustomerReserveInfoSimple(param);  //param 데이터 est_spe insert
    	}catch(Exception e) {
    		throw e;
    	}
    }
    
    /*특별할인차량상담요청*/
    @Transactional
    public void setSimpleEstimateDiscountCustomerInfo(Map<String, String> param) throws Exception {
    	try{        	
    		estiDao.insertCustomerDiscountInfo(param);  //param 데이터 est_spe insert
    	}catch(Exception e) {
    		throw e;
    	}
    }
    
    /*간편상담등록*/
    @Transactional
    public void setSimpleEstimateCustomerInfo2(Map<String, String> param) throws Exception {
    	try{        	
    		estiDao.insertCustomerInfoSimple2(param);  //param 데이터 est_spe insert
    	}catch(Exception e) {
    		throw e;
    	}
    }
    
    /*간편상담등록*/
    //견적서 url을 /smart/print로 일괄수정하면서 이부분도 수정(2017.07.04)
    @Transactional
    public void setSimpleEstimateCustomerInfo(Map<String, String> param) throws Exception {
    	try{    		
    		DateFormat regFormat = new SimpleDateFormat("yyyyMMddHHss");
    		Date today = new Date();
    		String regDate = regFormat.format(today).toString();
    		String regCode = Long.toString(System.currentTimeMillis());
    		String gubun = param.get("estGubun"); //1,2,3(법인사업자/개인사업자/개인)
    		String newEstimateId = "";
    		//Date date = new Date();
    		//String regSysDate = new SimpleDateFormat("yyyyMMddHHmm").format(date);
    		String[] jobArray = {"org", "cls"};
    		String jgG7 = param.get("jgG7");
    		String carCompId = param.get("carCompId");
    		
    		/*if ((jgG7.equals("3") || jgG7.equals("4")) && !carCompId.equals("0056")) {
				param.put("print_type", "6");
			} else {
				param.put("print_type", "1");
			}*/
    		
    		param.put("print_type", "1");
    		
    		param.put("regSysDate", regDate);
    		param.put("docType", gubun);
    		param.put("regCode", regCode);
    		param.put("setCode", regCode);
    		param.put("ehCode", "");
    		
    		//System.out.println("setSimpleEstimateCustomerInfo >>> " + regCode);
    		//System.out.println("setSimpleEstimateCustomerInfo >>> " + param);
    		
    		int result = estiDao.checkCustomerInfo(param);	//먼저, estimate_cu에 견적서 존재여부 구함
    		    		
    		if (result == 1) {	//있으면 견적 데이터를 호출(스마트 견적으로 방금 견적을 생성한 경우)
    			
    			param.put("estimateId", param.get("estId"));
    			//param.put("estSSN", "");	//estSSN : 생년월일/사업자등록번호(간편상담신청은 해당없음)
    			estiDao.updateCustomerInfo(param);	 //추가사항 업데이트만 시켜줌
    			
    		} else{	//없으면 각 분기에 따라 신차나 재리스의 기본견적을 토대로 estimate_cu에 견적데이터 생성
    			    			
    			if (param.get("productType").equals("PJ")) {	//재렌트, 재리스인경우
    				newEstimateId = regCode + "1";
    				param.put("estimateId", newEstimateId);	//이 경우 estimateId가 새로 세팅됨
    				estiDao.insertSecondhandEstimateInfoForSimple(param);
    				
    				//20200720 고객주소지 관련하여 다시 금액 계산
    				//estiDao.insertEstiExamData(newEstimateId);
    		        //estiDao.insertEstiCompareData(newEstimateId);
    		        estiDao.insertEstiExamData(newEstimateId);
    		        estiDao.insertEstiCompareData(newEstimateId);
    		        
    		        Map<String, Object> estimateMap = estiService.getSecondhandEstimateInfo(param);
    				//System.out.println("setSimpleEstimateCustomerInfo >>> " + estimateMap);
    				
    				String reg = (String)estimateMap.get("REG_CODE");
    				String car_comp_id = (String)estimateMap.get("CAR_COMP_ID");
    		        String a_a = (String)estimateMap.get("A_A");
    		        
    		        Map<String, Object> resultMap = new HashMap<String, Object>();
    		        resultMap = estiService.getEstimateFeePerMonth(regCode, "secondhand", car_comp_id, a_a);
    		        
    		        String car_name = param.get("carName").toString();
    		        param.put("carName", "[재렌트]" + car_name);
    				//System.out.println(resultMap);
    				
    				//System.out.println("end");
    				
    			} else {	//신차
    				
					/*if ((jgG7.equals("3") || jgG7.equals("4")) && !carCompId.equals("0056")) { //전기차 및 수소차일 경우
						// 전기차 수소차일 경우 두개의 견적을 생성
						for (int i=1; i<3; i++) {
	    					
	    					// estimateId를 regCode에 1,2를 붙여 생성한다
	    					newEstimateId = regCode + "" + i;
	    					param.put("estimateId", newEstimateId);
	    					
	    					param.put("job", jobArray[i-1]);
	    					
	    					if (jobArray[i-1] == "cls") { //job이 cls면 개월 수를 절반만 넣어준다. 위약금계산을 위한 데이터
	    		                int clsMonth = Integer.parseInt(param.get("a_b"))/2;
	    		                param.put("a_b", String.valueOf(clsMonth));
	    		            }
	    					
	    					estiDao.insertEsimateInfoForSimple(param);
	    					estiDao.insertEstiExamData(newEstimateId);
	    					estiDao.insertEstiCompareData(newEstimateId);
	    				}
						
	    				Map<String, Object> paramMap = new HashMap<String, Object>();
	    		        List<Map<String, Object>> standardDateList = rentDao.selectStarndardDate(); //기준날짜 뽑기
	    		        
	    		        //기준 날짜 뽑아온 것을 table 형태에서 map 형태로 바꾼다
	    		        for (int z=0; z<standardDateList.size(); z++) {
	    		            String targetDateString = standardDateList.get(z).get("STD_DT").toString();
	    		            paramMap.put(standardDateList.get(z).get("GUBUN").toString(),targetDateString);
	    		        }
	    		        
	    		        paramMap.put("estTable", "");
	    		        	    		                		
		        		try {
		        			if (param.get("a_a").equals("22") || param.get("a_a").equals("12")) { //기본식일 경우		        				
		        				paramMap.put("regCode", regCode);
		        				estiDao.ExecEstimateRegEv(paramMap);
		        			}							
						} catch (Exception e) {
							System.out.println(e);
						}
						
    				} else {
    					// 전기차 수소차가 아닌경우 기존방식과 동일하게 한개의 견적만 생성
    					newEstimateId = regCode + "1";
    					param.put("estimateId", newEstimateId); //이 경우 estimateId가 새로 세팅됨
    					param.put("job", "org");
    					estiDao.insertEsimateInfoForSimple(param);
    				}*/
					
					newEstimateId = regCode + "1";
					param.put("estimateId", newEstimateId); //이 경우 estimateId가 새로 세팅됨
					param.put("job", "org");
					estiDao.insertEsimateInfoForSimple(param);    				 				
    			}
    		}
    		////기존고객인지 체크 로직 추가(2017.09.04) 기존로직에서 수정(2017.09.20)            
    		String client_id = "";
    		
    		if (param.get("estEmail") != null && !param.get("estEmail").equals("")) {
    			/*Map<String, Object> userMap = memberDao.selectUserInfo(param.get("estEmail"));
            	client_id = (String) userMap.get("CLIENT_ID");*/
    			if (param.get("estSSN").equals("1288147957")) {
    				client_id = "000228";
    			} else {
    				client_id = memberDao.selectClientId(param);
    			}
    			
    		}            
    		if (client_id != null && !client_id.equals("")) {
    			param.put("client_yn", "Y");
    		} else {
    			param.put("client_yn", "");
    		}
    		
    		if (result != 1) {
    			newEstimateId = regCode + "1";
    			param.put("estimateId", newEstimateId);	//이 경우 estimateId가 새로 세팅됨
    		}
			
    		estiDao.insertCustomerInfoSimple(param);  //마지막으로 분기에서 바뀐 param데이터들을 est_spe에 insert
    		
    	}catch(Exception e) {
    		throw e;
    	}
    }
    
    //전기차,수소차 견적서 pack으로 묶어서 fetch(20190212)
    @SuppressWarnings({ "finally" })
	@Transactional
    public Map<String, Object> setEstimateEHInfo(Map<String, String> param) throws Exception {
    	Map<String, Object> othersEstiMap = new HashMap<String, Object>();
    	try {
    		List<Map<String, Object>> estiIdMap = new ArrayList<Map<String, Object>>();
    		if (param.get("from_page").equals("/smart/print")) {
    			estiIdMap = rentDao.getABTypeEstIds2(param);
    		} else if (param.get("from_page").equals("/rentLease/print")) {
    			estiIdMap = rentDao.getABTypeEstIds3(param);
    		}
    		for (int i = 0; i < estiIdMap.size(); i++) {
    			CarDetail car = new CarDetail();
    			param.replace("estimateId", estiIdMap.get(i).get("EST_ID").toString());
    			car =estiService.getCreatedEstimateInfoForSmart(param);
    			othersEstiMap.put("data"+(i+1), car.getEstimateMap());
    		}
    	} catch(Exception e) {
    		throw e;
    	} finally {
			return othersEstiMap;
		}
    }
    
    public Map<String, Object> selectAccidCarDetail(Map<String, String> param) {
    	Map<String, Object> resultMap = rentDao.selectAccidCarDetail(param);       
        return resultMap;
    }

	public String getCompIdByCarName(String carName) {
		return rentDao.getCompIdByCarName(carName);
	}
    
}


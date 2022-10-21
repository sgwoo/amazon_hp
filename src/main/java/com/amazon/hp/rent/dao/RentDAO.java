package com.amazon.hp.rent.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.amazon.hp.common.AbstractDAO;

@Repository("rentDao")
public class RentDAO extends AbstractDAO{
	public List<Map<String, Object>> selectMonthCarList(Map<String, Object> param){
        return (List<Map<String, Object>>)selectList("rentMapper.selectMonthCarList", param);
    }

    public Map<String, Object> selectMonthCarDetail(Map<String, Object> param) {
        return (Map<String, Object>)selectOne("rentMapper.selectMonthCarDetail",param);
    }

    public List<Map<String, Object>> selectCarHistory(String param) {
        return (List<Map<String, Object>>)selectList("rentMapper.selectCarHistory",param);
    }

    public List<Map<String, Object>> selectAccidentHistory(String param) {
        return (List<Map<String, Object>>)selectList("rentMapper.selectAcciHistory",param);
    }

    public List<Map<String, Object>> selectServiceHistory(String param) {
        return (List<Map<String, Object>>)selectList("rentMapper.selectServHistory",param);
    }

    public List<Map<String, Object>> selectDomesticList(Map<String, Object> param) {
        return (List<Map<String, Object>>)selectList("rentMapper.selectDomesticRentList", param);
    }
    
    public List<Map<String, Object>> selectDomesticListForSearch(Map<String, Object> param){
        return (List<Map<String, Object>>)selectList("rentMapper.selectDomsticRentListForSearch", param);
    }
    
    public List<Map<String, Object>> selectDomesticFuelKdListForSearch(Map<String, Object> param){
    	return (List<Map<String, Object>>)selectList("rentMapper.selectDomesticFuelKdListForSearch", param);
    }

    public List<Map<String, Object>> selectDomesticRentPriceDetail(String param) {
        return (List<Map<String, Object>>)selectList("rentMapper.selectDomesticRentDetail_price",param);
    }

    public Map<String, Object> selectDomesticRentEstimateDetail(String param) {
        return (Map<String, Object>)selectOne("rentMapper.selectDomesticRentDetail_estimate",param);
    }
    
    public Map<String, Object> selectCommonCarDetail(Map<String, Object> param) {
        return (Map<String, Object>)selectOne("rentMapper.selectCommonCarDetail",param);
    }

    public Map<String, Object> selectDomesticRentMainInfo(Map<String, String> param) {
        return (Map<String, Object>)selectOne("rentMapper.selectDomesticRentDetail_main",param);
    }

    public List<Map<String, Object>> selectCarOption(Map<String, String> param) {
        return (List<Map<String, Object>>)selectList("rentMapper.selectCarOption",param);
    }
    
    public Map<String, Object> selectJGCarOption(Map<String,String> param){
        return (Map<String, Object>)selectOne("rentMapper.selectJGCarOption", param);
    }
    
    public List<Map<String, Object>> selectCarColor(Map<String, String> param) {    	
        return (List<Map<String, Object>>)selectList("rentMapper.selectCarColor",param);        
    }

    public Map<String, Object> selectCarDcAmt(Map<String, Object> param){
        return (Map<String, Object>)selectOne("rentMapper.selectCarDcAmt", param);
    }
    
    public List<Map<String, Object>> selectStarndardDate(){
        return (List<Map<String, Object>>)selectList("rentMapper.selectStandardDateForEstimate");
    }
    
    public Map<String, Object> selectEstiCommVarEstimateSh(){
    	return (Map<String, Object>)selectOne("rentMapper.selectEstiCommVarForEstimateSh");
    }
    
    public Map<String, Object> selectEstimateData(String regCode){
        return (Map<String, Object>)selectOne("rentMapper.selectEstimateData",regCode);
    }

    public Map<String, Object> selectSecondhandEstimateData(String regCode){
        return (Map<String, Object>)selectOne("rentMapper.selectSecondhandEstimateData",regCode);
    }
    
    public Map<String, Object> selectSecondhandData(String regCode){
    	return (Map<String, Object>)selectOne("rentMapper.selectSecondhandData", regCode);
    }
  
	public List<Map<String, Object>> selectImportsCarList(Map<String, Object> param) {
		return (List<Map<String, Object>>)selectList("rentMapper.selectImportsRentList", param);
	}
	
	public List<Map<String, Object>> selectDiscountRentCarList(Map<String, Object> param) {
		return (List<Map<String, Object>>)selectList("rentMapper.selectDiscountRentCarList", param);
	}
	
	public List<Map<String, Object>> selectDiscountLeaseCarList(Map<String, Object> param) {
		return (List<Map<String, Object>>)selectList("rentMapper.selectDiscountLeaseCarList", param);
	}
	
	public List<Map<String, Object>> selectSecondhandCarList(Map<String, Object> param){
	    return (List<Map<String, Object>>)selectList("rentMapper.selectSecondhandRentList", param);
	}

    public Map<String, Object> selectSecondHandCarDetail(Map<String, String> param) {
        return ((Map<String, Object>)selectOne("rentMapper.selectSecondhandCarDetail",param));
    }
 
    public Map<String, Object> selectShortRentFee(Map<String, Object> param) {
        return ((Map<String, Object>)selectOne("rentMapper.selectShortRentFee",param));
    }

    /* 스마트 견적관리에서 제조사 조회 */
    public List<Map<String, Object>> selectCarCompList(){
        return ((List<Map<String, Object>>)selectList("rentMapper.selectCarCompList"));
    }
    
    /* 스마트 견적관리에서 차명 조회 */
    public List<Map<String, Object>> selectCarNameList(String carCompId) {
        return ((List<Map<String, Object>>)selectList("rentMapper.selectCarNameList", carCompId));
    }
    
    /* 스마트 견적관리에서 차종 조회 */
    public List<Map<String, Object>> selectCarDetailList(Map<String, Object> param){
        return ((List<Map<String, Object>>)selectList("rentMapper.selectCarDetailList", param));
    }
    
    public Map<String, Object> selectSmartCarDetail(Map<String, Object> param){
        return (Map<String, Object>)selectOne("rentMapper.selectDomesticRentDetail_smart", param);
    }

    public Map<String, Object> selectCarMainCode(Map<String, String> param) {
        return (Map<String, Object>)selectOne("rentMapper.selectCarMainCode", param);
    }
    
    public Map<String, Object> selectParentSpec(Map<String,String> param){
        return (Map<String, Object>)selectOne("rentMapper.selectParentSpec", param);
    }
    
    public Map<String, Object> selectSecondhandCompareData(String estimateId){
        return (Map<String, Object>)selectOne("rentMapper.selectSecondhandCompareData", estimateId);
    }

    public Map<String, Object> selectMainCarCompareData(String estimateId) {
        return (Map<String, Object>)selectOne("rentMapper.selectMainCarCompareData", estimateId);
    }

    public Map<String, Object> selectSecondhandBaseData (String carManagedId) {
        return (Map<String, Object>)selectOne("rentMapper.selectSecondhandBaseData", carManagedId);
    }

    public Map<String, Object> selectReceiveHistory(String param) {
        return (Map<String, Object>)selectOne("rentMapper.selectReceiveHistory", param);
    }

    public Map<String, Object> selectAttachFile(Map<String, Object> param) {
        return (Map<String, Object>)selectOne("rentMapper.selectAttachFile", param);
    }
    
    public List<Map<String, Object>> selectAttachFileList(Map<String, Object> param) {
        return (List<Map<String, Object>>)selectList("rentMapper.selectAttachFileList", param);
    }

    public List<Map<String, Object>> selectImportsListForSearch(Map<String, Object> param) {
        return (List<Map<String, Object>>)selectList("rentMapper.selectImportsRentListForSearch", param);
    }

    public List<Map<String, Object>> selectDriverList(String estimateId) {
        return (List<Map<String, Object>>)selectList("rentMapper.selectDriverList", estimateId);
    }

    public String checkExistReservation(String estimateId) {
        return (String)selectOne("rentMapper.selectReversionStatus", estimateId);
    }

    public int checkReserveCount(Map<String, Object> param){
        return (int)selectOne("rentMapper.checkReserveCount",param);
    }

    public List<Map<String, Object>> selectDomesticLeaseList(Map<String, Object> param) {
    	return (List<Map<String, Object>>)selectList("rentMapper.selectDomesticLeaseList", param);
    }
    
    public int insertSendSMSForReserve(Map<String, Object> param){
    	return (int) insert("rentMapper.insertSendSMSForReserve", param);
    }
    
    public String selectJangaCode(String carId){
    	return (String)selectOne("rentMapper.selectJangaCode", carId);
    }
    
    public Map<String, Object> selectEstiJgVar(String jgCode){
    	return (Map<String, Object>)selectOne("rentMapper.selectEstiJgVar", jgCode);
    }
    
    public Map<String, Object> selectEstiJgOptVar(Map<String, String> paramMap){
    	return (Map<String, Object>)selectOne("rentMapper.selectEstiJgOptVar", paramMap);
    }
    
    public Map<String, Object> getMRentCarInfo(HashMap<String, Object> param){
    	return (Map<String, Object>)selectOne("rentMapper.getMRentCarInfo", param);
    }
    
    public List<Map<String, Object>> getABTypeEstIds2(Map<String, String> param) {
        return (List<Map<String, Object>>)selectList("rentMapper.getABTypeEstIds2", param);
    }
    
    public List<Map<String, Object>> getABTypeEstIds3(Map<String, String> param) {
        return (List<Map<String, Object>>)selectList("rentMapper.getABTypeEstIds3", param);
    }
    
    public Map<String, Object> selectAccidCarDetail(Map<String, String> param) {
        return ((Map<String, Object>)selectOne("rentMapper.selectAccidCarDetail",param));
    }

	public List<Map<String, Object>> getCarCompanyList() {
		return ((List<Map<String, Object>>)selectList("rentMapper.getCarCompanyList"));
	}

	public String getCompIdByCarName(String carName) {
		return (String)selectOne("rentMapper.getCompIdByCarName", carName);
	}
}

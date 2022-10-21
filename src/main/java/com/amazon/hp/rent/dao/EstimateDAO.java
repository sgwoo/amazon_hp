package com.amazon.hp.rent.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.amazon.hp.common.AbstractDAO;

@Repository("estiDao")
public class EstimateDAO extends AbstractDAO{

    public void insertEstimateData(Map<String, String> param) {
        insert("estiMapper.insertEstimateData",param);
    }

    public void insertEstiCompareData(String estimateId) {
        insert("estiMapper.insertEstiCompareData",estimateId);
    }
    
    public void insertEstiExamData(String estimateId) {
        insert("estiMapper.insertEstiExamData",estimateId);      
    }
    
    public void ExecEstimateRegEv(Map<String, Object> param){
        update("estiMapper.callSpEstiRegEv",param);
    }
    
    public void ExecEstimateJanga(Map<String, Object> param){
    	update("estiMapper.calculateJanga",param);
    }
    
    public void ExecEstimateFee(Map<String, Object> param){
        update("estiMapper.calculateFee",param);
    }
    
    public void ExecEstimateClsper(Map<String, Object> param){
        update("estiMapper.calculateClsper",param);
    }
    
    public void ExecMonthReserve(Map<String, Object> param){
        update("estiMapper.execMonthReserve",param);
    }
    
    public void updateCustomerInfo(Map<String, String> param) {
        update("estiMapper.updateCustomerInfo",param);
    }
    
    public int checkCustomerInfo(Map<String, String> param) {
        int checkResult = (int) selectOne("estiMapper.checkCustomerInfo",param);
        return checkResult;
    }

    public void insertCustomerInfo(Map<String, String> param) {
        insert("estiMapper.insertCustomerInfo",param);
    }
    
    public int checkCustomerInfo2(Map<String, String> param) {
        int checkResult2 = (int) selectOne("estiMapper.checkCustomerInfo2",param);
        return checkResult2;
    }
    
    public Map<String, Object> selectCustomerInfo(String param){
        return ((Map<String, Object>)selectOne("estiMapper.selectCustomerInfo",param));
    }
    
    public Map<String, Object> selectCreatedEstimateInfo(String param){
        return ((Map<String, Object>)selectOne("estiMapper.selectCreatedEstimateInfo",param));
    }

    public String selectSecondhandEstimateId(Map<String,String> param) {
        return selectOne("estiMapper.selectSecondhandEstimateId", param).toString();
    }
    
    public String selectRecentSecondhandEstimateId(Map<String,String> param) {
        return selectOne("estiMapper.selectRecentSecondhandEstimateId", param).toString();
    }
    
    public Map<String, Object> selectSecondhandEstimateInfo(String param) {
        return ((Map<String, Object>)selectOne("estiMapper.selectSecondhandEstimateInfo", param));
    }

    public void ExecSecondhandEstimateAmt(Map<String, Object> param) {
        update("estiMapper.calculateSecondhandAmt",param);
    }

    public void ExecSecondhandEstimateFee(Map<String, Object> param) {
        update("estiMapper.calculateSecondhandFee",param);
    }

    public void insertSecondhandEstimateInfo(Map<String, Object> param) {
        insert("estiMapper.insertSecondhandEstimateData",param);
    }
    
    public int checkReserveRank(String param){
        return Integer.parseInt((String)selectOne("estiMapper.checkReserveRank",param));
    }
    
    public void insertReserveInfo(Map<String,String> param){
        insert("estiMapper.insertReserveInfo",param);
    }
    
    public Map<String, Object> selectSmartDCprice(Map<String,String> param){
        return (Map<String, Object>)selectOne("estiMapper.selectSmartDcAmt",param);
    }
    
    public Map<String, Object> selectSmartDCprice2(Map<String,String> param){
    	return (Map<String, Object>)selectOne("estiMapper.selectSmartDcAmt2",param);
    }
    
    public Map<String, Object> selectSmartCarDcEtc(Map<String,String> param){
    	return (Map<String, Object>)selectOne("estiMapper.selectSmartCarDcEtc",param);
    }
    
    public void insertEsimateInfoForMonth(Map<String, Object> param){
        insert("estiMapper.insertEsimateInfoForMonth", param);
    }
    
    public void insertEsimateExamForMonth(Map<String, Object> param){
        insert("estiMapper.insertEsimateExamForMonth",param);
    }

    public String selectShResSeq(String param) {
        return (String)selectOne("estiMapper.selectShResSeq", param);
    }
    
    public void updateRoAmt(Map<String,String> param){
        update("estiMapper.updateRoAmt",param);
    }
    
    public Map<String, Object> selectSecondhandDepositInfo(Map<String, Object> param){
        return (Map<String, Object>)selectOne("estiMapper.selectSecondhandDepositInfo",param);
    }
    
    public void updateCustomerInfoToShres(Map<String,String> param){
        update("estiMapper.updateCustomerInfoToShres", param);
    }
    
    public void updateCustomerInfoToEsti(Map<String,String> param){
        update("estiMapper.updateCustomerInfoToEsti", param);
    }

    public int cancelMonthRent(Map<String, String> param) {
        return (int)update("estiMapper.cancelMonthRent",param);
    }
    
    public void updateReserveSituation(String estimateId){
        update("estiMapper.updateReserveSituation",estimateId);
    }
    
    public void insertDriverInfo(Map<String,String> param){
        insert("estiMapper.insertDriverInfo",param);
    }
    
    public void updateCustomerAccountInfo(Map<String,String> param){
        update("estiMapper.updateCustomerAccountInfo",param);
    }

    public void deleteDriverInfo(String estimateId) {
        delete("estiMapper.deleteDriverInfo",estimateId);
    }
    
    public void insertEsimateInfoForSimple(Map<String,String> param){
        insert("estiMapper.insertEsimateInfoForSimple",param);
    }
    
    public void insertSecondhandEstimateInfoForSimple(Map<String,String> param){
        insert("estiMapper.insertSecondhandEsimateInfoForSimple",param);
    }
    
    // 사전예약
    public void insertCustomerDiscountInfo(Map<String, String> param) {
        insert("estiMapper.insertCustomerDiscountInfo",param);
    }
    
    // 사전예약
    public void insertCustomerReserveInfoSimple(Map<String, String> param) {
    	insert("estiMapper.insertCustomerReserveInfo-simple",param);
    }
    
    // 간편상담
    public void insertCustomerInfoSimple2(Map<String, String> param) {
    	insert("estiMapper.insertCustomerInfo-simple2",param);
    }
    
    public void insertCustomerInfoSimple(Map<String, String> param) {
    	insert("estiMapper.insertCustomerInfo-simple",param);
    }
    
    public void updateInsPerSetting(Map<String, Object> paramMap){
        update("estiMapper.updateInsPerSetting",paramMap);
    } 
    
    //월렌트 예약시  예약 기간 가져오기 
    public Map<String, Object> selectReservePeriod(Map<String, Object> param){
        return (Map<String, Object>)selectOne("estiMapper.selectReservePeriod",param);
    } 
    
    public String getBDt(){
    	return (String)selectOne("estiMapper.getBDt");
    }
    
    public Map<String, Object> getSubsidyData(Map<String, Object> param){
        return (Map<String, Object>)selectOne("estiMapper.getSubsidyData",param);
    }
    
    public Map<String, Object> getEstiExamCu(String estimateId){
        return (Map<String, Object>)selectOne("estiMapper.getEstiExamCu",estimateId);
    }
    
    public Map<String, Object> getEstiExamHp(String estimateId){
        return (Map<String, Object>)selectOne("estiMapper.getEstiExamHp",estimateId);
    }
    
    public Map<String, Object> getEstimateCu(String estimateId){
        return (Map<String, Object>)selectOne("estiMapper.getEstimateCu",estimateId);
    }

	public int getBk128(Map<String, String> param) {
		return (int) selectOne("estiMapper.getBk128",param);
	}
    
}

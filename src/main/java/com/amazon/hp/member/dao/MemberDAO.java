package com.amazon.hp.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.jpa.criteria.expression.function.SubstringFunction;
import org.springframework.stereotype.Repository;

import com.amazon.hp.common.AbstractDAO;
import com.amazon.hp.member.util.user.UserEmailFormatter;

@Repository("memberDao") 
public class MemberDAO extends AbstractDAO {

    public Map<String, Object> selectUserInfo(String email){
        return (Map<String, Object>)selectOne("memberMapper.getUserInfo",email);
    }

    public void updateUserInfo(Map<String, Object> params) {
        update("memberMapper.updateUserInfo", params);
    }

    public void updateProviderInfo(Map<String,Object> params) {
        update("memberMapper.updateProviderInfo", params);
    }
    
    public void updateProviderInfoforNoEmail(Map<String,Object> params) {    	
        update("memberMapper.updateProviderInfoforNoEmail", params);        
    }
    
    public void updateProviderInfoforNoEmailKakao(Map<String,Object> params) {    	
    	update("memberMapper.updateProviderInfoforNoEmailKakao", params);        
    }

    public List<Map<String, Object>> selectEstimateList(Map<String,Object> params) {
        return selectList("memberMapper.selectEstimateList", params);
    }
    
    public int selectEstimateListCnt(Map<String,Object> params) {
    	return (int) selectOne("memberMapper.selectEstimateListCnt", params);
    }

    public void insertComplainInfo(Map<String, Object> params) {
        insert("memberMapper.insertComplainInfo",params);
    }

    public List<Map<String, Object>> selectComplainList(String email) {
        return selectList("memberMapper.selectComplainList",email);
    }

    public void updateTokenInfo(Map<String, Object> params) {
        update("memberMapper.updateTokenInfo", params);
    }

    public void insertEmailInfo(UserEmailFormatter mailFormat) {
        insert("memberMapper.insertEmailInfo", mailFormat);
    }

    public void updatePassword(Map<String, Object> params) {
        update("memberMapper.updatePassword", params);
    }

    public String selectToken(String token) {
        return selectOne("memberMapper.selectToken", token).toString();
    }
    
    //?????????????????? ????????????
    public String selectTokenForEmailAuth(String token) {
        return selectOne("memberMapper.selectTokenForEmailAuth", token).toString();
    }
    
    //????????? ?????? ?????? ?????? ??????(2017.05.15)
    public int checkPassword(Map<String, Object> params){
    	return (int) selectOne("memberMapper.checkPassword", params);
    }
    
    //????????? ?????? ????????? ????????? ????????? ??????
    public void updateUseYn(String email){
    	update("memberMapper.updateUseYn", email);
    }
    
    //???????????? use_yn ????????? ??????
    public int checkUseYn(String email){
    	int checkCnt = (int) selectOne("memberMapper.selectUseYn", email);    	
    	return checkCnt;
    }
    
    //??????????????? ?????? ??????
    public int updateEmailToken(Map<String, Object> params) {
    	int checkResult = (int)update("memberMapper.updateEmailToken", params);    	
    	return checkResult;
    }
    
    //?????????????????? ??????
    public int checkRegEmail(Map<String, Object> params) {
    	int checkResult = (int)selectOne("memberMapper.checkRegEmail", params);
    	return checkResult;
    }
    
    //??????????????? ??????????????? ??????
    public Map<String, Object> selectEstimateOne(String estimateId) {
        return (Map<String, Object>) selectOne("memberMapper.selectEstimateOne", estimateId);
    }
    
    public String checkFacebookId(String facebookId) {
    	String checkId = (String) selectOne("memberMapper.checkFacebookId", facebookId);
    	return checkId;
    }
    
    public void updateFacebookId(String facebookId){
    	update("memberMapper.updateFacebookId", facebookId);
    }
    
    public void updateEmailInfo(HashMap vmap){
    	update("memberMapper.updateEmailInfo", vmap);
    }
    
    public void updateEmailInfoForFb(HashMap vmap){
    	update("memberMapper.updateEmailInfoForFb", vmap);
    }
    
    public void updateEmailInfoForKakao(HashMap vmap){
    	update("memberMapper.updateEmailInfoForKakao", vmap);
    }
    
    public String selectEmailInfo(String email) {
    	String realEmail = (String) selectOne("memberMapper.selectEmailInfo", email);
    	return realEmail;
    }
    
    public void updateRealEmail(String realEmail) {
    	update("memberMapper.updateRealEmail", realEmail);
    }
    
    public String checkUseYnForFb(String email){
    	String useYn = (String) selectOne("memberMapper.checkUseYnForFb", email);
    	return useYn;
    }
    
    //????????????
    public int cancelReservation(Map<String, Object> params) {
        int result = (int) update("memberMapper.cancelReservation",params);
        return result;
    }
    
    //????????????
    public int withdrawMember(String email) {
        int result = (int) delete("memberMapper.withdrawMember",email);
        return result;
    }
    //???????????? ??????????????? ???????????? ?????????????????? ??????
    public int checkFbLoginMember (Map<String,Object> params){
    	int result = (int) selectOne("memberMapper.checkFbLoginMember", params);
    	return result;
    }
    
    //???????????? ??????????????? ???????????? ???????????? ???????????? ??????
    public Map<String,Object> authEmailForFbLogin(Map<String, Object> params) {
    	   	
		return (Map<String, Object>) selectOne("memberMapper.authEmailForFbLogin", params);
    }
    
    //????????? ??????????????? ???????????? ?????????????????? ??????
    public int checkKakaoLoginMember (Map<String,Object> params){
    	int result = (int) selectOne("memberMapper.checkKakaoLoginMember", params);
    	return result;
    }
    
    //????????? ??????????????? ???????????? ???????????? ???????????? ??????
    public Map<String,Object> authEmailForKakaoLogin(Map<String, Object> params) {
    	
    	return (Map<String, Object>) selectOne("memberMapper.authEmailForKakaoLogin", params);
    }    
    
    // ?????? ??????(??????FMS??? ?????????)?????? ??????
    public String selectClientId(Map<String, String> param){
    	String gubun2 = param.get("estGubun").substring(2);
    	param.put("gubun2", gubun2);
    	String result = (String) selectOne("memberMapper.selectClientId", param);    	
    	return result;
    }
    
    //??????????????? ????????????????????? ????????? ???????????? ?????? 
    public int deleteMyEstimate(String est_id) {
        int result = (int) update("memberMapper.deleteMyEstimate",est_id);
        return result;
    }
}

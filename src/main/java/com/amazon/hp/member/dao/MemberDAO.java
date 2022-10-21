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
    
    //이메일인증용 토큰검증
    public String selectTokenForEmailAuth(String token) {
        return selectOne("memberMapper.selectTokenForEmailAuth", token).toString();
    }
    
    //로그인 위한 비번 체크 추가(2017.05.15)
    public int checkPassword(Map<String, Object> params){
    	return (int) selectOne("memberMapper.checkPassword", params);
    }
    
    //이메일 인증 성공시 유저의 상태값 변경
    public void updateUseYn(String email){
    	update("memberMapper.updateUseYn", email);
    }
    
    //로그인시 use_yn 상태값 체크
    public int checkUseYn(String email){
    	int checkCnt = (int) selectOne("memberMapper.selectUseYn", email);    	
    	return checkCnt;
    }
    
    //이메일인증 토큰 생성
    public int updateEmailToken(Map<String, Object> params) {
    	int checkResult = (int)update("memberMapper.updateEmailToken", params);    	
    	return checkResult;
    }
    
    //회원가입여부 체크
    public int checkRegEmail(Map<String, Object> params) {
    	int checkResult = (int)selectOne("memberMapper.checkRegEmail", params);
    	return checkResult;
    }
    
    //마이페이지 견적서보기 한건
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
    
    //예약취소
    public int cancelReservation(Map<String, Object> params) {
        int result = (int) update("memberMapper.cancelReservation",params);
        return result;
    }
    
    //회원탈퇴
    public int withdrawMember(String email) {
        int result = (int) delete("memberMapper.withdrawMember",email);
        return result;
    }
    //페이스북 이메일없이 로그인시 회원가입여부 체크
    public int checkFbLoginMember (Map<String,Object> params){
    	int result = (int) selectOne("memberMapper.checkFbLoginMember", params);
    	return result;
    }
    
    //페이스북 이메일없이 로그인시 인증절차 걸쳤는지 체크
    public Map<String,Object> authEmailForFbLogin(Map<String, Object> params) {
    	   	
		return (Map<String, Object>) selectOne("memberMapper.authEmailForFbLogin", params);
    }
    
    //카카오 이메일없이 로그인시 회원가입여부 체크
    public int checkKakaoLoginMember (Map<String,Object> params){
    	int result = (int) selectOne("memberMapper.checkKakaoLoginMember", params);
    	return result;
    }
    
    //카카오 이메일없이 로그인시 인증절차 걸쳤는지 체크
    public Map<String,Object> authEmailForKakaoLogin(Map<String, Object> params) {
    	
    	return (Map<String, Object>) selectOne("memberMapper.authEmailForKakaoLogin", params);
    }    
    
    // 기존 고객(고객FMS에 등록된)인지 체크
    public String selectClientId(Map<String, String> param){
    	String gubun2 = param.get("estGubun").substring(2);
    	param.put("gubun2", gubun2);
    	String result = (String) selectOne("memberMapper.selectClientId", param);    	
    	return result;
    }
    
    //마이페이지 견적리스트에서 견적건 사용안함 처리 
    public int deleteMyEstimate(String est_id) {
        int result = (int) update("memberMapper.deleteMyEstimate",est_id);
        return result;
    }
}

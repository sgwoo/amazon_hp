package com.amazon.hp.home.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.amazon.hp.common.AbstractDAO;


@Repository("UserDAO")
public class UserDAO extends AbstractDAO {

    public void insertAuthRequestEmail(Map<String, Object> params) {
        insert("userMapper.insertAuthRequestEmail",params);
    }
   

    public int checkEmailExists(String param){
        return (int)selectOne("userMapper.checkEmailExists",param);
    }

    public Map<String,Object> selectAuthTokenInfo(Map<String,Object> param) {
        return (Map<String,Object>)selectOne("userMapper.selectAuthTokenInfo",param);
    }
    
    public void updateAuthInfo(Map<String,Object> param){
        update("userMapper.updateAuthInfo",param);
    }
    
    public int selectEstimateCount(String email){
        return (int)selectOne("userMapper.selectEstimateCount",email);
    }
    
    public void updateEstimateCount(Map<String,String> param){
        update("userMapper.updateEstimateCount",param);
    }

    public int selectReserveCount(String email) {
        return (int)selectOne("userMapper.selectReserveCount",email);
    }
    
    public List<Map<String,Object>> selectDamdangEmpList(Map<String,Object> param){
        return (List<Map<String,Object>>)selectList("userMapper.selectDamdangEmpList",param);
    }
    
    public List<Map<String,Object>> selectDamdangEmpList2(Map<String,Object> param){
    	return (List<Map<String,Object>>)selectList("userMapper.selectDamdangEmpList2",param);
    }
    
    //월렌트 예약확인 메일 템플릿 컨텐츠를 FETCH(2017.12.26)
    public Map<String,Object> getTemplateList() {
		return (Map<String, Object>) selectOne("userMapper.getTemplateList");
    }
    
    //월렌트 예약확인메일 발송(FMS 알림톡 템플릿 사용(2017.12.26))
    public int insertConfResEmail(Map<String,Object> param){
    	return (int)insert("userMapper.insertConfResEmail",param);
    }
    
    //현재날짜 당직자 구하기
    public Map<String,Object> selectDangjikList(Map<String,Object> param){
        return (Map<String,Object>) selectOne("userMapper.selectDangjikList",param);
    }
    
    //지점 정보를 fetch 
    public Map<String,Object> selectBranch(String br_id){
        return (Map<String,Object>) selectOne("userMapper.selectBranch",br_id);
    }
}

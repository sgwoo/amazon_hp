package com.amazon.hp.home.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.amazon.hp.common.AbstractDAO;
import com.amazon.hp.util.EmailFormatter;

@Repository("HomeDAO")
public class HomeDAO extends AbstractDAO {

    public void insertComplainInfo(Map<String, Object> params) {    	
        insert("userMapper.insertComplainInfo", params);
    }
    
    public Map<String,Object> getHomepageMainInfo(){
        return (Map<String,Object>)selectOne("utilMapper.companyMainInfo");
    }
    
    public Map<String,Object> getHomepageMainInfo2(){
        return (Map<String,Object>)selectOne("utilMapper.companyMainInfo2");
    }
    
    public Map<String,Object> getHomepageMainCompInfo(){
    	return (Map<String,Object>)selectOne("utilMapper.companyMainInfo3");
    }
    
    public String getBlockIp(Map<String, String> param){
    	return (String)selectOne("utilMapper.getBlockIp", param);
    }

	public Map<String, Object> getComInfo() {
		return (Map<String,Object>)selectOne("userMapper.selectComInfo");
	}

	public List<Map<String, Object>> getRecruitmentList() {
		return selectList("userMapper.selectRecruitmentList");
	}

	public List<Map<String, Object>> getQualificationList() {
		return selectList("userMapper.selectQualificationList");
	}

	public List<Map<String, Object>> getBenefitList() {
		return selectList("userMapper.selectBenefitList");
	}

	public List<Map<String, Object>> getRecruitList() {
		return selectList("userMapper.selectRecruitList");
	}
}

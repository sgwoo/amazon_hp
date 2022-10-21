package com.amazon.hp.util.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.amazon.hp.common.AbstractDAO;
import com.amazon.hp.util.EmailFormatter;

@Repository("utilDao")
public class UtilDAO extends AbstractDAO{
    
    public Object selectMessengerIdx(){
        return selectOne("userMapper.selectIdxToMessenger");
    }
    
    public void insertMessengerData(Map<String,Object> param){
        insert("userMapper.insertMessengerData", param);
    }
    
    public void insertEmailInfo(EmailFormatter mailFormat) {
        insert("userMapper.insertEmailInfo", mailFormat);
    }
    
    public int isValidHoliday(String date){
        return (int)selectOne("userMapper.checkHoliday", date);
    }
   
}
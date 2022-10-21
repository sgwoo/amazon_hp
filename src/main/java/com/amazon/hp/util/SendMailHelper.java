package com.amazon.hp.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.amazon.hp.home.service.UserService;
import com.amazon.hp.util.dao.UtilDAO;

@Component("mailHelper")
public class SendMailHelper{
    
    @Autowired 
    UtilDAO utilDao;
    @Autowired
    UserService userservice;
    
    public void sendMail(String subject, String email, String content, String gubun){
        
        EmailFormatter mailFormat = new EmailFormatter();
        
        mailFormat.setSubject(subject);
        mailFormat.setSql("SSV:"+email);
        mailFormat.setMailTo(email);
        mailFormat.setContent(content);
        mailFormat.setGubun(gubun);
        
        utilDao.insertEmailInfo(mailFormat);
        
    }
    
    public void sendMailforAuth(String subject, String email, String content, String gubun, String gubun2){
        
        EmailFormatter mailFormat = new EmailFormatter();
        Map<String,Object> param = new HashMap<String, Object>();
        
        //현재날짜 구하기
        Date today = new Date();
    	SimpleDateFormat date = new SimpleDateFormat("yyyyMMdd");
	    String year  = String.valueOf(date.format(today)).substring(0,4);
	    String month = String.valueOf(date.format(today)).substring(4,6);
    	String day   = String.valueOf(date.format(today)).substring(6,8);
        param.put("year", year);
        param.put("month", month);
        param.put("date", day);
        param.put("watch_type", "1");	//watch_type = '1' : 본사
        
        //본사 야간당직자의 메일로 메일보내기
        Map<String,Object> dangjikMap = userservice.searchDangjikList(param);
        mailFormat.setSubject(subject);
        mailFormat.setMailFrom("\"아마존카\"<"+ dangjikMap.get("MEMBER_EMAIL1") + ">");
        mailFormat.setReplyTo("\"아마존카\"<" + dangjikMap.get("MEMBER_EMAIL1") + ">");
        mailFormat.setSql("SSV:"+email);
        mailFormat.setMailTo(email);
        mailFormat.setContent(content);
        mailFormat.setGubun(gubun);
        mailFormat.setGubun2(gubun2);
        
        utilDao.insertEmailInfo(mailFormat);
        
    }
    
}
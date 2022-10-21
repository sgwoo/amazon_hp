package com.amazon.hp.util;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.amazon.hp.util.dao.UtilDAO;

@Component("coolMsgHelper")
public class SendMessengerHelper {
    
    @Autowired
    UtilDAO utilDao;
    
    public boolean createXmlData(String subject, String content, String url, String id, String sender, String extraTargetXml){
        
        String xmlData = "";
        
        xmlData = "<COOLMSG>" +
                    "<ALERTMSG>"+
                        "<BACKIMG>4</BACKIMG>"+
                        "<MSGTYPE>104</MSGTYPE>"+
                        "<SUB>"+subject+"</SUB>"+
                        "<CONT>"+content+"</CONT>"+
                        "<URL>http://fms1.amazoncar.co.kr/fms2/coolmsg/cool_index.jsp?id=%ID&pass=%PASS&url="+url+"</URL>";
        
        if(extraTargetXml.equals("") && !id.equals("")){
            xmlData += "<TARGET>"+id+"</TARGET>";
        }else{
            xmlData += extraTargetXml;
        }
        
        xmlData +=      "<SENDER>"+sender+"</SENDER>"+
                        "<MSGICON>10</MSGICON>"+
                        "<MSGSAVE>1</MSGSAVE>"+
                        "<LEAVEDMSG>1</LEAVEDMSG>"+
                        "<FLDTYPE>1</FLDTYPE>"+
                    "</ALERTMSG>"+
                  "</COOLMSG>";
        boolean flag = sendMessage(xmlData);
        
        return flag;
        
    }
    
    public boolean sendMessage(String xmlData){
        
        boolean flag = false;
        Map<String,Object> paramMap = new HashMap<String,Object>();
        
        int idx = Integer.parseInt(utilDao.selectMessengerIdx().toString());
        
        paramMap.put("idx", idx);
        paramMap.put("xmlData", xmlData);
        paramMap.put("type", 1);
        
        try{
            utilDao.insertMessengerData(paramMap);
            flag = true;
        }catch(Exception e){
            throw e;  
        }
        return flag;
    }
    
}

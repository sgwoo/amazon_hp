package com.amazon.hp.util;

import java.io.IOException; 
import java.util.HashMap; 
import java.util.Map;

import org.apache.catalina.connector.ClientAbortException;
import org.apache.commons.codec.binary.Base64;
import org.codehaus.jackson.JsonGenerationException; 
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.JsonParser;
import org.codehaus.jackson.map.JsonMappingException; 
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody; 

public class JsonUtils {
	
	public JsonUtils(){}
	
	public static Map stringToJsonMap(String json){
		return stringToObject(json, HashMap.class); 
	} 
	
	public static Object stringToJsonClass(String json, Class clazz){
		return stringToObject(json, clazz); 
	} 
	
	public static <T> T stringToObject(String jsonString, Class<T> valueType){
		try { 
			return new ObjectMapper().readValue(jsonString, valueType); 
		} catch (ClientAbortException cae) {
			System.out.println(cae.getMessage());	
		} catch (JsonParseException e) { 
			e.printStackTrace(); 
		} catch (JsonMappingException e) { 
			e.printStackTrace(); 
		} catch (IOException e) { 
			e.printStackTrace(); 
		} 
		return null; 
	} 
	
	public static String jsonToString(Object jsonObject){ 
		return objectToString(jsonObject); 
	} 
	
	public static String gainJsonToString(Object jsonObject){ 
		return gainJsonToString(jsonObject, true); 
	} 
	
	public static String gainJsonToString(Object jsonObject, boolean resultAddFlag){ 
		if(resultAddFlag){ 
			Map m = new HashMap(); 
			m.put("result", jsonObject); 
			return objectToString(m); 
		}else{ 
			return objectToString(jsonObject); 
		} 
	} 
	
	public static String objectToString(Object json) { 
		ObjectMapper om = new ObjectMapper(); 
		try { 
			return om.writeValueAsString(json);
		} catch (ClientAbortException cae) {
			System.out.println(cae.getMessage());		
		} catch (JsonGenerationException e) { 
			e.printStackTrace(); 
		} catch (JsonMappingException e) { 
			e.printStackTrace(); 
		} catch (IOException e) { 
			e.printStackTrace(); 
		} 
		return ""; 
	} 
	
	public static String callbackObjectToString(String callback , Object json){ 
		String reval = objectToString(json); 
		if(!"".equals(callback)){ 
			reval = callback+"("+reval+")"; 
		} 
		return reval; 
	}
	
	
	
	/* XSS, SQL injection ??????????????? ????????????
	   --> Component?????? standard??? filter??? ????????? ?????? ????????? ??????????????? ????????? ??????????????? ????????? ??? ?????????(???????????????)
	              ???????????? filtering ????????? customizing ???????????? ??????. ??????????????? overloading ?????? ?????? ?????? ??????.. (20180914)							*/
	@ResponseBody
    public Map<?, ?> JsonFilter(@RequestBody Map<?, ?> jsonData){
    	
    	//Map -> json String 
    	ObjectMapper mapper1 = new ObjectMapper();
    	String json_str = "";
		try {
			json_str = mapper1.writerWithDefaultPrettyPrinter().writeValueAsString(jsonData);
		} catch (ClientAbortException cae) {
			System.out.println(cae.getMessage());		
		} catch (JsonGenerationException e1) {
			e1.printStackTrace(); 
		} catch (JsonMappingException e1) { 
			e1.printStackTrace();	
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
		//Data Filtering
    	if(jsonData.containsKey("email")){	//???????????? email??? ?????????
    		String temp_email = jsonData.get("email").toString();
    		if(!temp_email.contains("@")){
	        	byte[] byte_email = Base64.decodeBase64(temp_email); 
	        	String email = new String(byte_email);
	        	json_str = json_str.replace(temp_email, email);
    		}	
    	}
    	
    	//VV ???????????? ????????? ??????
    	json_str = json_str.replaceAll("(?i)select", "")
    					   .replaceAll("(?i)delete", "");
    	
    	
    	// json String -> Map  
    	ObjectMapper mapper2 = new ObjectMapper();
    	mapper2.configure(JsonParser.Feature.ALLOW_UNQUOTED_FIELD_NAMES, true);		//?????????????????? ??????X ??????.
    	mapper2.configure(JsonParser.Feature.ALLOW_UNQUOTED_CONTROL_CHARS, true);
    	try {
    		jsonData = mapper2.readValue(json_str, new TypeReference<Map<String, String>>(){});
    	} catch (ClientAbortException cae) {
			System.out.println(cae.getMessage());		
    	} catch (JsonParseException e2) {
    		e2.printStackTrace();
    	} catch (JsonMappingException e2) {
    		e2.printStackTrace();
		} catch (IOException e2) {
			e2.printStackTrace();
		}
    	return jsonData;
    }
}



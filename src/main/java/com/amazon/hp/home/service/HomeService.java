package com.amazon.hp.home.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.SocketTimeoutException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.UnknownHostException;
import java.security.InvalidKeyException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.apache.commons.httpclient.Header;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.methods.StringRequestEntity;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amazon.hp.home.dao.HomeDAO;
import com.amazon.hp.util.SendMessengerHelper;

import kr.co.grutech.anyauth2.client.OAuth2ClientUtil;
import kr.or.koroad.dlv.crypt.aria.cipher.ARIACipher256;
import kr.or.koroad.dlv.util.Base64;

@Service
public class HomeService {
    
    @Autowired
    HomeDAO homeDAO;
    
    @Autowired 
    SendMessengerHelper msgHelper;
    
    
    /* ========================= 마이페이지 > 불편합니다 ========================= */
    /*
     * 불편합니다 Data insert
     * */
    @Transactional
    public boolean insertComplainInfo(Map<String, Object> params){
        
        homeDAO.insertComplainInfo(params);
        
        String subject = "불편사항 등록";
        String content = "불편사항이 접수되었습니다";
        String name = params.get("name").toString();
        
        boolean flag = msgHelper.createXmlData(subject, content, "http://fms1.amazoncar.co.kr/fms2/complain/complain_frame.jsp", "2015010", name, "");
        
        return flag;
    }
        
    public Map<String,Object> getHomepageMainInfo(){
        Map<String, Object> resultMap = homeDAO.getHomepageMainInfo();
        return resultMap;
    }
    
    public Map<String,Object> getHomepageMainInfo2(){
    	Map<String, Object> resultMap = homeDAO.getHomepageMainInfo2();
        return resultMap;
    }
    
    public Map<String,Object> getHomepageMainCompInfo(){
    	Map<String, Object> resultMap = homeDAO.getHomepageMainCompInfo();
        return resultMap;
    }
    
    /*public void getBlockIp() throws Exception {
        try{
        	homeDAO.getBlockIp();  //param 데이터 est_spe insert
        }catch(Exception e) {
            throw e;
        }
    }*/
        
    public String getBlockIp(HttpServletRequest request) {
    	String ip = request.getHeader("X-Forwarded-For");
        if (ip == null) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null) {
            ip = request.getHeader("HTTP_CLIENT_IP");
        }
        if (ip == null) {
            ip = request.getHeader("HTTP_X_FORWARDED_FOR");
        }
        if (ip == null) {
            ip = request.getRemoteAddr();
        }
        return ip;
    }
    
    public String getTokenTest() throws ClientProtocolException, IOException, URISyntaxException {
		//개발
		String client_id = "171169c1-447f-4ed6-91b9-5d8f1185a7ec";
		String client_secret = "a5052015cb199f1a38fa3b37e4c65f127df45873893427db0715a51b0ec2111f";
		//운영
		//String client_id = "d7620fe9-c6ea-4967-bce7-883ac5461602";
		//String client_secret = "0b2836a9fc3d484aea8b7b0caf3c152ced1a1415c4a364f1199c2706526cdf1c";
		
		String authHeader = OAuth2ClientUtil.generateBasicAuthHeaderString(client_id, client_secret);
				
		//http client 생성
		CloseableHttpClient httpClient = HttpClients.createDefault();
		
		//http://203.243.39.19:80/oauth2/token2
		URIBuilder builder = new URIBuilder();
		builder.setScheme("http")
			.setHost("203.243.39.19")
	        .setPort(80)
	        .setPath("/oauth2/token2")
			.setParameter("grantType", "password");
		URI uri = builder.build();
		System.out.println(uri);
		
		String resString = "";
		try { 
			//get 메서드와 URL 설정
			HttpGet httpGet = new HttpGet(uri);
			httpGet.addHeader("Authorization", authHeader);
			
			//get 요청
			CloseableHttpResponse httpResponse = httpClient.execute(httpGet);
			
			System.out.println("::GET Response Status::");
			//response의 status 코드 출력
			System.out.println(httpResponse.getStatusLine().getStatusCode());
	 
			BufferedReader reader = new BufferedReader(new InputStreamReader(
					httpResponse.getEntity().getContent()
	        ));
	 
	        String inputLine;
	        StringBuffer res = new StringBuffer();
	 
	        while ((inputLine = reader.readLine()) != null) {
	        	res.append(inputLine);
	        }
	        reader.close();
	        //Print result
	        resString = res.toString();
			System.out.println("res.toString() >>> " + res.toString());
			httpClient.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return resString;
		
	}
    
    //auth header
    public String getAuthHeader() {
    	//개발
		String client_id = "171169c1-447f-4ed6-91b9-5d8f1185a7ec";
		String client_secret = "a5052015cb199f1a38fa3b37e4c65f127df45873893427db0715a51b0ec2111f";
		//운영
		//String client_id = "d7620fe9-c6ea-4967-bce7-883ac5461602";
		//String client_secret = "0b2836a9fc3d484aea8b7b0caf3c152ced1a1415c4a364f1199c2706526cdf1c";
		
		String authHeader = OAuth2ClientUtil.generateBasicAuthHeaderString(client_id, client_secret);
    	
    	return authHeader;
    }
    
    //token header
    public String getTokenHeader(String accesToken) {
    	//개발
    	String client_id = "171169c1-447f-4ed6-91b9-5d8f1185a7ec";
    	String client_secret = "a5052015cb199f1a38fa3b37e4c65f127df45873893427db0715a51b0ec2111f";
    	//운영
    	//String client_id = "d7620fe9-c6ea-4967-bce7-883ac5461602";
    	//String client_secret = "0b2836a9fc3d484aea8b7b0caf3c152ced1a1415c4a364f1199c2706526cdf1c";
    	
    	String authHeader = OAuth2ClientUtil.generateBearerTokenHeaderString(accesToken);
    	
    	return authHeader;
    }
    
	public String getToken() throws ClientProtocolException, IOException {
		//개발
		String client_id = Base64.encode("171169c1-447f-4ed6-91b9-5d8f1185a7ec".getBytes());//"171169c1-447f-4ed6-91b9-5d8f1185a7ec";
		String client_secret = "a5052015cb199f1a38fa3b37e4c65f127df45873893427db0715a51b0ec2111f";
		//운영
		//String client_id = "d7620fe9-c6ea-4967-bce7-883ac5461602";
		//String client_secret = "0b2836a9fc3d484aea8b7b0caf3c152ced1a1415c4a364f1199c2706526cdf1c";
		
		String authHeader = OAuth2ClientUtil.generateBasicAuthHeaderString(client_id, client_secret);
		//HttpClient client = new HttpClient();
		HttpClient client = new HttpClient();
		System.out.println("authHeader >>> " + authHeader);
		BufferedReader br = null;
		GetMethod method = new GetMethod("http://203.243.39.19:80/oauth2/token2");
		//GetMethod method = new GetMethod("http://203.243.39.19/oauth2/token2");
		method.setQueryString(new NameValuePair[] {
			new NameValuePair("grantType", "password")
		});
		
		Header header = new Header();
		header.setName("Authorization");
		header.setValue(authHeader);
		
		Header header2 = new Header();
		header2.setName("Access-Control-Allow-Origin");
		header2.setValue("*");
		
		Header header3 = new Header();
		header3.setName("Access-Control-Allow-Methods");
		header3.setValue("GET, POST, PUT");
		
		method.setRequestHeader(header);
		method.setRequestHeader(header2);
		method.setRequestHeader(header3);
		
		//method.addRequestHeader("Access-Control-Allow-Origin:", "*");
		//method.addRequestHeader("Access-Control-Allow-Methods", "GET, POST, PUT");
		
		String return_msg = "";
		try { 
			int returnCode = client.executeMethod(method);
			String rtnMsg = "";
			System.out.println("token returnCode >>> " + returnCode);
			if (returnCode == HttpStatus.SC_OK) {
				rtnMsg = method.getResponseBodyAsString();
				System.out.println("rtnMsg >>> " + rtnMsg);
				return_msg = rtnMsg;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			method.releaseConnection();
			if(br != null) try { br.close(); } catch (Exception fe) {}
		}
		
		return return_msg;
		
	}
    
	public String getOneValiDatorV2(String accesToken) throws UnknownHostException, SocketTimeoutException, InvalidKeyException, UnsupportedEncodingException {
		
		//String accesToken = request.getParameter("access_token");
		//String tokenType = request.getParameter("token_type");
		//String issuedAt = request.getParameter("issued_at");
		String authHeader = OAuth2ClientUtil.generateBearerTokenHeaderString(accesToken);
		String jsonBody = "{\"f_license_no\" : \"131063290260\","+
									"\"f_resident_name\" : \"금문일\","+
									"\"f_resident_date\" : \"900121\","+
									"\"f_seq_no\" : \"ND9UPI\","+
									"\"f_licn_con_code\" : \"12\","+
									"\"f_from_date\" : \"20281231\","+
									"\"f_to_date\" : \"20281231\"}";
		System.out.println(jsonBody);
		
		//String client_secret = "18fd8e9d06a82f11edd36ad3025d2390f4bf180e2f16fd4048e93661db931889";
		//String client_secret = "8117a5d75e9909eb7858b5638803d72c707fb744";
		
		//개발
		String client_id = "171169c1-447f-4ed6-91b9-5d8f1185a7ec";
		String client_secret = "a5052015cb199f1a38fa3b37e4c65f127df45873893427db0715a51b0ec2111f";		
		//운영
		//String client_id = "d7620fe9-c6ea-4967-bce7-883ac5461602";
		//String client_secret = "0b2836a9fc3d484aea8b7b0caf3c152ced1a1415c4a364f1199c2706526cdf1c";
		
		ARIACipher256 ac = new ARIACipher256(Base64.encode(client_secret.getBytes()));
		byte[] encBody = ac.encrypt(jsonBody.getBytes("UTF-8"));
		String encStr = Base64.encode(encBody);
		System.out.println(encStr);

		HttpClient client = new HttpClient();

		BufferedReader br = null;
		PostMethod post = new PostMethod("http://203.243.39.19:80/api/onevalidatorv2.do");
		post.setRequestHeader("Authorization", authHeader);
		String reqStr = "{\"header\" : {\"f_send_cnt\" : \"1\",\"f_request_date\" : \"20201119\",\"f_pin_info\" : \""+Base64.encode("1234567890:1234565".getBytes())+"\"},\"body\" : \""+encStr+"\"}";
		System.out.println("reqStr >>> " + reqStr);
		StringRequestEntity postingString = new StringRequestEntity(reqStr, "application/json", "UTF-8");
		post.setRequestEntity(postingString);
		
		String temp_string = "";
		try {

			int returnCode = client.executeMethod(post);
			System.out.println("returnCode >>> " + returnCode);
			System.out.println("HttpStatus.SC_OK >>> " + HttpStatus.SC_OK);
			if (returnCode == HttpStatus.SC_OK) {
				br = new BufferedReader(new InputStreamReader(post.getResponseBodyAsStream()));
				String readLine;
				StringBuffer st = new StringBuffer();
				while (((readLine = br.readLine()) != null)) {
					st.append(readLine);
				}
				System.out.println(st.toString());
				
				JSONParser parser = new JSONParser();
				JSONObject jsonObj = (JSONObject) parser.parse(st.toString());
				
				temp_string = jsonObj.toJSONString();
				System.out.println("jsonObj.toJSONString() >>> " + jsonObj.toJSONString());
				System.out.println("0".equals((String)((JSONObject)jsonObj.get("header")).get("f_rtn_cd")));
				System.out.println("encstr >>> " + jsonObj.get("body"));
				
				if (!"0".equals((String)((JSONObject)jsonObj.get("header")).get("f_rtn_cd"))) {
					System.out.println("####if####");
					System.out.println("header >>> " + jsonObj.toJSONString());
				} else {
					byte[] encBody1 = Base64.decode((String)jsonObj.get("body"));
					byte[] decBody = ac.decrypt(encBody1);
					JSONObject bodys = (JSONObject) parser.parse(new String(decBody, "UTF-8"));
					JSONObject headers = (JSONObject)jsonObj.get("header");
					System.out.println("####else####");
					System.out.println("header >>> " + headers.toJSONString());
					System.out.println("body >>> " + bodys.toJSONString());
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			//method.releaseConnection();
			if (br != null) try { br.close(); } catch (Exception fe) {}
		}
		
		return temp_string;
		
	}

	public Map<String, Object> getComInfo() {
		return homeDAO.getComInfo();
	}

	public List<Map<String, Object>> getRecruitmentList() {
		return homeDAO.getRecruitmentList();
	}

	public List<Map<String, Object>> getQualificationList() {
		return homeDAO.getQualificationList();
	}

	public List<Map<String, Object>> getBenefitList() {
		return homeDAO.getBenefitList();
	}

	public List<Map<String, Object>> getRecruitList() {
		return homeDAO.getRecruitList();
	}
    

}

package com.amazon.hp.member.service;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.Response;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.amazon.hp.member.dao.MemberDAO;
import com.amazon.hp.member.util.exception.CustomAuthException;
import com.amazon.hp.member.util.exception.DuplicateEmailException;
import com.amazon.hp.member.util.security.UserAuthenticationHandler;
import com.amazon.hp.member.util.security.UserCryptoUtil;
import com.amazon.hp.member.util.social.FrontUserDetail;
import com.amazon.hp.member.util.user.User;
import com.amazon.hp.member.util.user.UserCreateRequestVO;
import com.amazon.hp.member.util.user.UserEmailFormatter;
import com.amazon.hp.member.util.user.UserRepository;
import com.amazon.hp.rent.controller.EstimateController;
import com.amazon.hp.util.CryptoUtil;
import com.amazon.hp.util.SendMailHelper;


@Service
public class MemberService {

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private Environment env;

	@Autowired
    private MemberDAO memberdao;
	
	@Autowired
	private EstimateController estimateController;
	
	@Autowired
    private SendMailHelper mailHelper;
	

	private UserAuthenticationHandler authHandler;
    
	
	/* ========================= 회원 가입 ========================= */ 
	
	/*
	 * 회원가입 시 회원 데이터 생성
	 * */
	public User create(UserCreateRequestVO userCreateRequestVO) throws Exception {			
	    String email = userCreateRequestVO.getEmail();	    
		String providerId = userCreateRequestVO.getProviderId();		
		String fb_id = userCreateRequestVO.getId();
		
		if(existUser(email)){
	        throw new DuplicateEmailException("이미 가입되어 있는 이메일입니다");
	    }
		
		User user = User.fromVO(userCreateRequestVO);		
		
	    if (userCreateRequestVO.getPassword() != null) {
	    	//기존 비밀번호 암호화 방식
			//user.setPassword(passwordEncoder.encode(userCreateRequestVO.getPassword()));
	    
	    	//비밀번호 암호화방식 수정(2017.05.15)
	    	String token = null;
	    	UserCryptoUtil crypto = new UserCryptoUtil();	    	
		    String key = env.getProperty("amazoncar.user.key");
		    
		    //비밀번호 암호화 토큰 생성
		    try{		    
		        token= crypto.encrypt(key, userCreateRequestVO.getPassword());
		
		    }catch(Exception e){
		        throw e;
		    }
		    user.setPassword(token);
		}
	    
	    //페이스북 이메일이 없는 경우 아이디로 식별
	    if(user.getEmail().equals("undefined")){
	    	user.setFb_id(fb_id);
	    }
	    
		userRepository.save(user);	//정보저장(이메일없이 페북로그인시 페북아이디를 이메일컬럼에 임시저장함)	    
		return user;
	}

	/*
	 * 회원 존재 여부 확인 (flag 리턴)
	 * */
	public boolean existUser(String email) {
		User user = findByEmail(email);
		return user != null ? true : false;
	}
//	public boolean existUser(String email, String providerId) {
//		User user = findByEmailAndProviderId(email, providerId);
//		return user != null ? true : false;
//	}

	/*
	 * Email로 회원 찾기 (User 리턴)
	 * */
	public User findByEmail(String email) {
		//return userMapper.getUser(email);
	    return userRepository.findByEmail(email);
	}

	/*
 	 * Email과 ProviderId로 회원 찾기 (User 리턴)
 	 * */
	public User findByEmailAndProviderId(String email, String providerId) {
		//return userMapper.getUser(email);
		return userRepository.findByEmailAndProviderId(email, providerId);
	}

	/*
	 * 회원 견적내역 조회
	 */
	public List<Map<String, Object>> selectEstimateList(Map<String,Object> params) {
		List<Map<String, Object>> resultList = new ArrayList<>();
		resultList = memberdao.selectEstimateList(params);
		return resultList;
	}
	
	//회원 견적내역 카운트 조회
	public int selectEstimateListCnt(Map<String,Object> params) {
		return memberdao.selectEstimateListCnt(params); 
	}
	
	/*public List<Map<String, Object>> selectEstimateList(String email) {
		List<Map<String, Object>> resultList = new ArrayList<>();
		resultList = memberdao.selectEstimateList(email);
		return resultList;
	}*/

	/*
	 * 회원정보 조회
	 * */
	public Map<String, Object> selectUserInfo(String email){
	    Map<String, Object> userMap = memberdao.selectUserInfo(email);
	    return userMap;
	}
	
	/*
	 * 회원정보 수정 (회원정보 update)
	 * */
    public void updateUserInfo(Map<String, Object> params, FrontUserDetail userDetail) throws CustomAuthException{
	    
	    String verifyEmail = params.get("email").toString();
	    if(verifyEmail.equals(userDetail.getEmail())){ //인증한 사용자와 넘어온 이메일 값이 같으면

	        User user = new User();
            user.setName(params.get("name").toString());
            user.setEmail(userDetail.getEmail());

	        memberdao.updateUserInfo(params);
	        authHandler.CreateNewAuthenticationbyUser(user);
	            
	    }else{
	        throw new CustomAuthException("잘못된 접근입니다");
	    }

	}


    /*
	 * 회원가입 시 SNS Provider(facebook, google 등) 정보 update
	 */
    public int updateProviderInfo(String email, String provider) throws IOException {

        Map<String, Object> paramMap = new HashMap<String, Object>();
        
        paramMap.put("provider",provider);
        paramMap.put("email",email);
        
        //System.out.println("MemberService updateProviderInfo >>> " + paramMap);
        int resultNum = 0;
        if(!email.contains("@") || !email.contains(".")){
        	//페이스북 이메일이 없는 경우
        	if (provider.equals("facebook")) {
        		memberdao.updateProviderInfoforNoEmail(paramMap);
        		
    		//카카오 이메일이 없는 경우
        	} else if (provider.equals("kakao")) {
        		memberdao.updateProviderInfoforNoEmailKakao(paramMap);        	
        	}
        	
        	return resultNum = 1;
        }else{	
        	memberdao.updateProviderInfo(paramMap);
        	return resultNum = 2;
        }
        
        
    }
    
    /* ========================= 마이페이지 > 불편합니다 ========================= */
    
    /*
     * 불편합니다 Data insert
     * */
    public void insertComplainInfo(Map<String, Object> params){
        
        memberdao.insertComplainInfo(params);
        
    }

    /*
     * 불편합니다 접수내역 조회
     * */
    public List<Map<String, Object>> selectComplainList(String email) {
        
        List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();
        resultList = memberdao.selectComplainList(email);
        return resultList;
        
    }
    
    
    /* ========================= 비밀번호 찾기 ========================= */
    
    /*
     * 검증을 위한 토큰 생성 후 이메일 발송
     * */
    public Map<String,Object> generateTokenToEmail(String email) throws Exception {
    	
    	boolean result = false;
    	String regex = "^[_a-z0-9-]+(.[_a-z0-9-]+)*@(?:\\w+\\.)+\\w+$";
    	Pattern p = Pattern.compile(regex); 
    	Matcher m = p.matcher(email); 
    	if (m.matches()) {
    		result = true;
    	}
    	
        String token = null;
        UserCryptoUtil crypto = new UserCryptoUtil();
        String key = env.getProperty("amazoncar.user.key");
        String message = "";
        Map<String,Object> resultMap = new HashMap<String,Object>();
        //토큰 생성
        try{
            token= crypto.encrypt(key, email);
        }catch(Exception e){
            throw e;
        }
       
        //파라미터 생성
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("email", email);
        params.put("token", token);
       
        //비밀번호 재설정 Url 생성
        String domain = env.getProperty("amazoncar.current.domain");
        String url = "http://fms1.amazoncar.co.kr/mailing/homepage/pass_format.jsp?token=" + token;
      
        //먼저, 회원가입 된 이메일인지 조회후 가입된 이메일이면 메일발송
        Map<String, Object> infoMap = selectUserInfo(email);
        if (infoMap != null ) {
        	memberdao.updateTokenInfo(params); //토큰을 업데이트
        	if (result == true) {        		
        		mailHelper.sendMail("[아마존카]비밀번호 재설정 메일입니다", email, url, "resetPass"); //메일발송
        	}
        	message = "1";
        } else {
        	message = "2";
        }
  
        resultMap.put("token", token);
        resultMap.put("message", message);
        
        return resultMap;
     
    }
	
	/*
	 * 토큰 검증
	 * */
	public String verifyToken(String token) throws Exception{
	    
	    UserCryptoUtil crypto = new UserCryptoUtil();
	    String key = env.getProperty("amazoncar.user.key");
	    String verifyToken = crypto.decrypt(key, token);
	    
	    try{
	    	//토큰 검증
	    	String email = memberdao.selectTokenForEmailAuth(token);
	    	if(email.equals(verifyToken)){
	    		//토큰 검증 후 mobile_member의 use_yn을 H >> Y
	    		updateUseYn(email);
	    		
	    		return verifyToken;
	    	}else{
	    		return "redirect:/error_auth";
	    		//throw new Exception("잘못된 접근입니다");
	    	}
	    }catch(Exception e){
	    	return "redirect:/error_auth";
	    }
    
	    
	}
	
	/*
	 * 비밀번호변경 토큰인증
	 * */
	public String verifyTokenForPassword(String token) throws Exception{
	    
	    UserCryptoUtil crypto = new UserCryptoUtil();
	    String key = env.getProperty("amazoncar.user.key");
	    String verifyToken = crypto.decrypt(key, token);
	    
	    try{
		    //토큰검증
		    String email = memberdao.selectTokenForEmailAuth(token);
		    if(email.equals(verifyToken)){
		        return verifyToken;
		    }else{
		    	return "redirect:/error_auth";
		        //throw new Exception("비밀번호변경 토큰인증중 오류발생");
		    }
	    }catch(Exception e){
	    	return "redirect:/error_auth";
	    }
	}	

	/*
	 * 비밀번호 변경
	 * */
    public void resetPassword(Map<String, Object> params) throws Exception {
    	
        //String password = passwordEncoder.encode(params.get("password").toString());
        
    	String password = null;
    	UserCryptoUtil crypto = new UserCryptoUtil();	    	
	    String key = env.getProperty("amazoncar.user.key");
	    
	    try{
	    	password= crypto.encrypt(key, params.get("password").toString());
	
	    }catch(Exception e){
	        throw e;
	    }
        params.put("password", password);
        
        memberdao.updatePassword(params);
    }
    
    //로그인 위한 비번 체크 추가(2017.05.15)
    public int checkPassword(Map<String, Object> params){
    	int checkNum = memberdao.checkPassword(params);
    	return checkNum;
    }
    
    //이메일 인증 성공시 유저의 상태값 변경
    public void updateUseYn(String email){
    	memberdao.updateUseYn(email);
    }
    
    //로그인시 use_yn 상태값 체크
    public int checkUseYn(String email){
    	int checkCnt = memberdao.checkUseYn(email);    	
    	return checkCnt;
    }
    
    //email토큰생성
    public Map<String,Object> makeTokenToEmail(String email) throws Exception {
        
        String token = null;
        CryptoUtil crypto = new CryptoUtil();
        String key = env.getProperty("amazoncar.user.key");
        String message = "";
        Map<String,Object> resultMap = new HashMap<String,Object>();
        
        try{
            token= crypto.encrypt(key, email);
        }catch(Exception e){
            throw e;
        }
        
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("email",email);
        params.put("token",token);        
        
        int chkResult = memberdao.updateEmailToken(params);        
        
        resultMap.put("chkResult",chkResult);
        resultMap.put("token",token);
        return resultMap;
    }
    
    //회원가입여부 체크
    public int checkRegEmail( Map<String, Object> params) {
    	int checkResult = memberdao.checkRegEmail(params);
    	return checkResult;
    }
    
    //회원견적내역 조회 한건
    public Map<String, Object> selectEstimateOne(String estimateId) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = memberdao.selectEstimateOne(estimateId);
		return resultMap;
	}
    
    public String checkFacebookId(String facebookId) {
    	String checkId = memberdao.checkFacebookId(facebookId);
    	return checkId;
    }
    
    public void updateFacebookId(String facebookId) {
    	memberdao.updateFacebookId(facebookId);
    }
    
    public void updateEmailInfo(HashMap vmap) {
    	memberdao.updateEmailInfo(vmap);
    }
    
    public void updateEmailInfoForFb(HashMap vmap) {
    	memberdao.updateEmailInfoForFb(vmap);
    }
    
    public void updateEmailInfoForKakao(HashMap vmap) {
    	memberdao.updateEmailInfoForKakao(vmap);
    }
    
    public String selectEmailInfo(String email) {
    	String realEmail = memberdao.selectEmailInfo(email);
    	return realEmail;
    }
    
    public void updateRealEmail(String realEmail) {
    	memberdao.updateRealEmail(realEmail);
    }
    
    public String checkUseYnForFb(String email) {
    	String useYn = memberdao.checkUseYnForFb(email);
    	return useYn;
    }
    
    //예약취소
    public int cancelReservation(Map<String, Object> params) {
        int result = memberdao.cancelReservation(params);
		return result;
    } 
    
    //회원탈퇴
    public int withdrawMember(String email) {
        int result = memberdao.withdrawMember(email);
		return result;
    }
    
    //페이스북 이메일없이 로그인시 회원가입여부 체크
    public int checkFbLoginMember (Map<String,Object> params){
    	int result = (int) memberdao.checkFbLoginMember(params);
    	return result;
    }
    
    //페이스북 이메일없이 로그인시 인증절차 걸쳤는지 체크
    public Map<String, Object> authEmailForFbLogin(Map<String, Object> params) {
    	Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = memberdao.authEmailForFbLogin(params);
		return resultMap;
    }
    
    //카카오 이메일없이 로그인시 회원가입여부 체크
    public int checkKakaoLoginMember (Map<String,Object> params){
    	int result = (int) memberdao.checkKakaoLoginMember(params);
    	return result;
    }
    
    //카카오 이메일없이 로그인시 인증절차 걸쳤는지 체크
    public Map<String, Object> authEmailForKakaoLogin(Map<String, Object> params) {
    	Map<String, Object> resultMap = new HashMap<String, Object>();
    	resultMap = memberdao.authEmailForKakaoLogin(params);
    	return resultMap;
    }
    
    //마이페이지 견적리스트에서 견적건 사용안함 처리 
    public int deleteMyEstimate(String est_id) {
        int result = memberdao.deleteMyEstimate(est_id);
		return result;
    }
    
}

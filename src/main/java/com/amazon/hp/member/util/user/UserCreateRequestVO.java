package com.amazon.hp.member.util.user;


import java.io.IOException;

import org.springframework.social.connect.UserProfile;


public class UserCreateRequestVO {
    
    private String id;

	private String email;

	private String password;

	private String name;

	private String providerId;

	public String getId(){
	    return id;
	}
	
	public void setId(String fb_id){
	    this.id = fb_id;
	}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getProviderId() {
		return providerId;
	}

	public void setProviderId(String providerId) {
		this.providerId = providerId;
	}

	public static UserCreateRequestVO fromSocialUserProfile(UserProfile userProfile) throws IOException {		
		UserCreateRequestVO userCreateRequestVO = new UserCreateRequestVO();
		
		if(userProfile != null && (userProfile.getEmail()==null || userProfile.getEmail().equals(""))){	//페이스북 폰번호 로그인의 경우 id를 email에 넣어준다
			userCreateRequestVO.setEmail(userProfile.getId());			
		}else{	//userProfile에 email이 있는경우 email로 세팅 
			if(userProfile == null && userProfile.getEmail() == null){
				
			}else{
				userCreateRequestVO.setEmail(userProfile.getEmail());				
			}
		}
		// jjlim ID 필요없음
//		// jjlim 구글의 경우 id를 안주고 username에 id값을 주는듯 하다
//		if (userProfile.getId() != null) {
//			userCreateRequestVO.setId(userProfile.getId() == null ? 0 : Math.abs((int) Long.parseLong(userProfile.getId())));
//		}
//		else {
//			userCreateRequestVO.setId(userProfile.getId() == null ? 0 : Math.abs((int) Long.parseLong(userProfile.getUsername())));
//		}
		
		return userCreateRequestVO;
	}

}
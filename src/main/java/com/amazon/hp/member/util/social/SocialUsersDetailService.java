package com.amazon.hp.member.util.social;

import com.amazon.hp.member.service.MemberService;
import org.apache.catalina.connector.ClientAbortException;
import org.springframework.dao.DataAccessException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.social.security.SocialUserDetails;
import org.springframework.social.security.SocialUserDetailsService;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

public class SocialUsersDetailService implements SocialUserDetailsService {

	private UserDetailsService userDetailsService;
	private MemberService memberService;

	public SocialUsersDetailService(UserDetailsService userDetailsService) {
		this.userDetailsService = userDetailsService;		
	}

	//VV에러발생시 수정필요
	@SuppressWarnings("null")
	@Override
	public SocialUserDetails loadUserByUserId(String userId) throws UsernameNotFoundException, DataAccessException {
		UserDetails userDetails = userDetailsService.loadUserByUsername(userId);
		//소셜로그인이 use_yn 이 H이면 이메일인증절차로
		String email = userId;
		String useYn = "";
		
		HttpServletResponse response = null;
		if(email == null || email.equals("")){
			try {
				response.sendRedirect("/regEmailForm");
			} catch (ClientAbortException cae) {
 				System.out.println(cae.getMessage());	
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else{
			try {
				Map<String, Object> infoMap = memberService.selectUserInfo(email);
				useYn = (String) infoMap.get("use_yn");
			} catch (Exception e) {
				try {
					response.sendRedirect("/regEmailForm");
				} catch (ClientAbortException cae) {
    				System.out.println(cae.getMessage());	
				} catch (IOException e1) {
					e1.printStackTrace();
				}
			}
		}		
		if(useYn == "H"){
			return null ; //(SocialUserDetails) redirectedUrl("/");
		}else{
			return (FrontUserDetail) userDetails;			
		}
		
		
	}
}
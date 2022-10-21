package com.amazon.hp.member.util.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by jjlim on 2017. 4. 19..
 */

// 로그인 성공시 이전 페이지로 이동
public class LoginSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {

	 @Autowired(required = true)
	    private HttpServletRequest request;
	
    public LoginSuccessHandler(String defaultTargetUrl) {
    	
        setDefaultTargetUrl(defaultTargetUrl);
    }

    /*@Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session != null) {
        	//String redirectUrl = (String)session.getAttribute("prevPage");
        	String redirectUrl = (String)session.getAttribute("presentPage");	//로그인시 현재의 페이지로 세팅
            if (redirectUrl != null) {
            	
            	String loginYn = "Y";
            	session.setAttribute("loginYn", loginYn);
            	
                getRedirectStrategy().sendRedirect(request, response, redirectUrl);
            }else {
                super.onAuthenticationSuccess(request, response, authentication);
            }
        }        else {
            super.onAuthenticationSuccess(request, response, authentication);
        }
    }*/
    
    @SuppressWarnings("unused")
	@Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session != null) {
        	//String redirectUrl = (String)session.getAttribute("prevPage");
        	String redirectUrl = (String)session.getAttribute("presentPage");	//로그인시 현재의 페이지로 세팅
            if (redirectUrl != null) {
            	
            	String loginYn = "Y";
            	session.setAttribute("loginYn", loginYn);
            	
                getRedirectStrategy().sendRedirect(request, response, redirectUrl);
            }else if(redirectUrl == null){
            	redirectUrl = "/";
            	getRedirectStrategy().sendRedirect(request, response, redirectUrl);
            }else {
                super.onAuthenticationSuccess(request, response, authentication);
            }
        }        else {
            super.onAuthenticationSuccess(request, response, authentication);
        }
    }
}

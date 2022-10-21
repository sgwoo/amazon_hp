package com.amazon.hp.member.util.security;

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import com.amazon.hp.member.util.social.FrontUserDetail;
import com.amazon.hp.member.util.user.User;

public class UserAuthenticationHandler {

    public static void CreateNewAuthenticationbyUser(User user){

        FrontUserDetail frontUserDetail = new FrontUserDetail(user);

        Authentication authentication = new UsernamePasswordAuthenticationToken(frontUserDetail, null, frontUserDetail.getAuthorities());
        SecurityContextHolder.getContext().setAuthentication(authentication);
        
    }
    
//    public void CreateNewAuthenticationbyUserDetail(FrontUserDetail frontUserDetail){
//
//        Authentication authentication = new UsernamePasswordAuthenticationToken(frontUserDetail, null, frontUserDetail.getAuthorities());
//        SecurityContextHolder.getContext().setAuthentication(authentication);
//        
//    }
}

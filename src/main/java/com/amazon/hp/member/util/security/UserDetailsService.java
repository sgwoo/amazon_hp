package com.amazon.hp.member.util.security;

import com.amazon.hp.member.util.social.FrontUserDetail;
import com.amazon.hp.member.util.user.User;
import com.amazon.hp.member.service.MemberService;

import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class UserDetailsService implements org.springframework.security.core.userdetails.UserDetailsService {

	@Autowired
	private MemberService userService;

	@Override
	public final FrontUserDetail loadUserByUsername(String username) throws UsernameNotFoundException {
		
		//email decoding(20180823)
		username = new String(Base64.decodeBase64(username));
		User user = userService.findByEmail(username);
		
		if(user == null) {
			throw new UsernameNotFoundException("Not Exist User");
		}

		FrontUserDetail frontUserDetail = new FrontUserDetail(user);
		return frontUserDetail;
	}
}

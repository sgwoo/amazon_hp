package com.amazon.hp.member.util.social;

import com.amazon.hp.member.util.user.User;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.social.security.SocialUserDetails;

import java.util.Collection;
import java.util.HashSet;

public class FrontUserDetail implements SocialUserDetails {

	private static final long serialVersionUID = 5197941260523577515L;

	private User user;

	public FrontUserDetail(User user) {
		this.user = user;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		Collection<GrantedAuthority> authorities = new HashSet<>(1);
		authorities.add(new SimpleGrantedAuthority("ROLE_USER"));
		return authorities;
	}

	@Override
	public String getPassword() {
		return user.getPassword();
	}

	@Override
	public String getUsername() {
		return user.getName();
	}
	
	public String getName(){
		if (user.getName() == null) {
			return "";
		}
	    return user.getName();
	}
	
	public String getEmail(){
	    return user.getEmail();
	}

	public String getBirth() {
		if (user.getBirth() == null) {
			return "";
		}
		else if (user.getBirth().length() >= 6) {
			return user.getBirth().substring(2);
		}
		return user.getBirth();
	}

	public String getTel() {
		if (user.getTel() == null) {
			return "";
		}
		return user.getTel();
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}

	@Override
	public String getUserId() {
		return user.getEmail();
	}
}

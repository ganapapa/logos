package com.logos.coffee.service;

import java.util.ArrayList;
import java.util.Collection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.logos.coffee.dao.CFDao;
import com.logos.coffee.vo.UserDto;

public class MemberService implements UserDetailsService{

	@Autowired CFDao dao;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
	    UserDto userD = null;
		try {
			userD = dao.getUsersByID(username);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if (null == userD) {
			throw new UsernameNotFoundException("No user found with username: " + username);
		}
	    Collection<SimpleGrantedAuthority> roles = new ArrayList<SimpleGrantedAuthority>();
	    roles.add(new SimpleGrantedAuthority("ROLE_USER"));
	    UserDetails user = new User(username, userD.getPassword(), roles);
	    return user;
	}
}
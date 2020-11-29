package com.logos.coffee.vo;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
 
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
 
@SuppressWarnings("serial")
public class UserDto implements UserDetails {
    private String id;       //key 자동생성
    private String username; //등록 시 입력할 ID
    private String password;
    private String emailaddress;
    private String enabled;
    private String phonenumber;
    private String sex;
    private List<String> roles;
    
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        ArrayList<SimpleGrantedAuthority> grants = new ArrayList<SimpleGrantedAuthority>();
        
        for(String role : roles) {
            grants.add(new SimpleGrantedAuthority(role));
        }    
        
        return grants;
    }
    
    @Override
    public String getUsername() {
        return id;
    }
    
    public String getUserId() {
        return username;
    }
    
    public void setUserId(String username) {
        this.username = username;
    }
 
    @Override
    public String getPassword() {
        return password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    
    public String getEmailaddress() {
		return emailaddress;
	}

	public void setEmailaddress(String emailaddress) {
		this.emailaddress = emailaddress;
	}

	public String getEnabled() {
		return enabled;
	}

	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}

	public String getPhonenumber() {
		return phonenumber;
	}

	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
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
 
}
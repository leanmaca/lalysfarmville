package com.ics.bean;

import java.io.Serializable;

public class LoginBean implements Serializable {
	
	public String username;
    public String password;
    public String userType;
    public int userNumber;
    public String userId;
    
    public LoginBean(String username, String password, String userType, int userNumber, String userId) {
		super();
		this.username = username;
		this.password = password;
		this.userType = userType;
		this.userNumber = userNumber;
		this.userId = userId;
	}
    
    public LoginBean(String username, String userType, int userNumber, String userId) {
		super();
		this.username = username;
		this.userType = userType;
		this.userNumber = userNumber;
		this.userId = userId;
	}
    
    public LoginBean() {
    	
    }



	




	public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    public int getUserNumber() {
        return userNumber;
    }

    public void setUserNumber(int userNumber) {
        this.userNumber = userNumber;
    }
    
    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }
    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }
}

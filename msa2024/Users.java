package com.msa2024;

public class Users {
	private String userid;
	private String userpassword;
	private String username;
	private int userage;
	private String useremail;

	
	
	public Users() {
		super();
	}
	public Users(String userid, String userpassword, String username, int userage, String useremail) {
		super();
		this.userid = userid;
		this.userpassword = userpassword;
		this.username = username;
		this.userage = userage;
		this.useremail = useremail;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpassword() {
		return userpassword;
	}
	public void setUserpassword(String userpassword) {
		this.userpassword = userpassword;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getUserage() {
		return userage;
	}
	public void setUserage(int i) {
		this.userage = i;
	}
	public String getUseremail() {
		return useremail;
	}
	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}



	
}

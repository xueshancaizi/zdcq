package com.zdcq.s2sh.domain;

import java.io.Serializable;
import java.util.Date;

import org.springframework.stereotype.Repository;
/**
 * 注册用户管理核心类
 * @author panww
 *
 */
@SuppressWarnings("serial")
@Repository("user")
public class User implements Serializable {
	/*
	  `userID` int(11) NOT NULL auto_increment,
	   loginname varchar(50) collate utf8_bin default NULL,
	  `username` varchar(50) collate utf8_bin default NULL,
	  `password` varchar(50) collate utf8_bin default NULL,
	  `sex` varchar(10) collate utf8_bin default NULL,
	  `birthday` varchar(50) collate utf8_bin default NULL,
	  `education` varchar(20) collate utf8_bin default NULL,
	  `telephone` varchar(50) collate utf8_bin default NULL,
	  `interest` varchar(20) collate utf8_bin default NULL,
	  `path` varchar(500) collate utf8_bin default NULL,
	  `filename` varchar(100) collate utf8_bin default NULL,
	  `remark` varchar(500) collate utf8_bin default NULL,
	*/
	private Long userID;
	private String loginname;
	private String username;
	private String password;
	private String sex;
	private Date birthday;
	private String education;
	private String telephone;
	private String interest;
	private String path;
	private String filename;
	private String remark;
	
	public Long getUserID() {
		return userID;
	}
	public void setUserID(Long userID) {
		this.userID = userID;
	}
	
	public String getLoginname() {
		return loginname;
	}
	public void setLoginname(String loginname) {
		this.loginname = loginname;
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
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getInterest() {
		return interest;
	}
	public void setInterest(String interest) {
		this.interest = interest;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}

}

package com.zdcq.s2sh.domain;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;


/**
 * 日志表
 * @author panw
 *
 */
public class Log {
	private Integer id;
	private String userName;
	private java.sql.Date loginTime;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public java.sql.Date getLoginTime() {
		return loginTime;
	}
	public void setLoginTime(String time) {
		Date date;
		try {
			date = new SimpleDateFormat("yyyy-MM-dd ").parse(time);
			this.loginTime = new java.sql.Date(date.getTime());
		} catch (ParseException e) {
			e.printStackTrace();
		}		
	}
}

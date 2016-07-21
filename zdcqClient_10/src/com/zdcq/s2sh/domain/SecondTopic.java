package com.zdcq.s2sh.domain;

import java.io.Serializable;

import org.springframework.stereotype.Repository;

/**
 * JavaBean 二级菜单栏
 * @author panww
 *
 */
@SuppressWarnings("serial")
@Repository("secondTopic")
public class SecondTopic implements Serializable{
	private String sid;
	private String name;
	private FirstTopic firstTopic;  
	
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public FirstTopic getFirstTopic() {
		return firstTopic;
	}
	public void setFirstTopic(FirstTopic firstTopic) {
		this.firstTopic = firstTopic;
	}

}

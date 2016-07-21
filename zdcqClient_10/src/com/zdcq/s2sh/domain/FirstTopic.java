package com.zdcq.s2sh.domain;

import java.io.Serializable;
import java.util.List;

import org.springframework.stereotype.Repository;

/**
 * JavaBean 一级菜单栏
 * @author panww
 *
 */
@SuppressWarnings("serial")
@Repository("firstTopic")
public class FirstTopic implements Serializable {
	private String fid;
	private String name;
	private List<SecondTopic> secondTopic;
	
	public List<SecondTopic> getSecondTopic() {
		return secondTopic;
	}
	public void setSecondTopic(List<SecondTopic> secondTopic) {
		this.secondTopic = secondTopic;
	}
	
	public String getFid() {
		return fid;
	}
	public void setFid(String fid) {
		this.fid = fid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

}

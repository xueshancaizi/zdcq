package com.zdcq.s2sh.domain;

import java.io.Serializable;

import org.springframework.stereotype.Repository;

@SuppressWarnings("serial")

@Repository("fenJuInfo")
public class FenJuInfo implements Serializable{
	private int fjId;
	private String fjName;
	private String fjLocation;
	private String ipAddress;
	private int view;   //导航栏是否可见
    
	public int getFjId() {
		return fjId;
	}
	public void setFjId(int fjId) {
		this.fjId = fjId;
	}
	
	public String getFjName() {
		return fjName;
	}
	public void setFjName(String fjName) {
		this.fjName = fjName;
	}
	public String getFjLocation() {
		return fjLocation;
	}
	public void setFjLocation(String fjLocation) {
		this.fjLocation = fjLocation;
	}

	public String getIpAddress() {
		return ipAddress;
	}
	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}
	
	public int getView() {
		return view;
	}
	public void setView(int view) {
		this.view = view;
	}
	
	
	
}

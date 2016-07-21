package com.zdcq.s2sh.test;

import java.util.List;

import org.junit.Test;

import com.zdcq.s2sh.domain.FenJuInfo;
import com.zdcq.s2sh.service.FenJuInfoService;

public class FenJuInfoTest extends SpringUtils{
	@Test
	public void testFindFenJuInfoById(){
		FenJuInfoService service = (FenJuInfoService) context.getBean("fenJuInfoService");
	    FenJuInfo info = service.findFenJuInfoById(15);
	    System.out.println(info.getFjName());
	}
	
	@Test
	public void testFindAllFenJuInfo(){
		FenJuInfoService service = (FenJuInfoService) context.getBean("fenJuInfoService");
	    List<FenJuInfo> list = service.findAllFenJuInfo();
	    for(FenJuInfo info : list){
	    	System.out.println(info.getFjName());
	    }
	    
	}
	
	@Test
	public void testFindAllFenJuInfoByView(){
		FenJuInfoService service = (FenJuInfoService) context.getBean("fenJuInfoService");
	    List<FenJuInfo> list = service.findAllFenJuInfoByView();
	    for(FenJuInfo info : list){
	    	System.out.println(info.getFjName());
	    }
	    
	}
	
	@Test
	public void testAddFenJuInfo(){
		FenJuInfoService service = (FenJuInfoService) context.getBean("fenJuInfoService");
	    FenJuInfo info = new FenJuInfo();
	    info.setFjName("宁波大学");
	    info.setIpAddress("http://127.0.0.1:8080");
	    info.setFjLocation("江北区风华路818号");
	    info.setView(1);
		service.saveFenJuInfo(info);
	}
	
	@Test
	public void testUpdateFenJuInfo(){
		FenJuInfoService service = (FenJuInfoService) context.getBean("fenJuInfoService");
	    FenJuInfo info = new FenJuInfo();
	    info.setFjId(18);
	    info.setFjName("宁大");
	    info.setIpAddress("http://127.0.0.1:8080");
	    info.setFjLocation("江北区风华路818号");
	    info.setView(1);
		service.updateFenJuInfo(info);
	}
	
	@Test
	public void testDeleteFenJuInfoById(){
		FenJuInfoService service = (FenJuInfoService) context.getBean("fenJuInfoService");
		service.deleteFenJuInfoById(19);
	}
}

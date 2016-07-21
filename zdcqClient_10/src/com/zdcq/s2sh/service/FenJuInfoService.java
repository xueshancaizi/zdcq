package com.zdcq.s2sh.service;

import java.util.List;

import com.zdcq.s2sh.domain.FenJuInfo;

public interface FenJuInfoService {
	public FenJuInfo findFenJuInfoById(int FenJuId);
    
	public FenJuInfo findByfjLocation(String fjLocation);

	public List<FenJuInfo> findAllFenJuInfo();
	
	public List<FenJuInfo> findAllFenJuInfoByView();
    
	public void saveFenJuInfo(FenJuInfo info);
	
	public void updateFenJuInfo(FenJuInfo info);
	
	public void deleteFenJuInfoById(int id);
}

package com.zdcq.s2sh.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zdcq.s2sh.dao.FenJuInfoDao;
import com.zdcq.s2sh.domain.FenJuInfo;
import com.zdcq.s2sh.service.FenJuInfoService;

@Service("fenJuInfoService")
public class FenJuInfoServiceImpl implements FenJuInfoService{
	@Resource(name="fenJuInfoDao")
	private FenJuInfoDao fenJuInfoDao;
	
	@Override
	public FenJuInfo findFenJuInfoById(int FenJuId) {
		if(FenJuId < 0){
			throw new IllegalArgumentException("分局参数信息不合法");
		}
		FenJuInfo fjInfo = fenJuInfoDao.findById(FenJuId);
		
		return fjInfo;
	}

	@Override
	public List<FenJuInfo> findAllFenJuInfo() {
		List<FenJuInfo> listFenJuInfo = fenJuInfoDao.findAllInfo();
		return listFenJuInfo;
	}

	@Override
	public List<FenJuInfo> findAllFenJuInfoByView() {
		List<FenJuInfo> listFenJuInfo = fenJuInfoDao.findAllInfoByView();
		return listFenJuInfo;
	}

	@Override
	public void saveFenJuInfo(FenJuInfo info) {
		if(info == null){
			throw new IllegalArgumentException("分局没有实例化");
		}
		fenJuInfoDao.save(info);
		
	}

	@Override
	public void updateFenJuInfo(FenJuInfo info) {
		if(info == null){
			throw new IllegalArgumentException("分局没有实例化");
		}
		fenJuInfoDao.update(info);
	}

	@Override
	public void deleteFenJuInfoById(int id) {
		fenJuInfoDao.deleteByID(id);
	}

	@Override
	public FenJuInfo findByfjLocation(String fjLocation) {		
		return fenJuInfoDao.findByfjLocation(fjLocation);
	}

}

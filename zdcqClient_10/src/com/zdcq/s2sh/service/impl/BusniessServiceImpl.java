package com.zdcq.s2sh.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zdcq.s2sh.dao.FenJuInfoDao;
import com.zdcq.s2sh.dao.FirstTopicDao;
import com.zdcq.s2sh.dao.SecondTopicDao;
import com.zdcq.s2sh.domain.FenJuInfo;
import com.zdcq.s2sh.domain.FirstTopic;
import com.zdcq.s2sh.domain.SecondTopic;
import com.zdcq.s2sh.service.BusniessService;



@Service("busniessService")
public class BusniessServiceImpl implements BusniessService {
	@Resource(name="fenJuInfoDao")
    private FenJuInfoDao dao;
	@Resource(name="firstTopicDao")
    private FirstTopicDao fdao;   //一级栏目的操作DAO层
	@Resource(name="secondTopicDao")
    private SecondTopicDao sdao; //二级栏目的操作DAO层
    
	@Override
	public FenJuInfo findFenJuInfoById(int FenJuId) {
		if(FenJuId < 0){
			throw new IllegalArgumentException("分局参数信息不合法");
		}
		FenJuInfo fjInfo = dao.findById(FenJuId);
		
		return fjInfo;
	}
	@Override
	public List<FenJuInfo> findAllFenJuInfo() {
		List<FenJuInfo> listFenJuInfo = dao.findAllInfo();
		return listFenJuInfo;
	}
	
	@Override
	public List<FenJuInfo> findAllFenJuInfoByView() {
		List<FenJuInfo> listFenJuInfo = dao.findAllInfoByView();
		return listFenJuInfo;
	}
	
	@Override
	public void addFenJuInfo(FenJuInfo info) {
		if(info == null){
			throw new IllegalArgumentException("分局没有实例化");
		}
		dao.save(info);
	}
	@Override
	public void updateFenJuInfo(FenJuInfo info) {
		if(info == null){
			throw new IllegalArgumentException("分局没有实例化");
		}
		dao.update(info);
	}
	@Override
	public void deleteFenJuInfoById(int id) {
		dao.deleteByID(id);
	}
	//--------------------------分局信息的操作end-------------------------
	//--------------------------栏目的操作begin-------------------------
	@Override
	public List<FirstTopic> findAllFirstTopic() {
		List<FirstTopic> list = fdao.findAllRecords();
		return list;
	}
	@Override
	public List<SecondTopic> FindAllSecondTopic() {
		List<SecondTopic> list = sdao.findAllRecords();
		return list;
	}

	@Override
	public List<SecondTopic> FindAllSecondTopicByfId(String fid) {
		if(fid == null || fid == ""){
			throw new IllegalArgumentException("一级菜单参数信息不合法");
		}
		List<SecondTopic> list = sdao.findRecordsByFid(fid);
		return list;
	}

	@Override
	public SecondTopic findSecondTopicByID(String sid) {
		if(sid == null || sid == ""){
			throw new IllegalArgumentException("二级菜单参数信息不合法");
		}
		return sdao.findById(sid);
	}
	@Override
	public FirstTopic findFirstTopicById(String fid) {
		
		return fdao.findById(fid);
	}
	@Override
	public void updateFirstTopic(FirstTopic ft) {
		fdao.update(ft);
		
	}
	@Override
	public void deleteFirstTopicById(String fid) {
		fdao.deleteById(fid);
		
	}
	@Override
	public void addFirstTopic(FirstTopic model) {
		fdao.save(model);
	}
	@Override
	public void updateSecondTopic(SecondTopic model) {
		sdao.update(model);
		
	}
	@Override
	public void deleteSecondTopicById(String sid) {
		sdao.deleteById(sid);
		
	}
	@Override
	public void addSecondTopic(SecondTopic st) {
		sdao.add(st);
		
	}




}

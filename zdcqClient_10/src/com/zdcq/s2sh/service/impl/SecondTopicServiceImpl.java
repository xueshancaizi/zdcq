package com.zdcq.s2sh.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zdcq.s2sh.dao.SecondTopicDao;
import com.zdcq.s2sh.domain.SecondTopic;
import com.zdcq.s2sh.service.SecondTopicService;
@Service("secondTopicService")
public class SecondTopicServiceImpl implements SecondTopicService {
	@Resource(name="secondTopicDao")
	private SecondTopicDao secondTopicDao;

	@Override
	public List<SecondTopic> findAllSecondTopic() {
		List<SecondTopic> list = secondTopicDao.findAllRecords();
		return list;
	}

	@Override
	public List<SecondTopic> findAllSecondTopicByfId(String fid) {
		if(fid == null || fid == ""){
			throw new IllegalArgumentException("一级菜单参数信息不合法");
		}
		List<SecondTopic> list = secondTopicDao.findRecordsByFid(fid);
		return list;
	}

	@Override
	public SecondTopic findSecondTopicByID(String sid) {
		if(sid == null || sid == ""){
			throw new IllegalArgumentException("二级菜单参数信息不合法");
		}
		return secondTopicDao.findById(sid);
	}

	@Override
	public void updateSecondTopic(SecondTopic model) {
		secondTopicDao.update(model);

	}

	@Override
	public void deleteSecondTopicById(String sid) {
		secondTopicDao.deleteById(sid);
	}

	@Override
	public void saveSecondTopic(SecondTopic st) {
		secondTopicDao.add(st);
	}

}

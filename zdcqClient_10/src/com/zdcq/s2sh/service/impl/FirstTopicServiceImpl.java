package com.zdcq.s2sh.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zdcq.s2sh.dao.FirstTopicDao;
import com.zdcq.s2sh.domain.FirstTopic;
import com.zdcq.s2sh.service.FirstTopicService;

@Service("firstTopicService")
public class FirstTopicServiceImpl implements FirstTopicService {
	@Resource(name="firstTopicDao")
	private FirstTopicDao firstTopicDao;

	@Override
	public List<FirstTopic> findAllFirstTopic() {
		List<FirstTopic> list = firstTopicDao.findAllRecords();
		return list;
	}

	@Override
	public FirstTopic findFirstTopicById(String fid) {
		return firstTopicDao.findById(fid);
	}

	@Override
	public void updateFirstTopic(FirstTopic ft) {
		firstTopicDao.update(ft);
	}

	@Override
	public void deleteFirstTopicById(String fid) {
		firstTopicDao.deleteById(fid);
	}

	@Override
	public void saveFirstTopic(FirstTopic model) {
		firstTopicDao.save(model);

	}

}

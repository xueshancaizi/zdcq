package com.zdcq.s2sh.service;

import java.util.List;

import com.zdcq.s2sh.domain.SecondTopic;

public interface SecondTopicService {
	
	public List<SecondTopic> findAllSecondTopic();
	
	public List<SecondTopic> findAllSecondTopicByfId(String fid);
	
	public SecondTopic findSecondTopicByID(String sid);

	public void updateSecondTopic(SecondTopic model);

	public void deleteSecondTopicById(String sid);

	public void saveSecondTopic(SecondTopic st);

}

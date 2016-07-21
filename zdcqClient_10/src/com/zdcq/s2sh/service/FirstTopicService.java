package com.zdcq.s2sh.service;

import java.util.List;

import com.zdcq.s2sh.domain.FirstTopic;

public interface FirstTopicService {
	
	public List<FirstTopic> findAllFirstTopic();
	
	public FirstTopic findFirstTopicById(String fid);
	
	public void updateFirstTopic(FirstTopic ft);

	public void deleteFirstTopicById(String fid);

	public void saveFirstTopic(FirstTopic model);

}

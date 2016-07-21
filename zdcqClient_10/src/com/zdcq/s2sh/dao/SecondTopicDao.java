package com.zdcq.s2sh.dao;

import java.util.List;

import com.zdcq.s2sh.domain.SecondTopic;

public interface SecondTopicDao {

	List<SecondTopic> findAllRecords();

	List<SecondTopic> findRecordsByFid(String fid);

	SecondTopic findById(String sid);

	void update(SecondTopic model);

	void deleteById(String sid);

	void add(SecondTopic st);

}

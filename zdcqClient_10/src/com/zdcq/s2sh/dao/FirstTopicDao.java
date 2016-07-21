package com.zdcq.s2sh.dao;

import java.util.List;

import com.zdcq.s2sh.domain.FirstTopic;

public interface FirstTopicDao {

	List<FirstTopic> findAllRecords();

	FirstTopic findById(String fid);

	void update(FirstTopic ft);

	void deleteById(String fid);

	void save(FirstTopic model);

}

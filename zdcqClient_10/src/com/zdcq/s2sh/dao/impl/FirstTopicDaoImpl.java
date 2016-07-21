package com.zdcq.s2sh.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.zdcq.s2sh.dao.FirstTopicDao;
import com.zdcq.s2sh.domain.FirstTopic;

@Repository("firstTopicDao")
public class FirstTopicDaoImpl  implements FirstTopicDao {
	@Resource(name="hibernateTemplate")
	private HibernateTemplate hibernateTemplate;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<FirstTopic> findAllRecords() {
		return this.hibernateTemplate.find("from FirstTopic");
	}

	@Override
	public FirstTopic findById(String fid) {
		return (FirstTopic) this.hibernateTemplate.find("from FirstTopic where fid = ?", fid).get(0);
	}

	@Override
	public void update(FirstTopic ft) {
		FirstTopic topic = this.hibernateTemplate.load(FirstTopic.class, ft.getFid());
		topic.setName(ft.getName());
		this.hibernateTemplate.update(topic);
		this.hibernateTemplate.flush();
	}

	@Override
	public void deleteById(String fid) {
		FirstTopic ft = this.hibernateTemplate.load(FirstTopic.class, fid);
		this.hibernateTemplate.delete(ft);
		this.hibernateTemplate.flush();
	}

	@Override
	public void save(FirstTopic model) {
		this.hibernateTemplate.save(model);
		this.hibernateTemplate.flush();
	}

}

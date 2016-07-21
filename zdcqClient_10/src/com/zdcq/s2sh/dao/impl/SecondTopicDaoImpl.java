package com.zdcq.s2sh.dao.impl;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.zdcq.s2sh.dao.SecondTopicDao;
import com.zdcq.s2sh.domain.FirstTopic;
import com.zdcq.s2sh.domain.SecondTopic;

@Repository("secondTopicDao")
public class SecondTopicDaoImpl implements SecondTopicDao {
	@Resource(name="hibernateTemplate")
	private HibernateTemplate hibernateTemplate;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<SecondTopic> findAllRecords() {
		return this.hibernateTemplate.find("from SecondTopic");
		
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<SecondTopic> findRecordsByFid(String fid) {

		
		return this.hibernateTemplate.find("from SecondTopic where fid = ?", fid);
	}
	@Override
	public SecondTopic findById(String sid) {

		return (SecondTopic) this.hibernateTemplate.find("from SecondTopic where sid = ?", sid).get(0);
	}
	@Override
	public void update(SecondTopic model) {
		SecondTopic st = this.hibernateTemplate.load(SecondTopic.class, model.getSid());
		st.setName(model.getName());
		FirstTopic ft = this.hibernateTemplate.load(FirstTopic.class, model.getFirstTopic().getFid());
		st.setFirstTopic(ft);
		this.hibernateTemplate.update(st);
		this.hibernateTemplate.flush();
		
	}
	@Override
	public void deleteById(String sid) {

		SecondTopic st = this.hibernateTemplate.load(SecondTopic.class, sid);
		this.hibernateTemplate.delete(st);
		this.hibernateTemplate.flush();		
	}
	@Override
	public void add(SecondTopic st) {
		FirstTopic ft = this.hibernateTemplate.load(FirstTopic.class, st.getFirstTopic().getFid());
		st.setFirstTopic(ft);
		this.hibernateTemplate.save(st);
		this.hibernateTemplate.flush();		
	}

}

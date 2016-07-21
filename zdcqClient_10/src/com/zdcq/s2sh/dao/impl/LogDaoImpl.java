package com.zdcq.s2sh.dao.impl;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.zdcq.s2sh.dao.LogDao;
import com.zdcq.s2sh.domain.Log;

@Repository("logDao")
public class LogDaoImpl implements LogDao {
	@Resource(name="hibernateTemplate")
	private HibernateTemplate hibernateTemplate;
	@Override
	public void save(Log log) {		
		this.hibernateTemplate.save(log);
		this.hibernateTemplate.flush();
	}

}

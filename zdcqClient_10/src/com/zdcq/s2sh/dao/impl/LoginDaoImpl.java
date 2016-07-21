package com.zdcq.s2sh.dao.impl;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.zdcq.s2sh.dao.LoginDao;
import com.zdcq.s2sh.domain.User;

@Repository("loginDao")
public class LoginDaoImpl implements LoginDao {
	@Resource(name="hibernateTemplate")
	private HibernateTemplate hibernateTemplate;
	
	@Override
	public User getUserByUsername(String username) {
		return (User) this.hibernateTemplate.find("from User where username = ?", username).get(0);
	}

}

package com.zdcq.s2sh.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.zdcq.s2sh.dao.UserDao;
import com.zdcq.s2sh.domain.User;

@Repository("userDao")
public class UserDaoImpl implements UserDao {
	@Resource(name="hibernateTemplate")
	private HibernateTemplate hibernateTemplate;
	
	@Override
	public User getUserByUAndP(String username, String password) {
		List<User> list = this.hibernateTemplate.find("from User u where u.loginname=? and u.password=?", new String[]{username, password});
	    if(list.size()!=0){
	    	return list.get(0);
	    }else{
	    	return null;
	    }
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> getAllUser() {
		return this.hibernateTemplate.find("from User order by userID");
	}

	@Override
	public User getUserById(Long uid) {
		return this.hibernateTemplate.get(User.class, uid);
	}

	@Override
	public void deleteUser(Long uid) {
		User user = this.hibernateTemplate.load(User.class, uid);
		this.hibernateTemplate.delete(user);
		this.hibernateTemplate.flush();	    
	}

	@Override
	public void updateUser(User user) {
		this.hibernateTemplate.update(user);
		this.hibernateTemplate.flush();
	}

	@Override
	public boolean saveUser(User user) {
		this.hibernateTemplate.save(user);
		this.hibernateTemplate.flush();
		return true;
	}

	@Override
	public boolean checkByLoginname(String loginname) {
		
		int size = this.hibernateTemplate.find("from User u where u.loginname = ?", loginname).size();
		if(size != 0){
			return true;
		}
		return false;
	}

}

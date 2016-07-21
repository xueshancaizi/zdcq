package com.zdcq.s2sh.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zdcq.s2sh.dao.UserDao;
import com.zdcq.s2sh.domain.User;
import com.zdcq.s2sh.service.UserService;
import com.zdcq.s2sh.util.MD5Util;

@Service("userService")
public class UserServiceImpl implements UserService {
    @Resource(name="userDao")
	private UserDao userDao;  //Spring注入
   

	@Override
	public boolean login(String username, String password) {
		//使用MD5加密
		String password2 = MD5Util.md5(password);
		User u = userDao.getUserByUAndP(username, password2);
		
		if(u != null) {
			return true;
		} else {
			return false;
		}
		
	}

	@Override
	public List<User> getAllUser() {
		return userDao.getAllUser();
	}

	@Override
	public User getUserById(Long uid) {
		
		return userDao.getUserById(uid);
	}

	@Override
	public void deleteUser(Long uid) {
		userDao.deleteUser(uid);
	}

	@Override
	public void updateUser(User user) {
		userDao.updateUser(user);
	}

	@Override
	public boolean saveUser(User user) {
		boolean bool;
	    bool = userDao.saveUser(user);
        
	    return bool;
	}

	@Override
	public boolean checkUserByLoginname(String loginname) {
		return userDao.checkByLoginname(loginname);
	}

}

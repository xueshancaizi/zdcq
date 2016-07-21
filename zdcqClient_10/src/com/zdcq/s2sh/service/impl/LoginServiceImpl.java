package com.zdcq.s2sh.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zdcq.s2sh.dao.LoginDao;
import com.zdcq.s2sh.dao.impl.LoginDaoImpl;
import com.zdcq.s2sh.domain.User;
import com.zdcq.s2sh.service.LoginService;

@Service("loginService")
public class LoginServiceImpl implements LoginService {
	@Resource(name="loginDao")
    private LoginDao loginDao;

	@Override
	public User getUserByUsername(String username) {
		return this.loginDao.getUserByUsername(username);
	}

}

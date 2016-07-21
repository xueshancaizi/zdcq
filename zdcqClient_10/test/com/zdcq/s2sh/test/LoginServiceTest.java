package com.zdcq.s2sh.test;

import static org.junit.Assert.*;

import org.junit.Test;

import com.zdcq.s2sh.domain.User;
import com.zdcq.s2sh.service.LoginService;
import com.zdcq.s2sh.service.impl.LoginServiceImpl;

public class LoginServiceTest extends SpringUtils{

	@Test
	public void test() {
		LoginService loginService = (LoginService) context.getBean("loginService");
		User user = loginService.getUserByUsername("admin");
		System.out.println(user.toString());
	}

}

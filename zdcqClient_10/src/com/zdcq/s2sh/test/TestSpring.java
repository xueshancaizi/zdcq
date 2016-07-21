package com.zdcq.s2sh.test;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.zdcq.s2sh.dao.LogDao;
import com.zdcq.s2sh.domain.Log;
import com.zdcq.s2sh.service.LoginService;


public class TestSpring {
	private ApplicationContext context = null;
	@Before
	public void init(){
		context = new ClassPathXmlApplicationContext("spring/applicationContext.xml");
	}
	@Test
	public void testSpringAOP(){
		LoginService loginService = (LoginService)context.getBean("loginService");
		loginService.getUserByUsername("admin");		
	}
	
}

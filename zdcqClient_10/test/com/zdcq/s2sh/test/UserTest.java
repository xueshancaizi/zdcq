package com.zdcq.s2sh.test;

import java.util.List;

import org.junit.Test;

import com.zdcq.s2sh.domain.User;
import com.zdcq.s2sh.service.UserService;

public class UserTest extends SpringUtils{
	
	@Test
	public void testLogin(){
		UserService userService = (UserService) context.getBean("userService");
		boolean bool = userService.login("123", "123");
		if(bool){
			System.out.println("用户存在");
		} else {
			System.out.println("用户不存在");
		}
	}
	
	@Test
	public void testGetAllUser(){
		UserService userService = (UserService) context.getBean("userService");
		List<User> list = userService.getAllUser();
		for(User u:list){
			System.out.println(u.getUsername());
		}
	}
	
	@Test
	public void testGetUserById(){
		UserService userService = (UserService) context.getBean("userService");
		User user = userService.getUserById(2L);
		System.out.println(user.getUsername());
	}
	
	@Test
	public void testDeleteUser(){
		UserService userService = (UserService) context.getBean("userService");
		userService.deleteUser(9L);
	}
	
	@Test
	public void testUpdateUser(){
		UserService userService = (UserService) context.getBean("userService");
		User user = new User();
		user.setUserID(3L);
		user.setUsername("fxh");
		userService.updateUser(user);
	}
	
	@Test
	public void testSaveUser(){
		UserService userService = (UserService) context.getBean("userService");
		User user = new User();
		user.setUserID(4L);
		user.setUsername("jjj");
		userService.saveUser(user);
	}
	
	@Test
	public void testCheckByLoginname(){
		UserService userService = (UserService) context.getBean("userService");
		boolean bool = userService.checkUserByLoginname("admin1");
		
		if(bool){
			System.out.println("该登录名不可用");
		} else {
			System.out.println("该登录名可用");
		}
	}
}

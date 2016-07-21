package com.zdcq.s2sh.service;

import java.util.List;

import com.zdcq.s2sh.domain.User;

public interface UserService {
	/**
	 * 根据用户名和密码查找用户
	 */
	public boolean login(String username,String password);
	/**
	 * 查询所有的用户
	 */
	public List<User> getAllUser();
	
	/**
	 * 根据id查询用户
	 */
	public User getUserById(Long uid);
	
	/**
	 * 删除用户
	 */
	public void deleteUser(Long uid);
	/**
	 * 更改用户
	 */
	public void updateUser(User user);
	/**
	 * 增加用户
	 */
	public boolean saveUser(User user);
	
	public boolean checkUserByLoginname(String loginname);
}

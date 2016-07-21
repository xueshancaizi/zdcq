package com.zdcq.s2sh.service;

import org.springframework.stereotype.Service;

import com.zdcq.s2sh.domain.User;


public interface LoginService {
	public User getUserByUsername(String username);
}

package com.zdcq.s2sh.dao;

import com.zdcq.s2sh.domain.User;

public interface LoginDao {
    public User getUserByUsername(String username);
}

package com.zdcq.s2sh.test;

import static org.junit.Assert.*;

import org.junit.Test;

import com.zdcq.s2sh.util.MD5Util;

public class MD5UtilTest {

	@Test
	public void test() {
		String password = MD5Util.md5("admin");
		System.out.println(password);
	}

}

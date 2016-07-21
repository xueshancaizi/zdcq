package com.zdcq.s2sh.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import sun.misc.BASE64Encoder;

public class MD5Util {
	/**
	 * 字符串使用md5加密
	 * @param str
	 * @return
	 */
	public static String md5(String str){
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
		    byte b[] = md.digest(str.getBytes());
		    
		    String s = new BASE64Encoder().encode(b);
		    return s;
		} catch (NoSuchAlgorithmException e) {
			throw new RuntimeException(e);
		}
		
	}
}

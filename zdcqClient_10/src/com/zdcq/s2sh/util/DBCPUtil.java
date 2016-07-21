package com.zdcq.s2sh.util;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSourceFactory;

public class DBCPUtil {
     private static DataSource dataSource;
     static {
    	 try {
			InputStream in = DBCPUtil.class.getClassLoader().getResourceAsStream("dbcfg.properties");
			 Properties props = new Properties();
			 props.load(in);
			 dataSource = BasicDataSourceFactory.createDataSource(props);
		} catch (Exception e) {
		    throw new ExceptionInInitializerError("初始化参数失败");
		}
     }
     
     public static Connection getConnection() {
    	 try {
			return dataSource.getConnection();
		} catch (SQLException e) {
			throw new RuntimeException("获取数据库连接失败");
		}
     }
     
     public static DataSource getDataSource() {
    	 return dataSource;
     }
}

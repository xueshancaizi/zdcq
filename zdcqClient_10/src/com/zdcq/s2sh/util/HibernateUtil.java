package com.zdcq.s2sh.util;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtil {
	public static SessionFactory factory;
	static{
		   Configuration config = new Configuration();
		   config.configure();
		   factory = config.buildSessionFactory();
	}
}

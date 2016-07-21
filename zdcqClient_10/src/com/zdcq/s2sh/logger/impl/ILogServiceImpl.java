package com.zdcq.s2sh.logger.impl;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;

import org.aspectj.lang.JoinPoint;
import org.springframework.stereotype.Service;

import com.zdcq.s2sh.dao.LogDao;
import com.zdcq.s2sh.domain.Log;
import com.zdcq.s2sh.logger.ILogService;

@Service("logService")
public class ILogServiceImpl implements ILogService{
	@Resource(name="logDao")
    private LogDao logDao;
	@Override
	public void log() {
		System.out.println("****************Log******************");
	}

	@Override
	public void logArg(JoinPoint point) {
		//此方法返回的是一个数组，数组中包括request以及ActionCofig等类对象
		Object[] args = point.getArgs();
		System.out.println("目标参数列表");
		if(args != null){
			for(Object arg:args){
				System.out.println(arg + ",");
			}
			System.out.println();
		}
	}

	@Override
	public void logArgAndReturn(JoinPoint point, Object returnObj) {
		//此方法返回的是一个数组，数组中包括request以及ActionCofig等类对象
		Object[] args = point.getArgs();
		Date date = null;
		System.out.println("目标参数列表");
		Log log = new Log();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		String dateStr = df.format(new Date());
		
		log.setId(1);
		log.setUserName((String)args[0]);
		log.setLoginTime(dateStr);	
		logDao.save(log);

		if(args != null){
			for(Object arg:args){
				System.out.println(arg + ",");
			}
			System.out.println();
			System.out.println("执行结果是：" + returnObj);
		}
		
	}


}

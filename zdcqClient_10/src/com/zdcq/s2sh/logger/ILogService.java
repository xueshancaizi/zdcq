package com.zdcq.s2sh.logger;

import org.aspectj.lang.JoinPoint;


public interface ILogService {
	public void log();
	public void logArg(JoinPoint point);
	public void logArgAndReturn(JoinPoint point, Object returnObj);
}

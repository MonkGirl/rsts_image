package cn.net.sinodata.utils;

import org.apache.log4j.Logger;

public class CommonLogger {

	public static Logger logger = Logger.getLogger(CommonLogger.class);
	
	public static void debug(Object message){
		logger.debug(message);
	}
	
	public static void debug(Object message, Throwable t){
		logger.debug(message, t);
	}
	
	public static void info(Object message){
		logger.info(message);
	}
	
	public static void info(Object message, Throwable t){
		logger.info(message, t);
	}
	
	public static void warn(Object message){
		logger.warn(message);
	}
	
	public static void warn(Object message, Throwable t){
		logger.warn(message, t);
	}
	
	public static void error(Object message){
		logger.error(message);
	}
	
	public static void error(Object message, Throwable t){
		logger.error(message, t);
	}
}

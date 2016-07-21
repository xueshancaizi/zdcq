package com.zdcq.s2sh.util;

public class ParameterFilterUtil {
    public static String filter(String parameter){
	    if((parameter!=null) && (!"".equals(parameter))){  
	    	parameter = parameter.replaceAll("<","")//匹配尖括号  
	                               .replaceAll(">","")//匹配尖括号  
	                               .replaceAll("\"","")//匹配双引号  
	                               .replaceAll("\'","")//匹配单引号  
	                               .replaceAll("\\(.*?\\)","")//匹配左右括号  
	                               .replaceAll("[+]","");//匹配加号  
	    } 
	    return parameter;
    }
}

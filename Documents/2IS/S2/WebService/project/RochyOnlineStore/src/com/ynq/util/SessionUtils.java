
package com.ynq.util;

import javax.servlet.http.HttpServletRequest;

import com.ynq.business.entity.User;


public class SessionUtils {
	
	private static String USER_SESSION = "User";
	

	public static Long getCurrectUserid(HttpServletRequest request){
		return getCurrectUser(request)==null?0L:getCurrectUser(request).getId();
	}
	

	public static String getCurrectUserName(HttpServletRequest request){
		return getCurrectUser(request)==null?"":getCurrectUser(request).getLoginName();
	}

	public static User getCurrectUser(HttpServletRequest request){
		return (User) request.getSession().getAttribute(USER_SESSION);
	}
}

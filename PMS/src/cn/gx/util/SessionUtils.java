package cn.gx.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import cn.gx.entity.User;

public class SessionUtils {

	public static User getUser(HttpServletRequest request){
	    HttpSession session = request.getSession();
	    return (User) session.getAttribute("user");
	}
}

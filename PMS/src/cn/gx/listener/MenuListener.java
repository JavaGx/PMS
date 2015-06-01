package cn.gx.listener;

import java.util.List;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import cn.gx.entity.Privilege;
import cn.gx.service.PrivilegeService;

public class MenuListener implements ServletContextListener {

	public void contextDestroyed(ServletContextEvent arg0) {

	}

	public void contextInitialized(ServletContextEvent arg0) {
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(arg0.getServletContext());
		 
		PrivilegeService ps=(PrivilegeService)context.getBean("privilegeServiceImpl");
		List<Privilege> tops=ps.getCascadeList();
		arg0.getServletContext().setAttribute("topMenu",tops);
		
		List<String> urls=ps.findUrls();
		arg0.getServletContext().setAttribute("urls",urls);
	}

}

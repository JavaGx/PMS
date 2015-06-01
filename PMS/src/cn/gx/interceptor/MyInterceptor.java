package cn.gx.interceptor;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import cn.gx.entity.Privilege;
import cn.gx.entity.User;
import cn.gx.service.PrivilegeService;
import cn.gx.service.RoleService;
import cn.gx.util.SessionUtils;


public class MyInterceptor extends HandlerInterceptorAdapter {
	
	@Resource
	private RoleService rs;
	@Resource
	private PrivilegeService ps;

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		StringBuffer requestURL = request.getRequestURL();
		String uri=request.getRequestURI();
		String context=request.getContextPath();
		//String path=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+context;
		  if(uri.contains(".do")){
			  if(uri.contains("user/login")||uri.contains("user/register")){
				  
				 return true;
			  }else{
				 
				  int index=uri.indexOf(context)+context.length();
				  int endIndex=uri.indexOf(".do");
				  String action=uri.substring(index, endIndex);
				  User user = SessionUtils.getUser(request);
				  if(user!=null){
						  if(ps.findUrls().contains(action)){
							  List<Privilege> privileges = rs.getPrivileges(user.getRole().getId());
							  for(Privilege privilege:privileges){
								  if(action.equalsIgnoreCase(privilege.getUrl())){
									return true ;
								  }
							  }
							  response.sendRedirect(context+"/noPrivilege.jsp");
							  return false;
						  } 
					  
				  }else{
					  response.sendRedirect(context+"/login.jsp");
					  return false;
				  }
				 
			  }
		  }
	
		return true;
	}

	
	
}

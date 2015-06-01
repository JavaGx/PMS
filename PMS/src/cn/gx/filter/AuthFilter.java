package cn.gx.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.gx.entity.User;
import cn.gx.util.SessionUtils;


public class AuthFilter implements Filter {
	@Override
	public void destroy() {
	}
	
	@Override
	public void init(FilterConfig config) throws ServletException {
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {
	      HttpServletRequest request = (HttpServletRequest) req;
	      HttpServletResponse response = (HttpServletResponse) resp;
	      
	      User user = SessionUtils.getUser(request);
	      
	      if(user==null){
	    	  
	      }else{
	    	  chain.doFilter(request, response);
	      }
          
	}


}

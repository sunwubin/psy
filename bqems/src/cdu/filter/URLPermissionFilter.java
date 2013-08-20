package cdu.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class URLPermissionFilter implements javax.servlet.Filter{

	@Override
	public void destroy() {
		
	}


	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest httpRequest=(HttpServletRequest) request;
		HttpServletResponse httpResponse=(HttpServletResponse) response;
		//
		HttpSession session=httpRequest.getSession(false);
		String contextPath=httpRequest.getContextPath();
		String requestUri=httpRequest.getRequestURI();
		
		chain.doFilter(httpRequest, httpResponse);
	}


	@Override
	public void init(FilterConfig arg0) throws ServletException {
		
	}

}

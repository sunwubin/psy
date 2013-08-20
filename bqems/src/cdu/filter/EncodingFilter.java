package cdu.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class EncodingFilter implements Filter {
	private String charset = "";

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// 设置字符过滤
		request.setCharacterEncoding(this.charset);
		response.setCharacterEncoding(this.charset);
		chain.doFilter(request, response);
	}

	public void destroy() {
		// TODO 销毁
	}

	public void init(FilterConfig config) throws ServletException {
		// 获取初始化参数
		this.charset = config.getInitParameter("charset");
	}

}

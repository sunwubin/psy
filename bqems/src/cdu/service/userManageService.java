package cdu.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;

import cdu.bean.UserBean;
import cdu.dao.UserDao;

public class userManageService extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String format = request.getParameter("format");
		if (format.equals("login")) {
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			if (username != "" && username != null && password != ""
					&& password != null) {
				UserDao userDao = new UserDao();
				boolean isCheck = (password.equals(userDao.login(username)));
				if (isCheck) {
					HttpSession httpSession = request.getSession();
					UserBean bean = new UserBean(username, password, null, null);
					httpSession.setAttribute("login", bean);
					response.sendRedirect("html/index.jsp");
				} else {
					response.sendRedirect("html/login.jsp");
				}
			} else {
				response.sendRedirect("html/login.jsp");
			}
		} else if (format.equals("logout")) {
			request.getSession().invalidate();
			response.sendRedirect("html/login.jsp");
		}
		
	}
}

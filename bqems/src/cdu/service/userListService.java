package cdu.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import cdu.bean.UserBean;
import cdu.dao.UserDao;

/**
 * Servlet implementation class userListService
 */
@WebServlet("/userListService")
public class userListService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String format = request.getParameter("format");
		UserDao userDao = new UserDao();
		if (format.equals("list")) {
			List<HashMap<String, Object>> users = userDao.getUsers();
			response.setContentType("text/html;charset=UTF-8");
			JSONArray array = new JSONArray(users);
			response.getWriter().print(array.toString());
		} else if (format.equals("delete")) {
			String name = request.getParameter("name");
			userDao.DeleteUser(name);
			response.sendRedirect("html/usertable.jsp");
		} else if (format.equals("add")) {
			String name = request.getParameter("username");
			String password = request.getParameter("password");
			String phone = request.getParameter("phone");
			String power = request.getParameter("power");
			switch (Integer.parseInt(power)) {
			case 1:
				power = "超级管理员";
				break;
			case 2:
				power = "管理员";
				break;
			case 3:
				power = "用户";
				break;
			}
			UserBean user = new UserBean(name, password, phone, power);
			userDao.CreateUser(user);
			response.sendRedirect("html/usertable.jsp");
		} else if (format.equals("listone")) {
			String name = request.getParameter("name");
			UserBean user = userDao.getUser(name);
			request.setAttribute("user", user);
			RequestDispatcher dispatcher = request
					.getRequestDispatcher("html/EditUserTable.jsp");
			dispatcher.forward(request, response);
		} else if (format.equals("update")) {
			String name = request.getParameter("name");
			String password = request.getParameter("password");
			String phone = request.getParameter("phone");
			String power = request.getParameter("power");
			switch (Integer.parseInt(power)) {
			case 1:
				power = "超级管理员";
				break;
			case 2:
				power = "管理员";
				break;
			case 3:
				power = "用户";
				break;
			}
			UserBean user = new UserBean(name, password, phone, power);
			userDao.UpdateUser(user);
			response.sendRedirect("html/usertable.jsp");
		}

		
	}

}

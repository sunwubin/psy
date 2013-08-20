package cdu.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cdu.utils.Constant;

/**
 * Servlet implementation class nowhumidityService
 */
@WebServlet("/nowhumidityService")
public class nowhumidityService extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public nowhumidityService() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                doPost(request,response);
	}

	/**
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BufferedReader reader = request.getReader();
		  reader.close();
		  response.setCharacterEncoding("utf-8");
		  PrintWriter out = response.getWriter();
		  out.print(this.getServletContext().getAttribute(Constant.CON_HUMIDITY));
		  System.out.println("xxxxxx"+this.getServletContext().getAttribute(Constant.CON_HUMIDITY));
		  out.flush();
		  out.close();
	}

}

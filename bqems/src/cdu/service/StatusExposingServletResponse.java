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
import cdu.utils.*;
/**
 * Servlet implementation class StatusExposingServletResponse
 */
@WebServlet("/StatusExposingServletResponse")
public class StatusExposingServletResponse extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StatusExposingServletResponse() {
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
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		BufferedReader reader = request.getReader();
		  reader.close();
		  response.setCharacterEncoding("utf-8");
		  PrintWriter out = response.getWriter();
		 // out.print((Math.random()*10));
		 
		  out.print(this.getServletContext().getAttribute(Constant.CON_TEMPERATURE));
		  out.flush();
		  out.close();
	}

}

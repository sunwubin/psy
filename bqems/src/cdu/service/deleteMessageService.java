package cdu.service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cdu.dao.SendMessageDao;

/**
 * Servlet implementation class deleteMessageService
 */
@WebServlet("/deleteMessageService")
public class deleteMessageService extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteMessageService() {
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
	    String sendId=request.getParameter("sendId");
	    System.out.println(request.getRequestURL());
	    System.out.println(request.getRequestURI());
	    System.out.println(sendId);
	    SendMessageDao dao=new SendMessageDao();
	    dao.delete(Integer.parseInt(sendId));
	    response.sendRedirect("html/senmessage.jsp");
	}

}

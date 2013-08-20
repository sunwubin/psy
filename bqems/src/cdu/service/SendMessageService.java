package cdu.service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cdu.bean.SendMessageBean;
import cdu.dao.SendMessageDao;
import cdu.utils.sms.SendMessage;

/**
 * Servlet implementation class SendMessage
 */
@WebServlet("/SendMessage")
public class SendMessageService extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendMessageService() {
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
		String phones=request.getParameter("phone");
		String sendMessage=request.getParameter("sendMessage");
		System.out.println(phones+sendMessage);
		//SendMessage sendMessages = new SendMessage();
		SendMessage.sendSMS(phones, sendMessage);
		//sendMessages=null;
	
		SendMessageBean bean=new SendMessageBean();
		SendMessageDao dao=new SendMessageDao();
		bean.setSendPhone(phones);
		bean.setSendMessage(sendMessage);
		dao.add(bean);
		 response.sendRedirect("html/senmessage.jsp");
	
	}

}

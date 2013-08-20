package cdu.socketserver;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import cdu.utils.sms.AcceptMessages;

/**
 * 
 * @author sun
 *
 */
public class ServiceLoader implements ServletContextListener {
	private SocketThread socketThread;

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		if(null!=socketThread&&!socketThread.isInterrupted()){
			socketThread.closeSocketServer();
			socketThread.interrupt();
		}
	}
	
	@Override
	public void contextInitialized(ServletContextEvent e) {
		ServletContext servletContext=e.getServletContext();
		String str=(String)servletContext.getAttribute("socketThreadIsRun");
		if(null==socketThread){
			servletContext.setAttribute("socketThreadIsRun", "true");
			socketThread=new SocketThread(null,servletContext);
			System.out.println("start get data.....");
			socketThread.start();
		}
		System.out.println("start get sms.....");
//		AcceptMessages acceptMessages = new AcceptMessages();
//		acceptMessages.acceptSMS();
	}

}

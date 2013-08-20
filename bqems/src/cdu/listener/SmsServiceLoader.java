package cdu.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import cdu.utils.sms.AcceptMessages;

public class SmsServiceLoader  implements ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		
		
	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		System.out.println("start get sms.....");
		AcceptMessages acceptMessages = new AcceptMessages();
		acceptMessages.acceptSMS();
	}

	

}

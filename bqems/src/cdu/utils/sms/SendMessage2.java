package cdu.utils.sms;

import org.smslib.IOutboundMessageNotification;
import org.smslib.OutboundMessage;
import org.smslib.Service;
import org.smslib.Message.MessageEncodings;
import org.smslib.modem.SerialModemGateway;

public class SendMessage2 implements Runnable {
	 public static class OutboundNotification implements IOutboundMessageNotification {
		 
		 
		 
	  public void process(String gatewayId, OutboundMessage msg) {
	   System.out.println("Outbound handler called from Gateway: "
	     + gatewayId);
	   System.out.println(msg);
	  }
	 }
	 private static Service srv;
	 private static  OutboundMessage msg;
	 static{
//		 OutboundNotification outboundNotification = new OutboundNotification();
//		  srv = new Service();
//		  SerialModemGateway gateway = new SerialModemGateway("modem.com6",
//		    "COM6", 9600, "wavecom", ""); //设置端口与波特率
//		  gateway.setInbound(true);
//		  gateway.setOutbound(true);
//		  gateway.setSimPin("0000");
//		  gateway.setOutboundNotification(outboundNotification);
//		  srv.addGateway(gateway);
//		  System.out.println("初始化成功，准备开启服务");
//		  try {
//			srv.startService();
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} 
	 }
	 
	 public static void main(String[] args) {
	  SendMessage2 sendMessage = new SendMessage2();
	//  sendMessage.sendSMS("18782965163", "123456");
	  
	  for(int  i=0;i<2;i++){
		  sendMessage.mobilePhones="18782965163";
		  sendMessage.content="123456";
		  sendMessage.isSend=true;
	  }
	  sendMessage.run();
	 }
	public static String mobilePhones=null;
	public static String content=null;
	public static boolean isSend=false;

	@Override
	public void run() {
		System.out.println("执行");
		while(true)
		if(isSend){
			System.out.println("执行");
		    System.out.println("服务启动成功");
		   String[] phones = mobilePhones.split(",");
		   for (int i = 0; i < phones.length; i++) {
		    msg = new OutboundMessage(phones[i], content);
		    msg.setEncoding(MessageEncodings.ENCUCS2); // 中文
		    try {
				srv.sendMessage(msg);
				isSend=false;
			} catch (Exception e) {
				
				e.printStackTrace();
			} 
		   }
	}
}
}

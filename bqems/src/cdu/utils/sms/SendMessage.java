package cdu.utils.sms;

import org.smslib.IOutboundMessageNotification;
import org.smslib.OutboundMessage;
import org.smslib.Service;
import org.smslib.Message.MessageEncodings;
import org.smslib.modem.SerialModemGateway;

public class SendMessage {
	 public static class  OutboundNotification implements IOutboundMessageNotification {
	  public void process(String gatewayId, OutboundMessage msg) {
	   System.out.println("Outbound handler called from Gateway: "
	     + gatewayId);
	   System.out.println(msg);
	  }
	 }
	 static Service srv=null;
	 static SerialModemGateway gateway=null;
	 /**sendMessage**/
	 @SuppressWarnings("deprecation")
	 public static void sendSMS(String mobilePhones, String content) {
	  OutboundMessage msg;
	 boolean isstart=false;
	  if(srv==null){
	  srv = new Service();
	  isstart=true;
	  }else{
		  isstart=false;
	  }
	  if(gateway==null){
		  OutboundNotification outboundNotification = new OutboundNotification();
	   gateway = new SerialModemGateway("modem.com6",
	    "COM6", 9600, "wavecom", ""); //设置端口与波特率
	  gateway.setInbound(true);
	  gateway.setOutbound(true);
	  gateway.setSimPin("0000");
	  gateway.setOutboundNotification(outboundNotification);
	  srv.addGateway(gateway);
	  }
	  
	  System.out.println("初始化成功，准备开启服务");
	  /*Service.getInstance().S.SERIAL_POLLING = true;  //启用轮循模式  
*/	  
	  try {
		  if(isstart)
	     srv.startService();
	   System.out.println("服务启动成功");
	   String[] phones = mobilePhones.split(",");
	   for (int i = 0; i < phones.length; i++) {
	    msg = new OutboundMessage(phones[i], content);
	    msg.setEncoding(MessageEncodings.ENCUCS2); // 中文
	    srv.sendMessage(msg);
	  //  srv.stopService();
		 System.out.println("停止服务");
	   }
	   
	  } catch (Exception e) {
	   e.printStackTrace();
	  }

	 }
	 public static void main(String[] args) {
	  SendMessage sendMessage = new SendMessage();
	  sendMessage.sendSMS("18782965163", "123456");
	 }
	} 

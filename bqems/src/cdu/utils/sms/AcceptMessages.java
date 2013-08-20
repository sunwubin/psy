package cdu.utils.sms;

import org.smslib.IInboundMessageNotification;
import org.smslib.InboundMessage;
import org.smslib.Message.MessageTypes;
import org.smslib.Service;
import org.smslib.modem.SerialModemGateway;


/**
  * 监听短信接收服务
  * 
  * @author ZHJH
  * 
  */
public class AcceptMessages
{
	private Service	srv;

	public void acceptSMS()
	{
		System.out.println("start....");
		// 实例化短信接入监听
		InboundMessageNotification inboundMessageNotification = new InboundMessageNotification();
		// 创建服务
		srv = new Service();
		// 设置相关参数（一般情况下以下默认参数不要变）
		SerialModemGateway gateway = new SerialModemGateway("modem.com1",
				"COM3", 9600, "wavecom", "");
		// 设置短信接收状态为可接收
		gateway.setInbound(true);
		// 设置短信发送状态为可发送
		gateway.setOutbound(true);
		gateway.setSimPin("0000");
		// 添加短信接收监听器
		gateway.setInboundNotification(inboundMessageNotification);
		// 添加网关参数到服务
		srv.addGateway(gateway);
		System.out.println("初始化成功，准备开启服务");
		try
		{
			// 开启服务
			srv.startService();
			System.out.println("服务启动成功");
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}

	/**
	 * 短信接收服务
	 * 
	 * @author ZHJH
	 * 
	 */
	private class InboundMessageNotification implements
			IInboundMessageNotification
	{
		@Override
		public void process(String string, MessageTypes messageTypes,
				InboundMessage message)
		{
			// 当前信息接收到别的用户发送的信息
			if (messageTypes == MessageTypes.INBOUND)
			{
				System.out.println("发送时间 ： " + message.getDate()
						+ " ； 发送号码是 ： " + message.getOriginator()
						+ " ； 内容是：   " + message.getText() + " ; 属性是 ： "
						+ message.getType());
				try
				{
					// 删除当前接收到的信息
					srv.deleteMessage(message);
				}
				catch (Exception e)
				{
					e.printStackTrace();
				}
			}
		}
	}

	public static void main(String[] args)
	{
		AcceptMessages acceptMessages = new AcceptMessages();
		acceptMessages.acceptSMS();
	}
}


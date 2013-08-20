package cdu.utils.sms;

import org.smslib.IInboundMessageNotification;
import org.smslib.InboundMessage;
import org.smslib.Message.MessageTypes;
import org.smslib.Service;
import org.smslib.modem.SerialModemGateway;


/**
  * �������Ž��շ���
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
		// ʵ�������Ž������
		InboundMessageNotification inboundMessageNotification = new InboundMessageNotification();
		// ��������
		srv = new Service();
		// ������ز�����һ�����������Ĭ�ϲ�����Ҫ�䣩
		SerialModemGateway gateway = new SerialModemGateway("modem.com1",
				"COM3", 9600, "wavecom", "");
		// ���ö��Ž���״̬Ϊ�ɽ���
		gateway.setInbound(true);
		// ���ö��ŷ���״̬Ϊ�ɷ���
		gateway.setOutbound(true);
		gateway.setSimPin("0000");
		// ��Ӷ��Ž��ռ�����
		gateway.setInboundNotification(inboundMessageNotification);
		// ������ز���������
		srv.addGateway(gateway);
		System.out.println("��ʼ���ɹ���׼����������");
		try
		{
			// ��������
			srv.startService();
			System.out.println("���������ɹ�");
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}

	/**
	 * ���Ž��շ���
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
			// ��ǰ��Ϣ���յ�����û����͵���Ϣ
			if (messageTypes == MessageTypes.INBOUND)
			{
				System.out.println("����ʱ�� �� " + message.getDate()
						+ " �� ���ͺ����� �� " + message.getOriginator()
						+ " �� �����ǣ�   " + message.getText() + " ; ������ �� "
						+ message.getType());
				try
				{
					// ɾ����ǰ���յ�����Ϣ
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


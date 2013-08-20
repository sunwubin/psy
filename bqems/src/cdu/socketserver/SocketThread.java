package cdu.socketserver;

import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;

import javax.servlet.ServletContext;

import cdu.utils.Constant;

/**
 * 
 * @author sun
 *
 */
public class SocketThread extends Thread{
	
	private DatagramSocket serverScoket;
	private ServletContext serverContext;
	
	public static String  control="";
	byte[] receiveData = new byte[80];
    byte[] sendData = new byte[1024];
	public SocketThread(ServerSocket serverSocket,ServletContext servletContext){
		this.serverContext=servletContext;
		try{
			if(null==serverScoket){
				this.serverScoket=new DatagramSocket(Constant.SOCKET_PORT);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public void run(){
		while(!this.isInterrupted()){
			try{
					DatagramPacket receivePacket = new DatagramPacket(receiveData, receiveData.length);
					serverScoket.receive(receivePacket);
	                String sentence = new String( receivePacket.getData());
	                System.out.println("接收"+sentence);
	                new OperatorSocketdata(receivePacket.getData(),serverContext).start();
	                // System.out.println("RECEIVED: " + sentence);
	                serverContext.setAttribute("socketValue", sentence);
	                InetAddress IPAddress = receivePacket.getAddress();
	                int port = receivePacket.getPort();
	                String capitalizedSentence = sentence.toUpperCase();
	                //sendData = capitalizedSentence.getBytes();
	                sendData="444111100000000".getBytes();
	                DatagramPacket sendPacket =
	                new DatagramPacket(sendData, sendData.length, IPAddress, port);
	                System.out.println("端口"+port);
	                System.out.println(IPAddress);
	                //发送控制信息
	                serverScoket.send(sendPacket);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}
	public void closeSocketServer(){
		try{
			if(null!=serverScoket && !serverScoket.isClosed()){
				serverScoket.close();
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}

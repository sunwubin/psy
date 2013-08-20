package cdu.socketserver;


import cdu.utils.*;

import javax.servlet.ServletContext;
/**
 * 
 * @author sun
 *
 */
public class OperatorSocketdata extends Thread {
	//private DatagramSocket socket;
	private ServletContext servletContext;
	byte[] receiveData = new byte[80];
	
	public OperatorSocketdata(byte[] receiveData,ServletContext servletContext){
		this.receiveData=receiveData;
		this.servletContext=servletContext;
	}
	
	public  void run(){
		try{
			String temp=new String(this.receiveData);
			//servletContext.setAttribute(Constant.CON_TEMPERATURE, ""+(char)this.receiveData[0]+(char)this.receiveData[1]);
			String reStr=new String(this.receiveData,"UTF-8").trim();
			System.out.println(reStr);
			if(reStr.substring(0,3).equals("333")){
				//System.out.println("大气压:"+reStr.substring(9,12)+"."+reStr.substring(12,15));
				//System.out.println("insert into t_pressure (collectionTime,collectionData,collectionNode,collectionPointId) values(now(),"+reStr.substring(9,12)+"."+reStr.substring(12,15)+",'1',1)");
				DB.ExecuteNonQuery("insert into t_pressure (collectionTime,collectionData,collectionNode,collectionPointId) values(now(),"+reStr.substring(9,12)+"."+reStr.substring(12,15)+",'1',1)");
			}else if(reStr.substring(0,3).equals("666")){
				//System.out.println("风速"+reStr.substring(3,6)+"."+reStr.substring(6,8));
				DB.ExecuteNonQuery("insert into t_noise (collectionTime,collectionData,collectionNode,collectionPointId) values(now(),"+reStr.substring(3,6)+"."+reStr.substring(6,8)+",'1',1)");
			}else if(reStr.substring(0,3).equals("111")){
				//温湿度
				DB.ExecuteNonQuery("insert into t_temperature (collectionTime,collectionData,collectionNode,collectionPointId) values(now(),"+reStr.substring(3,5)+"."+reStr.substring(5,9)+",'1',1)");
				DB.ExecuteNonQuery("insert into t_humidity (collectionTime,collectionData,collectionNode,collectionPointId) values(now(),"+reStr.substring(9,11)+"."+reStr.substring(11,15)+",'1',1)");
//				System.out.println("温度："+reStr.substring(3,5)+"."+reStr.substring(5,9));
//				System.out.println("湿度"+reStr.substring(9,11)+"."+reStr.substring(11,15));
				
			}else if(reStr.substring(0,3).equals("555")){
				DB.ExecuteNonQuery("insert into t_dust (collectionTime,collectionData,collectionNode,collectionPointId) values(now(),"+reStr.substring(3,4)+"."+reStr.substring(4,8)+",'1',1)");
				System.out.println("粉尘："+reStr.substring(3,4)+"."+reStr.substring(4,8));
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}

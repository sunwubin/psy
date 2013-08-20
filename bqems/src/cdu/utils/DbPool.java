package cdu.utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
/**
 * 
 * @author sun
 * Connection Pool
 *
 */
public class DbPool {
	
	private static int ConnectionMax=10;
	private static Connection[] conns=new Connection[ConnectionMax];
	private static int ConnectionNum=-1;
	//static code block
	static{
		for(int i=0;i<ConnectionMax;i++){
			conns[i]=DB.getConn();
			ConnectionNum++;
		}
		System.out.println("Pool has "+(ConnectionNum+1)+" Connection");
	}

	public static Connection getConnection(){
		Connection conn=null;
		if(conns.length>0){
			conn=conns[ConnectionNum];
			ConnectionNum=ConnectionNum-1;
		}
		return conn;
	}
	//connection push Connection Pool 
	public static void disponse(Connection connection){
		if(connection!=null){//connection no null
			conns[ConnectionNum+1]=connection;
			ConnectionNum=ConnectionNum+1;
		}
	}
	
	public static void main(String[] args) throws SQLException{
		for(int i=0;i<2000;i++){
			Connection connection=DB.getConn();
			PreparedStatement ps=null;
			ps=connection.prepareStatement("insert into t_test(testnum) values ('"+i+"')");
			System.out.println(i);
			ps.executeUpdate();
			ps.close();
			connection.close();
//			
		}
	}

}

package cdu.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


public class DB {
	
	private static String DBDrive = "com.mysql.jdbc.Driver";
	private static String DBUrl ="jdbc:mysql://192.168.1.149:3306/bqbems?useUnicode=true&characterEncoding=UTF-8";//"jdbc:mysql://180.84.33.71:3306/bems";
	private static String DBUser = "root";
	private static String DBPassword = "root";
	private static ResultSet _rs = null;
	private static Connection _conn = null;
	private static Statement _stmt = null;
	/**
	 * create  Connection
	 * @return
	 */
	public static Connection getConn() {
		try {
			Class.forName(DBDrive);
			_conn = DriverManager.getConnection(DBUrl, DBUser, DBPassword);
		} catch (Exception e) {
			System.out.println("--Connection --");
			e.printStackTrace();
		}
		return _conn;
	}
	/**
	 * 
	 * @param sql
	 * @return
	 */
	public synchronized static int executeUpdate(String sql) {
		int result = -1;
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		try {
			conn=DbPool.getConnection();
			stmt=conn.createStatement();
			stmt.executeUpdate(sql,Statement.RETURN_GENERATED_KEYS);
			rs = stmt.getGeneratedKeys();
			while (rs.next()) {
				//
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(stmt,rs);
			DbPool.disponse(conn);
		}
		return result;
	}

	public static ResultSet executeQuery(String sql) {

		try {
			_stmt = getConn().createStatement();
			_rs = _stmt.executeQuery(sql);

		} catch (Exception e) {
			e.printStackTrace();
		} 
		return _rs;
	}



	public static boolean colse() {
		try {
			if (_rs != null) {
				_rs.close();
			}
			if (_stmt != null) {
				_stmt.close();
			}
			if (_conn != null) {
				_conn.close();
			}
			return true;
		} catch (SQLException e) {
			System.out.println("success");
			e.printStackTrace();
			return false;
		}
	}
	
	/**
	 * synchronized code function block
	 * @param stmt
	 * @param rs
	 */
	public synchronized static void close(Statement stmt,ResultSet rs){
			try {
				if(stmt!=null){
				   stmt.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				if(rs!=null){
					try {
						rs.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
	}
	/**
	 * @param sql
	 * @param params
	 * @return
	 */
	public synchronized static int ExecuteNonQuery(String sql, Object[] params) {
		int reNumber = -1;
		Connection conn =DbPool.getConnection();
		PreparedStatement ps = null;
		try {
			ps = conn.prepareStatement(sql);
			for (int i = 0; i < params.length; i++) {
				ps.setObject(i + 1, params[i]);
			}
			reNumber = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(ps,null);
			DbPool.disponse(conn);
		}
		return reNumber;
	}
	
	public synchronized static int ExecuteNonQuery(String sql) {
		int reNumber = -1;
		Connection conn =DbPool.getConnection();
		PreparedStatement ps = null;
		try {
			ps = conn.prepareStatement(sql);
			
			reNumber = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(ps,null);
			DbPool.disponse(conn);
		}
		return reNumber;
	}
	
	
	/**
	 * 
	 * @param sql
	 * @return
	 */
	public synchronized static List<HashMap<String, Object>> ExecuteQuery(String sql) {
		List<HashMap<String, Object>> datas = null;
		PreparedStatement sta = null;
		ResultSet rs = null;
		Connection conn = DbPool.getConnection();
		if (conn != null) {
			try {
				sta = conn.prepareStatement(sql);
				rs = sta.executeQuery();
				ResultSetMetaData rsmd = rs.getMetaData();
				int recount = rsmd.getColumnCount();
				String[] colLabels = new String[recount];
				for (int i = 0; i < recount; i++) {
					colLabels[i] = rsmd.getColumnLabel(i + 1);
				}
				datas = new ArrayList<HashMap<String, Object>>();
				while (rs.next()) {
					rs.getObject(1);
					HashMap<String, Object> data = new HashMap<String, Object>();
					for (int i = 0; i < colLabels.length; i++) {
						data.put(colLabels[i], rs.getObject(colLabels[i]));
					}
					datas.add(data);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close(sta,rs);
				DbPool.disponse(conn);
			}
		} else {
			System.out.println("Connection is null");
		}
		return datas;
	}
	
	
	/**
	 * 
	 * @param sql
	 * @param params
	 * @return
	 */
	public synchronized static List<HashMap<String, Object>> ExecuteQuery(String sql,
			Object[] params) {
		List<HashMap<String, Object>> datas = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Connection conn = DbPool.getConnection();
		if (conn != null) {
			try {
				ps = conn.prepareStatement(sql);
				for (int i = 0; i < params.length; i++) {
					ps.setObject(i + 1, params[i]);
				}
				rs = ps.executeQuery();
				ResultSetMetaData rsmd = rs.getMetaData();
				int recount = rsmd.getColumnCount();
				String[] colLabels = new String[recount];
				for (int i = 0; i < recount; i++) {
					colLabels[i] = rsmd.getColumnLabel(i + 1);
				}
				datas = new ArrayList<HashMap<String, Object>>();
				while (rs.next()) {
					HashMap<String, Object> data = new HashMap<String, Object>();
					for (int i = 0; i < colLabels.length; i++) {
						data.put(colLabels[i], rs.getObject(colLabels[i]));
					}
					datas.add(data);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close(ps,rs);
				DbPool.disponse(conn);
			}
		} else {
			System.out.println("Connection is null");
		}
		return datas;
	}


}


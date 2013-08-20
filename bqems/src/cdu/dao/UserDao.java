package cdu.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import cdu.bean.UserBean;
import cdu.utils.DB;

public class UserDao {
	/**
	 * 根据传入用户名得到相应密码
	 * 
	 * @param password
	 * @return
	 */
	public String login(String name) {
		String sql = "select password from t_user where username='" + name
				+ "'";
		String pass = "";
		try {
			ResultSet _rs = DB.executeQuery(sql);
			while (_rs.next()) {
				pass = _rs.getString(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return pass;
		}
		return pass;
	}
	
	public UserBean getUser(String name) {
		String sql = "SELECT * FROM t_user WHERE username='"+name+"'";
		UserBean user = null;
		try {
			ResultSet _rs = DB.executeQuery(sql);
			while (_rs.next()) {
				user = new UserBean(_rs.getString(1), _rs.getString(2), _rs.getString(3), _rs.getString(4));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
		
	}
	
	public float[] getData() {

		float[] a=new float[5];
		String sql1= "SELECT collectionData FROM t_dust  order by collectionTime desc LIMIT 0,1 ";
		String sql2= "SELECT collectionData FROM t_noise  order by collectionTime desc LIMIT 0,1 ";
		String sql3= "SELECT collectionData FROM t_pressure  order by collectionTime desc LIMIT 0,1 ";
		String sql4= "SELECT collectionData FROM t_temperature  order by collectionTime desc LIMIT 0,1 ";
		String sql5= "SELECT collectionData FROM t_humidity  order by collectionTime desc LIMIT 0,1 ";
		try {
			ResultSet _rs0,_rs1,_rs2,_rs3,_rs4;
			_rs0= DB.executeQuery(sql1);
			_rs1= DB.executeQuery(sql2);
			_rs2= DB.executeQuery(sql3);
			_rs3= DB.executeQuery(sql4);
			_rs4= DB.executeQuery(sql5);
		
//			for(int i=1;i<=5;i++){
//					a[i]=_rs[i].getFloat(i);
//					System.out.print("rs[i].getFloat(i)=="+_rs[i].getFloat(i));
//			}
			if(_rs0.next()){
			a[0]=_rs0.getFloat(1);
			}
			if(_rs1.next()){
			a[1]=_rs1.getFloat(1);
			}
			if(_rs2.next()){
			a[2]=_rs2.getFloat(1);
			}
			if(_rs3.next()){
			a[3]=_rs3.getFloat(1);
			}
			if(_rs4.next()){
			a[4]=_rs4.getFloat(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return a;
		
	}

	public List<HashMap<String, Object>> getUsers() {
		List<HashMap<String, Object>> users = new ArrayList<HashMap<String, Object>>();
		String sql = "select * from t_user";
		try {
			users = DB.ExecuteQuery(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return users;
	}

	public int UpdateUser(UserBean user) {
		String sql = "UPDATE t_user SET `password`=?,phone=?,power=? WHERE username=? ";
		Object[] params = new Object[] { user.getPassword(), user.getPhone(),
				user.getPower(), user.getUsername() };
		int i = DB.ExecuteNonQuery(sql, params);
		return i;
	}

	public int CreateUser(UserBean user) {
		String sql = "INSERT INTO t_user VALUES(?,?,?,?)";
		Object[] params = new Object[] { user.getUsername(),
				user.getPassword(), user.getPhone(), user.getPower() };
		int i = DB.ExecuteNonQuery(sql, params);
		return i;
	}

	public int DeleteUser(String username){
		String sql = "DELETE FROM t_user WHERE username=?";
		Object[] params = new Object[] { username};
		int i = DB.ExecuteNonQuery(sql, params);
		return i;
	}
	public static void main(String[] args) {
		UserDao dao = new UserDao();
		UserBean user = new UserBean();
		user.setPassword("123456");
		user.setPhone("18728898888");
		user.setPower("1");
		user.setUsername("db");
		dao.UpdateUser(user);
		
	}

	
}

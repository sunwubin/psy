package cdu.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import cdu.bean.SendMessageBean;
import cdu.utils.DB;

public class SendMessageDao {


  public void add(SendMessageBean bean){
	  String sql="insert into t_sendMessage(sendPhone,sendMessage,sendTime) values (?,?,now())";
		Object[] params=new Object[2];
		params[0]=bean.getSendPhone();
		params[1]=bean.getSendMessage();
		DB.ExecuteNonQuery(sql, params);
  }
  
  public List<HashMap<String,Object>> queryMessages(){
	  List<HashMap<String,Object>> reList=new ArrayList<HashMap<String,Object>>();
	  String sql="select sendId,sendPhone,sendMessage,sendTime from t_sendMessage";
	  reList=DB.ExecuteQuery(sql);
	  return reList;
  }

public void delete(int sendId) {
	String sql="delete from t_sendMessage where sendId=?";
	Object[] params=new Object[1];
	params[0]=sendId;
	DB.ExecuteNonQuery(sql, params);
	
}

}

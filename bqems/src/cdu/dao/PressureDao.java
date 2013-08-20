package cdu.dao;

import java.util.HashMap;
import java.util.List;

import cdu.bean.PressureBean;
import cdu.utils.DB;

public class PressureDao {
	
	public boolean add(PressureBean pressureBean){
		String sql="insert into t_peressure (COLLECTIONTIME,COLLECTIONDATA,COLLECTIONNODE,COLLECTIONPOINTID) values (?,?,?,?)";
		
		Object[] params=new Object[4];
		params[0]=pressureBean.getCollectionTime();
		params[1]=pressureBean.getCollectionData();
		params[2]=pressureBean.getCollectionNode();
		params[3]=pressureBean.getCollectionPointId();
		DB db=new DB();
		if(1==db.ExecuteNonQuery(sql, params)){
			return true;
		}
		return false;
	}
	public List<HashMap<String, Object>> query(String  sql){
		DB db=new DB();
		return db.ExecuteQuery(sql);
	}
	

}

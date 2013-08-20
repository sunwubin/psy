package cdu.dao;

import java.util.HashMap;
import java.util.List;

import cdu.bean.DustBean;
import cdu.utils.DB;


public class DustDao {
	
	/**
	 * 
	 * @param dustBean
	 * @return
	 */
	public boolean add(DustBean dustBean){
		String sql="insert into t_dust(COLLECTIONTIME,COLLECTIONDATA,COLLECTIONNODE,COLLECTIONPOINTID) values (?,?,?,?)";
		DB db=new DB();
		Object[] params=new Object[4];
		params[0]=dustBean.getCollectionTime();
		params[1]=dustBean.getCollectionData();
		params[2]=dustBean.getCollectionNode();
		params[3]=dustBean.getCollectionPointId();
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

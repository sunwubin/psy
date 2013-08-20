package cdu.dao;

import java.util.HashMap;
import java.util.List;

import cdu.bean.TemperatureBean;
import cdu.utils.DB;

public class TemperatureDao {
	
	
	public boolean add(TemperatureBean temper){
		String sql="insert into t_temperature (COLLECTIONTIME,COLLECTIONDATA,COLLECTIONNODE,COLLECTIONPOITID) values (?,?,?,?)";
		Object[] params=new Object[4];
		params[0]=temper.getCollectionTime();
		params[1]=temper.getCollectionData();
		params[2]=temper.getCollectionNode();
		params[3]=temper.getCollectionPointId();
		if(1==DB.executeUpdate(sql)){
			return true;
		}
		return false;
	}
	public List<HashMap<String, Object>> query(String  sql){
		DB db=new DB();
		return db.ExecuteQuery(sql);
	}

}

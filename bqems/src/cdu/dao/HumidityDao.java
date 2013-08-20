package cdu.dao;

import cdu.bean.HumidityBean;
import cdu.utils.DB;

public class HumidityDao {
	
	public boolean add(HumidityBean humidityBean){
		String sql="insert into t_humidity (COLLECTIONTIME,COLLECTIONDATA,COLLECTIONNODE,COLLECTIONPOINTID) values (?,?,?,?)";
		Object[] params=new Object[4];
		params[0]=humidityBean.getCollectionTime();
		params[1]=humidityBean.getCollectionData();
		params[2]=humidityBean.getCollectionNode();
		params[3]=humidityBean.getCollectionPointId();
		DB db=new DB();
		if(1==db.ExecuteNonQuery(sql, params)){
			return true;
		}
		return false;
	}


}

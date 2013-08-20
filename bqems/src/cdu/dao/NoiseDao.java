package cdu.dao;

import cdu.bean.NoiseBean;
import cdu.utils.DB;

public class NoiseDao {
	
	public boolean add(NoiseBean noiseBean){
		String sql="insert into t_noise (COLLECTIONTIME,COLLECTIONDATA,COLLECTIONNODE,COLLECTIONPOINTID) values (?,?,?,?)";
		Object[] params=new Object[4];
		params[0]=noiseBean.getCollectionTime();
		params[1]=noiseBean.getCollectionData();
		params[2]=noiseBean.getCollectionNode();
		params[3]=noiseBean.getCollectionPointId();
		DB db=new DB();
		if(1==db.ExecuteNonQuery(sql, params)){
			return true;
		}
		return false;
	}
	
	
	

}

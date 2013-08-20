package cdu.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import cdu.bean.WaringBean;
import cdu.utils.DB;

public class WaringDao {

	public void update(WaringBean waringBean){
		String sql="update t_waring set dustmax=?,dustmin=?,humiditymax=?,humiditymin=?,noisemax=?,noisemin=?,pressuremax=?,pressuremin=?,temperaturemax=?,temperaturemin=?" ;
		Object[] params=new Object[10];
		params[0]=waringBean.getDustMax();
		params[1]=waringBean.getDustMin();
		params[2]=waringBean.getHumidityMax();
		params[3]=waringBean.getHumidityMin();
		params[4]=waringBean.getNoiseMax();
		params[5]=waringBean.getNoiseMin();
		params[6]=waringBean.getPressureMax();
		params[7]=waringBean.getPressureMin();
		params[8]=waringBean.getTemperatureMax();
		params[9]=waringBean.getTemperatureMin();
		DB.ExecuteNonQuery(sql, params);
	}

	public List<HashMap<String, Object>> queryWaring() {
		List<HashMap<String,Object>> list=new ArrayList<HashMap<String,Object>>();
		list=DB.ExecuteQuery("select dustmax,dustmin,humiditymax,humiditymin,noisemax,noisemin,pressuremax,pressuremin,temperaturemax,temperaturemin from t_waring");

		return list;
	}

}

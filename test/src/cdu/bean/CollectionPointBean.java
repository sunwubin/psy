package cdu.bean;
/**
 * 数据采集点
 * @author sun
 *
 */
 public class CollectionPointBean {
	 
	 private int collectionPointId;
	 private float longitude;//经度
	 private float latitude;//纬度
	 private String pointName;//采集点名称
	public int getCollectionPointId() {
		return collectionPointId;
	}
	public void setCollectionPointId(int collectionPointId) {
		this.collectionPointId = collectionPointId;
	}
	public float getLongitude() {
		return longitude;
	}
	public void setLongitude(float longitude) {
		this.longitude = longitude;
	}
	public float getLatitude() {
		return latitude;
	}
	public void setLatitude(float latitude) {
		this.latitude = latitude;
	}
	public String getPointName() {
		return pointName;
	}
	public void setPointName(String pointName) {
		this.pointName = pointName;
	}
 }

package cdu.bean;
/**
 * ���ݲɼ���
 * @author sun
 *
 */
 public class CollectionPointBean {
	 
	 private int collectionPointId;
	 private float longitude;//����
	 private float latitude;//γ��
	 private String pointName;//�ɼ�������
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

package cdu.bean;
/**
 * Êª¶È
 * @author sun
 *
 */
public class HumidityBean {
	
	private int humidityId;
	private String collectionTime;
	private float collectionData;
	private String collectionNode;
	private int collectionPointId;
	
	public int getHumidityId() {
		return humidityId;
	}
	public void setHumidityId(int humidityId) {
		this.humidityId = humidityId;
	}
	public int getCollectionPointId() {
		return collectionPointId;
	}
	public void setCollectionPointId(int collectionPointId) {
		this.collectionPointId = collectionPointId;
	}
	public String getCollectionTime() {
		return collectionTime;
	}
	public void setCollectionTime(String collectionTime) {
		this.collectionTime = collectionTime;
	}
	public float getCollectionData() {
		return collectionData;
	}
	public void setCollectionData(float collectionData) {
		this.collectionData = collectionData;
	}
	public String getCollectionNode() {
		return collectionNode;
	}
	public void setCollectionNode(String collectionNode) {
		this.collectionNode = collectionNode;
	}
	

}

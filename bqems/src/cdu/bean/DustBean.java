package cdu.bean;
/**
 * ·Û³¾
 * @author sun
 *
 */
public class DustBean {
	private int dustId;
	private String collectionTime;
	private float collectionData;
	private String collectionNode;
	private int collectionPointId;
	
	public int getDustId() {
		return dustId;
	}
	public void setDustId(int dustId) {
		this.dustId = dustId;
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

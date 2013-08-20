package cdu.bean;
/**
 * ѹǿ
 * @author sun
 *
 */
public class PressureBean {
	
	private int pressureId;
	private String collectionTime;
	private float collectionData;
	private String collectionNode;
	private int collectionPointId;
	public int getPressureId() {
		return pressureId;
	}
	public void setPressureId(int pressureId) {
		this.pressureId = pressureId;
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
	public int getCollectionPointId() {
		return collectionPointId;
	}
	public void setCollectionPointId(int collectionPointId) {
		this.collectionPointId = collectionPointId;
	}

}

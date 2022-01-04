package tag;

import java.sql.Timestamp;

public class TagDTO {
	
	private int no;
	private String checkBox;
	private String tagID;
	private String tagKR;
	private String tagEN;
	private String UOM;
	private String plant;
	private String process;
	private String equip;
	private String tagUse;
	private Timestamp dateTime;
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getCheckBox() {
		return checkBox;
	}
	public void setCheckBox(String checkBox) {
		this.checkBox = checkBox;
	}
	public String getTagID() {
		return tagID;
	}
	public void setTagID(String tagID) {
		this.tagID = tagID;
	}
	public String getTagKR() {
		return tagKR;
	}
	public void setTagKR(String tagKR) {
		this.tagKR = tagKR;
	}
	public String getTagEN() {
		return tagEN;
	}
	public void setTagEN(String tagEN) {
		this.tagEN = tagEN;
	}
	public String getUOM() {
		return UOM;
	}
	public void setUOM(String uOM) {
		UOM = uOM;
	}
	public String getPlant() {
		return plant;
	}
	public void setPlant(String plant) {
		this.plant = plant;
	}
	public String getProcess() {
		return process;
	}
	public void setProcess(String process) {
		this.process = process;
	}
	public String getEquip() {
		return equip;
	}
	public void setEquip(String equip) {
		this.equip = equip;
	}
	public String getTagUse() {
		return tagUse;
	}
	public void setTagUse(String tagUse) {
		this.tagUse = tagUse;
	}
	public Timestamp getDateTime() {
		return dateTime;
	}
	public void setDateTime(Timestamp dateTime) {
		this.dateTime = dateTime;
	}
	public TagDTO(int no, String checkBox, String tagID, String tagKR, String tagEN, String uOM, String plant,
			String process, String equip, String tagUse, Timestamp dateTime) {
		super();
		this.no = no;
		this.checkBox = checkBox;
		this.tagID = tagID;
		this.tagKR = tagKR;
		this.tagEN = tagEN;
		UOM = uOM;
		this.plant = plant;
		this.process = process;
		this.equip = equip;
		this.tagUse = tagUse;
		this.dateTime = dateTime;
	}

	public TagDTO() {
		
	}
}

package com.ics.bean;

public class StaffBean {
	int staffId;
	String staffName;
	String position;
	String image;
	public StaffBean(int staffId, String staffName, String position, String image) {
		super();
		this.staffId = staffId;
		this.staffName = staffName;
		this.position = position;
		this.image = image;
	}
	public StaffBean() {
		super();
	}
	public int getStaffId() {
		return staffId;
	}
	public void setStaffId(int staffId) {
		this.staffId = staffId;
	}
	public String getStaffName() {
		return staffName;
	}
	public void setStaffName(String staffName) {
		this.staffName = staffName;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	
}

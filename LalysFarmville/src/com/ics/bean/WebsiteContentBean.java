package com.ics.bean;

public class WebsiteContentBean {
	public int contentsetnumber;
	public String aboutUs;
	public String mission;
	public String vision;
	public String farmValues;
	public String contactNumber1;
	public String contactNumber2;
	public String welcomeMessage;
	public WebsiteContentBean(int contentsetnumber, String aboutUs, String mission, String vision, String farmValues,
			String contactNumber1, String contactNumber2, String welcomeMessage) {
		super();
		this.contentsetnumber = contentsetnumber;
		this.aboutUs = aboutUs;
		this.mission = mission;
		this.vision = vision;
		this.farmValues = farmValues;
		this.contactNumber1 = contactNumber1;
		this.contactNumber2 = contactNumber2;
		this.welcomeMessage = welcomeMessage;
	}
	public WebsiteContentBean() {
		super();
	}
	public int getContentsetnumber() {
		return contentsetnumber;
	}
	public void setContentsetnumber(int contentsetnumber) {
		this.contentsetnumber = contentsetnumber;
	}
	public String getAboutUs() {
		return aboutUs;
	}
	public void setAboutUs(String aboutUs) {
		this.aboutUs = aboutUs;
	}
	public String getMission() {
		return mission;
	}
	public void setMission(String mission) {
		this.mission = mission;
	}
	public String getVision() {
		return vision;
	}
	public void setVision(String vision) {
		this.vision = vision;
	}
	public String getFarmValues() {
		return farmValues;
	}
	public void setFarmValues(String farmValues) {
		this.farmValues = farmValues;
	}
	public String getContactNumber1() {
		return contactNumber1;
	}
	public void setContactNumber1(String contactNumber1) {
		this.contactNumber1 = contactNumber1;
	}
	public String getContactNumber2() {
		return contactNumber2;
	}
	public void setContactNumber2(String contactNumber2) {
		this.contactNumber2 = contactNumber2;
	}
	public String getWelcomeMessage() {
		return welcomeMessage;
	}
	public void setWelcomeMessage(String welcomeMessage) {
		this.welcomeMessage = welcomeMessage;
	}
	
	
}

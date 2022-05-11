package com.ics.bean;

public class Schedule {
	private int schedule_ID;
	private String course_id;
	private String startDate;
	private String endDate;
	private String time;
	private String slots;
	
	public Schedule(int schedule_ID, String course_id, String startDate, String endDate, String time, String slots) {
		super();
		this.schedule_ID = schedule_ID;
		this.course_id = course_id;
		this.startDate = startDate;
		this.endDate = endDate;
		this.time = time;
		this.slots = slots;
	}
	
	public Schedule(String startDate, String endDate, String time, String slots) {
		super();
		this.startDate = startDate;
		this.endDate = endDate;
		this.time = time;
		this.slots = slots;
	}

	public int getSchedule_ID() {
		return schedule_ID;
	}
	public void setSchedule_ID(int schedule_ID) {
		this.schedule_ID = schedule_ID;
	}
	public String getCourseId() {
		return course_id;
	}
	public void setCourseId(String course_id) {
		this.course_id = course_id;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getSlots() {
		return slots;
	}
	public void setSlots(String slots) {
		this.slots = slots;
	}
	
	
	
}
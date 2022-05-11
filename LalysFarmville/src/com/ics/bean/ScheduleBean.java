package com.ics.bean;

public class ScheduleBean {

	public int scheduleId;
	public String courseId;
	public String startDate;
	public String endDate;
	public int slots;
	public String time;
	
	public ScheduleBean(int scheduleId, String courseId, String startDate, String endDate, int slots, String time) {
		super();
		this.scheduleId = scheduleId;
		this.courseId = courseId;
		this.startDate = startDate;
		this.endDate = endDate;
		this.slots = slots;
		this.time = time;
	}

	public ScheduleBean() {
		super();
	}

	public int getScheduleId() {
		return scheduleId;
	}
	
	public void setScheduleId(int scheduleId) {
		this.scheduleId = scheduleId;
	}
	public String getCourseId() {
		return courseId;
	}
	
	public void setCourseId(String courseId) {
		this.courseId = courseId;
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
	public int getSlots() {
		return slots;
	}
	
	public void setSlots(int slots) {
		this.slots = slots;
	}
}

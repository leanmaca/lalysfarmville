package com.ics.bean;

public class CourseBean {
	int courseId;
	String courseName;
	String courseDesc;
	String image;
	
	public CourseBean() {
		super();
	}

	public CourseBean(int courseId, String courseName, String courseDesc, String image) {
		super();
		this.courseId = courseId;
		this.courseName = courseName;
		this.courseDesc = courseDesc;
		this.image = image;
	}

	public int getCourseId() {
		return courseId;
	}

	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public String getCourseDesc() {
		return courseDesc;
	}

	public void setCourseDesc(String courseDesc) {
		this.courseDesc = courseDesc;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
	
	
}

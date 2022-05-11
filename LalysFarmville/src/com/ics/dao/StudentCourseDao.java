package com.ics.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.ics.bean.StudentBean;

public class StudentCourseDao {
	public void updateStudentCourseStatus(String userId, String status) {
		try {

			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/lalysfarmville", "root",
					"2001may19");
			Statement stat = conn.createStatement();
			stat.execute("UPDATE studentcourse SET status='"+ status +"' WHERE user_id='"+ userId +"'");

		} catch (Exception e) {
			System.out.println(e);
		}
		
	}
	
	public void addStudentGrad(String userId, String status) {
		try {

			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/lalysfarmville", "root",
					"2001may19");
			Statement stat = conn.createStatement();
			stat.execute("UPDATE studentcourse SET status='"+ status +"' WHERE user_id='"+ userId +"'");

		} catch (Exception e) {
			System.out.println(e);
		}
		
	}
	
	public void updateStudentCourse(String userId, String courseId) {
		try {

			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/lalysfarmville", "root",
					"2001may19");
			Statement stat = conn.createStatement();
			stat.execute("UPDATE studentcourse SET course_id="+ courseId +" WHERE user_id='"+ userId +"'");

		} catch (Exception e) {
			System.out.println(e);
		}
		
	}
	
	public void addStudentCourse(String userId, String courseId) {
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/lalysfarmville", "root",
					"2001may19");
			Statement stat = conn.createStatement();
			stat.execute("INSERT INTO studentcourse(user_id, status, course_id) VALUES("+ userId +", 'Pending', "+ courseId +")");

		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	public String getCourseId(String courseName) throws ClassNotFoundException {
		String courseId = null;
		Class.forName("com.mysql.jdbc.Driver");
		try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/lalysfarmville", "root",
				"2001may19");
				PreparedStatement preparedStatement = connection
						.prepareStatement("SELECT * FROM course where course_name = '" + courseName + "'")) {

			ResultSet rs = preparedStatement.executeQuery("SELECT * FROM course where course_name = '" + courseName + "'");
			while (rs.next()) {
				courseId = rs.getString("course_id");
			}
		} catch (Exception p) {
			System.out.println(p);
		}

		return courseId;
	}
	
	public String getGrade(String userId) throws ClassNotFoundException {
		String grade = null;
		Class.forName("com.mysql.jdbc.Driver");
		try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/lalysfarmville", "root",
				"2001may19");
				PreparedStatement preparedStatement = connection
						.prepareStatement("SELECT * FROM studentcourse where user_id = '" + userId + "'")) {

			ResultSet rs = preparedStatement.executeQuery("SELECT * FROM studentcourse where user_id = '" + userId + "'");
			while (rs.next()) {
				grade = rs.getString("status");
			}
		} catch (Exception p) {
			System.out.println(p);
		}

		return grade;
	}
}

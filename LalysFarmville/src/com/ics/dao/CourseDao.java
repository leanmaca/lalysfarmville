package com.ics.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.ics.bean.CourseBean;
import com.ics.bean.LoginBean;
import com.ics.bean.ScheduleBean;

public class CourseDao {
	public String addCourse(String courseName, String courseDesc, String imageFileName) {
    	String userId = null;
    	try {
    		Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/lalysfarmville","root" , "2001may19");
    		Statement stat = conn.createStatement();
    		
    		
    		stat.execute("INSERT INTO course(course_name, course_desc, image) VALUES('"+ courseName +"', '"+ courseDesc +"', '"+ imageFileName +"')");
    		System.out.println("Added course successfully");
    	}
    	catch(Exception e) {
    		
    	}
    	return userId;
    	
    }
	
	public void updateCourse(String courseId, String courseName, String courseDesc) {
		try {

			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/lalysfarmville", "root",
					"2001may19");
			Statement stat = conn.createStatement();
		

			stat.execute("UPDATE course set course_name='"+ courseName +"', course_desc='"+ courseDesc +"' WHERE course_id="+ courseId +"");

		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	public List<CourseBean> selectCourseList(){
		List<CourseBean> course = new ArrayList<>();
		try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/lalysfarmville", "root",
				"2001may19");
				PreparedStatement preparedStatement = connection
						.prepareStatement("SELECT * FROM course")) {

			ResultSet rs = preparedStatement.executeQuery("SELECT * FROM course");
			while (rs.next()) {
				CourseBean courseBean = new CourseBean();
				courseBean.setCourseId(rs.getInt("course_id"));
				courseBean.setCourseName(rs.getString("course_name"));
				courseBean.setCourseDesc(rs.getString("course_desc"));
				courseBean.setImage(rs.getString("image"));
				course.add(courseBean);
				
			}
			//System.out.println(userId);
		} catch (Exception p) {
			System.out.println(p);
		}

		return course;
	}
	
	 public CourseBean selectCourseWithId(String courseId) throws ClassNotFoundException {
	    	CourseBean courseBean = null;
	    	Class.forName("com.mysql.jdbc.Driver");

	        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/lalysfarmville","root", "2001may19");
	            PreparedStatement preparedStatement = connection.prepareStatement("select * from course where course_id="+ courseId +"")) {
	            
			
	            ResultSet rs = preparedStatement.executeQuery();
	            while(rs.next()) {
	            	int course_Id = rs.getInt("course_id");
	            	String courseName = rs.getString("course_name");
	            	String courseDesc = rs.getString("course_desc");
	            	String image = rs.getString("image");
	            	courseBean = new CourseBean(course_Id,  courseName, courseDesc, image);
	            }

	        } catch (SQLException e) {
	            System.out.println("Error Here");
	        }
	        return courseBean;
	        
	    }
}

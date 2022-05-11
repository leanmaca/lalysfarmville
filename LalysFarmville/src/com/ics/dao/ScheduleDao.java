package com.ics.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.ics.bean.Schedule;
import com.ics.bean.ScheduleBean;
import com.ics.bean.StudentBean;

public class ScheduleDao {
	public void updateSchedule(int schedule_id, String course_id, String startDate, String endDate, String time, String slots) {
		try {

			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/lalysfarmville", "root",
					"2001may19");
			Statement stat = conn.createStatement();
			Statement stat2 = conn.createStatement();

			stat.execute("UPDATE schedule SET course_id='"+ course_id +"', startDate='"+ startDate +"', endDate='"+ endDate +"', time='"+ time +"', slots="+ slots +" WHERE schedule_id='"+ schedule_id +"'");

		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	public boolean checkScheduleAvailable(String scheduleId) throws ClassNotFoundException {
		boolean status = false;

        Class.forName("com.mysql.jdbc.Driver");

        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/lalysfarmville","root", "2001may19");
            PreparedStatement preparedStatement = connection.prepareStatement("select * from schedule where schedule_id="+ scheduleId +"")) {
            

            ResultSet rs = preparedStatement.executeQuery();
            status = rs.next();

        } catch (Exception e) {
            // process sql exception
        	System.out.println(e);
        }
        return status;
	}
	
	public ScheduleBean selectSchedule(String scheduleid) {
		ScheduleBean schedule = null;
		try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/lalysfarmville", "root",
				"2001may19");
				PreparedStatement preparedStatement = connection
						.prepareStatement("select * from schedule where schedule_id = " + scheduleid + "")) {

			ResultSet rs = preparedStatement.executeQuery("select * from schedule where schedule_id = " + scheduleid + "");
			while (rs.next()) {
				int scheduleId = rs.getInt("schedule_id");
				String course_id = rs.getString("course_id");
				String startDate = rs.getString("startDate");
				String endDate = rs.getString("endDate");
				String time = rs.getString("time");
				int slots = rs.getInt("slots");
				schedule = new ScheduleBean(scheduleId, course_id, startDate, endDate, slots, time);
			}
			
		} catch (Exception p) {
			System.out.println(p);
		}

		return schedule;
	}
	
	public void addSchedule(String course_id, String startDate, String endDate, String time, String slots) {
		try {

			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/lalysfarmville", "root",
					"2001may19");
			Statement stat = conn.createStatement();
			stat.execute("INSERT INTO schedule(course_id, startDate, endDate, time, slots) VALUES('"+ course_id +"','"+ startDate +"','"+ endDate +"','"+ time +"', "+ slots +")");

		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	public List<ScheduleBean> selectScheduleList(){
		List<ScheduleBean> schedule = new ArrayList<>();
		try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/lalysfarmville", "root",
				"2001may19");
				PreparedStatement preparedStatement = connection
						.prepareStatement("SELECT * FROM schedule")) {

			ResultSet rs = preparedStatement.executeQuery("SELECT * FROM schedule");
			while (rs.next()) {
				// System.out.println(rs.getString("student_fname"));
				ScheduleBean scheduleBean = new ScheduleBean();
				scheduleBean.setScheduleId(rs.getInt("schedule_id"));
				scheduleBean.setCourseId(rs.getString("course_id"));
				scheduleBean.setStartDate(rs.getString("startDate"));
				scheduleBean.setEndDate(rs.getString("endDate"));
				scheduleBean.setTime(rs.getString("time"));
				scheduleBean.setSlots(rs.getInt("slots"));
				schedule.add(scheduleBean);
				
			}
			//System.out.println(userId);
		} catch (Exception p) {
			System.out.println(p);
		}

		return schedule;
	}
}

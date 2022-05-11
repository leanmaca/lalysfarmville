package com.ics.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.ics.bean.StaffBean;
import com.ics.bean.WebsiteContentBean;

public class StaffDao {
	public List<StaffBean> selectStaff() throws ClassNotFoundException {
		List<StaffBean> staff = new ArrayList<>();
		Class.forName("com.mysql.jdbc.Driver");
		try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/lalysfarmville", "root",
				"2001may19");
				PreparedStatement preparedStatement = connection
						.prepareStatement("select * from staff")) {

			ResultSet rs = preparedStatement.executeQuery("select * from staff");
			while (rs.next()) {
				StaffBean staffBean = new StaffBean();
				 staffBean.setStaffId(rs.getInt("staff_id"));
				 staffBean.setStaffName(rs.getString("staffname"));
				 staffBean.setPosition(rs.getString("staffposition"));
				 staffBean.setImage(rs.getString("image"));
				 staff.add(staffBean);
			}
			//System.out.println();
		} catch (Exception p) {
			System.out.println(p);
		}

		return staff;
	}
	
	public void addStaff(String staffName, String position, String imageFileName) {
    
    	try {
    		Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/lalysfarmville","root" , "2001may19");
    		Statement stat = conn.createStatement();
    		
    		
    		stat.execute("INSERT INTO staff(staffname, staffposition, image) VALUES('"+ staffName +"', '"+ position +"', '"+ imageFileName +"')");
    		System.out.println("Added staff successfully");
    	}
    	catch(Exception e) {
    		
    	}
    	
    	
    }
	
	public void updateStaff(String staffId, String staffName, String position) {
		try {

			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/lalysfarmville", "root",
					"2001may19");
			Statement stat = conn.createStatement();
		

			stat.execute("UPDATE staff set staffname='"+ staffName +"', staffposition='"+ position +"' WHERE staff_id="+ staffId +"");

		} catch (Exception e) {
			System.out.println(e);
		}
	}
}

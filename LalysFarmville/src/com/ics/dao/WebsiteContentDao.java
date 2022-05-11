package com.ics.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.ics.bean.WebsiteContentBean;

public class WebsiteContentDao {
	public WebsiteContentBean selectContent() throws ClassNotFoundException {
		WebsiteContentBean content = null;
		Class.forName("com.mysql.jdbc.Driver");
		try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/lalysfarmville", "root",
				"2001may19");
				PreparedStatement preparedStatement = connection
						.prepareStatement("select * from websitecontent where contentsetnumber = '1'")) {

			ResultSet rs = preparedStatement.executeQuery("select * from websitecontent where contentsetnumber = '1'");
			while (rs.next()) {
				 int contentsetnumber = rs.getInt("contentsetnumber");
				 String aboutUs = rs.getString("aboutus");
				 String mission = rs.getString("mission");
				 String vision = rs.getString("vision");
				 String farmValues = rs.getString("farmvalues");
				 String contactNumber1 = rs.getString("contactnumber1");
				 String contactNumber2 = rs.getString("contactnumber2");
				 String welcomeMessage = rs.getString("welcomemessage");
				content = new WebsiteContentBean(contentsetnumber, aboutUs, mission, vision, farmValues, contactNumber1, contactNumber2, welcomeMessage);
			}
			//System.out.println();
		} catch (Exception p) {
			System.out.println(p);
		}

		return content;
	}
	
	public void updateContent(String welcomeMessage, String aboutUs, String mission, String vision, String farmValues, String contact1, String contact2) {
		try {

			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/lalysfarmville", "root",
					"2001may19");
			Statement stat = conn.createStatement();
		

			stat.execute("UPDATE websitecontent set welcomemessage=\""+ welcomeMessage +"\", aboutus=\""+ aboutUs +"\", mission=\""+ mission +"\", vision=\""+ vision +"\", farmvalues=\""+ farmValues +"\", contactnumber1=\""+ contact1 +"\", contactnumber2=\""+ contact2 +"\" WHERE contentsetnumber=1");

		} catch (Exception e) {
			System.out.println(e);
		}
	}
}

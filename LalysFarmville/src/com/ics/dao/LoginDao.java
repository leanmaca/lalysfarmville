package com.ics.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.ics.bean.LoginBean;
import com.ics.servlet.Security;


public class LoginDao {
    public boolean validate(LoginBean loginBean) throws ClassNotFoundException {
        boolean status = false;

        Class.forName("com.mysql.jdbc.Driver");

        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/lalysfarmville","root", "2001may19");
            PreparedStatement preparedStatement = connection.prepareStatement("select * from loginaccount where username = ? and password = ? ")) {
            preparedStatement.setString(1, loginBean.getUsername());
            preparedStatement.setString(2, Security.encrypt(loginBean.getPassword()));

            ResultSet rs = preparedStatement.executeQuery();
            status = rs.next();

        } catch (SQLException e) {
            // process sql exception
            printSQLException(e);
        }
        return status;
    }
    
    public boolean checkUsername(String username) throws ClassNotFoundException {
    	Class.forName("com.mysql.jdbc.Driver");
    	boolean status = false;
        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/lalysfarmville","root", "2001may19");
            PreparedStatement preparedStatement = connection.prepareStatement("select * from loginaccount where username='"+ username +"'")) {
            
		
            ResultSet rs = preparedStatement.executeQuery();
            status = rs.next();

        } catch (SQLException e) {
            // process sql exception
            printSQLException(e);
        }
        return status;
    }
    
    public LoginBean selectLoginWithId(String userId) throws ClassNotFoundException {
    	LoginBean login = null;
    	Class.forName("com.mysql.jdbc.Driver");

        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/lalysfarmville","root", "2001may19");
            PreparedStatement preparedStatement = connection.prepareStatement("select * from loginaccount where user_id='"+ userId +"'")) {
            
		
            ResultSet rs = preparedStatement.executeQuery();
            while(rs.next()) {
            	int userNumber = rs.getInt("usernumber");
            	String userName = rs.getString("username");
            	String userId1 = rs.getString("user_id");
            	
            	String userType = rs.getString("userType");
            	login = new LoginBean(userName,  userType, userNumber, userId1);
            }

        } catch (SQLException e) {
            // process sql exception
            printSQLException(e);
        }
        return login;
        
    }
    public LoginBean selectLoginWithUsername(String username) throws ClassNotFoundException {
    	LoginBean login = null;
    	Class.forName("com.mysql.jdbc.Driver");

        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/lalysfarmville","root", "2001may19");
            PreparedStatement preparedStatement = connection.prepareStatement("select * from loginaccount where username='"+ username +"'")) {
            
		
            ResultSet rs = preparedStatement.executeQuery();
            while(rs.next()) {
            	int userNumber = rs.getInt("usernumber");
            	String userName = rs.getString("username");
            	String userId1 = rs.getString("user_id");
            	String password = rs.getString("password");
            	String userType = rs.getString("userType");
            	login = new LoginBean(userName, password, userType, userNumber, userId1);
            }

        } catch (SQLException e) {
            // process sql exception
            printSQLException(e);
        }
        return login;
        
    }
    public String addLogin(String username, String password) {
    	String userId = null;
    	try {
    		Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/lalysfarmville","root" , "2001may19");
    		Statement stat = conn.createStatement();
    		Statement stat3 = conn.createStatement();
    		String selectQuery2 = "SELECT * FROM student ORDER BY user_id DESC LIMIT 1";
    		ResultSet rs2 = stat.executeQuery(selectQuery2);
    		while(rs2.next()) {
    			userId = rs2.getString("user_id");
    		}
    		stat3.execute("INSERT INTO loginaccount(username, password, user_id, userType) VALUES('"+ username +"','"+ password +"',"+ userId +",'student')");
    		
    	}
    	catch(Exception e) {
    		
    	}
    	return userId;
    	
    }
    
    private void printSQLException(SQLException ex) {
        for (Throwable e: ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
    
    
}
package com.ics.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import com.ics.bean.LoginBean;
import com.ics.bean.StudentBean;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ics.bean.LoginBean;
import com.ics.dao.LoginDao;
import com.ics.dao.StudentCourseDao;
import com.ics.dao.StudentDao;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    	PrintWriter out = response.getWriter();
    	String userId = null;
    	String userType = "null";
    	int userNumber = 0;
    	String username = request.getParameter("username");
        String password = request.getParameter("password");
        LoginDao loginDao = new LoginDao();
        LoginBean loginBean = new LoginBean();
        StudentDao studentDao = new StudentDao();
        StudentBean studentBean = new StudentBean();
        StudentCourseDao scDao = new StudentCourseDao();
        loginBean.setUsername(username);
        loginBean.setPassword(password);
        
        String statusMessage = null;
        Boolean scheduleCheck = false;
        Boolean resultCheck = false;
        String grade = null;
        String message = null;
        HttpSession session = request.getSession();
        
        try {
			System.out.println("Status: " + loginDao.validate(loginBean));
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
        try {
        	
            if (loginDao.validate(loginBean)) {
            	request.setAttribute("error", "");
            	try {
        			loginBean = loginDao.selectLoginWithUsername(username);
        			userType = loginBean.getUserType();
        		} catch (ClassNotFoundException e) {
        			// TODO Auto-generated catch block
        			e.printStackTrace();
        		}
                if(userType.equals("admin")){
                	List<StudentBean> studentList = studentDao.selectStudentList();
                	List<StudentBean> studentListPending = studentDao.selectStudentListPending();
                	session.setAttribute("studentList", studentList);
                	session.setAttribute("studentListPending", studentListPending);
                	session.setAttribute("loginbean",loginBean);
                    session.setAttribute("username",username);
                    session.setAttribute("message", message);
                	System.out.println("Admin");
                	response.sendRedirect("adminhomepage.jsp");
                }
                else {
                	studentBean = studentDao.selectStudent(loginBean.getUserId());
                	session.setAttribute("studentloginbean",loginBean);
                    session.setAttribute("username",username);
                    session.setAttribute("studentBean", studentBean);
                    if(studentBean.getStatus().equals("Approved (No schedule)")) {
                    	statusMessage = "Schedule is still pending";
                    	scheduleCheck = false;
                    }
                    else if (studentBean.getStatus().equals("Approved (Active with schedule)") ) {
                    	statusMessage = "Schedule available. You can see your schedule in view schedule page.";
                    	scheduleCheck = true;
                    }
                    else if (studentBean.getStatus().equals("Finished Course") ) {
                    	statusMessage = "You have finished your course. Your result is shown below";
                    	resultCheck = true;
                    	scheduleCheck = true;
                    	grade = scDao.getGrade(Integer.toString(studentBean.getUserID()));
                    	System.out.println(grade);
                    	session.setAttribute("grade", grade);
                    }
                    else {
                    	statusMessage = "Pending Approval";
                    	
                    }
                    session.setAttribute("resultCheck", resultCheck);
                    session.setAttribute("scheduleCheck", scheduleCheck);
                    session.setAttribute("statusMessage", statusMessage);
                	System.out.println("Student");
                	response.sendRedirect("student.jsp");
                }
            } else {
            	session.setAttribute("message", "check");
            	session.setAttribute("error", "Incorrect username or password");
                response.sendRedirect("Login.jsp");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
package com.ics.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ics.bean.LoginBean;
import com.ics.bean.StudentBean;
import com.ics.dao.LoginDao;
import com.ics.dao.StudentDao;

/**
 * Servlet implementation class ObjectPass
 */
@WebServlet("/ObjectPass")
public class ObjectPass extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ObjectPass() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String adminId = request.getParameter("adminid");
		String loginId = request.getParameter("loginid");
		String goTo = request.getParameter("pagename");
		String userId = request.getParameter("userid");
		String userType = "null";
		int userNumber = 0;
		String username = null;
		String usernameQuery = request.getParameter("username");
		String password = request.getParameter("password");
		System.out.println("LoginId=" + loginId);
		//System.out.println(usernameQuery);

		StudentBean student = new StudentBean();
		StudentDao studentDao = new StudentDao();

		try {
			student = studentDao.selectStudent(userId);
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		System.out.println(student.getStudentFName());

		LoginBean loginBean = new LoginBean();
		LoginDao loginDao = new LoginDao();
		try {
			loginBean = loginDao.selectLoginWithId(loginId);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String message = null;
		System.out.println(loginBean.getUsername());
		HttpSession session = request.getSession();
		session.setAttribute("loginbean", loginBean);
		session.setAttribute("student", student);
		session.setAttribute("message", message);
		String jspSend = null;
		System.out.println(goTo);
		if (goTo.equals("viewStudent")) {
			jspSend = "adminviewstudent.jsp";
		} else if (goTo.equals("editStudent")) {
			jspSend = "EditStudent.jsp";
		} else if (goTo.equals("viewSchedule")) {
			jspSend = "viewstudentschedule.jsp";
		} else if (goTo.equals("gradestudent")) {
			jspSend = "gradestudent.jsp";
		}
		
		response.sendRedirect(jspSend);
	}

}

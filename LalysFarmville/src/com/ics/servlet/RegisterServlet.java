package com.ics.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ics.bean.LoginBean;
import com.ics.bean.StudentBean;
import com.ics.dao.LoginDao;
import com.ics.dao.StudentCourseDao;
import com.ics.dao.StudentDao;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		Date currentDate = new Date();
		java.sql.Date sqlDate = new java.sql.Date(currentDate.getTime());
		PrintWriter out = response.getWriter();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String firstName = request.getParameter("firstname");
		String middleName = request.getParameter("middlename");
		String lastName = request.getParameter("lastname");
		String streetNumber = request.getParameter("streetnumber");
		String barangay = request.getParameter("barangay");
		String district = request.getParameter("district");
		String cityMunicipality = request.getParameter("citymunicipality");
		String province = request.getParameter("province");
		String region = request.getParameter("region");
		String emailAddress = request.getParameter("emailadd");
		String contactNo = request.getParameter("contactno");
		String nationality = request.getParameter("nationality");
		String sex = request.getParameter("sex");
		String civilStatus = request.getParameter("civilstatus");
		String employmentStatus = request.getParameter("employmentstatus");
		String birthDate = request.getParameter("birthdate");
		String birthPlace = request.getParameter("birthplace");
		String educAttain = request.getParameter("educattain");
		String parentLName = request.getParameter("parentlname");
		String parentFName = request.getParameter("parentfname");
		String parentMName = request.getParameter("parentmname");
		String parentAddress = request.getParameter("parentaddress");
		String studentClassification1 = request.getParameter("studentclassification1");
		String studentClassification2 = request.getParameter("studentclassification2");
		String disabilityType = request.getParameter("disabilitytype");
		String takeNCAE = request.getParameter("ncaetake");
		String whereNCAE = request.getParameter("ncaewhere");
		String whenNCAE = request.getParameter("ncaewhen");
		String course = request.getParameter("course");
		String multipleDisability = request.getParameter("multipledisability");

		String disabilityInput;
		String userId = null;
		if (disabilityType == null) {
			disabilityInput = multipleDisability;
		} else {
			disabilityInput = disabilityType;
		}
		String studentClassification = null;
		if (studentClassification2 == null) {
			studentClassification = studentClassification1;
		}	else {
			studentClassification = studentClassification2;
		}

		HttpSession session = request.getSession();
		Security sec = new Security();
		LoginDao loginDao = new LoginDao();
		LoginBean loginBean = new LoginBean();
		StudentDao studentDao = new StudentDao();
		StudentBean student = new StudentBean();
		StudentCourseDao scDao = new StudentCourseDao();
		
		try {
			if (loginDao.checkUsername(username) == false) {
				studentDao.addStudent(firstName, lastName, middleName, streetNumber, barangay, district, province,
						region, emailAddress, contactNo, nationality, sex, civilStatus, employmentStatus, birthDate,
						birthPlace, educAttain, parentLName, parentFName, parentMName, parentAddress,
						studentClassification, disabilityInput, takeNCAE, course, sqlDate, whenNCAE, whereNCAE,
						cityMunicipality);
				userId = loginDao.addLogin(username, Security.encrypt(password));
				System.out.println("UserId: " + userId);
				loginBean = loginDao.selectLoginWithUsername(username);
				session.setAttribute("studentloginbean", loginBean);
				
				student = studentDao.selectStudent(userId);
				session.setAttribute("studentBean", student);
				session.setAttribute("scheduleCheck", false);
				String courseIdQuery = studentDao.selectStudentCourse(userId);
				String courseId = scDao.getCourseId(courseIdQuery);
				System.out.println("CourseId: " + courseId);
				session.setAttribute("statusMessage", "Pending Approval");
				scDao.addStudentCourse(userId, courseId);
				response.sendRedirect("student.jsp");
			} else {
				request.setAttribute("ErrorCheck", "check");
				request.setAttribute("error", "Invalid username or password");
				request.getRequestDispatcher("register.jsp").forward(request, response);

			}

		} catch (Exception e) {
			System.out.println(e);
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}
}

package com.ics.servlet;

import java.io.IOException;
import java.io.PrintWriter;
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
import com.ics.dao.ScheduleDao;
import com.ics.dao.StudentCourseDao;
import com.ics.dao.StudentDao;

/**
 * Servlet implementation class EditServlet
 */
@WebServlet("/EditServlet")
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String passAdminUserId = request.getParameter("adminid");
		String passUsername = null;
		String passPassword = null;
		int passUserNumber;
		String passUserType = null;
		String passedUserId = request.getParameter("userid");
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
		String whenNCAE = request.getParameter("ncaewhen");
		String whereNCAE = request.getParameter("ncaewhere");
		String course = request.getParameter("course");
		String scheduleId = request.getParameter("schedulecode");
		String multipleDisability = request.getParameter("multipledisability");
		String status = request.getParameter("studentstatus");
		String scholarship = request.getParameter("scholarship");
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
		
		StudentDao studentDao = new StudentDao();
		
		String courseId = "0";
		if(course.equals("Organic Agriculture Production NC II")) {
			courseId = "1";
		}
		else if(course.equals("Production of High-Quality Inbred Rice and Seed Certification, and Farm Mechanization")) {
			courseId = "2";
		}
		StudentCourseDao scDao = new StudentCourseDao();
		scDao.updateStudentCourse(passedUserId, courseId);
		LoginBean loginBean = new LoginBean();
		LoginDao loginDao = new LoginDao();
		StudentBean student = new StudentBean();
		ScheduleDao scheduleDao = new ScheduleDao();
		HttpSession session = request.getSession();
		try {
	
			studentDao.updateStudent(firstName, lastName, middleName, streetNumber, barangay, district, province, region,
					emailAddress, contactNo, nationality, sex, civilStatus, employmentStatus, birthDate, birthPlace,
					educAttain, parentLName, parentFName, parentMName, parentAddress, studentClassification,
					disabilityInput, takeNCAE, course, scholarship, scheduleId, status, passedUserId, whenNCAE,
					whereNCAE, cityMunicipality);
			scDao.updateStudentCourse(passedUserId, courseId);
			loginBean = loginDao.selectLoginWithId(passAdminUserId);
			student = studentDao.selectStudent(passedUserId);
			session.setAttribute("message", "Student successfully edited");
			session.setAttribute("loginbean", loginBean);
			session.setAttribute("student", student);
			
		
		
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		response.sendRedirect("EditStudent.jsp");
		
		
		
	}

}

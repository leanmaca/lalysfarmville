package com.ics.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ics.bean.CourseBean;
import com.ics.bean.LoginBean;
import com.ics.bean.ProductsBean;
import com.ics.bean.ScheduleBean;
import com.ics.bean.StaffBean;
import com.ics.bean.StudentBean;
import com.ics.bean.WebsiteContentBean;
import com.ics.dao.CourseDao;
import com.ics.dao.LoginDao;
import com.ics.dao.ProductsDao;
import com.ics.dao.ScheduleDao;
import com.ics.dao.StaffDao;
import com.ics.dao.StudentDao;
import com.ics.dao.WebsiteContentDao;

/**
 * Servlet implementation class LoginSessionPass
 */
@WebServlet("/LoginSessionPass")
public class LoginSessionPass extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginSessionPass() {
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
		PrintWriter out = response.getWriter();
		String userId = request.getParameter("adminid");
		String studentUserId = request.getParameter("studentid");
		String userType = "null";
		int userNumber = 0;
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String message = null;
		String nextPage = request.getParameter("nextpage");

		LoginBean loginBean = new LoginBean();
		LoginBean studentLoginBean = new LoginBean();
		StudentBean student = new StudentBean();
		LoginDao loginDao = new LoginDao();
		StudentDao studentDao = new StudentDao();
		ScheduleDao scheduleDao = new ScheduleDao();
		HttpSession session = request.getSession();
		try {
			loginBean = loginDao.selectLoginWithId(userId);
			studentLoginBean = loginDao.selectLoginWithId(studentUserId);
			int scheduleId = studentDao.selectStudentSchedule(studentUserId);
			String queryScheduleId = Integer.toString(scheduleId);
			ScheduleBean schedule = scheduleDao.selectSchedule(queryScheduleId);
			List<StudentBean> studentList = studentDao.selectStudentList();
			List<StudentBean> studentListPending = studentDao.selectStudentListPending();
			List<ScheduleBean> scheduleList = scheduleDao.selectScheduleList();
			session.setAttribute("message", message);
			session.setAttribute("studentList", studentList);
			session.setAttribute("studentListPending", studentListPending);
			session.setAttribute("scheduleList", scheduleList);
			session.setAttribute("scheduleBean", schedule);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		session.setAttribute("loginbean", loginBean);
		session.setAttribute("studentloginbean", studentLoginBean);
		// System.out.println(nextPage);
		if (nextPage.equals("addstudent")) {
			response.sendRedirect("addstudent.jsp");
			System.out.println("add student to pupunta");
		} else if (nextPage.equals("logout")) {
			response.sendRedirect("Login.jsp");
		} else if (nextPage.equals("viewschedule")) {
			response.sendRedirect("adminviewschedule.jsp");
		} else if (nextPage.equals("studentmanagement")) {
			response.sendRedirect("adminhomepage.jsp");
		} else if (nextPage.equals("report")) {
			response.sendRedirect("report.jsp");
		} else if (nextPage.equals("addschedule")) {
			response.sendRedirect("addschedule.jsp");
		} else if (nextPage.equals("courses")) {
			CourseBean courseBean = new CourseBean();
			CourseDao courseDao = new CourseDao();
			List<CourseBean> courseList = courseDao.selectCourseList();
			session.setAttribute("courselist", courseList);
			response.sendRedirect("adminviewcourses.jsp");
		} else if (nextPage.equals("viewstudentschedule")) {
			try {
				student = studentDao.selectStudent(studentUserId);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			session.setAttribute("studentbean", student);
			response.sendRedirect("viewschedulestudent.jsp");
		} else if (nextPage.equals("studentviewprofile")) {
			response.sendRedirect("student.jsp");
		} else if (nextPage.equals("addcourse")) {
			response.sendRedirect("addcourse.jsp");
		} else if (nextPage.equals("websitecontent")) {
			WebsiteContentBean content = new WebsiteContentBean();
			WebsiteContentDao wcDao = new WebsiteContentDao();
			StaffBean staff = null;
			StaffDao staffDao = new StaffDao();
			ProductsBean products = null;
			ProductsDao productsDao = new ProductsDao();
			
			try {
				content = wcDao.selectContent();
				List<StaffBean> staffList = staffDao.selectStaff();
				List<ProductsBean>productsList = productsDao.selectProducts();
				session.setAttribute("productslist", productsList);
				session.setAttribute("stafflist", staffList);


			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			session.setAttribute("content", content);
			response.sendRedirect("homeform.jsp");
		}
	}

}

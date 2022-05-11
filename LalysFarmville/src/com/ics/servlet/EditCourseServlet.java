package com.ics.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ics.bean.CourseBean;
import com.ics.bean.LoginBean;
import com.ics.bean.ScheduleBean;
import com.ics.dao.CourseDao;
import com.ics.dao.LoginDao;
import com.ics.dao.ScheduleDao;

/**
 * Servlet implementation class EditCourseServlet
 */
@WebServlet("/EditCourseServlet")
public class EditCourseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditCourseServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String passedCourseId = request.getParameter("courseid");
		String passedUserId = request.getParameter("adminid");
		String courseId = request.getParameter("courseid");
		String courseName = request.getParameter("coursename");
		String courseDesc = request.getParameter("coursedesc");
		ScheduleBean scheduleBean = new ScheduleBean();
		LoginBean loginBean = new LoginBean();
		LoginDao loginDao = new LoginDao();
		ScheduleDao scheduleDao = new ScheduleDao();
		CourseBean courseBean = new CourseBean();
		CourseDao courseDao = new CourseDao();
		HttpSession session = request.getSession();
		try {
			loginBean = loginDao.selectLoginWithId(passedUserId);
			courseDao.updateCourse(courseId, courseName, courseDesc);
			courseBean = courseDao.selectCourseWithId(passedCourseId);
			session.setAttribute("message", "Course edited successfully");
			session.setAttribute("loginbean", loginBean);
			session.setAttribute("coursebean", courseBean);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("editcourse.jsp");
		
	}

}

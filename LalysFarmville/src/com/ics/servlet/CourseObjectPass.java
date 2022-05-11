package com.ics.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ics.bean.CourseBean;
import com.ics.bean.LoginBean;
import com.ics.bean.ScheduleBean;
import com.ics.bean.StudentBean;
import com.ics.dao.CourseDao;
import com.ics.dao.LoginDao;
import com.ics.dao.ScheduleDao;
import com.ics.dao.StudentDao;

/**
 * Servlet implementation class CourseObjectPass
 */
@WebServlet("/CourseObjectPass")
public class CourseObjectPass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CourseObjectPass() {
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
		String passedUserId = request.getParameter("userid");
		String goTo = request.getParameter("pagename");
		LoginBean loginBean = new LoginBean();
		LoginDao loginDao = new LoginDao();	
		HttpSession session = request.getSession();
		CourseDao courseDao = new CourseDao();
		CourseBean courseBean = new CourseBean();
		String message = null;
		try {
			loginBean = loginDao.selectLoginWithId(passedUserId);
			courseBean = courseDao.selectCourseWithId(passedCourseId);
			session.setAttribute("message", message);
			session.setAttribute("loginbean", loginBean);
			session.setAttribute("coursebean", courseBean);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
		String jspSend = null;
		System.out.println(goTo);
		if(goTo.equals("editcourse")) {
			jspSend = "editcourse.jsp";
		}
		
		response.sendRedirect(jspSend);
	}

}

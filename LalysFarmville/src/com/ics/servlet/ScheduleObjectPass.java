package com.ics.servlet;

import java.io.IOException;
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

import com.ics.bean.LoginBean;
import com.ics.bean.ScheduleBean;
import com.ics.bean.StudentBean;
import com.ics.dao.LoginDao;
import com.ics.dao.ScheduleDao;
import com.ics.dao.StudentDao;

/**
 * Servlet implementation class ScheduleObjectPass
 */
@WebServlet("/ScheduleObjectPass")
public class ScheduleObjectPass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ScheduleObjectPass() {
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
		String passedScheduleId = request.getParameter("scheduleid");
		String passedUserId = request.getParameter("userid");
		String goTo = request.getParameter("pagename");
		ScheduleBean scheduleBean = new ScheduleBean();
    	String userType = "null";
    	int userNumber = 0;
    	String username = null;
    	String password = null;
    	//String usernameQuery = request.getParameter("username");
        //String password = request.getParameter("password");
        //System.out.println("Dito");
       // System.out.println(usernameQuery);
        //String nextPage = request.getParameter("nextpage");
		LoginBean loginBean = new LoginBean();
		LoginDao loginDao = new LoginDao();
		ScheduleDao scheduleDao = new ScheduleDao();
		StudentDao studentDao = new StudentDao();
		StudentBean student = new StudentBean();
		HttpSession session = request.getSession();
		try {
			loginBean = loginDao.selectLoginWithId(passedUserId);
			scheduleBean = scheduleDao.selectSchedule(passedScheduleId);
			List<ScheduleBean> scheduleList = scheduleDao.selectScheduleList();
			session.setAttribute("scheduleList", scheduleList);
			session.setAttribute("loginbean", loginBean);
			session.setAttribute("scheduleBean", scheduleBean);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
		String jspSend = null;
		System.out.println(goTo);
		if(goTo.equals("editschedule")) {
			jspSend = "editschedule.jsp";
		}
		else if(goTo.equals("editStudent")) {
			jspSend = "EditStudent.jsp";
		}
		else if(goTo.equals("viewSchedule")) {
			jspSend = "viewstudentschedule.jsp";
		}
		else if(goTo.equals("scheduledetails")) {
			try {
				List<StudentBean> studentList = studentDao.selectStudentScheduleList(passedScheduleId);
				session.setAttribute("studentlist", studentList);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			jspSend = "scheduledetails.jsp";
		}
		response.sendRedirect(jspSend);
	}

}

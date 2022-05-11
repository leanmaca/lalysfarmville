package com.ics.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ics.bean.LoginBean;
import com.ics.bean.ScheduleBean;
import com.ics.dao.LoginDao;
import com.ics.dao.ScheduleDao;

/**
 * Servlet implementation class AddScheduleServlet
 */
@WebServlet("/AddScheduleServlet")
public class AddScheduleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddScheduleServlet() {
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
		String userId = request.getParameter("adminid");
		String scheduleId = request.getParameter("scheduleid");
		String courseId = request.getParameter("courseid");
		String startDate = request.getParameter("startdate");
		String endDate = request.getParameter("enddate");
		String time = request.getParameter("time");
		String slots = request.getParameter("slots");
		String message = null;
		LoginBean loginBean = new LoginBean();
		LoginDao loginDao = new LoginDao();
		ScheduleDao scheduleDao = new ScheduleDao();
		HttpSession session = request.getSession();
		try {
			loginBean = loginDao.selectLoginWithId(userId);
			scheduleDao.addSchedule(courseId, startDate, endDate, time, slots);
			List<ScheduleBean> scheduleList = scheduleDao.selectScheduleList();
			message = "Successfully added schedule!";
			session.setAttribute("message", message);
			session.setAttribute("scheduleList", scheduleList);
			session.setAttribute("loginBean", loginBean);
			response.sendRedirect("addschedule.jsp");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}

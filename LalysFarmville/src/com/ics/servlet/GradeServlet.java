package com.ics.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ics.bean.LoginBean;
import com.ics.dao.LoginDao;
import com.ics.dao.StudentCourseDao;

/**
 * Servlet implementation class GradeServlet
 */
@WebServlet("/GradeServlet")
public class GradeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GradeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String loginId = request.getParameter("loginid");
		String studentId = request.getParameter("userid");
		String newStatus = request.getParameter("coursestatus");
		LoginBean loginBean = new LoginBean();
		LoginDao loginDao = new LoginDao();
		StudentCourseDao scDao = new StudentCourseDao();
		try {
			loginBean = loginDao.selectLoginWithId(loginId);
			scDao.updateStudentCourseStatus(studentId, newStatus);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		HttpSession session = request.getSession();
		session.setAttribute("message", "Completion Status Updated Successfully");
		session.setAttribute("loginBean", loginBean);
		response.sendRedirect("gradestudent.jsp");
		
		
		
		
	}

}

package com.ics.servlet;

import java.io.IOException;
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

/**
 * Servlet implementation class GraduateTraceServlet
 */
@WebServlet("/GraduateTraceServlet")
public class GraduateTraceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GraduateTraceServlet() {
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
		String userId = request.getParameter("studentid");
		String company = request.getParameter("company");
		String salaryMin = request.getParameter("salarymin");
		String salaryMax = request.getParameter("salarymax");
		StudentBean student = new StudentBean();
		LoginBean loginBean = new LoginBean();
		StudentDao studentDao = new StudentDao();
		LoginDao loginDao = new LoginDao();
		StudentCourseDao scDao = new StudentCourseDao();
		String grade = null;
		
		studentDao.updateCompany(company, salaryMin, salaryMax, userId);
		
		try {
			student = studentDao.selectStudent(userId);
			loginBean = loginDao.selectLoginWithId(userId);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		HttpSession session = request.getSession();
		String statusMessage = null;
		 Boolean scheduleCheck = false;
	        Boolean resultCheck = false;
		if(student.getStatus().equals("Approved (No schedule)")) {
        	statusMessage  = "Schedule is still pending";
        	scheduleCheck = false;
        }
        else if (student.getStatus().equals("Approved (Active with schedule)") ) {
        	statusMessage = "Schedule available. You can see your schedule in view schedule page.";
        	scheduleCheck = true;
        }
        else if (student.getStatus().equals("Finished Course") ) {
        	statusMessage = "You have finished your course. Your result is shown below";
        	resultCheck = true;
        	scheduleCheck = true;
        	try {
				grade = scDao.getGrade(Integer.toString(student.getUserID()));
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        	System.out.println(grade);
        	session.setAttribute("grade", grade);
        }
        else {
        	statusMessage = "Pending Approval";
        
        }
        session.setAttribute("resultCheck", resultCheck);
        session.setAttribute("scheduleCheck", scheduleCheck);
        session.setAttribute("statusMessage", statusMessage);
		session.setAttribute("studentloginbean", loginBean);
		session.setAttribute("studentBean", student);
		System.out.println(student.getCompany());
		response.sendRedirect("student.jsp");
	}

}

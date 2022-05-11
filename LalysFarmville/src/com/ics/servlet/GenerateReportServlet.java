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
import com.ics.bean.StudentBean;
import com.ics.dao.LoginDao;
import com.ics.dao.StudentDao;

/**
 * Servlet implementation class GenerateReportServlet
 */
@WebServlet("/GenerateReportServlet")
public class GenerateReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GenerateReportServlet() {
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
		String loginId = request.getParameter("loginid");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String salaryMin = request.getParameter("salarymin");
		String salaryMax = request.getParameter("salarymax");
		int count = 0;
		LoginDao loginDao = new LoginDao();
        LoginBean loginBean = new LoginBean();
        StudentDao studentDao = new StudentDao();
        HttpSession session = request.getSession();
        try {
			loginBean = loginDao.selectLoginWithId(loginId);
			count = studentDao.countStudent(startDate, endDate);
			List<StudentBean> studentList = studentDao.selectStudentListReport(startDate, endDate);
			List<StudentBean> studentListCompany = null;
			if(salaryMin == null) {
				studentListCompany = studentDao.selectStudentListReport(startDate, endDate);

			}else {
				studentListCompany = studentDao.selectStudentListSalaryRange(startDate, endDate, salaryMin, salaryMax);
				System.out.println("Start Date: " + startDate);
				System.out.println("End Date: " + endDate);
				System.out.println("Salary Min: " + salaryMin);
				System.out.println("Salary Max: " + salaryMax);
				//System.out.println("SELECT * FROM lalysfarmville.student WHERE (registerDate BETWEEN '"+ startDate +"' AND '"+ endDate +"') AND (salarymin<="+salaryMin+" OR salarymin>="+salaryMax+"  OR salarymax<="+salaryMin+" OR salarymax>="+salaryMax+")");
			}
			
			
			String check = "check";
			session.setAttribute("check", check);
			session.setAttribute("studentList", studentList);
			session.setAttribute("studentListCompany", studentListCompany);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        
        session.setAttribute("loginbean", loginBean);
        session.setAttribute("count", count);
        session.setAttribute("startdate", startDate);
        session.setAttribute("enddate", endDate);
        response.sendRedirect("report.jsp");
	}

}

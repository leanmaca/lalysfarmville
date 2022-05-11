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
 * Servlet implementation class SearchServlet
 */
@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SearchServlet() {
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
		String loginId = request.getParameter("loginid");
		String searchString = request.getParameter("nonpendingtxtsearch");
		String searchStringPending = request.getParameter("pendingtxtsearch");
		LoginDao loginDao = new LoginDao();
		LoginBean loginBean = new LoginBean();
		StudentDao studentDao = new StudentDao();
		try {
			loginBean = loginDao.selectLoginWithId(loginId);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		HttpSession session = request.getSession();
		try {
			if (searchStringPending == null && searchString != null) {
				List<StudentBean> studentList = studentDao.selectStudentListSearch(searchString);
				List<StudentBean> studentListPending = studentDao.selectStudentListPending();
				session.setAttribute("studentList", studentList);
				session.setAttribute("studentListPending", studentListPending);
			} else if (searchStringPending != null && searchString == null) {
				List<StudentBean> studentList = studentDao.selectStudentList();
				List<StudentBean> studentListPending = studentDao.selectStudentListSearchPending(searchStringPending);
				session.setAttribute("studentList", studentList);
				session.setAttribute("studentListPending", studentListPending);
			}

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		session.setAttribute("loginbean", loginBean);
		System.out.println("Admin");
		response.sendRedirect("adminhomepage.jsp");
	}

}

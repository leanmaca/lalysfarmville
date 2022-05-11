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
 * Servlet implementation class DeleteServlet
 */
@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeleteServlet() {
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

		String userId = request.getParameter("adminid");
		String studentUserId = request.getParameter("userid");
		LoginBean loginBean = new LoginBean();
		LoginBean studentLoginBean = new LoginBean();
		LoginDao loginDao = new LoginDao();
		StudentDao studentDao = new StudentDao();
		HttpSession session = request.getSession();
		try {
			loginBean = loginDao.selectLoginWithId(userId);
			studentDao.deleteStudent(studentUserId);
			List<StudentBean> studentList = studentDao.selectStudentList();
			List<StudentBean> studentListPending = studentDao.selectStudentListPending();
			session.setAttribute("studentList", studentList);
			session.setAttribute("studentListPending", studentListPending);

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		session.setAttribute("message", "Student successfully edited");
		session.setAttribute("loginbean", loginBean);
		response.sendRedirect("adminhomepage.jsp");
	}

}

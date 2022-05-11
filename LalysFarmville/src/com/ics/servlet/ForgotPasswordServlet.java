package com.ics.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.mail.MessagingException;
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
 * Servlet implementation class ForgotPasswordServlet
 */
@WebServlet("/ForgotPasswordServlet")
public class ForgotPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ForgotPasswordServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		StudentDao studentDao = new StudentDao();
		StudentBean student = new StudentBean();
		LoginDao login = new LoginDao();
		LoginBean loginBean = new LoginBean();
		String recipient = null;
		String alert = null;
		try {
			if (login.checkUsername(username)) {
				try {
					loginBean = login.selectLoginWithUsername(username);
					student = studentDao.selectStudent(loginBean.getUserId());
					recipient = student.getEmailAdd();
					alert = "Password was sent to " + recipient;

				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				String decPass = Security.decrypt(loginBean.getPassword());
				System.out.println("Password: " + decPass);

				Email email = new Email();
				email.setupServerProperties();

				try {
					email.draftEmail(student.getEmailAdd(), username, decPass);
					email.sendEmail();
				} catch (MessagingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

				HttpSession session = request.getSession();
				session.setAttribute("message", alert);
				response.sendRedirect("forgotpassword.jsp");
			} else {
				System.out.println("No username found");
				alert = "No username found";
				HttpSession session = request.getSession();
				session.setAttribute("message", alert);
				response.sendRedirect("forgotpassword.jsp");
				/*response.setContentType("text/html");
				PrintWriter pw = response.getWriter();
				pw.println("<script type=\"text/javascript\">");
				pw.println("alert('Invalid Username');");
				pw.println("location='forgotpassword.jsp';");
				//response.sendRedirect("forgotpassword.jsp");
				pw.println("</script>");*/
			}
		} catch (Exception e) {

		}

	}

}

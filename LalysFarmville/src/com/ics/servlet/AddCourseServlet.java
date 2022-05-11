package com.ics.servlet;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.ics.bean.CourseBean;
import com.ics.bean.LoginBean;
import com.ics.bean.ScheduleBean;
import com.ics.dao.CourseDao;
import com.ics.dao.LoginDao;
import com.ics.dao.ScheduleDao;

/**
 * Servlet implementation class AddCourseServlet
 */
@MultipartConfig
@WebServlet("/AddCourseServlet")
public class AddCourseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCourseServlet() {
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
	
	private static String getSubmittedFileName(Part part) {
		for (String cd : part.getHeader("content-disposition").split(";")) {
			if (cd.trim().startsWith("filename")) {
				String fileName = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
				return fileName.substring(fileName.lastIndexOf('/') + 1).substring(fileName.lastIndexOf('\\') + 1); // MSIE
																													// fix.
			}
		}
		return null;
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("adminid");
		String courseName = request.getParameter("coursename");
		String courseDesc = request.getParameter("coursedesc");
		String message = null;
		LoginBean loginBean = new LoginBean();
		LoginDao loginDao = new LoginDao();
		CourseDao courseDao = new CourseDao();
		HttpSession session = request.getSession();
		Part file = request.getPart("image");
		String imageFileName = getSubmittedFileName(file);
		String uploadPath2 = "D:/Users/Leandrin/Desktop/SEProject/WebContent/courseimages/" + imageFileName;
		System.out.println("Added: " + imageFileName);
		try {
			FileOutputStream fos = new FileOutputStream(uploadPath2);
			InputStream is = file.getInputStream();

			byte[] data = new byte[is.available()];
			is.read(data);
			fos.write(data);
			fos.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			loginBean = loginDao.selectLoginWithId(userId);
			courseDao.addCourse(courseName, courseDesc, imageFileName);
			List<CourseBean> courseList = courseDao.selectCourseList();
			message = "Successfully added course!";
			session.setAttribute("message", message);
			session.setAttribute("courselist", courseList);
			session.setAttribute("loginbean", loginBean);
			System.out.println("Added successfully");
			response.sendRedirect("adminviewcourses.jsp");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}

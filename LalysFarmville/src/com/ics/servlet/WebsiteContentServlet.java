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

import com.ics.bean.LoginBean;
import com.ics.bean.ProductsBean;
import com.ics.bean.StaffBean;
import com.ics.bean.WebsiteContentBean;
import com.ics.dao.LoginDao;
import com.ics.dao.ProductsDao;
import com.ics.dao.StaffDao;
import com.ics.dao.WebsiteContentDao;

/**
 * Servlet implementation class WebsiteContentServlet
 */
@MultipartConfig
@WebServlet("/WebsiteContentServlet")
public class WebsiteContentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public WebsiteContentServlet() {
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

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userId = request.getParameter("adminid");
		String process = request.getParameter("process");
		String welcomeMessage = request.getParameter("welcomemessage");
		String aboutUs = request.getParameter("about");
		String mission = request.getParameter("mission");
		String vision = request.getParameter("vision");
		String farmValues = request.getParameter("values");
		String contact1 = request.getParameter("contactnumber1");
		String contact2 = request.getParameter("contactnumber2");
		String staffName = request.getParameter("staffname");
		String position = request.getParameter("position");
		String staffId = request.getParameter("staffid");
		String productId = request.getParameter("productid");
		String productName = request.getParameter("productname");
		String productDesc = request.getParameter("productdesc");
		String message = null;
	

		LoginBean loginBean = new LoginBean();
		LoginDao loginDao = new LoginDao();
		WebsiteContentBean content = new WebsiteContentBean();
		WebsiteContentDao wcDao = new WebsiteContentDao();
		StaffDao staffDao = new StaffDao();
		ProductsDao productsDao = new ProductsDao();
		HttpSession session = request.getSession();
		try {
			loginBean = loginDao.selectLoginWithId(userId);
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		if (process.equals("websitecontent")) {
			wcDao.updateContent(welcomeMessage, aboutUs, mission, vision, farmValues, contact1, contact2);
			message = "Website content edited successfully";

		} else if (process.equals("staff")) {
			Part file = request.getPart("image");
			String imageFileName = getSubmittedFileName(file);
			String uploadPath = "D:/Users/Leandrin/Desktop/SEProject/WebContent/images/" + imageFileName;
			
			try {
				FileOutputStream fos = new FileOutputStream(uploadPath);
				InputStream is = file.getInputStream();

				byte[] data = new byte[is.available()];
				is.read(data);
				fos.write(data);
				fos.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			StaffBean staff = null;
			
			staffDao.addStaff(staffName, position, imageFileName);
			message = "Staff added successfully";

		} else if (process.equals("edit")) {
			staffDao.updateStaff(staffId, staffName, position);
			message = "Staff edited successfully";
			
		} else if (process.equals("addproduct")) {
			Part file = request.getPart("image");
			String imageFileName = getSubmittedFileName(file);
			String uploadPath2 = "D:/Users/Leandrin/Desktop/SEProject/WebContent/productimages/" + imageFileName;
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
			ProductsBean products = null;
			productsDao.addProduct(productName, productDesc, imageFileName);
			message = "product added successfully";
			

		}else if (process.equals("editproduct")) {
			productsDao.updateProduct(productId, productName, productDesc);
			message = "product edited successfully";

		} 
		
		
		List<StaffBean> staffList;
		List<ProductsBean> productsList = null;
		try {
			content = wcDao.selectContent();
			productsList = productsDao.selectProducts();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		session.setAttribute("productslist", productsList);
		session.setAttribute("message", message);
		session.setAttribute("loginbean", loginBean);
		session.setAttribute("content", content);

		response.sendRedirect("homeform.jsp");
	}

}

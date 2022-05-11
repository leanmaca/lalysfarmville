<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@page import="com.ics.dao.*"%>
<%@page import="com.ics.bean.*"%>
<!DOCTYPE html>
<style>
.gradebody{
	width: 1000px;
	height: 300px;
	background-color: white;
	position: absolute;
	top: 20vh;
	left: 35vh;
	background: white;
	opacity: 0.8;
	padding: 40px;
	border-radius: 10px;
	box-shadow: 0px 0px 10px 0px #000
}
body, html {
  height: 100%;
}

.bg {
  background-image: url("farm.jpg");
  height: 100%;
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
}
</style>

<html>
<head>
<link rel="stylesheet" type="text/css" href="addstudent.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@500&display=swap" rel="stylesheet">		
<meta charset="ISO-8859-1">
<title>Grade Student</title>
<%
LoginBean login = (LoginBean) session.getAttribute("loginbean");
if (login == null){
	response.sendRedirect("Login.jsp");
}
String loginId = login.getUserId();
StudentBean student = (StudentBean) session.getAttribute("student");
int studentUserId = student.getUserID();
String courseName = null;
String courseStatus = null;
%>
</head>
<body class="bg">
<div class="headerbg">
		<h2></h2>
		<div class=function-area>
		<li>
		<form action="<%=request.getContextPath()%>/LoginSessionPass"
			method="post">

			<input type="hidden" name="nextpage" value="studentmanagement">
			<input type="hidden" name="adminid" value=<%=loginId%>>
			<button type="submit" name="your_name" value="your_value"
				class="btn-link" style="font-family: 'Quicksand', sans-serif; font-size: 15px; padding: 5px;">View Students</button>
		</form>
	</li>
		<li>
		<a href="Login.jsp" style="font-family: 'Quicksand', sans-serif; font-size: 20px;">Logout</a>
	</li>
		</div>
		
		</div>
<div class="gradebody">
	<p>Name:</p>
	<p><b><%=student.getStudentFName()%></b></p>
	<%
		String courseId = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/lalysfarmville", "root", "virgo0six");

			PreparedStatement stmt = connect.prepareStatement("SELECT * FROM studentcourse WHERE user_id = " + student.getUserID() + "");
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				courseId = rs.getString("course_id");
				System.out.println("course id: " + courseId);
				PreparedStatement stmt1 = connect.prepareStatement("SELECT * FROM course where course_id = " + courseId + "");
				ResultSet rs1 = stmt1.executeQuery();
				while (rs1.next()) {
		%>

	<br>
	<p>Course:</p> 
		<p><b><%=rs1.getString("course_name") %></b></p>
		<%courseName = rs1.getString("course_name");
		courseStatus = rs.getString("status");
		%>
		
	<% System.out.println(rs1.getString("course_name"));%>



	<%
		}
		}
		rs.close();
		stmt.close();
		connect.close();
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>
	<form action="<%=request.getContextPath()%>/GradeServlet" method="post">
		<span><label style="font-size: 20px; font-weight: 400; margin-right: -50px;">Completion Status:</label> <select
			name="coursestatus" id="coursestatus" required>
				<%if(courseStatus != null) {%><option
					value="<%=courseStatus %>"><%=courseStatus %></option>
				<%} %>
				<option value="Competent">Competent</option>
				<option value="Not Yet Competent">Not Yet Competent</option>
		</select> </span> <input type="hidden" name="userid" value="<%=student.getUserID()%>">
		<input type="hidden" name="loginid" value="<%=loginId%>"> <input
			type="submit" name="btnsubmit" value="Grade Student" id="button">
	</form>
</div>

</body>
</html>
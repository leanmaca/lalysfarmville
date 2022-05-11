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
.popup1 {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    font-family: "sans-serif";
    font-weight: bold;
  }

  .popup-content1 {
    background-color: #fefefe;
    margin: 15% auto; /* 15% from the top and centered */
    padding: 20px;
    border: 1px solid #888;
    width: 80%; /* Could be more or less, depending on screen size */
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
String message = (String)session.getAttribute("message");
String display = null;
if (message == null){
	message = null;
	display = "none";
}
else{
	display = "block";
}
System.out.println(message);
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
		<li><form action="<%=request.getContextPath()%>/NullMessageServlet" method="get">
			<input type="hidden" name="nextpage" value="login">
			<button class="btn-link" style="text-decoration:none;" type="submit">Logout</button>
			</form></li>
		</div>
		
		</div>
		
		<div class="popup1">
			<div class="popup-content1">
				<center><h1>Completion status updated successfully!</h1>
				<center><button id="close">OK</button></center>
				
			</div>
		</div>
		
	
		
	<script>
	
	
	
	
		window.addEventListener("load", function() {

			document.querySelector(".popup1").style.display = "<%=display%>";

		});
	
	
		
		
		document.querySelector("#close").addEventListener("click", function() {
			document.querySelector(".popup1").style.display = "none";
		})
	</script>
<div class="gradebody">
	<p>Name:</p>
	<p><b><%=student.getStudentFName()%></b></p>
	<%
		String courseId = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/lalysfarmville", "root", "2001may19");

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
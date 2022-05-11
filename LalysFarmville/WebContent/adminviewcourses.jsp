<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@page import="com.ics.dao.*"%>
<%@page import="com.ics.bean.*"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@500&display=swap" rel="stylesheet">	
<style>
*{
	font-family: 'Quicksand', sans-serif;
	color: black;
}
li a{
	background-color: #EDDEA4;
	border: black;
	cursor: pointer;
	transition: all 0.3s ease 02;
	color:black;
	padding:0.3em 1.2em;
	border-radius: 6em;
	
}
.function-area {
	display: inline-block;
	padding: 0px 20px;
	justify-content: space-evenly;
}
#button{
	padding: 9px 25px;
	background-color: #EDDEA4;
	border: black;
	border-radius: 5px;
	cursor: pointer;
	transition: all 0.3s ease 02;
	color:black;
}
button{
	
	background-color:#EDDEA4;
	border: black;
	border-radius: 2em;
	cursor: pointer;
	transition: all 0.3s ease 02;
	color:black;
	padding:0.3em 1.2em;
}
body
{
		background-image: url("farm.jpg");
		background-size: cover;
		font-weight: 300;
		font-size: 14px;
		font-family: 'Quicksand', sans-serif !important;
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
h4{
	color: #2F2F2F;
	font-weight: 600;
	text-transform: uppercase;
	padding-left: 20px;
	position: relative;
	font-family: "Quicksand", sans-serif;
	margin-top: 50px;
	font-size: 200%;
}
h3{
	color: #2F2F2F;
	font-weight: 600;
	text-transform: uppercase;
	padding-left: 20px;
	position: absolute;
	font-family: "Quicksand", sans-serif;
}
label{
	color: #2F2F2F;
	font-weight: 600;
	text-transform: uppercase;
	padding-left: 20px;
	position: relative;
	font-family: "Quicksand", sans-serif;
	margin-top: 50px;
}
input[type=text]
{
	border-radius: 4em;
	width: 250px;
	height: 30px;
}
input[type=number]
{
	border-radius: 4em;
	width: 250px;
	height: 30px;
}
input[type=submit]{
	background-color: #EDDEA4;
	display: inline-block;
	justify-content: space-evenly;
	padding: 10px 10;
	border-radius: 6em;
	border:none;
	font-size: 20px;
	width: 10%;
	margin-bottom: 20px;
}
table
{
	width: 100%;
	border-collapse: collapse;
	text-align: center;
}
table tr th
{
	background-color: #F0ffec;
	font-size: 14px;
	font-weight: 600;
	letter-spacing: 0.35px;
	color: #000000;
	opacity: 0.8;
	padding: 12px;
	vertical-align: top;
	text-align: center;
	border: 1px solid #000000;
}
table tr td
{
	background-color: #D1EFE4;
	font-size: 14px;
	font-weight: 600;
	letter-spacing: 0.35px;
	color: #000000;
	opacity: 0.8;
	padding: 12px;
	vertical-align: top;
	text-align: center;
}

.addform{
	margin-top: 10px;
	background-color: #D1EFE4;
	font-size: 14px;
	font-weight: 600;
	width: 500px;
	color: #000000;
	opacity: 0.8;
	padding: 12px;

}

.addform button{
	width: 100%;
}
</style>
<head>
<meta charset="ISO-8859-1">
<title>Courses</title>
<%LoginBean login = (LoginBean)session.getAttribute("loginbean"); %>
<%ArrayList courseList = (ArrayList)session.getAttribute("courselist");%>
<%if (login == null){
	response.sendRedirect("Login.jsp");
}else{
	
}
	
	StudentBean student = new StudentBean();
	String username = login.getUsername();
	String password = login.getPassword();
	String userId = login.getUserId();
	String search = request.getParameter("txtsearch");
	System.out.println(username);
	System.out.println(userId);%>
</head>
<body>
<div class="headerbg">
		<div class=function-area>
		<p id ="s"><b></b></p>
		<h5 style="margin-bottom: -10px; font-size: 50px; color: black;">LALY'S FARMVILLE COURSES</h5>
		<br>
		
		<form action="<%=request.getContextPath()%>/LoginSessionPass"
			method="post">

			<input type="hidden" name="nextpage" value="studentmanagement">
			<input type="hidden" name="adminid" value=<%=userId%>>
			<button type="submit" name="your_name" value="your_value"
				class="btn-link">View Students</button>
		</form>
	<br>
		<form action="<%=request.getContextPath()%>/NullMessageServlet" method="get">
			<input type="hidden" name="nextpage" value="login">
			<button class="btn-link" style="text-decoration:none;" type="submit">Logout</button>
			</form>
		</div>
		
		</div>
	
	<br>
	<br>
	<table class = "table">
	<thead>
		<tr>
			<th> Course ID </th>
			<th> Course Name </th>
			<th> Course Desc </th>
			
			
			
		</tr>
		<%for (int i = 0 ; i < courseList.size() ; i++) {%>
		<%CourseBean courseBean = (CourseBean)courseList.get(i); %>
    	<tr>
    	<td><%=courseBean.getCourseId()%></td>
    	<td><%=courseBean.getCourseName()%></td>
    	<td><%=courseBean.getCourseDesc()%></td>
    	
    	<td><form action="<%=request.getContextPath()%>/CourseObjectPass"
					method="post">
					<input type="hidden" name="courseid"
						value="<%=courseBean.getCourseId()%>"> <input
						type="hidden" name="userid" value="<%=userId%>"> <input
						type="hidden" name="pagename" value="editcourse">
					<button type="submit">
						<span>Edit</span>
					</button>
				</form></td>
    	</tr>
		<%} %>
		</thead>
		
	</table>
	<div class="addform">
	<h1>Add Course</h1>
	<form action="<%=request.getContextPath()%>/AddCourseServlet"
			method="post" enctype="multipart/form-data" class=loginGroup>
		    <div class="section-title"> <br>
				<h3>Image:<input type="file" name="image"> </h3>
			</div>
			<br>
			<div class="input__item">
		    <div class="section-title">
                   <h4>Course Name:</h4>
            </div>
				<input type="text" name="coursename" required>
			</div>
			<div class="input__item">
				 <div class="section-title">
                   <h4>Course Description:</h4>
            </div> 
				 <input type="text" name="coursedesc" required>
			</div>
			<br>
		<input type="hidden" name="adminid" value="<%=login.getUserId()%>">
			 <input type="submit" name="btnsubmit" value="SUBMIT"
				class="btn btn-second" id="myBtn">
				
		</form>
		</div>
</body>
</html>
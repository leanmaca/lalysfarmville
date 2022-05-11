<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@page import="com.ics.dao.*"%>
<%@page import="com.ics.bean.*"%>
<%@page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
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
<meta charset="ISO-8859-1">
<title>Edit Course</title>
<%LoginBean login = (LoginBean)session.getAttribute("loginbean");%>
<% ArrayList courseList = (ArrayList)session.getAttribute("courseList");%>
<%CourseBean course = (CourseBean)session.getAttribute("coursebean"); %>
<%if (login == null){
	response.sendRedirect("Login.jsp");
}else{
	
}
	String selectQuery = null;
	StudentBean student = new StudentBean();
	String username = login.getUsername();
	String userId = login.getUserId();
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
<body>
<div class="headerbg" style= "margin-top: -40px;">
		<div class=function-area style = "background: transparent;">
		<li>
				<form action="<%=request.getContextPath()%>/LoginSessionPass"
					method="post">

					<input type="hidden" name="nextpage" value="courses">
					<input type="hidden" name="adminid" value=<%=userId %>>
					<button type="submit" name="your_name" value="your_value"
						class="btn-link" style="text-decoration:none;color: black;font-family: 'Quicksand', sans-serif;font-size: 18px;">View Courses</button>
				</form>
			</li>
		<li>

		<form action="<%=request.getContextPath()%>/LoginSessionPass"
			method="post">

			<input type="hidden" name="nextpage" value="studentmanagement">
			<input type="hidden" name="adminid" value=<%=userId%>>
			<li>
			<button type="submit" name="your_name" value="your_value"
				class="btn-link" style="text-decoration:none;color: black;font-family: 'Quicksand', sans-serif;font-size: 18px;">View Students</button>
			</li>
		</form>

	</li>
		<li><form action="<%=request.getContextPath()%>/NullMessageServlet" method="get">
			<input type="hidden" name="nextpage" value="login">
			<button class="btn-link" style="text-decoration:none;" type="submit">Logout</button>
			</form></li>
		</div>
		
		</div>
		</div>
<div class="popup1">
			<div class="popup-content1">
				<center><h1>Course edited successfully!</h1>
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
<form action="<%=request.getContextPath()%>/EditCourseServlet"
			method="post" class=loginGroup>
			
			<div class="input__item">
			<div class="section-title">
                   <h4>Course ID:</h4>
            </div>
				<input type="number" name="courseid" required
					value="<%=course.getCourseId()%>" disabled>
			</div>
			<br>
			<div class="input__item">
			<div class="section-title">
                   <h4>Course Name:</h4>
            </div>
				 <input type="text" name="coursename" required
					value="<%=course.getCourseName()%>">
			</div>
			<br>
			<div class="input__item">
			<div class="section-title">
                   <h4>Course Description:</h4>
            </div>	
				<input type="text" name="coursedesc"
					required value="<%=course.getCourseDesc()%>">

			
			<input type="hidden" name="adminid" value="<%=login.getUserId()%>">
			 <input type="hidden" name="courseid" value="<%=course.getCourseId()%>">
			 <input type="submit" name="btnsubmit" value="SUBMIT"
				class="btn btn-first" id="myBtn">
	
</form>
</body>
</html>
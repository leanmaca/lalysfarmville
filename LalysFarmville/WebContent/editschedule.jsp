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
<link rel="stylesheet" type="text/css" href="CSS/admineditschedule.css">

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@500&display=swap" rel="stylesheet">	

<!-- Css Styles -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/elegant-icons.css" type="text/css">

<style>
li button{
	margin-top:10px;
	font-family:'Quicksand', sans-serif !important;
	background-color: #EDDEA4 !important;
	border: black;
	cursor: pointer;
	height: 30px;
	transition: all 0.3s ease 02;
	color: black;
	padding: 0.3em 1.2em;
	padding-bottom: 0.3px;
	border-radius: 6em !important ;
}
.login__form {
	position: relative;
	padding-left: 145px;
	margin-top: 120px;
}
.login__form form .input__item {
	position: relative;
	width: 370px;
	margin-bottom: 20px;
}
.login__form form .input__item input {
	height: 50px;
	width: 100%;
	font-size: 15px;
	color: #000000;
	background: #ffffff;
	border: none;
	padding-left: 10px;
}
.login__form form .input__item span {
	color: #b7b7b7;
	font-size: 20px;
	position: absolute;
	left: 15px;
	top: 13px;
}
.site-btn {
	font-size: 13px;
	color: #ffffff;
	background: #607D3B;
	font-weight: 700;
	border: none;
	border-radius: 2px;
	letter-spacing: 2px;
	text-transform: uppercase;
	display: inline-block;
	padding: 12px 30px;
	margin-left: -390px;
}
h4{
	color: #2F2F2F;
	font-weight: 600;
	text-transform: uppercase;
	padding-left: 20px;
	position: relative;
	font-family: "Quicksand", sans-serif;
	font-size: 150%;
}
h5{
	color: #2F2F2F;
	font-weight: 600;
	text-transform: uppercase;
	padding-left: 20px;
	position: relative;
	font-family: "Quicksand", sans-serif;
	margin-top: 50px;
	font-size: 200%;
}
.section-title h4,
.section-title h5 {
	color: #2F2F2F;
	font-weight: 600;
	line-height: 21px;
	text-transform: uppercase;
	padding-left: 20px;
	position: relative;
	font-family: "Quicksand", sans-serif;
}

.section-title h4:after,
.section-title h5:after {
	position: absolute;
	left: 0;
	top: -6px;
	height: 32px;
	width: 4px;
	background: #607D3B;
	content: "";
}
body, html {
  height: 100%;
  margin: 0;
}

.bg {
  background-image: url("farm2.png");

  height: 170%; 
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
}
input.btn{
	margin: 30px 100px;
	width: 150px;
	padding: 10px;
	border-radius: 20px;
}
input.btn-first{
	background-color: #5AB345;
	color: #fff;
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

  .close {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
  }


button{
	background-color:#5AB345;
  	padding: 9px 25px;
	border: black;
	font-size : 18px;
	font-family: "Quicksand", sans-serif;
	border-radius: 5px;
	cursor: pointer;
	transition: all 0.3s ease 02;
	
}
li a {
	background-color: #EDDEA4;
	border: black;
	cursor: pointer;
	height: 30px;
	transition: all 0.3s ease 02;
	color: black;
	padding: 0.3em 1.2em;
	border-radius: 6em;
}
h1{
	justify-content: space-between;
	float:center;
	font-size: 37px;
}
.container1{
  background-image: url("farm2.png");
  height: 100%;
  width: 100%;  
  overflow-x:hidden;
  background-position: center;
  background-size: cover;
}
.container2
{
    padding: 0;
    margin: 0;
    display: flex;
    align-items: right;
    justify-content: right;

}
</style>
<%LoginBean login = (LoginBean)session.getAttribute("loginbean");%>
<% ArrayList scheduleList = (ArrayList)session.getAttribute("scheduleList");%>
<%ScheduleBean schedule = (ScheduleBean)session.getAttribute("scheduleBean"); %>
<%if (login == null){
	response.sendRedirect("Login.jsp");
}else{
	
}
	String selectQuery = null;
	StudentBean student = new StudentBean();
	String username = login.getUsername();
	String password = login.getPassword();
	String userId = login.getUserId();
	String search = request.getParameter("txtsearch");
	String search2 = request.getParameter("txtsearch2");
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
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Schedule</title>
</head>
<body>
<div class="container1">

	<br>
<br>
<br>
<div class="container2">
<div class="headerbg" style= "margin-top: -40px;">
		<div class=function-area style = "background: transparent;">
		<li>
				<form action="<%=request.getContextPath()%>/LoginSessionPass"
					method="post">

					<input type="hidden" name="nextpage" value="viewschedule">
					<input type="hidden" name="adminid" value=<%=userId %>>
					<button type="submit" name="your_name" value="your_value"
						class="btn-link" style="text-decoration:none;color: black;font-family: 'Quicksand', sans-serif;font-size: 18px;">View Schedules</button>
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
				<center><h1>Schedule edited successfully!</h1>
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
<div class="col-lg-12 text-center">
        <h5 style="margin-bottom: -10px;">EDIT SCHEDULE:</h5>
</div>
<div class="container">
<div class="row">
<div class="login__form">
 <div class="row d-flex justify-content-center" style="margin-left: 250px;">
<form action="<%=request.getContextPath()%>/EditScheduleServlet"
			method="post" class=loginGroup>
			
			<div class="input__item">
			<div class="section-title">
                   <h4>Course ID:</h4>
            </div>
				<input type="number" name="courseid" required
					value="<%=schedule.getCourseId()%>">
			</div>
			<br>
			<div class="input__item">
			<div class="section-title">
                   <h4>Start Date:</h4>
            </div>
				 <input type="date" name="startdate" required
					value="<%=schedule.getStartDate()%>">
			</div>
			<br>
			<div class="input__item">
			<div class="section-title">
                   <h4>End Date:</h4>
            </div>	
				<input type="date" name="enddate"
					required value="<%=schedule.getEndDate()%>">

			</div>
			<br>
			<div class="input__item">
				<div class="section-title">
                   <h4>Time:</h4>
            </div> 
				<input type="time" name="time" required
					value="<%=schedule.getTime()%>">
			</div>
			<br>
			<div class="input__item">
				<div class="section-title">
                   <h4>Slots:</h4>
            </div>
				<input type="number"
					name="slots" required value="<%=schedule.getSlots()%>">
			</div>
			<input type="hidden" name="adminid" value="<%=login.getUserId()%>">
			 <input type="hidden" name="scheduleid" value="<%=schedule.getScheduleId()%>">
			 <input type="submit" name="btnsubmit" value="SUBMIT"
				class="btn btn-first" id="myBtn">
	
</form>
</div>
</div>
</div>
</div>
</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
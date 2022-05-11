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

	margin-top: 120px;
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
table {

	border-collapse: collapse;
	text-align: center;
	padding-right: 10px;
}

table tr th {
	background-color: White;
	font-size: 14px;
	font-weight: 300;
	letter-spacing: 0.35px;
	color: #000000;
	padding: 0.75rem 2rem;
	text-align: center;
	border: 0.5px solid;
}

table tr td {
	background-color: White;
	font-size: 14px;
	font-weight: 300;
	letter-spacing: 0.35px;
	color: #000000;
	padding: 12px;
	vertical-align: center;
	text-align: center;
}


.details{
background-color: white;
float: left;
}

.details p{
padding: 0.3em 0.88em;
display: inline-block;
}

.downloadbtn{
margin-top: 50px;
font-family:'Quicksand', sans-serif !important;
	background-color: #EDDEA4 !important;
	border: black;
	cursor: pointer;
	height: 30px;
	transition: all 0.3s ease 02;
	color: black;
	padding: 0.3em 1.2em;
	padding-bottom: 0.3px;

}

</style>
<%LoginBean login = (LoginBean)session.getAttribute("loginbean");%>
<% ArrayList scheduleList = (ArrayList)session.getAttribute("scheduleList");%>
<%ScheduleBean schedule = (ScheduleBean)session.getAttribute("scheduleBean"); 

ArrayList studentList = (ArrayList) session.getAttribute("studentlist");%>
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
<script src="js1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.js"></script>
<title>Schedule Details</title>
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
		<li>
		<a href="Login.jsp" style= "text-decoration:none;color: black; font-family: 'Quicksand', sans-serif;font-size: 17px;">Logout</a>
	</li>
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
        <h5 style="margin-bottom: -10px;">SCHEDULE DETAILS:</h5>
</div>
<br>

<div class="printform" id="printform">
<h2><center>Laly's Farm Ville</center></h2>
			<h3><center>Bukal Road Brgy. Sisilmin, Cavinti, Laguna</center></h3>
			<h3><center>Contact Number: 0921 663 1359/0909 6080 737</center></h3>
			<h3><center>Email Address: nonetp58@gmail.com</center></h3>
			
	<h3 style = "font-family: Arial; font-weight: bold;"><center>------------------------------------------------------------------------------------------------ </center></h2>
	
	<div class="row d-flex justify-content-center" style="font-family: Arial">
	
<div class="row d-flex justify-content-center" style="margin-left: 0px; text-align: justify; ">
<div class="details">
<p class="mb-0">
<% String courseName =null;
if(schedule.getCourseId() == "1"){
	courseName = "Organic Agriculture Production NC II";
} 
else{
	courseName = "Production of High-Quality Inbred Rice and Seed Certification, and Farm Mechanization";
}%>
<strong class="pr-1">Course: </strong><%=courseName %></p>
<p class="mb-0">
<strong class="pr-1">Start Date: </strong><%=schedule.getStartDate()%></p>
<p class="mb-0">
<strong class="pr-1">End Date: </strong><%=schedule.getEndDate()%></p>
<p class="mb-0">
<strong class="pr-1">Time: </strong><%=schedule.getTime()%></p>
<p class="mb-0">
<strong class="pr-1">Slots: </strong><%=schedule.getSlots()%></p>
</div>
</div>
<table class = "table table-striped">
	<thead>
		<tr>
			<th scope = "col"><strong>Name</strong></th>
			<th scope="col"><strong>Email Address</strong></th>
			<th scope = "col"><strong>Contact Number</strong></th>
			<th scope = "col"><strong>Sex</strong></th>
		</tr>
	</thead>
	<tbody>
		<%for (int i = 0; i < studentList.size(); i++) {%>
			<%StudentBean studentBean = (StudentBean) studentList.get(i);%>
		<tr>
			<td><%=studentBean.getStudentFName()%> <%=studentBean.getStudentMName()%> <%=studentBean.getStudentLName()%></td>
			<td><%=studentBean.getEmailAdd()%></td>
			<td><%=studentBean.getContactNo()%></td>
			<td><%=studentBean.getSex()%></td>
		</tr>
		<%
			}
		%>
		</tbody>
		
</table>
</div>
	

</div>


	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<button type="button" class="downloadbtn" id="download">Download PDF</button>
</body>
</html>
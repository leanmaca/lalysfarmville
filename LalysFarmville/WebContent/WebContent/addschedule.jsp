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
<%LoginBean login = (LoginBean)session.getAttribute("loginbean");%>
<% ArrayList scheduleList = (ArrayList)session.getAttribute("scheduleList");%>
<%ScheduleBean schedule = (ScheduleBean)session.getAttribute("scheduleBean"); %>
<%String message = (String)session.getAttribute("message");
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
<%if (login == null){
	response.sendRedirect("Login.jsp");
}else{
	
}
	String selectQuery = null;
	StudentBean student = new StudentBean();
	String username = login.getUsername();
	String password = login.getPassword();
	String userId = login.getUserId();%>
<title>Add Schedule</title>
<link rel="stylesheet" type="text/css" href="addschedule.css">
<link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@500&display=swap" rel="stylesheet">	
</head>
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
.container1
{
    padding: 0;
    margin: 0;
    display: flex;
    align-items: right;
    justify-content: right;
}
.table{
	display: inline-block;
	margin-left: 80px;
	font-size : 15px;
	margin-top: 100px;
	width: 50%;
	opacity: 0.9;
	border-collapse: collapse;
	text-align: center;
}
</style>
<body>
<div class ="container">
<div class="bg">
<div class="container1">
<div class="headerbg" style= "margin-top: 20px;">
		<div class=function-area style = "background: transparent">
		<li>
				<form action="<%=request.getContextPath()%>/LoginSessionPass"
					method="post">

					<input type="hidden" name="nextpage" value="viewschedule">
					<input type="hidden" name="adminid" value=<%=userId %>>
					<li>
					<button type="submit" name="your_name" value="your_value"
						class="btn-link" style="color: black; font-family: 'Quicksand', sans-serif;">View Schedules</button>
					</li>
				</form>
			</li>
		<li>
		<form action="<%=request.getContextPath()%>/LoginSessionPass"
			method="post">

			<input type="hidden" name="nextpage" value="studentmanagement">
			<input type="hidden" name="adminid" value=<%=userId%>>
			<li>
			<button type="submit" name="your_name" value="your_value"
				class="btn-link" style="color: black;font-family: 'Quicksand', sans-serif;">View Students</button>
				</li>
		</form>
	</li>
		<li>
		<a href="Login.jsp" style= "color: black; font-size: 17px;">Logout</a>
	</li>
		</div>
		
		</div>
		</div>
<div class="popup1">
			<div class="popup-content1">
				<center><h1>Schedule added successfully!</h1>
				<button class="btn1" id="close">OK</button></center>
				
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
			
<div class="body">
<div class="login__form">
<form action="<%=request.getContextPath()%>/AddScheduleServlet"
			method="post" class=loginGroup>
			<div class="input__item">
		    <div class="section-title">
                   <h4>Course ID:</h4>
            </div>
				<input type="number" name="courseid" required>
			</div>
			<div class="input__item">
				 <div class="section-title">
                   <h4>Start Date:</h4>
            </div> 
				 <input type="date" name="startdate" required>
			</div>
			<div class="input__item">
				<div class="section-title">
                   <h4>End Date:</h4>
            </div>
				<input type="date" name="enddate"
					required>

			</div>
			<div class="input__item">
				<div class="section-title">
                   <h4>Time:</h4>
            </div>
             <input type="time" name="time" oninvalid="this.setCustomValidity(this.willValidate?'':'Enter valid time')" required>
			</div>
			<div class="input__item">
				<div class="section-title">
                   <h4>Slots:</h4>
            </div> 
				<input type="number"
					name="slots" required>
			</div>
		<input type="hidden" name="adminid" value="<%=login.getUserId()%>">
			 <input type="submit" name="btnsubmit" value="SUBMIT"
				class="btn btn-second" id="myBtn">
				
		</form>
		</div>
	<table class = "table">
	<thead>
		<tr>
			<th> Schedule ID </th>
			<th> Course ID </th>
			<th> Start Date </th>
			<th> End Date </th>
			<th> Time </th>
			<th> Slots </th>
			
			
			
		</tr>
		<%for (int i = 0 ; i < scheduleList.size() ; i++) {%>
		<%ScheduleBean scheduleBean = (ScheduleBean)scheduleList.get(i); %>
    	<tr>
    	<td><%= scheduleBean.getScheduleId()%></td>
    	<td><%=scheduleBean.getCourseId()%></td>
    	<td><%=scheduleBean.getStartDate()%></td>
    	<td><%=scheduleBean.getEndDate()%></td>
    	<td><%=scheduleBean.getTime()%></td>
    	<td><%=scheduleBean.getSlots()%></td>
    	
    	</tr>
		<%} %>
	</thead>
	</table>
	</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</div>
</div>
</body>
</html>
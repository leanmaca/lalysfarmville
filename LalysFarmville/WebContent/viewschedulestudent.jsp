<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@page import="com.ics.dao.*"%>
<%@page import="com.ics.bean.*"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<style>
a{

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
/* css for search button and input search */
input[type=submit]{
	background-color: #EDDEA4;
	display: inline-block;
	justify-content: space-evenly;
	padding: 10px 10;
	border-radius: 6em;
	width: 20%;
	margin-bottom: 20px;
	
}
/* css for search button and input search */
input[type=text]{
	display: inline-block;
	justify-content: space-evenly;
	padding: 10px 10;
	opacity: 0.8;
	width: 70%;
	margin-bottom: 20px;
}
h1{
	justify-content: space-between;
	float:center;
	font-size: 37px;
}
h2{
	color: #2F2F2F;
	font-weight: 600;
	text-transform: uppercase;
	padding-left: 20px;
	position: relative;
	font-family: "Quicksand", sans-serif;
	margin-top: 50px;
	font-size: 200%;
}

.function-area li{
	display: inline-block;
	padding: 0px 20px;
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


button, a{
	font-family: 'Quicksand', sans-serif;

}


		
		#makepdf {
			 /* Letter */ size: us-letter; margin-right: 1in;
			 margin-left: 1in;
			 margin-bottom: 1in;
			 margin-top: 0px;
			/*box-sizing: content-box;
			width: 700px;
			height: 150px;
			padding: 30px;
			border: 1px solid black;*/
			font-style: Arial;
			background-color: #f0f0f0;
		}

		#button {
			background-color: #4caf50;
			border-radius: 5px;
			margin-left: 650px;
			margin-bottom: 5px;
			color: white;
		}

		h2 {
			text-align: center;
			color: #24650b;
			font-style: Arial;
		}
		
		h3{
		font-style: Arial;
		}
		
		table
		{
		width: 100%;
		border-collapse: collapse;
		text-align: center;
	}
</style>
<head>
		
	<Title>My Schedule</Title>
	<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@500&display=swap" rel="stylesheet">	
<%LoginBean login = (LoginBean)session.getAttribute("studentloginbean"); %>
<%ScheduleBean scheduleBean = (ScheduleBean)session.getAttribute("scheduleBean");%>
<%StudentBean student = (StudentBean)session.getAttribute("studentbean"); %>
<%if (login == null){
	response.sendRedirect("Login.jsp");
}else{
	
}
	String username = login.getUsername();

	String userId = login.getUserId();
	String search = request.getParameter("txtsearch");
	System.out.println(username);
	System.out.println(userId);%>

<script src="js3.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.js"></script>
		
</head>
<body>

<div class="headerbg">
		<br>
		
		
				<form action="<%=request.getContextPath()%>/LoginSessionPass"
					method="post">

					<input type="hidden" name="nextpage" value="studentviewprofile">
					<input type="hidden" name="studentid" value=<%=userId %>>
					<button type="submit" name="your_name" value="your_value"
						class="btn-link">Back to Student Profile</button>
					
				</form>
				<form action="<%=request.getContextPath()%>/NullMessageServlet" method="get">
			<input type="hidden" name="nextpage" value="login">
			<button class="btn-link" style="text-decoration:none;" type="submit">Logout</button>
			</form>
		
		
		
		</div>

	<div id="printform">
		<div id="makepdf">
			<h2><center>Laly's Farm Ville</center></h2>
			<h3><center>Bukal Road Brgy. Sisilmin, Cavinti, Laguna</center></h3>
			<h3><center>Contact Number: 0921 663 1359/0909 6080 737</center></h3>
			<h3><center>Email Address: nonetp58@gmail.com</center></h3>
			
	<h3 style = "font-family: Arial; font-weight: bold;"><center>------------------------------------------------------------------------------------------------ </center></h2>
	
	<div class="row d-flex justify-content-center" style="font-family: Arial">
	<h3 style = "font-family: Arial; font-weight: bold;"><center>Name: <%=student.getStudentFName() %> <%=student.getStudentMName()%> <%=student.getStudentLName()%> </center></h2>
	<h3 style = "font-family: Arial; font-weight: bold;"><center>------------------------------------------------------------------------------------------------ </center></h2>
	
	</div>
	<table class = "table table-striped">
		<thead>
		<tr>
			<th scope = "col"><strong>Schedule ID</strong></th>
			<th scope = "col"><strong>Course ID</strong></th>
			<th scope = "col"><strong>Start Date</strong></th>
			<th scope = "col"><strong>End Date</strong></th>
			<th scope = "col"><strong>Time</strong></th>
		</tr>
		</thead>
		<tbody>
    	<tr>
    	<td><%=scheduleBean.getScheduleId()%></td>
    	<td><%=scheduleBean.getCourseId()%></td>
    	<td><%=scheduleBean.getStartDate()%></td>
    	<td><%=scheduleBean.getEndDate()%></td>
    	<td><%=scheduleBean.getTime()%></td>
    	</tr>
    	</tbody>
    	</table>
		</div>
	</div>
	<br><br>
	<button type="button" class="downloadbtn" id="download">Download PDF</button>
</body>
</html>
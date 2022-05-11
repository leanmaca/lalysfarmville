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
*{
	margin: 0px;
	padding: 10px;
	font-size: 16px;
	font-family: 'Quicksand', sans-serif;
}
input{
	
	top: 50%;
	left: 50%;
	border: 3px solid #000000;
	height: 30px;
	width: 500px;
	border-radius: 40px;
	padding: 10px;
}
table
{
	width: 100%;
	border-collapse: collapse;
	text-align: center;
}

table tr th
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
	vertical-align:center;
	text-align: center;
	
}
body
{
	background-image: url("farm.jpg");
	  position: relative;
		font-weight: 300;
		font-size: 14px;
		font-family: 'Quicksand', sans-serif;
}
</style>
<head>
		
	<Title>My Schedule</Title>
	<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@500&display=swap" rel="stylesheet">	
<%LoginBean login = (LoginBean)session.getAttribute("studentloginbean"); %>
<%ScheduleBean scheduleBean = (ScheduleBean)session.getAttribute("scheduleBean");%>
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
		<br>
		
		
				<form action="<%=request.getContextPath()%>/LoginSessionPass"
					method="post">

					<input type="hidden" name="nextpage" value="studentviewprofile">
					<input type="hidden" name="studentid" value=<%=userId %>>
					<button type="submit" name="your_name" value="your_value"
						class="btn-link">Back to Student Profile</button>
						<a href="Login.jsp"style="text-decoration:none;">Logout</a>
				</form>
		
		
		
		</div>
		
	
	<br>
	<br>
	<table>
		<tr>
			<th> Schedule ID </th>
			<th> Course ID </th>
			<th> Start Date </th>
			<th> End Date </th>
			<th> Time </th>
			<th> Slots </th>
			
			
		</tr>
		
    	<tr>
    	<td><%= scheduleBean.getScheduleId()%></td>
    	<td><%=scheduleBean.getCourseId()%></td>
    	<td><%=scheduleBean.getStartDate()%></td>
    	<td><%=scheduleBean.getEndDate()%></td>
    	<td><%=scheduleBean.getTime()%></td>
    	<td><%=scheduleBean.getSlots()%></td>
    	
    	</tr>
	</table>

	
</body>
</html>
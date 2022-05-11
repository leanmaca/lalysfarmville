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
<head>
		
	<Title>Schedule Management</Title>
	<link rel="stylesheet" type="text/css" href="adminviewschedule.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@500&display=swap" rel="stylesheet">	
<%LoginBean login = (LoginBean)session.getAttribute("loginbean"); %>
<%ArrayList scheduleList = (ArrayList)session.getAttribute("scheduleList");%>
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
		<h2></h2>
		<div class=function-area>
		<p id ="s"><b></b></p>
		<h5 style="margin-bottom: -10px; font-size: 50px; color: black;">EDIT SCHEDULE:</h5>
		<br>
		<li>
				<form action="<%=request.getContextPath()%>/LoginSessionPass"
					method="post">

					<input type="hidden" name="nextpage" value="addschedule"> <input
						type="hidden" name="adminid" value=<%=userId %>>
					<button type="submit" name="your_name" value="your_value"
						class="btn-link">Add Schedule</button>
				</form>
			</li>
		<li>
		<form action="<%=request.getContextPath()%>/LoginSessionPass"
			method="post">

			<input type="hidden" name="nextpage" value="studentmanagement">
			<input type="hidden" name="adminid" value=<%=userId%>>
			<button type="submit" name="your_name" value="your_value"
				class="btn-link">View Students</button>
		</form>
	</li>
		<li>
		<a href="Login.jsp" style="text-decoration:none;">Logout</a>
	</li>
		</div>
		
		</div>
	
	<br>
	<br>
	<table class = "table">
	<thead>
		<tr>
			<th> Schedule ID </th>
			<th> Course ID </th>
			<th> Start Date </th>
			<th> End Date </th>
			<th> Time </th>
			<th> Slots </th>
			<th> Actions </th>
			
			
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
    	<td><form action="<%=request.getContextPath()%>/ScheduleObjectPass"
					method="post">
					<input type="hidden" name="scheduleid"
						value="<%=scheduleBean.getScheduleId()%>"> <input
						type="hidden" name="userid" value="<%=userId%>"> <input
						type="hidden" name="pagename" value="editschedule">
					<button type="submit">
						<span>Edit</span>
					</button>
				</form></td>
    	</tr>
		<%} %>
		</thead>
		
	</table>

	
</body>
</html>
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
<link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@500&display=swap" rel="stylesheet">		
<%LoginBean login = (LoginBean)session.getAttribute("loginbean"); %>
<%String check = (String)session.getAttribute("check"); %>
<% ArrayList studentList = (ArrayList)session.getAttribute("studentList");%>
<%if (login == null){
	response.sendRedirect("Login.jsp");
}else{
	
}
	StudentBean student = new StudentBean();
	String username = login.getUsername();
	String password = login.getPassword();
	String userId = login.getUserId();
	System.out.println(username);
	System.out.println(userId);%>

<meta charset="ISO-8859-1">
<title>Generate Report</title>
</head>
<style>
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
/* css for search button and input search */
input[type=submit]{
	background-color: #EDDEA4;
	display: inline-block;
	justify-content: space-evenly;
	padding: 10px 10;
	border-radius: 6em;
	width: 10%;
	margin-bottom: 20px;
	
}
/* css for search button and input search */
input[type=date]{
	display: inline-block;
	justify-content: space-evenly;
	padding: 10px 10;
	opacity: 0.8;
	width: 20%;
	margin-bottom: 20px;
}
label{
	background-color: #EDDEA4;
	border: black;
	transition: all 0.3s ease 02;
	color:black;
	padding:0.3em 1.2em;
	border-radius: 6em;
}
.nav-area{
	float: right;
	list-style:none;
}

.nav-area li{

	display: inline-block;
	display: flex;
	justify-content: space-around;
	padding: 30px 10;
	opacity: 0.8;
	width: 100%;
	margin-bottom: 20px;
}
nav ul{
	display:inline;
}

.nav-area a{
	transition: all 0.3s ease 0s;
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
	padding:10px;
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
	padding-right: 10px;
}
table tr th
{
	background-color: #D1EFE4;
	font-size: 14px;
	font-weight: 600;
	letter-spacing: 0.35px;
	color: #000000;
	opacity: 0.8;
	padding: 0.75rem 2rem;
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
		background-size: cover;
		font-weight: 300;
		font-size: 14px;
		font-family: 'Quicksand', sans-serif !important;
}
h1{
	font-size: 25px;
}
</style>
	
<body>

	<br><br>
	<div class=function-area>
		<li>
				<form action="<%=request.getContextPath()%>/LoginSessionPass"
					method="post">

					<input type="hidden" name="nextpage" value="viewschedule">
					<input type="hidden" name="adminid" value=<%=userId %>>
					<button type="submit" name="your_name" value="your_value"
						class="btn-link">View Schedules</button>
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
		<a href="Login.jsp"style="text-decoration:none;">Logout</a>
	</li>
		</div>
		
		</div>
	<form action="<%=request.getContextPath()%>/GenerateReportServlet"
			method="post" class=loginGroup>
		<label>Start Date:</label>
		<input type="date" name="startDate" required>
		<br>
		<label>End Date:  </label>
		<input type="date" name="endDate" required>
		<input type="hidden" name="loginid" value="<%=login.getUserId()%>">
		<br>
		<input type="submit" name="btnsubmit" value="SUBMIT" id="button">
		</form><h1>${count} students enrolled from ${startdate} to ${enddate}</h1>
		<h1></h1>
		
		<table>
		<tr>
			<th> First name </th>
			<th> Last name </th>
			<th> Middle name </th>
			<th> Street number </th>
			<th> Barangay </th>
			<th> District </th>
			<th> Province </th>
			<th> Region </th>
			<th> Email Address </th>
			<th> Contact Number </th>
			<th> Nationality </th>
			<th> Sex </th>
			<th> Civil Status </th>
			<th> Employee Status </th>
			<th> Birth Date </th>
			<th> Birth Place </th>
			<th> Educational Attainment </th>
			<th> Parent's last name </th>
			<th> Parent's first name </th>
			<th> Parent's middle name </th>
			<th> Parent's address </th>
			<th> Student classification </th>
			<th> Disability Type </th>
			<th> NCAE </th>
			<th> Course </th>
			<th> Scholarship Type </th>
			<th> Status </th>
			<th> Register Date </th>
		</tr>
		<%if(check != null){ %>
    	<%for (int i = 0 ; i < studentList.size() ; i++) {%>
    	<%StudentBean studentBean = (StudentBean)studentList.get(i); %>
		<tr>
			
			<td><%= studentBean.getStudentFName() %></td>
			<td><%= studentBean.getStudentLName() %></td>
			<td><%= studentBean.getStudentMName() %></td>
			<td><%= studentBean.getStreetNum() %></td>
			<td><%= studentBean.getBrgy() %></td>
			<td><%= studentBean.getDistrict() %></td>
			<td><%= studentBean.getProvince() %></td>
			<td><%= studentBean.getRegion() %></td>
			<td><%= studentBean.getEmailAdd() %></td>
			<td><%= studentBean.getContactNo() %></td>
			<td><%= studentBean.getNationality() %></td>
			<td><%= studentBean.getSex() %></td>
			<td><%= studentBean.getCivilStatus() %></td>
			<td><%= studentBean.getEmpStatus() %></td>
			<td><%= studentBean.getBirthDate() %></td>
			<td><%= studentBean.getBirthPlace() %></td>
			<td><%= studentBean.getEducAttain() %></td>
			<td><%= studentBean.getParentLName() %></td>
			<td><%= studentBean.getParentFName() %></td>
			<td><%= studentBean.getParentMName() %></td>
			<td><%= studentBean.getParentAddress() %></td>
			<td><%= studentBean.getStudentClassification() %></td>
			<td><%= studentBean.getDisabilityType() %></td>
			<td><%= studentBean.getAccompNcae() %></td>
			<td><%= studentBean.getCourse() %></td>
			<td><%= studentBean.getScholarshipType() %></td>
			<td><%= studentBean.getStatus() %></td>
			<td><%= studentBean.getRegisterDate() %></td>
			
		</tr>
		<%} %>
		<%} %>
	</table>
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@page import="com.ics.dao.*"%>
<%@page import="com.ics.bean.*"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@500&display=swap" rel="stylesheet">
<head>
<style>
* {
	margin: 0px;
	padding: 10px;
	font-size: 16px;
	font-family: 'Quicksand', sans-serif;
}

body {
	background-image: url("farm.jpg");
	background-size: cover;
	font-weight: 300;
	font-size: 14px;
	font-family: 'Quicksand', sans-serif;
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

.searchtext {
	display: inline-block;
	justify-content: space-evenly;
	padding: 10px 10;
	opacity: 0.8;
	width: auto;
	margin-bottom: 20px;
	border: black;
	border-radius: 6em;
}

.nav-area button {
	float: right;
	background: none;
	border: none;
	font-family: arial;
}

header {
	display: flex;
	justify-content: flex-end;
	align-item: center;
	padding: 30px 10;
	background: #1abc9c;
	width: 100%
}

.nav-area {
	float: right;
	list-style: none;
}

.nav-area li {
	display: inline-block;
	padding: 0px 20px;
}

nav ul {
	display: inline;
}

.nav-area a {
	transition: all 0.3s ease 0s;
}

.nav-area li a:hover {
	color: white;
}

h1 {
	text-align: center;
	font-size: 37px;
}

h2 {
	font-size: 24px;
}

.function-area {
	display: inline-block;
	padding: 0px 20px;
	justify-content: space-evenly;
}

.function-area li {
	display: inline-block;
	padding: 5px 5px;
}

#button {
	padding: 9px 25px;
	background-color: #EDDEA4;
	border: black;
	border-radius: 5px;
	cursor: pointer;
	transition: all 0.3s ease 02;
	color: black;
}

button {
	background-color: #EDDEA4;
	border: black;
	border-radius: 2em;
	cursor: pointer;
	transition: all 0.3s ease 02;
	color: black;
	padding: 0.3em 1.2em;
}

.table {
	max-width: 1850px;
	overflow-x: scroll;
}

.table2 {
	max-width: 1850px;
	overflow-x: scroll;
}

table {
	border-collapse: collapse;
	text-align: center;
	padding-right: 10px;
}

table tr th {
	background-color: #D1EFE4;
	font-size: 14px;
	font-weight: 300;
	letter-spacing: 0.35px;
	color: #000000;
	padding: 0.75rem 2rem;
	text-align: center;
	border: 0.5px solid;
}

table tr td {
	background-color: #F0ffec;
	font-size: 14px;
	font-weight: 300;
	letter-spacing: 0.35px;
	color: #000000;
	padding: 12px;
	vertical-align: center;
	text-align: center;
}
</style>
<Title>Student Management</Title>


<%
LoginBean login = (LoginBean) session.getAttribute("loginbean");
%>
<%
ArrayList studentList = (ArrayList) session.getAttribute("studentList");
%>
<%
ArrayList studentListPending = (ArrayList) session.getAttribute("studentListPending");
%>
<%
if (login == null) {
	response.sendRedirect("Login.jsp");
} else {

}
String selectQuery = null;
StudentBean student = new StudentBean();
String username = login.getUsername();
String password = login.getPassword();
String userId = login.getUserId();
String search = request.getParameter("txtsearch");
String search2 = request.getParameter("txtsearch2");
System.out.println(username);
System.out.println("UserID = " + userId);

String message = (String) session.getAttribute("message");
String display = null;
if (message == null) {
	message = null;
	display = "none";
} else {
	display = "block";
}
System.out.println(display);
%>


</head>
<body>
	<div class="popup">
		<div class="popup-content">
			<h2>Student record deleted successfully!</h2>
			<button id="close">Ok</button>

		</div>
	</div>
	<script>
		window.addEventListener("load", function() {

			document.querySelector(".popup").style.display = "<%=display%>";

		});

		document.querySelector("#close").addEventListener("click", function() {
			document.querySelector(".popup").style.display = "none";
		})
	</script>


	<h1>Student Management</h1>
	<div class=function-area>
		
		<br>
		<li>
			<form action="<%=request.getContextPath()%>/LoginSessionPass"
				method="post">

				<input type="hidden" name="nextpage" value="addstudent"> <input
					type="hidden" name="adminid" value=<%=userId%>>
				<button type="submit" name="your_name" value="your_value"
					class="btn-link">Add Student</button>
			</form>
		</li>
		<li>
			<form action="<%=request.getContextPath()%>/LoginSessionPass"
				method="post">

				<input type="hidden" name="nextpage" value="viewschedule"> <input
					type="hidden" name="adminid" value=<%=userId%>>
				<button type="submit" name="your_name" value="your_value"
					class="btn-link">View Schedules</button>
			</form>
		</li>
		<li>
			<form action="<%=request.getContextPath()%>/LoginSessionPass"
				method="post">

				<input type="hidden" name="nextpage" value="courses"> <input
					type="hidden" name="adminid" value=<%=userId%>>
				<button type="submit" name="your_name" value="your_value"
					class="btn-link">View Courses</button>
			</form>
		</li>
		<li>
			<form action="<%=request.getContextPath()%>/LoginSessionPass"
				method="post">

				<input type="hidden" name="nextpage" value="report"> <input
					type="hidden" name="adminid" value=<%=userId%>>
				<button type="submit" name="your_name" value="your_value"
					class="btn-link">Get Report</button>
			</form>
		</li>
		<li>
			<form action="<%=request.getContextPath()%>/LoginSessionPass"
				method="post">

				<input type="hidden" name="nextpage" value="websitecontent"> <input
					type="hidden" name="adminid" value=<%=userId%>>
				<button type="submit" name="your_name" value="your_value"
					class="btn-link">Edit Website Content</button>
			</form>
		</li>
		<li><form action="<%=request.getContextPath()%>/NullMessageServlet" method="get">
			<input type="hidden" name="nextpage" value="login">
			<button class="btn-link" style="text-decoration:none;" type="submit">Logout</button>
			</form></li>
		<div class="search">
			<form class="formsearch"
				action="<%=request.getContextPath()%>/SearchServlet" method="post"
				class="log">
				<div class="searchcont">
					<input class="searchtext" type="text" name="nonpendingtxtsearch">
					<input type="hidden" name="loginid" value="<%=userId%>"> <input
						type="submit" name="btnsubmit" value="Search" id="button">
				</div>
			</form>
		</div>
	</div>
	<br>
	<br>
	<h2>Enrolled Students</h2>
	<div class="table">
		<tbody>
			<table>
				<tr>
					<th></th>
					<th>First name</th>
					<th>Last name</th>
					<th>Middle name</th>
					<th>Street number</th>
					<th>Barangay</th>
					<th>District</th>
					<th>City/Municipality</th>
					<th>Province</th>
					<th>Region</th>
					<th>Email Address</th>
					<th>Contact Number</th>
					<th>Nationality</th>
					<th>Sex</th>
					<th>Civil Status</th>
					<th>Employee Status</th>
					<th>Birth Date</th>
					<th>Birth Place</th>
					<th>Educational Attainment</th>
					<th>Parent's last name</th>
					<th>Parent's first name</th>
					<th>Parent's middle name</th>
					<th>Parent's address</th>
					<th>Student classification</th>
					<th>Disability Type</th>
					<th>NCAE</th>
					<th>When</th>
					<th>Where</th>
					<th>Course</th>
					<th>Scholarship Type</th>
					<th>Status</th>
					<th>Register Date</th>
				</tr>

				<%
				for (int i = 0; i < studentList.size(); i++) {
				%>
				<%
				StudentBean studentBean = (StudentBean) studentList.get(i);
				%>

				<tr>
					<td><form action="<%=request.getContextPath()%>/ObjectPass"
							method="post">
							<input type="hidden" name="userid"
								value="<%=studentBean.getUserID()%>"> <input
								type="hidden" name="loginid" value="<%=userId%>"> <input
								type="hidden" name="pagename" value="viewStudent">
							<button type="submit" name="your_name" value="your_value"
								class="btn-link" id="ratebtn">
								<span>View</span>
							</button></td>
					</form>
					<td><%=studentBean.getStudentFName()%></td>
					<td><%=studentBean.getStudentLName()%></td>
					<td><%=studentBean.getStudentMName()%></td>
					<td><%=studentBean.getStreetNum()%></td>
					<td><%=studentBean.getBrgy()%></td>
					<td><%=studentBean.getDistrict()%></td>
					<td><%=studentBean.getCityMunicipality()%></td>
					<td><%=studentBean.getProvince()%></td>
					<td><%=studentBean.getRegion()%></td>
					<td><%=studentBean.getEmailAdd()%></td>
					<td><%=studentBean.getContactNo()%></td>
					<td><%=studentBean.getNationality()%></td>
					<td><%=studentBean.getSex()%></td>
					<td><%=studentBean.getCivilStatus()%></td>
					<td><%=studentBean.getEmpStatus()%></td>
					<td><%=studentBean.getBirthDate()%></td>
					<td><%=studentBean.getBirthPlace()%></td>
					<td><%=studentBean.getEducAttain()%></td>
					<td><%=studentBean.getParentLName()%></td>
					<td><%=studentBean.getParentFName()%></td>
					<td><%=studentBean.getParentMName()%></td>
					<td><%=studentBean.getParentAddress()%></td>
					<td><%=studentBean.getStudentClassification()%></td>
					<td><%=studentBean.getDisabilityType()%></td>
					<td><%=studentBean.getAccompNcae()%></td>
					<%
					if (studentBean.getAccompNcae().equals("Yes")) {
					%>
					<td><%=studentBean.getNcaeWhen()%></td>
					<td><%=studentBean.getNcaeWhere()%></td>
					<%
					} else {
					%>
					<td>N/A</td>
					<td>N/A</td>
					<%
					}
					%>
					<td><%=studentBean.getCourse()%></td>
					<td><%=studentBean.getScholarshipType()%></td>
					<td><%=studentBean.getStatus()%></td>
					<td><%=studentBean.getRegisterDate()%></td>
					<td><form action="<%=request.getContextPath()%>/ObjectPass"
							method="post">
							<input type="hidden" name="userid"
								value="<%=studentBean.getUserID()%>"> <input
								type="hidden" name="loginid" value="<%=userId%>"> <input
								type="hidden" name="pagename" value="editStudent">
							<button type="submit">
								<span>Edit</span>
							</button>
						</form></td>
						<%String buttonstat = null;
						if(studentBean.getStatus().equals("Finished Course")){
							
						}
						else{
							buttonstat = "disabled";
						}
						
						%>
					<td><form action="<%=request.getContextPath()%>/ObjectPass"
							method="post">
							<input type="hidden" name="userid"
								value="<%=studentBean.getUserID()%>"> <input
								type="hidden" name="loginid" value="<%=userId%>"> <input
								type="hidden" name="pagename" value="gradestudent">
							<button type="submit" <%=buttonstat %>>
								<span>Completion Status</span>
							</button>
						</form></td>
				</tr>
				<%
				}
				%>
				</tbody>
			</table>
</div>
			<p id="s">
			<div class="function-area">
			
				</p>
				<form class="formsearch"
					action="<%=request.getContextPath()%>/SearchServlet" method="post"
					class="log">
					<div class="searchcont">
						<input class="searchtext" type="text" name="pendingtxtsearch">
						<input type="hidden" name="loginid" value="<%=userId%>"> <input
							type="submit" name="btnsubmit" value="Search" id="button">
						<br> <br>
					</div>

				</form>
			</div>

			<h2>Pending For Approval</h2>
			<div class="table2">
			<table>
				<tr>
					<th></th>
					<th>First name</th>
					<th>Last name</th>
					<th>Middle name</th>
					<th>Street number</th>
					<th>Barangay</th>
					<th>District</th>
					<th>City/Municipality</th>
					<th>Province</th>
					<th>Region</th>
					<th>Email Address</th>
					<th>Contact Number</th>
					<th>Nationality</th>
					<th>Sex</th>
					<th>Civil Status</th>
					<th>Employee Status</th>
					<th>Birth Date</th>
					<th>Birth Place</th>
					<th>Educational Attainment</th>
					<th>Parent's last name</th>
					<th>Parent's first name</th>
					<th>Parent's middle name</th>
					<th>Parent's address</th>
					<th>Student classification</th>
					<th>Disability Type</th>
					<th>NCAE</th>
					<th>When NCAE</th>
					<th>Where NCAE</th>
					<th>Course</th>
					<th>Scholarship Type</th>
					<th>Status</th>
					<th>Register Date</th>
				</tr>

				<%
				for (int i = 0; i < studentListPending.size(); i++) {
				%>
				<%
				StudentBean studentBean2 = (StudentBean) studentListPending.get(i);
				%>
				<tr>
					<td><form action="<%=request.getContextPath()%>/ObjectPass"
							method="post">
							<input type="hidden" name="userid"
								value="<%=studentBean2.getUserID()%>"> <input
								type="hidden" name="loginid" value="<%=userId%>"> <input
								type="hidden" name="pagename" value="viewStudent">
							<button type="submit" name="your_name" value="your_value"
								class="btn-link" id="ratebtn">
								<span>View</span>
							</button></td>
					</form>
					<td><%=studentBean2.getStudentFName()%></td>
					<td><%=studentBean2.getStudentLName()%></td>
					<td><%=studentBean2.getStudentMName()%></td>
					<td><%=studentBean2.getStreetNum()%></td>
					<td><%=studentBean2.getBrgy()%></td>
					<td><%=studentBean2.getDistrict()%></td>
					<td><%=studentBean2.getCityMunicipality()%></td>
					<td><%=studentBean2.getProvince()%></td>
					<td><%=studentBean2.getRegion()%></td>
					<td><%=studentBean2.getEmailAdd()%></td>
					<td><%=studentBean2.getContactNo()%></td>
					<td><%=studentBean2.getNationality()%></td>
					<td><%=studentBean2.getSex()%></td>
					<td><%=studentBean2.getCivilStatus()%></td>
					<td><%=studentBean2.getEmpStatus()%></td>
					<td><%=studentBean2.getBirthDate()%></td>
					<td><%=studentBean2.getBirthPlace()%></td>
					<td><%=studentBean2.getEducAttain()%></td>
					<td><%=studentBean2.getParentLName()%></td>
					<td><%=studentBean2.getParentFName()%></td>
					<td><%=studentBean2.getParentMName()%></td>
					<td><%=studentBean2.getParentAddress()%></td>
					<td><%=studentBean2.getStudentClassification()%></td>
					<td><%=studentBean2.getDisabilityType()%></td>
					<td><%=studentBean2.getAccompNcae()%></td>
					<%
					if (studentBean2.getAccompNcae().equals("Yes")) {
					%>
					<td><%=studentBean2.getNcaeWhen()%></td>
					<td><%=studentBean2.getNcaeWhere()%></td>
					<%
					} else {
					%>
					<td>N/A</td>
					<td>N/A</td>
					<%
					}
					%>
					<td><%=studentBean2.getCourse()%></td>
					<td><%=studentBean2.getScholarshipType()%></td>
					<td><%=studentBean2.getStatus()%></td>
					<td><%=studentBean2.getRegisterDate()%></td>
					<td><form action="<%=request.getContextPath()%>/ObjectPass"
							method="post">
							<input type="hidden" name="userid"
								value="<%=studentBean2.getUserID()%>"> <input
								type="hidden" name="loginid" value="<%=userId%>"> <input
								type="hidden" name="pagename" value="editStudent">
							<button type="submit">
								<span>Edit</span>
							</button>
						</form></td>
					<td><form action="<%=request.getContextPath()%>/ObjectPass"
							method="post">
							<input type="hidden" name="userid"
								value="<%=studentBean2.getUserID()%>"> <input
								type="hidden" name="loginid" value="<%=userId%>"> <input
								type="hidden" name="pagename" value="gradestudent">
							<button type="submit">
								<span>Completion Status</span>
							</button>
						</form></td>
				</tr>
				<%} %>
			</table>
	</div>
</body>
</html>
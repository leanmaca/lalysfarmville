<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@page import="com.ics.dao.*"%>
<%@page import="com.ics.bean.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@500&display=swap" rel="stylesheet">	
<html>
<head>
<meta charset="ISO-8859-1">
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
body
{
		background-image: url("farm.jpg");
		background-size: fit;
		font-weight: 300;
		font-size: 14px;
		font-family: 'Quicksand', sans-serif;
}
*{
	margin: 0px;
	padding:10px;
	font-size: 16px;
	font-family: 'Quicksand', sans-serif;
}
.function-area {
	padding-top: 10px;
  	padding-right: 30px;
  	padding-bottom: 30px;
  	padding-left: 50px;
	justify-content: space-evenly;
	
}

.function-area li{
	display: inline-block;
	padding: 5px 10px;
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
input[type=submit]{
	background-color: #EDDEA4;
	display: inline-block;
	justify-content: space-evenly;
	padding: 10px 10;
	border-radius: 6em;
	width: 10%;
	margin-bottom: 20px;
	
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
card shadow-sm{

}
h1{
	justify-content: space-between;
	text-align:center;
	font-size: 37px;
	
}
h3{
	justify-content: space-between;
	text-align:left;
	font-size: 27px;
	font-weight: 900;
	border-style: groove;
	border-radius: 0cm;
	border-color: #91C545;
	background-color: white;
	
}
p{
	justify-content: space-between;
	text-align:left;
	font-size: 17px;
	font-weight: 900;
	border-style: groove;
	border-radius: 0cm;
	border-color: #91C545;
	background-color: white;
}
.container1
{
    height: 100%;
    padding: 0;
    margin: 0;
    display: flex;
    align-items: right;
    justify-content: right;
}
</style>

<title>Student Profile</title>
<%
LoginBean login = (LoginBean) session.getAttribute("loginbean");
%>
<%
if (login == null) {
	response.sendRedirect("Login.jsp");
}
String username = login.getUsername();
String password = login.getPassword();
String userId = login.getUserId();
String search = request.getParameter("txtsearch");
System.out.println(username);
System.out.println(userId);
StudentBean student = (StudentBean) session.getAttribute("student");
%>

</head>
<body>




	<nav>
		<div class="container1">
		<div class="function-area">

			<li>
				<form action="<%=request.getContextPath()%>/LoginSessionPass"
					method="post">

					<input type="hidden" name="nextpage" value="studentmanagement">
					<input type="hidden" name="adminid" value=<%=userId%>>
					<button type="submit" name="your_name" value="your_value"
						class="btn-link">View Students</button>
				</form>
			</li>

			<!--5th -->
			<li><form action="<%=request.getContextPath()%>/NullMessageServlet" method="get">
			<input type="hidden" name="nextpage" value="login">
			<button class="btn-link" style="text-decoration:none;" type="submit">Logout</button>
			</form></li>
		</div>
		</div>
		<h1>Student Profile</h1>
		</ul>
	</nav>
</head>
<body>

	<%
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/lalysfarmville", "root", "2001may19");

		//if(searchString == null || searchString.isEmpty()){
		PreparedStatement stmt = connect
		.prepareStatement("SELECT * FROM student where user_id = '" + student.getUserID() + "'");
		ResultSet rs = stmt.executeQuery();

		while (rs.next()) {
	%>
	<div class="student-profile py-4">
		<div class="container">
			<div class="row">
				<div class="col-lg-4">
					<div class="card shadow-sm">
						<div class="card-header bg-transparent text-center">

							<h3>
								Name:
								<%=rs.getString("student_fname")%>
								<%=rs.getString("student_mname")%>
								<%=rs.getString("student_lname")%></h3>
						</div>
						<div class="card-body">
							<p class="mb-0">
								<strong class="pr-1">Address:</strong><%=rs.getString("streetNum")%>
								<%=rs.getString("brgy")%>
								<%=rs.getString("district")%>
								<%=rs.getString("province")%>
								<%=rs.getString("region")%></p>
							<p class="mb-0">
								<strong class="pr-1">Contact No.:</strong><%=rs.getString("emailAdd")%></p>
							<p class="mb-0">
								<strong class="pr-1">Nationality:</strong><%=rs.getString("nationality")%></p>
							<p class="mb-0">
								<strong class="pr-1">Sex:</strong><%=rs.getString("sex")%></p>
							<p class="mb-0">
								<strong class="pr-1">Civil Status:</strong><%=rs.getString("civilStatus")%></p>
							<p class="mb-0">
								<strong class="pr-1">Employee Status:</strong><%=rs.getString("empStatus")%></p>
							<p class="mb-0">
								<strong class="pr-1">Birth Date:</strong><%=rs.getString("birthDate")%></p>
							<p class="mb-0">
								<strong class="pr-1">Birth Place:</strong><%=rs.getString("birthPlace")%></p>
							<p class="mb-0">
								<strong class="pr-1">Educational Attainment:</strong><%=rs.getString("educAttain")%></p>
							<p class="mb-0">
								<strong class="pr-1">Parent's Name:</strong><%=rs.getString("parent_fname")%>
								<%=rs.getString("parent_mname")%>
								<%=rs.getString("parent_lname")%></p>
							<p class="mb-0">
								<strong class="pr-1">Parent's Address:</strong><%=rs.getString("parent_address")%></p>
							<p class="mb-0">
								<strong class="pr-1">Student Classification:</strong><%=rs.getString("student_classification")%></p>
							<p class="mb-0">
								<strong class="pr-1">Disability:</strong><%=rs.getString("typeDisability")%></p>
							<p class="mb-0">
								<strong class="pr-1">Accomplished NCAE:</strong><%=rs.getString("accompNcae")%></p>
							<p class="mb-0">
								<strong class="pr-1">Accomplished NCAE:</strong><%=rs.getString("accompNcae")%>
								<%
								if (rs.getString("accompNcae").equals("Yes")) {
								%>
								<%=rs.getString("whenNcae")%>
								<%=rs.getString("whereNcae")%>
								<%
								}
								%>
							</p>
							<p class="mb-0">
								<strong class="pr-1">Course:</strong><%=rs.getString("course")%></p>
							<p class="mb-0">
								<strong class="pr-1">Scholarship Type:</strong><%=rs.getString("typeScholarship")%></p>
							<p class="mb-0">
								<strong class="pr-1">Status:</strong><%=rs.getString("status")%></p>
							<%
							if (student.getCompany() == null) {
							%>
							<p class="mb-0">
								<strong class="pr-1">No company submitted yet</strong>
							</p>
							<%
							} else if (student.getCompany() != null) {
							%>
							<p class="mb-0">
								<strong class="pr-1"><%=student.getCompany()%></strong>
							</p>
							<%
							}
							%>
						</div>
					</div>
				</div>

			</div>
		</div>




		</tr>

		<%
		}
		rs.close();
		stmt.close();
		connect.close();
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>
		<b></b>
</body>
</html>
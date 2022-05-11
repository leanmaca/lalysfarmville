<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@page import="com.ics.dao.*"%>
<%@page import="com.ics.bean.*"%>
<!DOCTYPE html>
<html>
<head>
<style>
@charset "ISO-8859-1";
*{
	font-family: 'Quicksand', sans-serif;
	color: black;
}
body, html {
  height: 100%;
  margin: 0;
}

.bg {
  background-image: url("farm.jpg");

  height: 100%; 
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
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
h3{
	color: #f5f2ea;
	text-align: center;
}
.card-body
{
  width: 400px;
  height: cover;
  object-fit: cover;
  margin: 10px auto;
  border: 0px solid #000;
  border-radius: 3%;
  margin-left: auto; 


}
.card-body1
{
  width: 400px;
  height: cover;
  object-fit: cover;
  margin: 10px auto;
  border: 5px solid #000;
  border-radius: 3%;
 margin-right: auto;

}
.nav-area button{
	float: right;
	background: none;
	border: none;	
	font-family: arial;
	
}

header{
	
	display: flex;
	justify-content: flex-end;
	align-items: center;
	padding: 30px 10;
	background: #1abc9c;
	width: 100%
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


.nav-area{
	float: right;
	list-style:none;
}

.nav-area li{

	display: inline-block;
	padding: 0px 20px;
}
nav ul{
	display:inline;
}

.nav-area a{
	transition: all 0.3s ease 0s;
}

.nav-area li a:hover{
	color: white;
}

h1{
	color: #f5f2ea;
	text-align: start;
	font-size: 37px;
}



.function-area{

	padding: 10px 5px;
	float:right;
}

.function-area li{
	display: inline-block;
	padding: 5px 10px;
}

.card-body{
	width: 1000px;
	height: 750px;
	background-color: white;
	position: absolute;
	top: 20vh;
	left: 35vh;
	background: white;
	opacity: 0.8;
	padding: 40px;
	border-radius: 10px;
	box-shadow: 0px 0px 10px 0px #000
}
</style>
<meta charset="ISO-8859-1">
<title>Student Profile</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@500&display=swap" rel="stylesheet">	


<%LoginBean login = (LoginBean)session.getAttribute("studentloginbean"); %>
<%StudentBean student = (StudentBean)session.getAttribute("studentBean"); %>
<%String statusMessage = (String)session.getAttribute("statusMessage"); %>
<%Boolean scheduleCheck = (Boolean)session.getAttribute("scheduleCheck"); %>
<%Boolean resultCheck = (Boolean)session.getAttribute("resultCheck"); %>
<%String grade = (String)session.getAttribute("grade"); %>
<%if (login == null){
	response.sendRedirect("Login.jsp");
}
	String username = login.getUsername();
	String password = login.getPassword();
	String userId = login.getUserId();
	String search = request.getParameter("txtsearch");
	System.out.println(username);
	System.out.println(userId);
	System.out.println("Grade: " + grade);
	%>

</head>
<body class="bg">



<div class=function-area>
		<%if (scheduleCheck){ %>
			<li>
				<form action="<%=request.getContextPath()%>/LoginSessionPass"
					method="post">

					<input type="hidden" name="nextpage" value="viewstudentschedule">
					<input type="hidden" name="studentid" value=<%=userId %>>
					<button type="submit" name="your_name" value="your_value"
						class="btn-link">View Schedule</button>
				</form>
			</li>
			<%} 
			
			%>
			<li><form action="<%=request.getContextPath()%>/NullMessageServlet" method="get">
			<input type="hidden" name="nextpage" value="login">
			<button class="btn-link" style="text-decoration:none;" type="submit">Logout</button>
			</form></li>
		</div>
			<h1 style="margin-left: 10px; color: white">STUDENT PROFILE</h1>
</ul>
</head>
<body>

<div class="student-profile py-4">
  <div class="container">
    <div class="row">
      <div class="col-lg-4">
        <div class="card shadow-sm">
          <div class="card-header bg-transparent text-center">
            
            <h3>Name: <%=student.getStudentFName() %> <%=student.getStudentMName()%> <%=student.getStudentLName()%></h3>
          </div>
          <div class="card-body">
            <p class="mb-0"><strong class="pr-1">Address:</strong><%=student.getStreetNum()%> <%=student.getBrgy()%> <%=student.getDistrict()%> <%=student.getCityMunicipality()%> <%=student.getProvince()%> <%=student.getRegion()%></p>
            <p class="mb-0"><strong class="pr-1">Email Address:</strong><%=student.getEmailAdd()%></p>
            <p class="mb-0"><strong class="pr-1">Contact No.:</strong><%=student.getContactNo()%></p>
            <p class="mb-0"><strong class="pr-1">Nationality:</strong><%=student.getNationality()%></p>
            <p class="mb-0"><strong class="pr-1">Sex:</strong><%=student.getSex()%></p>
            <p class="mb-0"><strong class="pr-1">Civil Status:</strong><%=student.getCivilStatus()%></p>
            <p class="mb-0"><strong class="pr-1">Employee Status:</strong><%=student.getEmpStatus()%></p>
            <p class="mb-0"><strong class="pr-1">Birth Date:</strong><%=student.getBirthDate()%></p>
            <p class="mb-0"><strong class="pr-1">Birth Place:</strong><%=student.getBirthPlace()%></p>
            
            <p class="mb-0"><strong class="pr-1">Educational Attainment:</strong><%=student.getEducAttain()%></p>
            <p class="mb-0"><strong class="pr-1">Parent's Name:</strong><%=student.getParentFName()%> <%=student.getParentMName()%> <%=student.getParentLName()%></p>
            <p class="mb-0"><strong class="pr-1">Parent's Address:</strong><%=student.getParentAddress()%></p>
            <p class="mb-0"><strong class="pr-1">Student Classification:</strong><%=student.getStudentClassification()%></p>
            <%if (student.getDisabilityType() == null){ %>
            <p class="mb-0"><strong class="pr-1">Disability:</strong>N/A</p>
            <%} else{%>
            <p class="mb-0"><strong class="pr-1">Disability:</strong><%=student.getDisabilityType()%></p>
            <%} %>
            <p class="mb-0"><strong class="pr-1">Accomplished NCAE:</strong><%=student.getAccompNcae()%>
            <%if(student.getAccompNcae().equals("Yes")){ %>
             <%=student.getNcaeWhere()%> <%=student.getNcaeWhen() %><%} %></p>
            <p class="mb-0"><strong class="pr-1">Course:</strong><%=student.getCourse()%></p>
            <p class="mb-0"><strong class="pr-1">Scholarship Type:</strong><%=student.getScholarshipType()%></p>
            <p class="mb-0"><strong class="pr-1">Status:</strong><%=student.getStatus()%></p>
            <p class="mb-0"><strong class="pr-1"><%=statusMessage %></strong></p>
            <%String company = null;
            String salaryMin = null;
            String salaryMax = null;
            if (student.getStatus().equals("Finished Course")){
            	if (student.getCompany() == null || student.getSalaryMin() == 0){
            		
            		company = "";
            		salaryMin = "";
            		salaryMax = "";
            	}
            	
            	%>
            <p class="mb-0"><strong class="pr-1">Result: <%=grade %></strong></p>
            <%
            String disable = null;
            String hidden = null;
            if (student.getCompany() != null || student.getSalaryMin() != 0){ 
            	company = student.getCompany();
        		salaryMin = Float.toString(student.getSalaryMin());
        		salaryMax = Float.toString(student.getSalaryMax());
            	disable = "disabled";
            	hidden = "hidden";
            }%>
            <label>Company for graduate tracing (Answer if applicable):</label>
            <form action="<%=request.getContextPath()%>/GraduateTraceServlet"
					method="post">
					<label>Company (Enter Self-Employed if self-employed)</label>
					<input type="text" name="company" value="<%=company %>" <%= disable %> required>
					<br>
					<label>Salary Range</label>
					<input type="number" name="salarymin" value="<%=salaryMin %>" <%= disable %> required>
					<label> - </label>
					<input type="number" name="salarymax" value="<%=salaryMax %>" <%= disable %> required>
					<input type="hidden" name="studentid" value=<%=userId %>>
					<button type="submit" name="your_name" value="your_value"
						class="btn-link" <%= disable %> <%= hidden %>>Submit</button>
				</form>
			
            <%} %>
         
        </div>
        
      </div>
      
        </div>
      </div>
    
			
			
			
    	</tr>
	
<b></b>
</body>
</html>
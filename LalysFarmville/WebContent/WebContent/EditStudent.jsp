<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@page import="com.ics.dao.*"%>
<%@page import="com.ics.bean.*"%>
<!DOCTYPE html>
<style>
@charset "ISO-8859-1";

body
{
	background-image: url("farm.jpg");
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
	position: relative;
	font-weight: 300;
	font-size: 14px;
	opacity: 1;
	font-family: 'Quicksand', sans-serif;
	align-items: flex-start;
}


a{
	font-family: 'Quicksand', sans-serif;
	font-weight: 500;
	font-size: 18px;
	color: black;
	text-decoration:none;
	background-color: #EDDEA4;
	border: black;
	cursor: pointer;
	transition: all 0.3s ease 02;
	color:black;
	padding:0.3em 1.2em;
	border-radius: 6em;
}
p
{
	font-size: 20px;
	text-align: left;
}

label
{
    display: inline-block;
    width: 250px;
    align-items:flex-start;
    font-weight: 900;
}
.item
{
	background-size: cover;
	min-height: 10px;
	display: flex;
	align-items: flex-start;
	justify-content: flex-start;
	position: relative;
	
}
.item input[type=text]
{
	border-radius: 4em;
	width: 250px;
	height: 30px;
}
input[type=password]
{
	border-radius: 4em;
	width: 250px;
	height: 30px;
}
input[type=email]
{
	border-radius: 4em;
	width: 250px;
	height: 30px;
}
input[type=number]
{
	border-radius: 4em;
	width: 250px;
	height: 30px;
}
input[type=date]
{
	border-radius: 4em;
	width: 250px;
	height: 30px;
}
select[name]
{
	border-radius: 4em;
	width: 300px;
	height: 50px;
}
.columns
{
	background: #228B22; 
	max-width: 850px;
	opacity: 0.7;
	width: 50;
	padding-top: 36px;
	padding-bottom: 40px;
	padding-left: 45px;
	padding-right: 45px;
}
.nav-area button{
	float: right;
	background: none;
	border: none;	
	font-family: 'Quicksand', sans-serif;
}


header{
	
	display: flex;
	justify-content: flex-end;
	align-items: center;
	padding: 30px 10;
	background: #1abc9c;
	width: 100%
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


.function-area{
	padding: 10px 5px;
	float:right;
}

.function-area li{
	display: inline-block;
	padding: 5px 10px;
}

.search{
	
	float:right;
}

button{
	padding: 9px 25px;
	background-color:#EDDEA4;
	border: black;
	border-radius: 2em;
	cursor: pointer;
	transition: all 0.3s ease 02;
	color:black;
}

#button{
	padding: 9px 25px;
	background-color:#EDDEA4;
	border: black;
	border-radius: 2em;
	cursor: pointer;
	transition: all 0.3s ease 02;
	color:black;
}
table{
	margin-top: 50px;
	margin-left: 50px;
	background: green;
	color: black;
}
.form{
	background: red;
	width: 500px;
	float: left;
}
.formsearch{
	
}

.popup{
	width: 100%;
	
	
	top: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	text-align: center;
	display:none;
}

.popup input{
	margin: 20px
}

.button{
	padding: 10px 15px;
	color: white;
	font-weight: bolder;
	text-transform: uppercase;
	font-size: 10px;
	box-shadow: 6px 6px 29px -4px black;
	margin-top: 25px;
	text-decoration: none;
	transition: 0.4s;
}
button[type=button]
{
	padding: 10px 15px;
	color: black;
	font-weight: bolder;
	text-transform: uppercase;
	font-size: 14px;
	box-shadow: 6px 6px 29px -4px black;
	margin-top: 25px;
	text-decoration: none;
	transition: 0.4s;
	align-items: center;
	width: 20%;
	height: 30%;
}
input[type=submit]
{
	padding: 10px 15px;
	color: white;
	font-weight: bolder;
	text-transform: uppercase;
	font-size: 14px;
	box-shadow: 6px 6px 29px -4px black;
	margin-top: 25px;
	text-decoration: none;
	transition: 0.4s;
	align-items: center;
	width: 20%;
	height: 30%;
	
}
input[value]
{
	color:black;
}
.popup-content{
	height: 180px;
	width: 500px;
	background: #54C34E;
	padding: 20px;
	border-radius: 5px;
	position: relative;
}
.columns
{
	background: #f5f2ea; 
	max-width: 850px;
	opacity: 0.7;
	width: 50;
	padding-top: 36px;
	padding-left: 45px;
	padding-right: 45px;
}
.container1
{
	display:flex;
    padding: 0;
    margin: 0;
    display: flex;
    align-items: center;
    justify-content: center;
}
</style>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Student</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@500&display=swap" rel="stylesheet">	
<%LoginBean login = (LoginBean)session.getAttribute("loginbean");
if (login == null){
	response.sendRedirect("Login.jsp");
}
String username = login.getUsername();
System.out.println(username);
StudentBean student = (StudentBean)session.getAttribute("student");
String message = (String)session.getAttribute("message");
String messagesched = (String)session.getAttribute("messagesched");
String display = null;
if (message == null){
	message = null;
	display = "none";
}
else{
	display = "block";
}
System.out.println(display);
%>
</head>
<body>

<br>
<div class=function-area>
		
		<br>
		
		<form action="<%=request.getContextPath()%>/LoginSessionPass"
			method="post">

			<input type="hidden" name="nextpage" value="studentmanagement">
			<input type="hidden" name="adminid" value=<%=login.getUserId() %>>
			<button type="submit" name="your_name" value="your_value"
				class="btn-link" style="font-family: 'Quicksand', sans-serif;">View Students</button>
				<a href="Login.jsp">Logout</a>
		</form>
	
		
		</div>
	
		
		
		
		
		<div class="popup">
			<div class="popup-content">
				<h2>Student edited successfully!</h2>
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
	<div class="columns" id="register_content">
		<form action="<%=request.getContextPath()%>/EditServlet"
			method="post" class=loginGroup>
		
			<div class="item">
				 <span><label><b>First
							Name:</b></label> <input type="text" name="firstname" required
					value="<%=student.getStudentFName()%>" pattern="[a-zA-Z'-'\s]*" > </span>
			</div>
			<br>
			<br>
			<div class="item">
				 <span><label><b>Middle
							Name:</b></label> <input type="text" name="middlename" required
					value="<%=student.getStudentMName()%>" pattern="[a-zA-Z'-'\s]*" > </span>
			</div>
			<br>
			<br>
			<div class="item">
				<label><b>Last Name:</b></label> <input type="text" name="lastname"
					required value="<%=student.getStudentLName()%>" pattern="[a-zA-Z'-'\s]*" >

			</div>
			<br>
			<br>
			<p><b>ADDRESS</b></p> <br> <br>
			<div class="item">
				
				<span><label><b>Number, Street:</b></label> <input
					type="text" name="streetnumber" required
					value="<%=student.getStreetNum()%>"> </span>
			</div>
			<br>
			<br>
			<div class="item">
				<span><label><b>Barangay:</b></label> <input type="text"
					name="barangay" required value="<%=student.getBrgy()%>">
				</span>
			</div>
			<br>
			<br>
			<div class="item">
				<span><label><b>District:</b></label> <input type="text"
					name="district" required value="<%=student.getDistrict()%>">
				</span>
			</div>
			<br>
			<br>
			<div class="item">
				<span><label><b>City/Municipality:</b></label> <input
					type="text" name="citymunicipality"
					placeholder="type nationality here" required pattern="[a-zA-Z'-'\s]*"  value="<%=student.getCityMunicipality()%>"> </span>
			</div>
			<br>
			<div class="item">
				<span><label><b>Province:</b></label> <input type="text"
					name="province" required value="<%=student.getProvince()%>" pattern="[a-zA-Z'-'\s]*" >
				</span>
			</div>
			<br>
			<br>
			<div class="item">
				<span><label><b>Region:</b></label> <input type="text"
					name="region" required value="<%=student.getRegion()%>" > </span>
			</div>
			<br>
			<br>
			<div class="item">
				<br> <span><label><b>EmailAddress:</b></label> <input
					type="email" name="emailadd" required
					value="<%=student.getEmailAdd()%>"> </span>
			</div>
			<br>
			<br>
			<div class="item">
				<span><label><b>Contact Number:</b></label> <input
					type="number" name="contactno" required
					value="<%=student.getContactNo()%>" oninvalid="this.setCustomValidity('Enter Numbers Only')"> </span>
			</div>
			<br>
			<br>
			<div class="item">
				<span><label><b>Nationality:</b></label> <input type="text"
					name="nationality" required value="<%=student.getNationality()%>" pattern="[a-zA-Z'-'\s]*" >
				</span>
			</div>
			<br>
			<br>
			<div class="item">
				<span><label><b>Sex:</b></label> <select name="sex" required>
						<option value="<%=student.getSex()%>"><%=student.getSex()%></option>
						<option value="Male">Male</option>
						<option value="Female">Female</option>
				</select> </span>
			</div>
			<br>
			<br>
			<div class="item">
				<span><label><b>Civil Status:</b></label> <select name="civilstatus" id="civilstatus" value="<%=student.getCivilStatus()%>" required>
						<option value="<%=student.getCivilStatus()%>"><%=student.getCivilStatus()%></option>
						<option value="Married">Married</option>
						<option value="Single">Single</option>
						<option value="Widowed">Widowed</option>
						<option value="Separated">Separated</option>
						<option value="Solo Parent">Solo Parent</option>
				</select> </span>
			</div>
			<br>
			<br>
			<div class="item">
				<span><label><b>Employment Status:</b></label> <select name="employmentstatus" id="employmentstatus" value="<%=student.getEmpStatus()%>" required>
						<option value="<%=student.getEmpStatus()%>"><%=student.getEmpStatus()%></option>
						<option value="Employed">Employed</option>
						<option value="Unemployed">Unemployed</option>
				</select> </span>
			</div>
			<br>
			<br>
			<div class="item">
				<span><label><b>Birth Date:</b></label> <input type="date"
					name="birthdate" required value="<%=student.getBirthDate()%>">
				</span>
			</div>
			<br>
			<br>
			<div class="item">
				<span><label><b>Birth Place:</b></label> <input type="text"
					name="birthplace" required value="<%=student.getBirthPlace()%>" pattern="[a-zA-Z'-'\s]*" >
				</span>
			</div>
			<br>
			<br>
			<div class="item">
				<span><label><b>Educational Attainment:</b></label> <select name="educattain" id="educattain" value="<%=student.getEducAttain()%>" required>
						<option value="<%=student.getEducAttain()%>"><%=student.getEducAttain()%></option>
						<option value="No Grade Completed">No Grade Completed</option>
						<option value="Elementary Undergraduate">Elementary Undergraduate</option>
						<option value="Elementary Graduate">Elementary Graduate</option>
						<option value="Pre-School">Pre-School (Nusery/Kinder/Prep)</option>
						<option value="Post Secondary Undergraduate">Post Secondary Undergraduate</option>
						<option value="Post Secondary Graduate">Post Secondary Graduate</option>
						<option value="High School Undergraduate">High School Undergraduate</option>
						<option value="College Undergraduate">College Undergraduate</option>
						<option value="Junior High Graduate">Junior High Graduate</option>
						<option value="High School Graduate">High School Graduate </option>
						<option value="College Graduate or Higher">College Graduate or Higher</option>
						<option value="Senior High Graduate">Senior High Graduate</option>
				</select> </span>
			</div>
			<br>
			<br>
			<div class="item">
				<span><label><b>Parent's Last Name:</b></label> <input type="text"
					name="parentlname" value="<%=student.getParentLName()%>" pattern="[a-zA-Z'-'\s]*" >
				</span>
			</div>
			<br>
			<br>
			<div class="item">
				<span><label><b>Parent's First Name:</b></label> <input type="text"
					name="parentfname"  value="<%=student.getParentFName()%>" pattern="[a-zA-Z'-'\s]*" >
				</span>
			</div>
			<br>
			<br>
			<div class="item">
				<span><label><b>Parent's Middle Name:</b></label> <input type="text"
					name="parentmname"  value="<%=student.getParentMName()%>" pattern="[a-zA-Z'-'\s]*" >
				</span>
			</div>
			<br>
			<br>
			<div class="item">
				<span><label><b>Parent's Address:</b></label> <input type="text"
					name="parentaddress"  value="<%=student.getParentAddress()%>">
				</span>
			</div>
			<br>
			<br>
			<div class="item">
				<span><label><b>Student Classification:</b></label> <select name="studentclassification" id="studentclassification" value="<%=student.getStudentClassification()%>" required>
						<option value="<%=student.getStudentClassification()%>"><%=student.getStudentClassification()%></option>
						<option value="Students">Students</option>
						<option value="Out-of-School-Youth">Out-of-School-Youth</option>
						<option value="Solo Parent">Solo Parent</option>
						<option value="Solo Parent's Children">Solo Parent's
							Children</option>
						<option value="Senior Citizens">Senior Citizens</option>
						<option value="Displaced HEIs Teaching Personnel">Displaced
							HEIs Teaching Personnel</option>
						<option value="Displaced Workers">Displaced Workers</option>
						<option value="TVET Trainers">TVET Trainers</option>
						<option value="Currently Employed Workers">Currently
							Employed Workers</option>
						<option value="Employees with Contractual/Job-Order Status">Employees
							with Contractual/Job-Order Status</option>
						<option value="TESDA Alumni">TESDA Alumni</option>
						<option value="Urban and Rural Poor">Urban and Rural Poor</option>
						<option value="Informal Workers">Informal Workers</option>
						<option value="Industry Workers">Industry Workers</option>
						<option value="Cooperatives">Cooperatives</option>
						<option value="Family Enterprises">Family Enterprises</option>
						<option value="Micro Entrepreneurs">Micro Entrepreneurs</option>
						<option value="Family Members of Microentrepreneur">Family
							Members of Microentrepreneur</option>
						<option value="Farmers and Fishermen">Farmers and
							Fishermen</option>
						<option value="Family Members of Farmers and Fisherman">Family
							Members of Farmers and Fisherman</option>
						<option value="Community Trng. & Employment Coordinator">Community
							Trng. & Employment Coordinator</option>
						<option value="Returning/Repariated Overseas Filipino Workers">Returning/Repariated
							Overseas Filipino Workers</option>
						<option value="Overseas Filipino Workers Dependents">Overseas
							Filipino Workers Dependents</option>
						<option value="Persons with Disabilities">Persons with
							Disabilities</option>
						<option value="Indigenous People & Cultural Communities">Indigenous
							People & Cultural Communities</option>
						<option value="Disadvantaged Women">Disadvantaged Women</option>
						<option value="Victim of Natural Disasters and Calamities">Victim
							of Natural Disasters and Calamities</option>
						<option value="Victim or Survivor of Human Trafficking">Victim
							or Survivor of Human Trafficking</option>
						<option value="Drug Dependent Surrenderers">Drug
							Dependent Surrenderers</option>
						<option value="Rebel Returnees or Decommissioned Combatants">Rebel
							Returnees or Decommissioned Combatants</option>
						<option value="Inmates and Detainees">Inmates and
							Detainees</option>
						<option value="Wounded-in-Action AFP & PNP Personnel">Wounded-in-Action
							AFP & PNP Personnel</option>
						<option
							value="Family Members of AFP and PNP Killed-and-Wounded In-Action">Family
							Members of AFP and PNP Killed-and-Wounded In-Action</option>
						<option value="Family Members of Inmates and Detainees">Family
							Members of Inmates and Detainees</option>
						<option value="Uniformed Personnel">Uniformed Personnel</option>
				</select> </span>
			</div>
			
			<br>
			<br>
			<label><b>Disability Type:</b></label> <select name="disabilitytype">
				<option value="<%=student.getDisabilityType()%>"><%=student.getDisabilityType()%></option>
				<option value="Mental/Intellectual">Mental/Intellectual</option>
				<option value="Hearing Disability">Hearing Disability</option>
				<option value="Psychological Disability">Psychological Disability</option>
				<option value="Visual Disability">Visual Disability</option>
				<option value="Speech Impairment">Speech Impairment</option>
				<option value="Disability Due to Chronic Illness">Disability Due to Chronic Illness</option>
				<option value="Orthopedic (Musculoskeletal) Disability">Orthopedic (Musculoskeletal) Disability</option>
				<option value="Learning Disability">Learning Disability</option>
			</select> 
			<br>
			<br>
			<div class="item">
			<label><b>Multiple Disabilities, specify:</b></label> <input
				type="text" name="multipledisability" value="multiple disabilities"> <br>
				</div>
			<br>
			<br>
			<div class="item">
				<span><label><b>Did you take the NCAE:</b></label> <select id="selectncae" name="ncaetake" required>
						<option value="<%=student.getAccompNcae() %>"><%=student.getAccompNcae() %></option>
						<option id="yesncae" value="Yes">Yes</option>
						<option id="noncae" value="No">No</option>
				</select> </span>
			</div>
			<br>
			
			
			<br>
			<div class="item">
				<span><label><b>If yes, Where?:</b></label> <input type="text"
					id="ncaeid" name="ncaewhere" value="<%=student.getNcaeWhere()%>" pattern="[a-zA-Z'-'\s]*" >
				</span>
			</div>
			<br>
			<div class="item">
				<span><label><b>If yes, When:</b></label> <input type="text"
					id="ncaeid2" name="ncaewhen" value="<%=student.getNcaeWhen()%>">
				</span>
			</div>
			
			<br>
			<script>
			function ncaeyesno() {
				var yesno = document.getElementById('selectncae');
				var selectedValue = yesno.options[yesno.selectedIndex].value;
				if (selectedValue == "No" || selectedValue == "<%=student.getAccompNcae() %>") {
					document.getElementById('ncaeid').disabled = true;
					document.getElementById('ncaeid2').disabled = true;
				} else {
					document.getElementById('ncaeid').disabled = false;
					document.getElementById('ncaeid2').disabled = false;
					document.getElementById('ncaeid').required = true;
					document.getElementById('ncaeid2').required = true;
				}
			}
			
			document.getElementById('selectncae').addEventListener("click", ncaeyesno);
			</script>
			<br>
			<div class="item">
				<span><label><b>Course:</b></label> <select name="course" id="civilstatus"  required>
						<option value="<%=student.getCourse()%>"><%=student.getCourse()%></option>
						<option value="Organic Agriculture Production NC II">Organic Agriculture Production NC II</option>
						<option value="Production of High-Quality Inbred Rice and Seed Certification, and Farm Mechanization">Production of High-Quality Inbred Rice and Seed Certification, and Farm Mechanization</option>
				
				</select> </span>
			</div>
			<br>
			<br>
			<div class="item">
				<span><label><b>Status:</b></label> <select name="studentstatus" id="studentstatus"  required>
						<option value="<%=student.getStatus()%>"><%=student.getStatus()%></option>
						<option value="Pending Approval">Pending Approval</option>
						<option value="Approved (No schedule)">Approved (No schedule)</option>
						<option value="Approved (Active with schedule)">Approved (Active with schedule)</option>
						<option value="Finished Course">Finished Course</option>
				</select> </span>
			</div>
			<br>
			<br>
			<div class="item">
			<span><label><b>Schedule Code: </b></label> <select name="schedulecode">
			<option value="<%=student.getScheduleId() %>"></option>
			<%
			try{
				Class.forName("com.mysql.jdbc.Driver");
					Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/lalysfarmville", "root",
							"virgo0six"); 
					PreparedStatement preparedStatement = conn.prepareStatement("select * from schedule");
				ResultSet rs = preparedStatement.executeQuery("select * from schedule");
				while (rs.next()) {
					%>
					<option value="<%=rs.getString("schedule_id") %>"><%=rs.getString("schedule_id") %></option>
					<% 
				}
				
			} catch (Exception p) {
				System.out.println(p);
			}
			%>
			</div>
			<br>
			<br>
			<br>
			</select>
			<div class="item">
				<span><label><b>If Scholar, What type of scholarship:</b></label> <select name="scholarship" id="studentstatus"  required>
						<option value="<%=student.getScholarshipType()%>"><%=student.getScholarshipType()%></option>
						<option value="TWSP">TWSP</option>
						<option value="PESFA">PESFA</option>
						<option value="STEP">STEP</option>
						<option value="Others">Others</option>
				</select> </span>
			</div>
			<br>
			<br>
			
			<input type="hidden" name="adminid" value="<%=login.getUserId()%>">
			 <input type="hidden" name="userid" value="<%=student.getUserID()%>">
			 <div class="container1">
			 <input type="submit" name="btnsubmit" value="SUBMIT"
				id="button" style= "margin-right:50px !important; margin-left: 240px;"">
				
		</form>

		<button type="button" id="delete" onclick = "document.getElementById('areyousure').style.display = 'block'">Delete</button>
		<div id="areyousure" style="display:none;">
		<form action="<%=request.getContextPath()%>/DeleteServlet"
			method="post">
			<label>Are you sure you want to delete this student record?</label>
			<input type="hidden" name="adminid" value="<%=login.getUserId()%>">
			 <input type="hidden" name="userid" value="<%=student.getUserID()%>">
			 
			 <input id="deletebutton" type="submit" name="deletebutton" value="Yes">
			</form>
			
	</div>
		</div>
    	
		
	</table>
	</div>
</body>
</html>
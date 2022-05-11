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
<link rel="stylesheet" type="text/css" href="addstudent.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@500&display=swap" rel="stylesheet">	
<%LoginBean login = (LoginBean)session.getAttribute("loginbean"); 
if (login == null){
	response.sendRedirect("Login.jsp");
	}%>
<%String errorCheck = (String)request.getAttribute("ErrorCheck"); %>
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
<title>Add Student</title>

<style>

</style>
</head>

<body class="flexcontainer">

	
	<div class=function-area>
	
		
		<br>
		
		<li>
		<form action="<%=request.getContextPath()%>/LoginSessionPass"
			method="post">

			<input type="hidden" name="nextpage" value="studentmanagement">
			<input type="hidden" name="adminid" value=<%=login.getUserId()%>>
			<button type="submit" name="your_name" value="your_value"
				class="btn-link" style="font-family: 'Quicksand', sans-serif; font-size: 15px; padding: 3px;">View Students</button>
		</form>
	</li>
		<li><form action="<%=request.getContextPath()%>/NullMessageServlet" method="get">
			<input type="hidden" name="nextpage" value="login">
			<button class="btn-link" style="text-decoration:none;" type="submit">Logout</button>
			</form></li>
		</div>
		
	
	<div class="columns" id="register_content">
		<section>
			<div class="popup">
			<div class="popup-content">
				<h2>Student added successfully!</h2>
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

			
			<p>FILL IN THE NECESSARY DETAILS.</p>
		</section>
		<br>
		<form action="<%=request.getContextPath()%>/AddStudentServlet"
			method="post" class=loginGroup>
			<div class="item">
				 <span><label><b>Username:</b></label>
					<input type="text" name="username" required
					placeholder="type username here"> </span>
			</div>
			<br>
			<%if(errorCheck != null){ %>
				<span style="color: red;">${error}</span>
				<br>
				<%} %>
			
			<div class="item">
				<span><label><b>Password:</b></label>
					<input type="password" name="password" required
					placeholder="type password here"> </span>
			</div>
			<br>
			
			<div class="item">
				 <span><label><b>First
							Name:</b></label> <input type="text" name="firstname" required
					placeholder="type first name here" pattern="[a-zA-Z'-'\s]*" > </span>
			</div>

			<br>
			<div class="item">
				<span><label><b>Middle
							Name:</b></label> <input type="text" name="middlename" required
					placeholder="type middle name here" pattern="[a-zA-Z'-'\s]*" > </span>
			</div>
			<br>

			<div class="item">
				<label><b>Last Name:</b></label> <input type="text" name="lastname"
					required placeholder="type last name here" pattern="[a-zA-Z'-'\s]*" >

			</div>

			<br>
			<p><b>ADDRESS</b></p> <br> <br>
			<div class="item">
				
				 <span><label><b>Number, Street:</b></label> <input type="text" name="streetnumber" required
					placeholder="type address street number here" > </span>
			</div>

			<br>
			<div class="item">
				<span><label><b>Barangay:</b></label> <input type="text"
					name="barangay" required placeholder="type barangay here">
				</span>
			</div>
			<br>

			<div class="item">
				<span><label><b>District:</b></label> <input type="text"
					name="district" required placeholder="type district here">
				</span>
			</div>
			<br>
			<div class="item">
				<span><label><b>City/Municipality:</b></label> <input
					type="text" name="citymunicipality"
					placeholder="type nationality here" required pattern="[a-zA-Z'-'\s]*" > </span>
			</div>
			<br>
			<div class="item">
				<span><label><b>Province:</b></label> <input type="text"
					name="province" required placeholder="type province here" pattern="[a-zA-Z'-'\s]*" >
				</span>
			</div>
			<br>

			<div class="item">
				<span><label><b>Region:</b></label> <input type="text"
					name="region" required placeholder="type region here"> </span>
			</div>
			<br>

			<div class="item">
				 <span><label><b>EmailAddress:</b></label> <input
					type="email" name="emailadd" required
					placeholder="type email address here"> </span>
			</div>

			<br>
			<div class="item">
				<span><label><b>Contact Number:</b></label> <input
					type="number" name="contactno" required
					placeholder="type contact number here" > </span>
			</div>
			<br>

			<div class="item">
				<span><label><b>Nationality:</b></label> <input type="text"
					name="nationality" required placeholder="type nationality here" pattern="[a-zA-Z'-'\s]*" >
				</span>
			</div>
<br>
			
			<div class="item">
				<span><label><b><br>Sex:</b></label> <select name="sex" required>
						<option value="">--Select Sex--</option>
						<option value="Male">Male</option>
						<option value="Female">Female</option>
				</select> </span>
			</div>

			<br>
			<div class="item">
				<span><label><b>Civil Status:</b></label> <select
					name="civilstatus" id="civilstatus" required>
						<option value="">--Select Civil Status--</option>
						<option value="Married">Married</option>
						<option value="Single">Single</option>
						<option value="Widowed">Widowed</option>
						<option value="Separated">Separated</option>
						<option value="Solo Parent">Solo Parent</option>
				</select> </span>
			</div>

			<br>
			<div class="item">
				<span><label><b>Employment Status:</b></label> <select
					name="employmentstatus" id="civilstatus" required>
						<option value="">--Select Employment Status--</option>
						<option value="Employed">Employed</option>
						<option value="Unemployed">Unemployed</option>
				</select> </span>
			</div>

			<br>
			<div class="item">
				<span><label><b>Birth Date:</b></label> <input type="date"
					name="birthdate" required placeholder="MM/DD/YYYY"> </span>
			</div>
			<br>

			<div class="item">
				<span><label><b>Birth Place:</b></label> <input type="text"
					name="birthplace" required placeholder="type birthplace here" pattern="[a-zA-Z'-'\s]*" >
				</span>
			</div>

			<br>
			<div class="item">
				<span><label><b>Educational Attainment:</b></label> <select
					name="educattain" id="civilstatus" required>
						<option value="">--Select Educational Attainment--</option>
						<option value="No Grade Completed">No Grade Completed</option>
						<option value="Elementary Undergraduate">Elementary
							Undergraduate</option>
						<option value="Elementary Graduate">Elementary Graduate</option>
						<option value="Pre-School">Pre-School
							(Nusery/Kinder/Prep)</option>
						<option value="Post Secondary Undergraduate">Post
							Secondary Undergraduate</option>
						<option value="Post Secondary Graduate">Post Secondary
							Graduate</option>
						<option value="High School Undergraduate">High School
							Undergraduate</option>
						<option value="College Undergraduate">College
							Undergraduate</option>
						<option value="Junior High Graduate">Junior High Graduate</option>
						<option value="High School Graduate">High School Graduate
						</option>
						<option value="College Graduate or Higher">College
							Graduate or Higher</option>
						<option value="Senior High Graduate">Senior High Graduate</option>
				</select> </span>
			</div>
			<br>

			<div class="item">
				<span><label><b>Parent's Last Name:</b></label> <input
					type="text" name="parentlname" placeholder="type parent's last name here" pattern="[a-zA-Z'-'\s]*" >
				</span>
			</div>
			<br>

			<div class="item">
				<span><label><b>Parent's First Name:</b></label> <input
					type="text" name="parentfname" placeholder="type parent's first name here" pattern="[a-zA-Z'-'\s]*" >
				</span>
			</div>
			<br>

			<div class="item">
				<span><label><b>Parent's Middle Name:</b></label> <input
					type="text" name="parentmname" placeholder="type parent's middle name here" pattern="[a-zA-Z'-'\s]*" >
				</span>
			</div>
			<br>

			<div class="item">
				<span><label><b>Parent's Address:</b></label> <input
					type="text" name="parentaddress"
					placeholder="type parent's address here"> </span>
			</div>
			<br>

			
			<div class="item">
				<span><label><b>Student Classification:</b></label> <select name="studentclassification" id="studentclassification"  required>
						<option value="">--Select Student Classification--</option>
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
			<div class ="item">
			<label><b>Disability Type:</b></label> <select name="disabilitytype">
				<option value="">--Select Disability Type--</option>
				<option value="Mental/Intellectual">Mental/Intellectual</option>
				<option value="Hearing Disability">Hearing Disability</option>
				<option value="Psychological Disability">Psychological Disability</option>
				<option value="Visual Disability">Visual Disability</option>
				<option value="Speech Impairment">Speech Impairment</option>
				<option value="Disability Due to Chronic Illness">Disability Due to Chronic Illness</option>
				<option value="Orthopedic (Musculoskeletal) Disability">Orthopedic (Musculoskeletal) Disability</option>
				<option value="Learning Disability">Learning Disability</option>
			</select> 
			</div>
			<br>
			<div class="item">
				<span><label><b>Did you take the NCAE:</b></label> <select id="selectncae" name="ncaetake" required>
						<option value="">--Select Yes or No--</option>
						<option id="yesncae" value="Yes">Yes</option>
						<option id="noncae" value="No">No</option>
				</select> </span>
			</div>
			<br>
			
			<div class="item">
				<span><label><b>If yes, Where?:</b></label> <input
					type="text" id="ncaeid" name="ncaewhere"
					placeholder="Where did you take the NCAE" disabled pattern="[a-zA-Z'-'\s]*" > </span>
			</div>
			<br>
			<div class="item">
				<span><label><b>If yes, When:</b></label> <input type="number"
					id="ncaeid2" name="ncaewhen"
					placeholder="When did you take the NCAE" disabled> </span>
			</div>

			<br>
			<script>
				
				function ncaeyesno() {
					var yesno = document.getElementById('selectncae');
					var selectedValue = yesno.options[yesno.selectedIndex].value;
					if (selectedValue == "No" || selectedValue == "") {
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
			
			<div class="item">
				<span><label><b>Course:</b></label> <select name="course"
					id="civilstatus" required>
						<option value="">--Select Course--</option>
						<option value="Organic Agriculture Production NC II">Organic
							Agriculture Production NC II</option>
						<option
							value="Production of High-Quality Inbred Rice and Seed Certification, and Farm Mechanization">Production
							of High-Quality Inbred Rice and Seed Certification, and Farm
							Mechanization</option>
				</select> </span>
			</div>
			<br>
			<div class="item">
				<span><label><b>If Scholar, What type of scholarship:</b></label> <select name="studentstatus" id="studentstatus"  required>
						<option value="TWSP">TWSP</option>
						<option value="PESFA">PESFA</option>
						<option value="STEP">STEP</option>
						<option value="Others">Others</option>
				</select> </span>
			</div>
			<br>
			<input type="hidden" name="pagename" value="add">
			<input type="hidden" name="adminid" value="<%= login.getUserId() %>">
			<div class="container1">
			 <input type="submit" name="btnsubmit" value="SUBMIT"
				id="button">
				</div>
		</form>
	</div>

	<div class="columns" id="title_content">
		<section>
			
		</section>
	</div>
</body>
</html>
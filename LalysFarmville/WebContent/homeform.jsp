<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@page import="com.ics.dao.*"%>
<%@page import="com.ics.bean.*"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@500&display=swap" rel="stylesheet">	
<style>
*{
	font-family: 'Quicksand', sans-serif;
	color: black;
}
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
body
{
		background-image: url("farm.jpg");
		background-size: cover;
		font-weight: 300;
		font-size: 14px;
		font-family: 'Quicksand', sans-serif !important;
}
.popup {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    font-family: "sans-serif";
    font-weight: bold;
  }

  .popup-content {
    background-color: #fefefe;
    margin: 15% auto; /* 15% from the top and centered */
    padding: 20px;
    border: 1px solid #888;
    width: 80%; /* Could be more or less, depending on screen size */
  }
h4{
	color: #2F2F2F;
	font-weight: 600;
	text-transform: uppercase;
	padding-left: 20px;
	position: relative;
	font-family: "Quicksand", sans-serif;
	margin-top: 50px;
	font-size: 200%;
}
h3{
	color: #2F2F2F;
	font-weight: 600;
	text-transform: uppercase;
	padding-left: 20px;
	position: absolute;
	font-family: "Quicksand", sans-serif;
}
label{
	color: #2F2F2F;
	font-weight: 600;
	text-transform: uppercase;
	padding-left: 20px;
	position: relative;
	font-family: "Quicksand", sans-serif;
	margin-top: 50px;
}
input[type=text]
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
input[type=submit]{
	background-color: #EDDEA4;
	display: inline-block;
	justify-content: space-evenly;
	padding: 10px 10;
	border-radius: 6em;
	border:none;
	font-size: 20px;
	width: 10%;
	margin-bottom: 20px;
}
input[type=reset]{
	background-color: #EDDEA4;
	display: inline-block;
	justify-content: space-evenly;
	padding: 10px 10;
	border-radius: 6em;
	border:none;
	font-size: 20px;
	width: 10%;
	margin-bottom: 20px;
}
table
{
	width: 100%;
	border-collapse: collapse;
	text-align: center;
}
table tr th
{
	background-color: #F0ffec;
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
	vertical-align: top;
	text-align: center;
}
</style>
<head>
<%LoginBean login = (LoginBean)session.getAttribute("loginbean"); %>
<%WebsiteContentBean content = (WebsiteContentBean)session.getAttribute("content");
ArrayList staffList = (ArrayList) session.getAttribute("stafflist");
ArrayList productsList = (ArrayList) session.getAttribute("productslist");
%>
<%if (login == null){
	response.sendRedirect("Login.jsp");
}else{
	
}
	StudentBean student = new StudentBean();
	String username = login.getUsername();
	
	String userId = login.getUserId();
	String search = request.getParameter("txtsearch");
	System.out.println(username);
	System.out.println(userId);
	String message = (String)session.getAttribute("message");
	String display = null;
	if (message == null){
		message = null;
		display = "none";
	}
	else{
		display = "block";
	}
	%>
<meta charset="ISO-8859-1">
<title>Edit Content</title>
</head>

<body>
<div class="popup">
			<div class="popup-content">
				<h2><%=message %></h2>
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
<div class="headerbg">
		<h2></h2>
		<div class=function-area>
		<br>
		
				<form action="<%=request.getContextPath()%>/LoginSessionPass"
					method="post">

					<input type="hidden" name="nextpage" value="addschedule"> <input
						type="hidden" name="adminid" value=<%=userId %>>
					<button type="submit" name="your_name" value="your_value"
						class="btn-link">Add Schedule</button>
				</form>
			<br>
		
		<form action="<%=request.getContextPath()%>/LoginSessionPass"
			method="post">

			<input type="hidden" name="nextpage" value="studentmanagement">
			<input type="hidden" name="adminid" value=<%=userId%>>
			<button type="submit" name="your_name" value="your_value"
				class="btn-link">View Students</button>
		</form>
	<br>
		<form action="<%=request.getContextPath()%>/NullMessageServlet" method="get">
			<input type="hidden" name="nextpage" value="login">
			<button class="btn-link" style="text-decoration:none;" type="submit">Logout</button>
			</form></li>
		</div>
		
		</div>
	<h1 style="text-align:center;"> Edit Content </h1>
	<form name="homeEdit" action="<%=request.getContextPath()%>/WebsiteContentServlet" method="post">
		<table>
			<tbody>
				<tr>
					<td>Welcome Message</td>
					<td><input type="text" name="welcomemessage" style="width:600px;height:60px;" size="250" value="<%= content.getWelcomeMessage()%>"></td>
				</tr>
				
				<tr>
					<td>About Us</td>
					<td><input type="text" name="about" style="width:600px;height:60px;" size="250" value="<%= content.getAboutUs()%>"></td>
				</tr>
				<tr>
					<td>Mission</td>
					<td><input type="text" name="mission" style="width:600px;height:60px;" size="250" value="<%= content.getMission()%>"></td>
				</tr>
				<tr>
					<td>Vision</td>
					<td><input type="text" name="vision" style="width:600px;height:60px;" size="250" value="<%= content.getVision()%>"></td>
				</tr>
				<tr>
					<td>Farm Values</td>
					<td><input type="text" name="values" style="width:600px;height:60px;" size="250" value="<%= content.getFarmValues()%>"></td>
				</tr>
				
				<tr>
					<td>Contact Number 1</td>
					<td><input type="text" name="contactnumber1" style="width:600px;height:60px;" size="250" value="<%= content.getContactNumber1()%>"></td>
				</tr>
				<tr>
					<td>Contact Number 2</td>
					<td><input type="text" name="contactnumber2" style="width:600px;height:60px;" size="250" value="<%= content.getContactNumber2()%>"></td>
				</tr>
			</tbody>
		</table>
				<br><br>
				<input type="hidden" name="adminid" value="<%=login.getUserId()%>">
				<input type="hidden" name="process" value="websitecontent">
				<input type="reset" value="Clear" id="clear">
				<input type="submit" value="Submit" id="submit">
	</form>
	<br><br>
	
	<h1>Edit Staff</h1>
	<div class="staff">
	<table id="table">
	<tr>
		<th>Staff Name</th>
		<th>Position</th>
	</tr>
	
		<%
				for (int i = 0; i < staffList.size(); i++) {
				%>
				<%
				StaffBean staffBean = (StaffBean) staffList.get(i);
				%>
				<tr>
				<td id="namevalue"><%=staffBean.getStaffName() %></td>
				<td id="positionvalue"><%=staffBean.getPosition() %></td>
				<!--  
				<td>
					<form action="<%=request.getContextPath()%>/WebsiteContentServlet" method="post">
					
					<input type="hidden" name="adminid" value="<%=login.getUserId()%>">	
					<input type="submit" value="submit" id="submit">
					
					</form>-->
				<td hidden id="staffid"><%=staffBean.getStaffId() %></td>
				<td><button type="button" id="edit" >Edit</button></td>
				</td>
				</tr>
				<%} %>
	</table>
	
	<br>
	<form action="<%=request.getContextPath()%>/WebsiteContentServlet" method="post">
		<input type="hidden" name="staffid" id="staffidbox">
		<br>
		<label>Staff Name:</label>
		<input type="text" name="staffname" id="staffname" required>
		<br>
		<label>Position:</label>
		<input type="text" name="position" id="position" required>
		<input type="hidden" name="adminid" value="<%=login.getUserId()%>">
		<input type="hidden" name="process" value="edit">
		<input type="submit" value="submit" id="submit">
	
	</form>
	<script>
		const staffId = document.getElementById('staffid').innerHTML;
		const name = document.getElementById('namevalue').innerHTML;
		const position = document.getElementById('positionvalue').innerHTML;
		const edit = document.getElementById('edit');
		const staffidbox = document.getElementById('staffidbox');
		const namebox = document.getElementById('staffname');
		const positionbox = document.getElementById('position');
		/*
		function fun1(){
			staffidbox.setAttribute('value', staffId);
			alert(staffId);
			namebox.setAttribute('value', name);
			positionbox.setAttribute('value', position);
			
		}*/
		
		 var table = document.getElementById('table');
         
         for(var i = 1; i < table.rows.length; i++)
         {
             table.rows[i].onclick = function()
             {
                  //rIndex = this.rowIndex;
                  
                  document.getElementById("staffname").value = this.cells[0].innerHTML;
                  document.getElementById("position").value = this.cells[1].innerHTML;
                  document.getElementById("staffidbox").value = this.cells[2].innerHTML;
             };
         }
		
	</script>
	<br>
	<br>
	<h1>Add Staff</h1>
	<form action="<%=request.getContextPath()%>/WebsiteContentServlet" method="post" enctype="multipart/form-data">
		<label>Image:</label>
		<input type="file" name="image">
		<br>
		<label>Staff Name:</label>
		<input type="text" name="staffname" required>
		<br>
		<label>Position:</label>
		<input type="text" name="position"  required>
		<input type="hidden" name="adminid" value="<%=login.getUserId()%>">
		<input type="hidden" name="process" value="staff">
		<input type="submit" value="submit" id="submit">
	
	</form>
	</div>
	
	<br>
	<br>
	
	<table id="table2">
	<tr>
		<th>Product Name</th>
		<th>Product Description</th>
	</tr>
	<%
				for (int i = 0; i < productsList.size(); i++) {
				%>
				<%
				ProductsBean productsBean = (ProductsBean) productsList.get(i);
				%>
				<tr>
				<td id="namevalue"><%=productsBean.getProductName() %></td>
				<td id="positionvalue"><%=productsBean.getProductDesc() %></td>
				<td hidden id="staffid"><%=productsBean.getProductId() %></td>
				<td><button type="button" id="edit" >Edit</button></td>
				</td>
				</tr>
				<%} %>
	
	</table>
	<br>
	<h1>Edit Product</h1>
	<br>
	<br>

	<form action="<%=request.getContextPath()%>/WebsiteContentServlet" method="post" enctype="multipart/form-data">
		<input type="hidden" name="productid" id="productidbox">
		<label>Product Name:</label>
		<input type="text" name="productname" id="productname" required>
		<br>
		<label>Product Description:</label>
		<input type="text" name="productdesc" id="productdesc" required>
		<input type="hidden" name="adminid" value="<%=login.getUserId()%>">
		<input type="hidden" name="process" value="editproduct">
		<input type="submit" value="submit" id="submit">
	
	</form>
	<br>
	<br>
	<script>
	var table = document.getElementById('table2');
    
    for(var i = 1; i < table.rows.length; i++)
    {
        table.rows[i].onclick = function()
        {
             //rIndex = this.rowIndex;
             
             document.getElementById("productname").value = this.cells[0].innerHTML;
             document.getElementById("productdesc").value = this.cells[1].innerHTML;
             document.getElementById("productidbox").value = this.cells[2].innerHTML;
        };
    }
	</script>
	<h1>Add Product</h1>
	<form action="<%=request.getContextPath()%>/WebsiteContentServlet" method="post" enctype="multipart/form-data">
		<label>Image:</label>
		<input type="file" name="image">
		<br>
		<label>Product Name:</label>
		<input type="text" name="productname" required>
		<br>
		<label>Product Description:</label>
		<input type="text" name="productdesc"  required>
		<input type="hidden" name="adminid" value="<%=login.getUserId()%>">
		<input type="hidden" name="process" value="addproduct">
		<input type="submit" value="submit" id="submit">
	
	</form>
	
	
	
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<style>
.formbody{
	width: 1000px;
	height: 300px;
	background-color: white;
	position: absolute;
	top: 20vh;
	left: 35vh;
	background: white;
	padding: 40px;
	border-radius: 10px;
	box-shadow: 0px 0px 10px 0px #000
}
body, html {
  height: 100%;
    background-image: url("farm.jpg");
}

.bg {

  height: 100%;
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
}
.fcolor2{
  color: #DCAE1D;
  font-size: 15px;
  
}

input{
	padding: 10px;
}
.popup1 {
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

  .popup-content1 {
    background-color: #fefefe;
    margin: 15% auto; /* 15% from the top and centered */
    padding: 20px;
    border: 1px solid #888;
    width: 80%; /* Could be more or less, depending on screen size */
  }
    .close {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
  }
  p{
  	color: blue;
  }
</style>
<head>
<%
String message = null;
message = (String)session.getAttribute("message");
String display = null;
if (message == null){
	message = null;
	display = "hidden";
}
else{
	display = "block";
}
System.out.println(message);
%>
<meta charset="ISO-8859-1">
<title>Forgot Password</title>
</head>
<body>

<div class="formbody">
<h1>Forgot Password</h1>
<form action="<%=request.getContextPath()%>/ForgotPasswordServlet"
			method="post">
<label>Enter username:</label>
<input type="text" name="username" placeholder="Enter your username" required>
<br>
<p <%=display %>><%=message %></p>
<input type="submit" value="Submit">
<br>
<a href = "Login.jsp" class="fcolor2" style="text-decoration:none;">Back to Login</a>
<p>Check your email after clicking submit. It may take a few seconds.</p>
</form>

</div>
</body>
</html>
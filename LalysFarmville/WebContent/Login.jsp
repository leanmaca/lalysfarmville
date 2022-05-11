<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%String errorCheck = null; %>
<%errorCheck = (String)session.getAttribute("message"); %>
	<title>Login Page</title>
	<link rel="stylesheet" type="text/css" href="CSS/login_register_style.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
</head>
<style>
.logo2{
  margin-top: -30px;
  margin-bottom: -15px;
  width: 120px;
}
a:hover {
  color: #5AB345;
  background-color: transparent;
  text-decoration: underline;
}
.btn-default{
  background: #DCAE1D !important;
  color: #000 !important;
}
.main {
    width: 50%;
    margin: 50px auto;
}
.fcolor1{
  color: #5AB345;
  font-size: 15px;
}
.fcolor2{
  color: #DCAE1D;
  font-size: 15px;
  
}
#fcolor3{
  color: #808080;
}
btn btn-primary btr-block{
	margin-bottom: 100px;
}
body, html {
  height: 100%;
  margin: 0;
}

.bg {
  background-image: url("farm2.png");

  height: 100%; 
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
}
.form-container{
	position: absolute;
	top: 15vh;
	width: 400px;
	background: white;
	opacity: 0.8;
	padding: 40px;
	border-radius: 10px;
	box-shadow: 0px 0px 10px 0px #000;
}
.text-center {
  text-align: center;
}
</style>
<body id="bg"class="container-fluid bg">
<section class="container-fluid bg">
	<section class="row justify-content-center">
	<section class="col-12 col-sm-6 col-md-3"> 
	<div class="columns" id="login_content">
	<div class="form-container">
		<form action="<%=request.getContextPath()%>/login" method="post">
		<div class="text-center">
		<img src="logo.jpg"  class="logo2">
		</div>
			<div class="form-group">
				<span><label class= "fcolor1"><b>Username:</b></label>
					<input type="text" class="form-control" name="username" required placeholder="Type username here">
				</span>
			</div>
			<div class="form-group">
				<span><label class= "fcolor1"><b>Password:</b></label>
					<input type="password" class="form-control" name="password" required placeholder="Type password here">
				</span>
				<%if(errorCheck != null){ %>
				<span style="color: red;">${error}</span>
				<%} %>
			</div>
			
			<div class="text-center">
			<input type="submit" name = "btnsubmit" value="SUBMIT" id="button" class="btn btn-primary btr-block" style="background-color:#5AB345; border: #5AB345;margin-top: 10px;margin-bottom: 15px;">		
			</div>
			<a href = register.jsp class="fcolor2" style="text-decoration:none;">Not a student yet? Register here.</a>
			<a href = home.jsp class="fcolor2" style="margin-top:5px;text-decoration:none;"><br>>>Go back to homepage</a>
		</form>
		<form action="<%=request.getContextPath()%>/NullMessageServlet" method="get">
			<input type="hidden" name="nextpage" value="forgotpassword">
			<input class="fcolor2" style="text-decoration:none;" type="submit" value="Forgot Password">
			</form>
		</div>
	</div>
	<section>
		
		
	</section>
	</section>
	</section>
</section>
</body>
</html>
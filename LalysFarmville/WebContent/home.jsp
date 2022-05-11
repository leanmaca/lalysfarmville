<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@page import="com.ics.dao.*"%>
<%@page import="com.ics.bean.*"%>
<%@page import="java.util.*"%>
<%WebsiteContentBean content = new WebsiteContentBean();
WebsiteContentDao wcDao = new WebsiteContentDao();
  content = wcDao.selectContent();
  
  StaffBean staff = null;
  StaffDao staffDao = new StaffDao();
  List<StaffBean> staffList = staffDao.selectStaff();
  
  ProductsBean product = null;
  ProductsDao productsDao = new ProductsDao();
  List<ProductsBean> productsList = productsDao.selectProducts();
  
  CourseBean course = null;
  CourseDao courseDao = new CourseDao();
  List<CourseBean> courseList = courseDao.selectCourseList();
  
%>
<!DOCTYPE html>
<html lang="en">
 <head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@500&display=swap" rel="stylesheet">	
 <!--<link rel="stylesheet" href="style-home.css">-->
 <title>Laly's Farmville</title>
 
 <link rel="stylesheet" type="text/css">
  <!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<link rel ="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>

</head>
<style>
*{
	font-family: 'Quicksand', sans-serif;
	margin:0;
	padding:0;
	box-sizing:border-box;
	}
.header{
	height: 100vh;
	
}
.header {
  padding: 60px;
  text-align: center;
  background: #fff;
  color: black;
  font-size: 30px;
}
.navbar-style{
	box-shadow: 0 5px 10px #1c2c34;
	text-transform: uppercase;
	<%--background: #98bf64;--%>
	background: #D4E6AB;
}
.logo{
	height: 60px;
	padding: 2px 10px;
}
.icon-bar{
	background: green;
	
}
li a{
	color: #000000;
}

h4{
	font-size: 60px;
}
h5{
	font-size: 60px;
	color: #607D3B;
}
.caption{
	font-size: 20px;
	text-align: center;
}
a.btn{
	margin: 30px 10px;
	width: 150px;
	padding: 10px;
	border-radius: 20px;
}
a.btn-first{
	background-color: #5AB345;
	color: #fff;
}
a.btn-second{
	background: transparent;
	border: 1px solid #5AB345;
	color: #333;
}
a.btn:hover{
	background: #5AB345;
	border: none;
	color: #fff;
	box-shadow: 5px 5px 10px #999;
	transition: 0.3s;
}
.banner-info, .banner-image{
	margin: 30px 0;
}







@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400&display=swap');
.section{
	width: 100%;
	min-height: 100vh;
	background-color: #d4e6ab;
}
.container{
	width: 80%;
	display: block;
	margin:auto;
	padding-top: 100px;
}
.content-section{
	float: left;
	width: 55%;
}
.image-section{
	float: right;
	width: 40%;
}
.image-section img{
	width: 100%;
	height: auto;
}
.content-section .title{
	text-transform: uppercase;
	font-size: 28px;
}
.content-section .content h3{
	margin-top: 20px;
	color:#5d5d5d;
	font-size: 21px;
}
.content-section .content p{
	margin-top: 10px;
	font-family: quicksand;
	font-size: 18px;
	line-height: 1.5;
}
.content-section .content .button{
	margin-top: 30px;
}
.content-section .content .button a{
	background-color: #3d3d3d;
	padding:12px 40px;
	text-decoration: none;
	color:#fff;
	font-size: 25px;
	letter-spacing: 1.5px;
}
.content-section .content .button a:hover{
	background-color: #a52a2a;
	color:#fff;
}
.content-section .social{
	margin: 40px 40px;
}
.content-section .social i{
	color:#a52a2a;
	font-size: 30px;
	padding:0px 10px;
}
.content-section .social i:hover{
	color:#3d3d3d;
}
@media screen and (max-width: 768px){
	.container{
	width: 80%;
	display: block;
	margin:auto;
	padding-top:50px;
}
.content-section{
	float:none;
	width:100%;
	display: block;
	margin:auto;
}
.image-section{
	float:none;
	width:100%;
}
.image-section img{
	width: 100%;
	height: auto;
	display: block;
	margin:auto;
}
.content-section .title{
	text-align: center;
	font-size: 19px;
}
.content-section .content .button{
	text-align: center;
}
.content-section .content .button a{
	padding:9px 30px;
}
.content-section .social{
	text-align: center;
}




}
.title{
    text-align: center;
    text-transform: capitalize;
    color: black;
    margin: 10px 0;
    position: relative;
    color: #354a21;
}

.title::after{
    content: "";
    position: absolute;
    width: 20%; height: 2px;
    bottom: -10px; left: 50%;
    transform: translate(-50%);
}

.team-row{
    display: flex;
    justify-content: center;
    flex-wrap: wrap;
    padding: 40px 0;
}

.member{
    flex: 1 1 250px;
    margin: 20px;
    text-align: center;
    padding: 20px 10px;
    cursor: pointer;
    max-width: 300px;
    transition: all 0.3s;
}

.member:hover{
	<%--box-shadow: rgba(6, 24, 44, 0.4) 0px 0px 0px 2px, rgba(6, 24, 44, 0.65) 0px 4px 6px -1px, rgba(255, 255, 255, 0.08) 0px 1px 0px inset;--%>
   <%-- box-shadow: 0 10px 20px rgba(0,0,0,0.1);--%>
    box-shadow: 10px 10px 5px black;
    transform: translateY(-20px);
}

.member img{
    display: block;
    width: 150px; height: 150px;
    object-fit: cover;
    border:4px solid #66bb6a;
    border-radius: 50%;
    margin: 0 auto;
}

.member h2{
    text-transform: uppercase;
    font-size: 24px;
    color: black;
    margin: 15px 0;
}

.member p{
    font-size: 15px;
    color: black;
    line-height: 1.6;
}






body {
  font-family: quicksand;
  min-height: 1000px;
  background-color: #b2d3c2;
}
h1{
	text-align: center;
    text-transform: capitalize;
    color: #354a21;
    margin: 10px 0;
    position: relative;
}
#wrap {
  width: 90%;
  max-width: 1100px;
  margin: 50px auto;
}
.columns_2 figure {
  width: 49%;
  margin-right: 1%;
}
.columns_2 figure:nth-child(2) {
  margin-right: 0;
}
.columns_3 figure {
  width: 32%;
  margin-right: 1%;
}
.columns_3 figure:nth-child(3) {
  margin-right: 0;
}
.columns_4 figure {
  width: 24%;
  margin-right: 1%;
}
.columns_4 figure:nth-child(4) {
  margin-right: 0;
}
.columns_5 figure {
  width: 19%;
  margin-right: 1%;
}
.columns_5 figure:nth-child(5) {
  margin-right: 0;
}
#columns figure:hover {
  -webkit-transform: scale(1.1);
  -moz-transform: scale(1.1);
  transform: scale(1.1);
}
#columns:hover figure:not(:hover) {
  opacity: 0.4;
}
div#columns figure {
  display: inline-block;
  background: #fefefe;
  border: 2px solid #fafafa;
  box-shadow: 0 1px 2px rgba(34, 25, 25, 0.4);
  margin: 0 0px 15px;
  -webkit-column-break-inside: avoid;
  -moz-column-break-inside: avoid;
  column-break-inside: avoid;
  padding: 15px;
  padding-bottom: 5px;
  background: -webkit-linear-gradient(45deg, #fff, #f9f9f9);
  opacity: 1;
  -webkit-transition: all 0.3s ease;
  -moz-transition: all 0.3s ease;
  -o-transition: all 0.3s ease;
  transition: all 0.3s ease;
}

div#columns figure img {
  width: 100%;
  border-bottom: 1px solid #ccc;
  padding-bottom: 15px;
  margin-bottom: 5px;
}

div#columns figure figcaption {
  font-size: 10;
  color: #444;
  line-height: 1.5;
  height: 60px;
  font-weight: 600;
  text-overflow: ellipsis;
}
@media screen and (max-width: 960px) {
  #columns figure {
    width: 24%;
  }
}
@media screen and (max-width: 767px) {
  #columns figure {
    width: 32%;
  }
}
@media screen and (max-width: 600px) {
  #columns figure {
    width: 49%;
  }
}
@media screen and (max-width: 500px) {
  #columns figure {
    width: 100%;
  }
}






footer{
	position: relative;
	bottom:0;
	left:0;
	right:0;
	background:#212121;
	height:auto;
	width:100vw;
	font-family:quicksand;
	padding-top:15px;
	color: #fff;
}

.footer-content{
	display:flex;
	align-items:center;
	justify-content:center;
	flex-direction:column;
	text-align:center;
}

.footer-content h3{
	font-family:quicksand;
	font-style:normal;
	font-weight:400;
	font-size:20px;
	line-height:20px;
	text-transform:capitalize;
}

.footer-content p{
	font-family:quicksand;
	font-style:normal;
	font-size:17px;
	max-width:500px;
	margin:10px auto;
	line-height:28px;
	
}

.socials{
	list-style:none;
	display:flex;
	align-items:center;
	justify-content:center;
	margin:10px 0 10px 0;
}

.socials li{
	margin:0 10px;
}

.socials a{
	text-decoration:none;
	color:#fff;
}

.socials a i{
	font-size:1 rem;
}

.socials a:hover i{
	color: #53B33C;
}

.footer-bottom{
	background:#000000;
	width:100vw;
	padding:10px;
	text-align:center;
}

.footer-bottom p{
	font-size:14px;
	word-spacing:2px;
	text-transform:capitalize;
}

.footer-bottom span{
	opacity:.6;
	font-weight:200;
}
</style>
<body>
	<header class = "header">
	<nav class = "navbar navbar-style">
		<div>
			<div class ="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#micon">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span></button>
			<a href=""><img class = "logo" src ="LFV NO BG.png"></a>
			</div>
			
			<div class="collapse navbar-collapse" id="micon">
			<ul class="nav navbar-nav navbar-right">
			<li><a href="#home">Home</a></li>
			<li><a href="#about">About</a></li>
			<li><a href="#products">Products</a></li>
			<li><a href="#courses">Courses</a></li>
			<li><a href="#contact-us">Contact Us</a></li>
			</ul>
			</div>
		</div>
	</nav>
	
	<div class="container">
	<div class="row">
	
		<div class="col-sm-6 banner-info">
			
			<h4>Welcome to</h4>
			<h5>Laly's Farmville!</h5>
			<p class="caption">MABUHAY!!!</p>
			<p class="caption"><%= content.getWelcomeMessage() %></p>
			<p class="caption">If you already have an account please <i>login.</i></p>
			<p class="caption">If you want to register click the <i>register</i> button.</p>
			<a class="btn btn-first" href="Login.jsp">Login</a>
			<a class="btn btn-second" href="register.jsp">Register</a>
			</div>
		
		<div class="col-sm-6 banner-image">
		<img src="farmer.png" class="img-responsive"></div>
	</div>
</div>
</header>

<!-- About Section -->


<!-- smooth scroll -->
	<script src ="smooth-scroll.js"></script>
	<script>
	var scroll = new SmoothScroll('a[href*="#"]');
</script>
<div class="section">
		<div class="container">
			<div class="content-section">
				<div class="title">
					<h1 id="about">About Us</h1>
				</div>
				<div class="content">
					<p><%=content.getAboutUs() %></p>
				</div>
				<div class="title">
					<h1>Mission</h1>
				</div>
				<div class="content">
					<p><%=content.getMission() %></p>
				</div>
				<div class="title">
					<h1>Vision</h1>
				</div>
				<div class="content">
					<p><%=content.getVision() %></p>
				</div>
				<div class="title">
					<h1>Farm Values</h1>
				</div>
				<div class="content">
					<p><%=content.getFarmValues() %></p>
				</div>
				<div class="social">
				</div>
			</div>
			<div class="image-section">
				<img src="LFV NO BG.png">
			</div>
		</div>
	</div>

<section>
    <h1 class="title">Meet the team</h1>
    <div class="team-row">
        <div class="member">
            <img src="images/marlon.jpg" alt="">
            <h2>Marlon Iluminado Perez</h2>
            <p>Chairman</p>
        </div>
        <div class="member">
            <img src="https://scontent.fmnl30-1.fna.fbcdn.net/v/t1.18169-1/13310537_1281899978506733_4335700758594775414_n.jpg?stp=dst-jpg_p320x320&_nc_cat=108&ccb=1-5&_nc_sid=7206a8&_nc_eui2=AeFRZkTMPWiek9aJl-17j6X7R0VLNOszT3FHRUs06zNPcZmWwso8P_xhjJhMYkTJMRkQUjhBy6td46-BGVVo-kaO&_nc_ohc=l4lE210M4RIAX9UPg2v&_nc_ht=scontent.fmnl30-1.fna&oh=00_AT-jkSpbzHA_nE06_Xw_CyC_odfmKXmhHj0f5dV3K_VwSA&oe=626A6E64" alt="">
            <h2>Normita R. Perez</h2>
            <p>President and Financial Officer, Trainer, School Administrator</p>
        </div>
        <div class="member">
            <img src="images/chantalvillamin.jpg" alt="">
            <h2>Chantal Marie R. Villamin</h2>
            <p>Trainer, Office Staff</p>
        </div>
        
        <%for(int i = 0 ; i < staffList.size() ; i ++){
        	staff = (StaffBean) staffList.get(i);%>
        	<div class="member">
            <img src="images/<%=staff.getImage() %>" alt="">
            <h2><%= staff.getStaffName() %></h2>
            <p><%= staff.getPosition() %></p>
        </div>
        	<%
        } %>
        
        
    </div>
</section>

<h1 id="products">PRODUCTS WE OFFER</h1>
  <div id="wrap">
  <!--Changing the number in the column_# class changes the number of columns-->
    <div id="columns" class="columns_3">
     
		
		<%for(int i = 0 ; i < productsList.size() ; i ++){
        	product = (ProductsBean) productsList.get(i);%>

			<figure>
				<img src="productimages/<%=product.getImage() %>">
				<figcaption><%=product.getProductName() %></figcaption>
				<span class="price"><%=product.getProductDesc() %></span>
			</figure>


			<%
			}
			%>


    </div>
</div>

<h1 id="courses">COURSES WE OFFER</h1>
  <div id="wrap">
  <!--Changing the number in the column_# class changes the number of columns-->
    <div id="columns" class="columns_2">
     
      
      <%for(int i = 0 ; i < courseList.size() ; i ++){
        	course = (CourseBean) courseList.get(i);%>

			<figure>
				<img src="courseimages/<%=course.getImage()%>">
				<figcaption><%=course.getCourseName() %></figcaption>
			</figure>
			

			<%
			System.out.println(course.getImage());
			}
			%>
      
      
    </div>
</div>
</body>
<footer>
		<div class="footer-content">
			<h3 id="contact-us"> HAVE ANY QUESTIONS? </h3>
			<p> We'd love to hear from you</p>
			<ul class="socials">
			<li><a href="https://www.facebook.com/Lalys-Farm-Ville-444106272710543/photos/?ref=page_internal"> <i class="fa fa-facebook"></i></a></li>
			<li><a href="mailto: lalysfarmville82@gmail.com"target="_blank"> <i class="fa fa-google-plus"></i></a></li>
			<li><a href="https://www.google.com/maps/place/Laly's+Farm+Ville/@14.2511041,121.5151673,17z/data=!3m1!4b1!4m5!3m4!1s0x3397fd3181ed58cf:0xe78904c2909c0a09!8m2!3d14.2511041!4d121.517356"> <i class="fa fa-map-marker"></i></a></li>
			</ul>
			<ul class="socials">	
			<li>Contact Us: <%=content.getContactNumber1() %> or <%=content.getContactNumber2() %></li>
			</ul>
		</div>
		<div class="footer-bottom">
			<p>copyright &copy; 2022 Laly's Farm Ville, designed by <span> UST 3rd Year Software Engineer Group 4 from 3ITG</span></p>
		</div>
	</footer>
</html>
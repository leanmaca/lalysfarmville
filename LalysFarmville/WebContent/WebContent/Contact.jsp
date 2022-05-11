<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Contact Us</title>
</head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
<style>
*{
	margin:0;
	padding:0;
	box-sizing:border-box;
	}
	
body{
	background-color: #fcfcfc;
}

footer{
	position: relative;
	bottom:0;
	left:0;
	right:0;
	background:#212121;
	height:auto;
	width:100vw;
	font-family:"Open Sans";
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
	font-family:Roboto;
	font-style:normal;
	font-weight:400;
	font-size:20px;
	line-height:20px;
	text-transform:capitalize;
}

.footer-content p{
	font-family:Roboto;
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
	font-size:1.1rem;
}

.socials a:hover i{
	color: #1e88e5;
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
	<footer>
		<div class="footer-content">
			<h3> HAVE ANY QUESTIONS? </h3>
			<p> We'd love to hear from you</p>
			<ul class="socials">
			<li><a href="https://www.facebook.com/Lalys-Farm-Ville-444106272710543/photos/?ref=page_internal"> <i class="fa fa-facebook"></i></a></li>
			<li><a href="mailto: lalysfarmville82@gmail.com"target="_blank"> <i class="fa fa-google-plus"></i></a></li>
			<li><a href="https://www.google.com/maps/place/Laly's+Farm+Ville/@14.2511041,121.5151673,17z/data=!3m1!4b1!4m5!3m4!1s0x3397fd3181ed58cf:0xe78904c2909c0a09!8m2!3d14.2511041!4d121.517356"> <i class="fa fa-map-marker"></i></a></li>
			</ul>
			<ul class="socials">	
			<li>Contact Us: 09216631359 or 09301162445</li>
			</ul>
		</div>
		<div class="footer-bottom">
			<p>copyright &copy; 2022 Laly's Farm Ville, designed by <span> UST 3rd Year Software Engineer Group 4 from 3ITG</span></p>
		</div>
	</footer>
</body>
</html>
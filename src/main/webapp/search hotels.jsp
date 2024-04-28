<%@page import="online_hotel_management.dto.Customer"%>
<%@page import="online_hotel_management.dto.Hotel"%>
<%@page import="java.util.List"%>
<DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width= device-width, initial-scale=1.0">
<script src="https://kit.fontawesome.com/8bc75d12bf.js"
	crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css" href="search hotels.css">

<link rel="stylesheet" href="menu.css">
<title>Online Hotels</title>
</head>

<body>
	<header class="hero">
		<!-- NAVBAR ITEMS -->
		<div id="navbar" class="navbar top menu-wrap">
			<h1 class="logo">
				<a>Staycations</a>
			</h1>
			<input type="checkbox" class="toggler">
			<div class="hamburger">
				<div></div>
			</div>
			<div class="menu">
				<div>
					<div>
						<ul>
							
							<li><a href="about.html">About US</a></li>
							<li><a href="contact.html">Contact </a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

	</header>

	<!--==Products====================================-->
	<section id="popular-product">
		<!--heading----------->
		<div class="product-heading">
			<h2>Your Searches</h2>

		</div>
		<!--box-container------>
		<div class="product-container">
			<!--box---------->
			<%
			List<Hotel> hotels = (List) session.getAttribute("hotels");
			
			Customer customer = (Customer) session.getAttribute("customersession");
			String notFound=(String) session.getAttribute("notfound");
			%>

			<%
			if(notFound==null){
			for (Hotel hotel : hotels) {
			%>
			<div class="product-box">
				<img alt="Kashmir" src="images/add hotels/img_2.jpg""> <span
					class=" quantity"><strong><%=hotel.getHotelName()%></strong></span>
				<span class="price">Rs. <%=hotel.getRoomPrice()%></span>
				<!--cart-btn------->
				<a
					href="Checkout.jsp?hotelId=<%=hotel.getHotelId()%>&hotelName=<%=hotel.getHotelName()%>&hotelPhone=<%=hotel.getHotelPhone()%>&hotelEmail=<%=hotel.getHotelEmail()%>&roomPrice=<%=hotel.getRoomPrice()%>&availRoom=<%=hotel.getAvailRoom()%>"
					class="cart-btn"> Book Now </a>
			</div>
			<%
			}}
			else
			{
				%>
			
			
			<h4><b><%="not Found" %>	</b></h4>
			<%} %>

		</div>
	</section>



	<footer class=" footer">
		<div class="footer-left">
			<H1>VACATION INN</H1>
			<H2>---HOTEL---</H2>
		</div>

		<ul class="footer-right">
			<li>
				<h3>INFORMATION</h3>

				<ul class="box">
					<li><a href="about.html">About us</a></li>
					<li><a href="contact.html">Contact US</a></li>
					<li><a href="#">Manage my booking</a></li>
					<li><a href="#">Carrers</a></li>
					<li><a href="#">Sitemap</a></li>
				</ul>
			</li>
			<li class="feature">
				<h3>Connect with us</h3>

				<div class="social">
					<a href="#"><i class="fab fa-facebook fa-2x"></i></a> <a href="#"><i
						class="fab fa-twitter fa-2x"></i></a> <a href="#"><i
						class="fab fa-youtube fa-2x"></i></a> <a href="#"><i
						class="fab fa-linkedin fa-2x"></i></a>
				</div>
			</li>
		</ul>

		<div class="footer-bottom">
			<p>All right reserved &copy; FashionStore 2023</p>
		</div>
	</footer>



	<script src="index.js"></script>

</body>

</html>
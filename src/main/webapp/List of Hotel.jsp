<%@page import="online_hotel_management.dto.Hotel"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

	<html>

	<head>

		<meta charset="utf-8">

		<meta name="viewport" content="width=device-width, initial-scale=1.0">

		<!--==Title==================================-->
		<title>

			Online Hotels

		</title>

		<!--==Stylesheet=============================-->
		<link rel="stylesheet" type="text/css" href="List of  Hotel.css">

		<!--==Fav-icon===============================-->
		<link rel="shortcut icon" href="images/fav-icon.png" />

		<!--==Using-Font-Awesome=====================-->
		<script src="https://kit.fontawesome.com/5471644867.js" crossorigin="anonymous"></script>

		<script src='Home Page JS.js' defer></script>

		<link rel="shortcut icon" type="image/jpg"
			href="C:\Users\hp\Desktop\College\First Semester\Introduction To Web Technologies\Notepad ++ Files\Project\favicon.ico" />

		<meta charset="UTF-8">
		<meta name="viewport" content="width= device-width, initial-scale=1.0">
		<script src="https://kit.fontawesome.com/8bc75d12bf.js" crossorigin="anonymous"></script>
		<link rel="stylesheet" href="style.css">
		<link rel="stylesheet" href="menu.css">
		<title>Online Hotels</title>
	</head>




	<body>
	
		<header class="hero">
			<!-- NAVBAR ITEMS -->
			<div id="navbar" class="navbar top menu-wrap">
				<h1 class="logo"><a >Staycations</a></h1>
				<input type="checkbox" class="toggler">
				<div class="hamburger">
					<div></div>
				</div>
				<div class="menu">
					<div>
						<div>
							<ul>
								<li><a href="ProfileCustomer.jsp">Update Profile</a></li>
								<li><a href="mybooking.jsp">My booking</a></li>
								<li><a href="contact.html">Contact </a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>

			<div class="banner1">
				<img src="images/add hotels/10.jpg" alt="">
				<div class="text">
					<h4>vacation in Goa</h4>
					<h1>BEACH LUX</h1>

				</div>
			</div>
			<div class="banner2">
				<img src="images/add hotels/12.jpg" alt="">
				<div class="text">
					<h4>vacation in Goa</h4>
					<h1> FOR A RELAXATION VIBE</h1>

				</div>
			</div>

		</header>




		<!--==Search-banner=======================================-->


		<div class="search-banner-text">
			<h1>Plan Your Trip</h1>


			<form action="BookHotel" class="search-box" method="post">

				<i class="fas fa-search"></i>

				<input type="text" class="search-input" placeholder="Search " name="hotels" required />

				<input type="submit" class="search-btn" value="Search" />
			</form>
		</div>
		<div id="search-banner">


			<img src="images/add hotels/Hotel Background.jpg" class="bg-1" alt="bg-1" />


		</div>




		<!--==Products====================================-->
		<section id="popular-product">
			<!--heading----------->
			<div class="product-heading">
				<h2>Popular Hotels in India</h2>

			</div>
			<!--box-container------>
		<div class="product-container">
			<!--box---------->
			<%
			List<Hotel> hotels = (List) session.getAttribute("allHotels");
			%>
			

			<%
			for (int i=0;i<6;i++) {
				Hotel hotel=hotels.get(i);
			%>
			<div class="product-box">
				<img alt="Kashmir" src="images/add hotels/img_2.jpg""> <span
					class=" quantity"><strong><%=hotel.getHotelName()%></strong></span>
				<span class="price">Rs.<%=hotel.getRoomPrice()%></span>
				<!--cart-btn------->
				<a
					href="Checkout.jsp?hotelId=<%=hotel.getHotelId()%>&hotelName=<%=hotel.getHotelName()%>&hotelPhone=<%=hotel.getHotelPhone()%>&hotelEmail=<%=hotel.getHotelEmail()%>&roomPrice=<%=hotel.getRoomPrice()%>&availRoom=<%=hotel.getAvailRoom()%>"
					class="cart-btn"> Book Now </a>
			</div>
			<%
			}
			%>

		</div>
	</section>
		<!--popular-product-end--------------------->
		<!--Popular-bundle-pack===================================-->
		<section id="popular-bundle-pack">
			<!--heading-------------->
			<div class="product-heading">
				<h2>6 MEMORABLE DESTINATIONS TO CELEBRATE A MILESTONE EVENT </h2>
			</div>
			<!--box-container------>
			<div class="product-container">
				<!--box---------->
				<div class="product-box">
					<img alt="pack" src="images/add hotels/tab_img_1.jpg">
					<strong> New York</strong>

					<span class="price">Rs. 50000</span>
					<!--cart-btn------->
					<a href="#" class="cart-btn">
						Book Now
					</a>

				</div>
				<!--box---------->
				<div class="product-box">
					<img alt="apple" src="images/add hotels/tab_img_2.jpg">
					<strong>Berlin</strong>

					<span class="price">Rs. 80000</span>
					<!--cart-btn------->
					<a href="#" class="cart-btn">
						Book Now
					</a>

				</div>
				<!--box---------->
				<div class="product-box">
					<img alt="apple" src="https://media.timeout.com/images/106086918/1024/768/image.webp">
					<strong>London</strong>

					<span class="price">Rs. 30000</span>
					<!--cart-btn------->
					<a href="#" class="cart-btn">
						Book Now
					</a>

				</div>
				<!--box---------->
				<div class="product-box">
					<img alt="pack" src="images/add hotels/1.jpg">
					<strong> Tokyo</strong>

					<span class="price">Rs. 900000</span>
					<!--cart-btn------->
					<a href="#" class="cart-btn">
						Book Now
					</a>

				</div>
				<!--box---------->
				<div class="product-box">
					<img alt="apple" src="images/add hotels/10.jpg">
					<strong>Paris</strong>

					<span class="price">Rs. 70000</span>
					<!--cart-btn------->
					<a href="#" class="cart-btn">
						Book Now
					</a>

				</div>
				<!--box---------->
				<div class="product-box">
					<img alt="apple" src="images/add hotels/11.jpg">
					<strong>Chicago</strong>

					<span class="price">Rs. 40000</span>
					<!--cart-btn------->
					<a href="#" class="cart-btn">
						Book Now
					</a>

				</div>
			</div>
		</section>
		<!--popular-bundle-pack-end-------------------------------->
		<!--==Clients===============================================-->
		<section id="clients">
			<!--heading---------------->
			<div class="client-heading">
				<h3>What Our Clients Say</h3>
			</div>
			<!--box-container---------->
			<div class="client-box-container">
				<!--box------------->
				<div class="client-box">
					<!--==profile===-->
					<div class="client-profile">
						<!--img--->
						<img alt="client" src="https://img.icons8.com/?size=48&id=20749&format=png">
						<!--text-->
						<div class="profile-text">
							<strong>Pramod Koli</strong>
							<span></span>
						</div>
					</div>
					<!--==Rating======-->
					<div class="rating">
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						
					</div>
					<!--==comments===-->
					<p>My experience with Staycations was fantastic. The website was user-friendly,
						the selection was impressive, and the booking process was seamless. Highly recommend!
					</p>
				</div>
				<!--box------------->
				<div class="client-box">
					<!--==profile===-->
					<div class="client-profile">
						<!--img--->
						<img alt="client" src="https://img.icons8.com/?size=80&id=108652&format=png">
						<!--text-->
						<div class="profile-text">
							<strong>Onkar Vaidya</strong>
							<span>Software Developer</span>
						</div>
					</div>
					<!--==Rating======-->
					<div class="rating">
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						
					</div>
					<!--==comments===-->
					<p> Booking with Staycations was a breeze! Their website is easy to navigate, with
						plenty of options to choose from. The customer service was top-notch, and I felt confident in my
						choice. I'll definitely be using them again for my future trips!!</p>
				</div>
				<!--box------------->
				<div class="client-box">
					<!--==profile===-->
					<div class="client-profile">
						<!--img--->
						<img alt="client" src="https://img.icons8.com/?size=50&id=7818&format=png">
						<!--text-->
						<div class="profile-text">
							<strong>Akanksha Dhaygude</strong>
							<span>Marketer</span>
						</div>
					</div>
					<!--==Rating======-->
					<div class="rating">
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
						<i class="fas fa-star"></i>
					</div>
					<!--==comments===-->
					<p>I can't recommend Staycations enough! Not only did they offer competitive
						prices, but their user-friendly interface made it simple to find the perfect hotel for my needs.
						Plus, their customer support team was incredibly helpful when I had questions. A fantastic
						experience all around!</p>
				</div>
			</div>
		</section>
		<!--client-section-end---------->
		<!--==Partnre-logo================================-->
		<section id="partner">
			<!--heading------------>
			<div class="partner-heading">
				<h2>Our Trusted Partner</h2>
			</div>
			<!--logo-container----->
			<div class="logo-container">
				<img alt="logo"
					src="https://upload.wikimedia.org/wikipedia/en/thumb/1/17/JWMarriott.svg/330px-JWMarriott.svg.png">
				<img alt="logo"
					src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/29/The_Leela_Palaces%2C_Hotels_and_Resorts_logo.svg/330px-The_Leela_Palaces%2C_Hotels_and_Resorts_logo.svg.png">
				<img alt="logo"
					src="https://upload.wikimedia.org/wikipedia/commons/thumb/c/cd/Taj_Hotels_logo.svg/150px-Taj_Hotels_logo.svg.png">
				<img alt="logo"
					src="https://upload.wikimedia.org/wikipedia/en/thumb/a/a0/RitzCarlton.svg/330px-RitzCarlton.svg.png">
			</div>
		</section>
		<!--logo-section-end--------------------->


		<footer class=" footer">
			<div class="footer-left">
				<H1>VACATION With</H1>
				<H2>---STAYCATIONS---</H2>
			</div>

			<ul class="footer-right">
				<li>
					<h3>INFORMATION</h3>

					<ul class="box">
						<li><a href="#">About us</a></li>
						<li><a href="contact.html">Contact US</a></li>
						<li><a href="CustomerRegisterLogin.jsp">Manage my booking</a></li>
						<li><a href="#">Carrers</a></li>
						<li><a href="#">Sitemap</a></li>
					</ul>
				</li>
				<li class="feature">
					<h3>Connect with us</h3>

					<div class="social">
						<a href="#"><i class="fab fa-facebook fa-2x"></i></a>
						<a href="#"><i class="fab fa-twitter fa-2x"></i></a>
						<a href="#"><i class="fab fa-youtube fa-2x"></i></a>
						<a href="#"><i class="fab fa-linkedin fa-2x"></i></a>
					</div>
				</li>
			</ul>

			<div class="footer-bottom">
				<p>All right reserved &copy; FashionStore 2020</p>
			</div>
		</footer>

<%
    Boolean loginSuccess = (Boolean)request.getAttribute("loginSuccess");
    if (loginSuccess != null && loginSuccess) {
%>
<script>
    alert("Login successful!");
</script>
<%
    }
%>

		<script src="index.js"></script>

	</body>

	</html>
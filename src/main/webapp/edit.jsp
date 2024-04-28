<%@page import="online_hotel_management.dto.Hotel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%Hotel hotel = (Hotel)session.getAttribute("session"); %>
	
	<form action="update" method="post">
		Id:<input type="hidden" name="id" value=<%=hotel.getHotelId()%> readonly><br>
		<br> Name:<input type="text" name="name" value=<%=hotel.getHotelName()%>><br>
		 <br> Phone:<input type="tel" name="phone" value=<%=hotel.getHotelPhone()%>><br>
		<br> Location:<input type="text" name="address" value=<%=hotel.getHotelLocation()%>><br>
		<br> Email:<input type="email" name="email" value=<%=hotel.getHotelEmail()%>><br>
		<br> Password:<input type="text" name="password" value=<%=hotel.getHotelPassword()%>><br>
		<br> 
		<button>Update</button>
	</form>
</body>
</html>
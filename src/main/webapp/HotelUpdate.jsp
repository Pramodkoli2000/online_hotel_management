<%@page import="online_hotel_management.dto.Hotel"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


	<%
	Hotel hotel = (Hotel) session.getAttribute("session");
	%>
	<table border="2px solid black">
		<tr>
			<th>Attributes</th>
			<th>Values</th>
			<th>Update</th>

		</tr>
		<tr>
			<td>Phone number</td>
			<td><%=hotel.getHotelPhone()%></td>
			<td><a href="edit.jsp"><button>Update</button></a></td>

		</tr>
		<tr>
			<td>Email</td>
			<td><%=hotel.getHotelEmail()%></td>

		</tr>
		<tr>
			<td>Password</td>
			<td><%=hotel.getHotelPassword()%></td>

		</tr>
		<tr>
			<td>Room Price</td>
			<td><%=hotel.getRoomPrice()%></td>

		</tr>
		<tr>
			<td>Location</td>
			<td><%=hotel.getHotelLocation()%></td>

		</tr>
		<tr>
	</table>

	


	
</body>
</html>
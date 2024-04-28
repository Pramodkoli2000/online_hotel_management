<%@page import="online_hotel_management.dto.Customer"%>
<%@page import="online_hotel_management.dto.Customer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%Customer customer = (Customer)session.getAttribute("customersession"); %>
	
	<form action="customerupdate" method="post">
		Id:<input type="number" name="id" value=<%=customer.getCustomerId()%> readonly><br>
		<br> Name:<input type="text" name="name" value=<%=customer.getCustomerName()%>><br>
		<br> Phone:<input type="tel" name="phone" value=<%=customer.getCustomerPhone()%>><br>
		<br> Address:<input type="text" name="address" value=<%=customer.getAddress()%>><br>
		<br> Email:<input type="email" name="email" value=<%=customer.getCustomerEmail()%>><br>
		<br> Password:<input type="text" name="password" value=<%=customer.getCustomerPassword()%>><br>
		<br> 
		Aadhar:<input type="number" name="aadhar" value=<%=customer.getCustomerAadhar()%>>
		<button>Update</button>
	</form>
</body>
</html>
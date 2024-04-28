<%@page import="online_hotel_management.dto.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	Customer customer = (Customer) session.getAttribute("customersession");
	%>
	<table border="2px solid black">
		<tr>
			<th>Attributes</th>
			<th>Values</th>
			<th>Update</th>

		</tr>
		<tr>
			<td>Phone number</td>
			<td><%=customer.getCustomerPhone()%></td>
			<td><a href="editcustomer.jsp"><button>Update</button></a></td>

		</tr>
		<tr>
		<td>Email</td>
			<td><%=customer.getCustomerEmail()%></td>
			 
		</tr>
		<tr>
			<td>Password</td>
			<td><%=customer.getCustomerPassword()%></td>
			 
		</tr>
		<tr>
		<td>Name</td>
			<td><%=customer.getCustomerName()%></td>
			 
		</tr>
		<tr>
		<td>Address</td>
			<td><%=customer.getAddress()%></td>
			 
		</tr>
		<tr>
		
		<td>Aadhar number</td>
			<td><%=customer.getCustomerAadhar()%></td>
			 
		</tr>
		</table>
		
		
		<a href="mybooking.jsp"><button>My booking</button></a> 
		
		<form action="BookHotel" method="post">
		<input type="text" name="hotels">
		<button >SUBMIT</button><br>
		
		
		
		
	</form>
</body>
</html>
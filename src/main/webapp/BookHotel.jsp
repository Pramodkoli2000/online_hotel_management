<%@page import="online_hotel_management.dto.Customer"%>
<%@page import="online_hotel_management.dto.Hotel"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
List of hotels


<%List<Hotel> hotels=(List)session.getAttribute("hotels"); %>
<%Customer customer=(Customer)session.getAttribute("customersession"); %>

<% for(Hotel hotel:hotels){ %>
<table border="2px solid">
 <tr>
       <th>Name</th>
       <th>Phone</th>
       <th>Email</th>
       <th>RoomPrice</th>
       <th>AvailableRooms</th>
       <th>Book</th>
       
     </tr>
     <tr>
         <td><%=hotel.getHotelName() %></td>
         <td><%=hotel.getHotelPhone() %></td>
         <td><%=hotel.getHotelEmail() %></td>
         <td><%=hotel.getRoomPrice() %></td>
         <td><%=hotel.getAvailRoom() %></td>
        <td>
    <a href="Checkout.jsp?hotelId=<%= hotel.getHotelId() %>&hotelName=<%= hotel.getHotelName() %>&hotelPhone=<%= hotel.getHotelPhone() %>&hotelEmail=<%= hotel.getHotelEmail() %>&roomPrice=<%= hotel.getRoomPrice() %>&availRoom=<%= hotel.getAvailRoom() %>">
        <button>Select Hotel</button>
    </a>
</td>

     </tr>
     
  </table>
   
     <% } %>



</body>
</html>
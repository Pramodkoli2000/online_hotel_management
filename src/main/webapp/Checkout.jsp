<%@page import="online_hotel_management.dao.HotelDAO"%>
<%@page import="online_hotel_management.dto.Hotel"%>
<%@page import="online_hotel_management.dto.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="book.css">

<script src="https://kit.fontawesome.com/9088cc6401.js"
    crossorigin="anonymous"></script>
<% String hotelId = request.getParameter("hotelId"); %>
<script>
    function setNoOfRoomsAndRedirect() {
        var noOfRooms = document.getElementById('input1').value;
        var hotelId = '<%= hotelId %>';
        var url = 'Payment.jsp?hotelId=' + hotelId + '&noOfRooms=' + noOfRooms;
        window.location.href = url;
    }
</script>
</head>
<body><% 
String hotelName = request.getParameter("hotelName");
double roomPrice = Double.parseDouble(request.getParameter("roomPrice"));
String availRoom = request.getParameter("availRoom");
String hotelPhone=request.getParameter("hotelPhone");
%>
<%Customer customer=(Customer)session.getAttribute("customersession"); %>

<div class="container">
        <h1>Book Your Hotel</h1>
        
        
        <div class="cart">
            <div class="products">
                <div class="product">
                    <img
                        src="https://media.istockphoto.com/id/1390233984/photo/modern-luxury-bedroom.jpg?s=612x612&w=0&k=20&c=po91poqYoQTbHUpO1LD1HcxCFZVpRG-loAMWZT7YRe4=">
                    <div class="product-info">
                        <h3 class="product-name">
                            Name:<%=hotelName%>
                        </h3>
                        <h4 class="product-price">
                            Phone:<%=hotelPhone%>
                        </h4>
                        <h4 class="product-offer">
                            RoomPrice:<%=roomPrice%>
                        </h4>

                        <form action="roomNumber" method="post" >
                            No of rooms: <input type="number"  name="noOfRooms"  min="1" required>
                            <input type="hidden" name="hotelId" value="<%=hotelId %>">
                            <input type="hidden" name="hotelName" value="<%=hotelName%>">
                            <input type="hidden" name="roomPrice" value="<%=roomPrice%>">
                            <input type="hidden" name="hotelPhone" value="<%=hotelPhone%>">
                            <button>Proceed</button>
                        </form>

                    </div>
                </div>
            </div>
            
            <div class="cart-total">
            <%if(session.getAttribute("noOfRooms")!=null) { %>
            <% int noOfRooms=(Integer)session.getAttribute("noOfRooms"); 
            if(noOfRooms!=0){%>
                <p>
                    <span> Rooms </span> <span> <%=noOfRooms %> </span>
                </p>
                <p>
                    <span> Total Price </span> <span> <%=noOfRooms*roomPrice %></span>
                </p>
			<input type="hidden" name="rooms" id="input1" value="<%=noOfRooms%>">
            <button onclick="setNoOfRoomsAndRedirect()">Proceed to Payment</button>
<%}} %>
            </div>

        </div>
    </div>
                
</body>
</html>

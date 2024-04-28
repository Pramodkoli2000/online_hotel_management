<%@page import="online_hotel_management.dto.Hotel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
<head>
    <meta charset="UTF-8">
    <title>Profile Page</title>
    <link rel="stylesheet" href="Profile CSS.css">
    <script src="https://kit.fontawesome.com/cacf32ff12.js" crossorigin="anonymous"></script>
    <link rel="shortcut icon" type="image/jpg" href="C:\Users\hp\Desktop\College\First Semester\Introduction To Web Technologies\Notepad ++ Files\Project\favicon.ico"/>
</head>
<body>

<% Hotel hotel = (Hotel)session.getAttribute("session"); %>
<% Hotel updatedHotel=(Hotel)session.getAttribute("hotelupdate"); %>
<% if(updatedHotel!=null){ 
    hotel=updatedHotel;
}%>
    <div class="container">
        <div class="leftbox">
            <nav>
                <a onclick="tabs(0)" class="tab active">
                    <i class="fas fa-user"></i>
                </a>
               
            
            </nav>
        </div>
        <div class="rightbox">
            <div class="profile tabShow">
                <form action="hotelupdate" method="post" onsubmit="return validateForm()">
                    <h1>Personal Information</h1>
                    <h2>Name</h2>
                    <input type="hidden" name="id" value=<%= hotel.getHotelId() %> >
                    <input type="text" name="name" value=<%= hotel.getHotelName()%>  >
                    <h2>Mobile Number</h2>
                    <input type="tel" name="phone" value=<%= hotel.getHotelPhone()%> disabled >
                    <h2>Email</h2>
                    <input type="email" name="email" value=<%= hotel.getHotelEmail()%> disabled>
                    <h2>Password</h2>
                    <input type=text id="password" name="password" required="required" oninput="checkPasswordStrength()" value=<%= hotel.getHotelPassword()%>>
                    <span id="password-strength"></span>
                    <h2>Confirm Password</h2>
                    <input type="text" id="confirm_password" name="confirm_password" required="required" oninput="validateConfirmPassword()">
                    <span id="confirm-password-validation-message" style="color: red;"></span>
                    <h2>Address</h2>
                    <input type="text" name="address" value=<%= hotel.getHotelLocation()%> required="required">
					<h2>Room Price</h2>
   					<input type="number" name="price" id="roomPrice" value=<%= hotel.getRoomPrice()%> required="required"><br>
    				<span id="price-validation-message" style="color: red;"></span><br>
                    <button class="btn">
                        Update
                    </button>  
                    <button class="btn">
                        Home
                    </button>
                </form>
            </div>
            <div class="Payment tabShow">
                <h1>My Booking</h1>
                <!-- Your booking form here -->
            </div>
        </div>
    </div>

    <script src="Profile JS.js"></script>

    <script>
        function checkPasswordStrength() {
            var password = document.getElementById('password').value;
            var passwordStrength = document.getElementById("password-strength");
            
            // Password strength criteria and calculation
            var minLength = 8;
            var hasUpperCase = /[A-Z]/.test(password);
            var hasLowerCase = /[a-z]/.test(password);
            var hasDigit = /\d/.test(password);
            var hasSpecialChar = /[!@#$%^&*(),.?":{}|<>]/.test(password);
            
            // Calculate password strength
            var strength = 0;
            if (password.length >= minLength) {
                strength++;
            }
            if (hasUpperCase) {
                strength++;
            }
            if (hasLowerCase) {
                strength++;
            }
            if (hasDigit) {
                strength++;
            }
            if (hasSpecialChar) {
                strength++;
            }
            
            // Update password strength message and color
            if (password === "") {
                passwordStrength.textContent = "";
            } else if (strength >= 4) {
                passwordStrength.textContent = "Strong password";
                passwordStrength.style.color = "green";
            } else if (strength >= 2) {
                passwordStrength.textContent = "Medium password";
                passwordStrength.style.color = "orange";
            } else {
                passwordStrength.textContent = "Weak password";
                passwordStrength.style.color = "red";
            }
        }

        function validateConfirmPassword() {
            var password = document.getElementById('password').value;
            var confirmPassword = document.getElementById('confirm_password').value;
            var confirmPasswordMessage = document.getElementById("confirm-password-validation-message");

            if (password === confirmPassword) {
                confirmPasswordMessage.textContent = "";
            } else {
                confirmPasswordMessage.textContent = "Passwords do not match.";
            }
        }

        function validateForm() {
            var password = document.getElementById('password').value;
            var confirmPassword = document.getElementById('confirm_password').value;
            var confirmPasswordMessage = document.getElementById("confirm-password-validation-message");

            if (password !== confirmPassword) {
                confirmPasswordMessage.textContent = "Passwords do not match.";
                return false;
            } else {
                return true;
            }
        }
    </script>
    
    <script>
    function validateForm() {
        var price = parseFloat(document.getElementById('roomPrice').value);
        var validationMessage = document.getElementById('price-validation-message');

        if (isNaN(price) || price <= 0) {
            validationMessage.textContent = 'Room price must be a non-zero positive number.';
            return false; // Prevent form submission
        } else {
            validationMessage.textContent = '';
            return true; // Allow form submission
        }
    }
</script>
</body>


</html>

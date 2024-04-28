<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Animated Login Page</title>
  <link rel="stylesheet" href="HotelRegisterLogin.css">
</head>

<body>
  
  <div class="container" id="container">
    <div class="form-container sign-up">
      <form name="signupForm" action="hotelsignup" method="post" onsubmit="return validateForm()">
        <h1>Create Account</h1>
        <span>Enter your credentials to register.</span>
        <%String uniqueMessage=(String) request.getAttribute("unique");
        if(uniqueMessage!=null){%>
        <span style="color: red"><%=uniqueMessage %></span>
        <%} %>
        <input type="text" placeholder="Hotel_Name" name="hotel_name"	autocomplete="off"><span id="name-validation-message"></span>
        <input type="text" placeholder="Hotel_location" name="hotel_location" autocomplete="off"><span id="location-validation-message"></span>
        <input type="tel" placeholder="Hotel_Phone_Number" name="hotel_phone" maxlength="10" autocomplete="off"><span id="phone-validation-message"></span>
        <input type="email" placeholder="Hotel_Email" name="hotel_email" autocomplete="off"><span id="email-validation-message"></span>
        <input type="password" placeholder="Hotel_Password" name="hotel_password" maxlength="18" minlength="8" oninput="checkPasswordStrength()"><span id="password-validation-message"></span>
        <span id="password-strength"></span>
        <input type="password" placeholder="Confirm_Password" name="confirm_hotel_password" onfocus="showPasswordMatchMessage()" oninput="showPasswordMatchMessage()"><span id="confirm-password-validation-message"></span>
        <input type="number" placeholder="Total_Rooms" name="total_rooms"><span id="total-rooms-validation-message"></span>
        <input type="number" placeholder="Current_Rooms_Available" name="avail_room"><span id="avail-room-validation-message"></span>
        <input type="number" placeholder="Room_Price" name="hotel_room_price"><span id="room-price-validation-message"></span>
        <button type="submit">Sign Up</button>
      </form>
    </div>
    <div class="form-container sign-in">
  		<form name="loginForm" action="hotellogin" method="post" onsubmit="return validateLoginForm()">
    		<h1>Login</h1>
    		<span>Use your email and password.</span>
    		<%String message=(String)request.getAttribute("message"); 
    		if(message!=null){
    		%>
    		<span style="color: red"><%=message %></span>
    		<%} %>
    		<input type="email" placeholder="Email" name="hotel_email" id="login-email" autocomplete="off">
    		<span id="login-email-validation-message" class="error-message"></span>
   			<input type="password" placeholder="Password"  name="hotel_password">
    		<a href="HotelForgot.jsp">Forget your Password?</a>
    		<button type="submit">Login</button>
  		</form>
	</div>
    <div class="toggle-container">
      <div class="toggle">
        <div class="toggle-panel toggle-left">
          <h1>Welcome Back!</h1>
          <p>Enter your Personal details to use all of site features</p>
          <button class="hidden" id="login">Login</button>
        </div>
        <div class="toggle-panel toggle-right">
          <h1>Hello, Friend!</h1>
          <p>Register with your Personal details to use all of site features</p>
          <button class="hidden" id="register">Sign Up</button>
        </div>
      </div>
    </div>
  </div>

<script>
document.addEventListener("DOMContentLoaded", function() {
    const container = document.getElementById('container');
    const registerBtn = document.getElementById('register');
    const loginBtn = document.getElementById('login')

    registerBtn.addEventListener('click', () => {
        container.classList.add('active');
    });

    loginBtn.addEventListener('click', () => {
        container.classList.remove('active');
    });
});

function validateForm() {
    var isValid = true;

    var hotelName = document.forms["signupForm"]["hotel_name"].value.trim();
    var hotelLocation = document.forms["signupForm"]["hotel_location"].value.trim();
    var hotelPhone = document.forms["signupForm"]["hotel_phone"].value.trim();
    var hotelEmail = document.forms["signupForm"]["hotel_email"].value.trim();
    var hotelPassword = document.forms["signupForm"]["hotel_password"].value.trim();
    var confirmHotelPassword = document.forms["signupForm"]["confirm_hotel_password"].value.trim();
    var totalRooms = parseInt(document.forms["signupForm"]["total_rooms"].value.trim());
    var availRoom = parseInt(document.forms["signupForm"]["avail_room"].value.trim());
    var hotelRoomPrice = parseInt(document.forms["signupForm"]["hotel_room_price"].value.trim());

    // Validate Hotel Name
    if (hotelName === "") {
        document.getElementById("name-validation-message").textContent = "Please enter Hotel Name.";
        document.getElementById("name-validation-message").style.color = "red";
        isValid = false;
    } else {
        document.getElementById("name-validation-message").textContent = "";
    }

    // Validate Hotel Location
    if (hotelLocation === "") {
        document.getElementById("location-validation-message").textContent = "Please enter Hotel Location.";
        document.getElementById("location-validation-message").style.color = "red";
        isValid = false;
    } else if (!/^[a-zA-Z\s]*$/.test(hotelLocation)) {
        document.getElementById("location-validation-message").textContent = "Location can only contain alphabets.";
        document.getElementById("location-validation-message").style.color = "red";
        isValid = false;
    } else {
        document.getElementById("location-validation-message").textContent = "";
    }

    // Validate Hotel Phone Number
    if (hotelPhone === "") {
        document.getElementById("phone-validation-message").textContent = "Please enter Hotel Phone Number.";
        document.getElementById("phone-validation-message").style.color = "red";
        isValid = false;
    } else if (!/^[6-9]\d{9}$/.test(hotelPhone)) {
        document.getElementById("phone-validation-message").textContent = "Please enter a valid 10-digit phone number starting with a digit between 6 and 9.";
        document.getElementById("phone-validation-message").style.color = "red";
        isValid = false;
    } else {
        document.getElementById("phone-validation-message").textContent = "";
    }

    // Validate Hotel Email
    if (hotelEmail === "") {
        document.getElementById("email-validation-message").textContent = "Please enter Hotel Email.";
        document.getElementById("email-validation-message").style.color = "red";
        isValid = false;
    } else if (!/^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/.test(hotelEmail)) {
        document.getElementById("email-validation-message").textContent = "Please enter a valid email address.";
        document.getElementById("email-validation-message").style.color = "red";
        isValid = false;
    } else {
        document.getElementById("email-validation-message").textContent = "";
    }

    // Validate Hotel Password
    if (hotelPassword === "") {
        document.getElementById("password-validation-message").textContent = "Please enter Hotel Password.";
        document.getElementById("password-validation-message").style.color = "red";
        isValid = false;
    } else {
        document.getElementById("password-validation-message").textContent = "";
    }

    // Validate Confirm Hotel Password
    if (confirmHotelPassword === "") {
        document.getElementById("confirm-password-validation-message").textContent = "Please enter Confirm Password.";
        document.getElementById("confirm-password-validation-message").style.color = "red";
        isValid = false;
    } else if (hotelPassword !== confirmHotelPassword) {
        document.getElementById("confirm-password-validation-message").textContent = "Passwords do not match.";
        document.getElementById("confirm-password-validation-message").style.color = "red";
        isValid = false;
    } else {
        document.getElementById("confirm-password-validation-message").textContent = "";
    }

    // Validate Total Rooms
    if (isNaN(totalRooms) || totalRooms <= 0) {
        document.getElementById("total-rooms-validation-message").textContent = "Please enter a valid Total Rooms count.";
        document.getElementById("total-rooms-validation-message").style.color = "red";
        isValid = false;
    } else {
        document.getElementById("total-rooms-validation-message").textContent = "";
    }

    // Validate Available Rooms
    if (isNaN(availRoom) || availRoom <= 0 || availRoom > totalRooms) {
        document.getElementById("avail-room-validation-message").textContent = "Please enter a valid Available Rooms count.";
        document.getElementById("avail-room-validation-message").style.color = "red";
        isValid = false;
    } else {
        document.getElementById("avail-room-validation-message").textContent = "";
    }

    // Validate Room Price
    if (isNaN(hotelRoomPrice) || hotelRoomPrice <= 0) {
        document.getElementById("room-price-validation-message").textContent = "Please enter a valid Room Price.";
        document.getElementById("room-price-validation-message").style.color = "red";
        isValid = false;
    } else {
        document.getElementById("room-price-validation-message").textContent = "";
    }

    return isValid;
}

function checkPasswordStrength() {
    var password = document.forms["signupForm"]["hotel_password"].value.trim();
    var passwordStrength = document.getElementById("password-strength");

    // Password strength criteria
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
        passwordStrength.style.color = "";
    } else if (strength === 5) {
        passwordStrength.textContent = "Strong password";
        passwordStrength.style.color = "green";
    } else if (strength >= 3) {
        passwordStrength.textContent = "Medium password";
        passwordStrength.style.color = "yellow";
    } else {
        passwordStrength.textContent = "Weak password";
        passwordStrength.style.color = "red";
    }
}

function showPasswordMatchMessage() {
    var hotelPassword = document.forms["signupForm"]["hotel_password"].value.trim();
    var confirmHotelPassword = document.forms["signupForm"]["confirm_hotel_password"].value.trim();
    var confirmPasswordMessage = document.getElementById("confirm-password-validation-message");

    if (hotelPassword === confirmHotelPassword) {
        confirmPasswordMessage.textContent = "Passwords match";
        confirmPasswordMessage.style.color = "green";
    } else {
        confirmPasswordMessage.textContent = "";
    }
}





function validateLoginForm() {
	  var isValid = true;

	  var email = document.forms["loginForm"]["hotel_email"].value.trim();
	  var emailErrorMessage = document.getElementById("login-email-validation-message");

	  // Validate Email
	  if (email === "") {
	    emailErrorMessage.textContent = "Please enter your email.";
	    emailErrorMessage.style.color = "red";
	    isValid = false;
	  } else if (!isValidEmail(email)) {
	    emailErrorMessage.textContent = "Please enter a valid email address.";
	    emailErrorMessage.style.color = "red";
	    isValid = false;
	  } else {
	    emailErrorMessage.textContent = "";
	  }

	  return isValid;
	}

	function isValidEmail(email) {
	  // Regular expression for basic email validation
	  var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
	  return emailRegex.test(email);
	}


</script>

</body>







</html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Forgot Password</title>
<link rel="stylesheet" href="forgot.css">
</head>
<body>

<div class="container">
  <h2>Forgot Password</h2>
  <p>Please enter your email address and new password.</p>
  <form action="forgotPassword" id="forgotPasswordForm" onsubmit="return validateForm()" method="post">
  	<%String noCustomer=(String)request.getAttribute("nocustomer"); 
  	if(noCustomer!=null){%>
  	
  	<span style="color: red"><%=noCustomer %></span>
  	<%} %>
    <input type="email" id="email" name="email" placeholder="Email address" required>
    <input type="password" id="newPassword" name="newPassword" placeholder="New Password" maxlength="18" minlength="8" onkeyup="checkPasswordStrength()" required>
    <span id="password-strength"></span>
    <span id="password-validation-message"></span>
    <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm Password" onkeyup="showPasswordMatchMessage()" required>
    <span id="confirm-password-validation-message"></span>
        
    <button type="submit">Reset Password</button>
  </form>
  <p id="message"></p>
</div>

<script src="forgot.js"></script>
</body>
</html>

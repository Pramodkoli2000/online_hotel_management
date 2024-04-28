<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="pt-BR">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Online Hotel Booking</title>
<link rel="stylesheet" href="CustomerRegisterLogin.css">
</head>

<body>
	<div class="container" id="container">
		<div class="form-container sign-up">
			<form name="signupForm" action="customersignup" method="post"
				onsubmit="return validateForm()">
				<h1>Create Account</h1>
				<span>or use your email to registration</span>
				<%
				String uniqueMessage = (String) request.getAttribute("unique");
				if (uniqueMessage != null) {
				%>
				<span style="color: red"><%=uniqueMessage%></span>
				<%
				}
				%>
				<input type="text" placeholder="Enter Your Name"
					name="customer_name" id="customer_name" autocomplete="off">
				<span id="name-validation-message" class="error-message"></span> 
				<input
					type="text" placeholder="Address" name="address" id="address"
					autocomplete="off"> <span id="address-validation-message"
					class="error-message"></span>
				<input type="tel"
					placeholder="Phone Number" name="customer_phone" maxlength="10"
					id="customer_phone" autocomplete="off"> <span
					id="phone-validation-message" class="error-message"></span> 
				<input 	type="email" placeholder="Email" name="customer_email"
					id="customer_email" autocomplete="off"> <span
					id="email-validation-message" class="error-message"></span> <input
					type="password" placeholder="Password" name="customer_password"
					id="customer_password" oninput="checkPasswordStrength()"> <span
					id="password-validation-message" class="error-message"></span> <span
					id="password-strength"></span> <input type="password"
					placeholder="Confirm Password" name="customer_confirm_password"
					id="customer_confirm_password" oninput="showPasswordMatchMessage()">
				<span id="confirm-password-validation-message" class="error-message"></span>
				<input type="text" placeholder="Aadhar Card Number"
					name="customer_aadhar" id="customer_aadhar" maxlength="12"
					autocomplete="off"> <span id="aadhar-validation-message"
					class="error-message"></span>
				<button type="submit">Sign Up</button>
			</form>
		</div>

		<div class="form-container sign-in">
			<form name="loginForm" action="customerlogin" method="post"
				onsubmit="return validateLoginForm()">
				<h1>Login</h1>
				<span>Use your email and password.</span>
				<%
				String message = (String) request.getAttribute("message");
				if (message != null) {
				%>
				<span style="color: red"><%=message%></span>
				<%
				}
				%>
				<input type="email" placeholder="Email" name="customer_email"
					id="login-email" autocomplete="off"> <span
					id="login-email-validation-message" class="error-message"></span> <input
					type="password" placeholder="Password" name="customer_password">
				<a href="forgot.jsp">Forget your Password?</a> <button
						type="submit">Login</button>
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
					<p>Register with your Personal details to use all of site
						features</p>
					<button class="hidden" id="register">Sign Up</button>
				</div>
			</div>
		</div>
	</div>

	<script>
    const container = document.getElementById('container');
    const registerBtn = document.getElementById('register');
    const loginBtn = document.getElementById('login');

    registerBtn.addEventListener('click', () => {
      container.classList.add('active');
    });

    loginBtn.addEventListener('click', () => {
      container.classList.remove('active');
    });
  </script>

	<script>
  document.addEventListener('DOMContentLoaded', function() {
	    // Add event listeners to input fields for real-time validation
	    document.getElementById('customer_name').addEventListener('input', validateName);
	    document.getElementById('address').addEventListener('input', validateAddress);
	    document.getElementById('customer_phone').addEventListener('input', validatePhone);
	    document.getElementById('customer_email').addEventListener('input', validateEmail);
	    document.getElementById('customer_password').addEventListener('input', validatePassword);
	    document.getElementById('customer_confirm_password').addEventListener('input', validateConfirmPassword);
	    document.getElementById('customer_aadhar').addEventListener('input', validateAadhar);
	  });

	  // Validation functions for each input field
	 function validateName() {
    var name = document.getElementById('customer_name').value.trim();
    var validationMessage = document.getElementById("name-validation-message");

    if (!/^[a-zA-Z ]+$/.test(name)) {
        validationMessage.textContent = "Name should only contain alphabets.";
        validationMessage.style.color = "red";
    } else {
        validationMessage.textContent = "";
    }
}

function validateAddress() {
    var address = document.getElementById('address').value.trim();
    var validationMessage = document.getElementById("address-validation-message");

    if (!/^[a-zA-Z ]+$/.test(address)) {
        validationMessage.textContent = "Address should only contain alphabets.";
        validationMessage.style.color = "red";
    } else {
        validationMessage.textContent = "";
    }
}

function validatePhone() {
    var phone = document.getElementById('customer_phone').value.trim();
    var validationMessage = document.getElementById("phone-validation-message");

    if (!/^[6-9]\d{9}$/.test(phone)) {
        validationMessage.textContent = "Please enter a valid 10-digit phone number starting with a digit between 6 and 9.";
        validationMessage.style.color = "red";
    } else {
        validationMessage.textContent = "";
    }
}

function validateEmail() {
    var email = document.getElementById('customer_email').value.trim();
    var validationMessage = document.getElementById("email-validation-message");

    if (!/^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/.test(email)) {
        validationMessage.textContent = "Please enter a valid email address.";
        validationMessage.style.color = "red";
    } else {
        validationMessage.textContent = "";
    }
}

function validatePassword() {
    var password = document.getElementById('customer_password').value.trim();
    var validationMessage = document.getElementById("password-validation-message");

    if (!/(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>]).{8,}/.test(password)) {
        validationMessage.textContent = "Password must contain at least one uppercase, one lowercase, one digit, one special character, and be at least 8 characters long.";
        validationMessage.style.color = "red";
    } else {
        validationMessage.textContent = "";
    }
}

function validateAadhar() {
    var aadhar = document.getElementById('customer_aadhar').value.trim();
    var validationMessage = document.getElementById("aadhar-validation-message");

    if (!/^\d{12}$/.test(aadhar)) {
        validationMessage.textContent = "Aadhar Card number must be exactly 12 digits long.";
        validationMessage.style.color = "red";
    } else {
        validationMessage.textContent = "";
    }
}

function validateConfirmPassword() {
    var password = document.getElementById('customer_password').value.trim();
    var confirmPassword = document.getElementById('customer_confirm_password').value.trim();
    var validationMessage = document.getElementById("confirm-password-validation-message");

    if (password !== confirmPassword) {
        validationMessage.textContent = "Passwords do not match.";
        validationMessage.style.color = "red";
    } else {
        validationMessage.textContent = "";
    }
}
	  
	  
	  
	  

    function validateForm() {
      var isValid = true;

      var name = document.getElementById('customer_name').value.trim();
      var address = document.getElementById('address').value.trim();
      var phone = document.getElementById('customer_phone').value.trim();
      var email = document.getElementById('customer_email').value.trim();
      var password = document.getElementById('customer_password').value.trim();
      var confirmPassword = document.getElementById('customer_confirm_password').value.trim();
      var aadhar = document.getElementById('customer_aadhar').value.trim();

      // Validate Name
      if (!/^[a-zA-Z ]+$/.test(name)) {
        document.getElementById("name-validation-message").textContent = "Name should only contain alphabets.";
        document.getElementById("name-validation-message").style.color = "red";
        isValid = false;
      } else {
        document.getElementById("name-validation-message").textContent = "";
      }

      // Validate Address
      if (!/^[a-zA-Z ]+$/.test(address)) {
        document.getElementById("address-validation-message").textContent = "Address should only contain alphabets.";
        document.getElementById("address-validation-message").style.color = "red";
        isValid = false;
      } else {
        document.getElementById("address-validation-message").textContent = "";
      }

      // Validate Phone Number
      if (!/^[6-9]\d{9}$/.test(phone)) {
        document.getElementById("phone-validation-message").textContent = "Please enter a valid 10-digit phone number starting with a digit between 6 and 9.";
        document.getElementById("phone-validation-message").style.color = "red";
        isValid = false;
      } else {
        document.getElementById("phone-validation-message").textContent = "";
      }

      // Validate Email
      if (!/^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/.test(email)) {
        document.getElementById("email-validation-message").textContent = "Please enter a valid email address.";
        document.getElementById("email-validation-message").style.color = "red";
        isValid = false;
      } else {
        document.getElementById("email-validation-message").textContent = "";
      }

      // Validate Password
      if (!/(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>]).{8,}/.test(password)) {
        document.getElementById("password-validation-message").textContent = "Password must contain at least one uppercase, one lowercase, one digit, one special character, and be at least 8 characters long.";
        document.getElementById("password-validation-message").style.color = "red";
        isValid = false;
      } else {
        document.getElementById("password-validation-message").textContent = "";
      }

      // Validate Confirm Password
      if (password !== confirmPassword) {
        document.getElementById("confirm-password-validation-message").textContent = "Passwords do not match.";
        document.getElementById("confirm-password-validation-message").style.color = "red";
        isValid = false;
      } else {
        document.getElementById("confirm-password-validation-message").textContent = "";
      }

      // Validate Aadhar Card Number
      if (!/^\d{12}$/.test(aadhar)) {
        document.getElementById("aadhar-validation-message").textContent = "Aadhar Card number must be exactly 12 digits long.";
        document.getElementById("aadhar-validation-message").style.color = "red";
        isValid = false;
      } else {
        document.getElementById("aadhar-validation-message").textContent = "";
      }

      return isValid;
    }

    function checkPasswordStrength() {
      var password = document.getElementById('customer_password').value.trim();
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
      var password = document.getElementById('customer_password').value.trim();
      var confirmPassword = document.getElementById('customer_confirm_password').value.trim();
      var confirmPasswordMessage = document.getElementById("confirm-password-validation-message");

      if (password === confirmPassword) {
        confirmPasswordMessage.textContent = "Passwords match";
        confirmPasswordMessage.style.color = "green";
      } else {
        confirmPasswordMessage.textContent = "Passwords do not match.";
        confirmPasswordMessage.style.color = "red";
      }
    }
    
    
    
    
    function validateLoginForm() {
  	  var isValid = true;

  	  var email = document.forms["loginForm"]["customer_email"].value.trim();
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



function validateForm() {
	var isValid = true;

	var hotelPassword = document.forms["forgotPasswordForm"]["newPassword"].value.trim();
	var confirmHotelPassword = document.forms["forgotPasswordForm"]["confirmPassword"].value.trim();

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
		document.getElementById("confirm-password-validation-message").textContent = "Passwords match.";
		document.getElementById("confirm-password-validation-message").style.color = "green";
	}

	return isValid;
}

function checkPasswordStrength() {
	var password = document.forms["forgotPasswordForm"]["newPassword"].value.trim();
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
	var hotelPassword = document.forms["forgotPasswordForm"]["newPassword"].value.trim();
	var confirmHotelPassword = document.forms["forgotPasswordForm"]["confirmPassword"].value.trim();
	var confirmPasswordMessage = document.getElementById("confirm-password-validation-message");

	if (hotelPassword === confirmHotelPassword && hotelPassword !== "") {
		confirmPasswordMessage.textContent = "Passwords match";
		confirmPasswordMessage.style.color = "green";
	} else {
		confirmPasswordMessage.textContent = "";
	}
}

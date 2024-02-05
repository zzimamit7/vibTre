/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
 function validation() {
    
    var isValid = true;
    var isValidNumber=true;
    var isValidDOB=true;
    var isValidEmail=true;
    // Name validation
    var name = document.getElementById('Name').value;
    if(name.trim() === '') {
        document.getElementById('nameError').innerHTML = 'Name is required.';
        isValid = false;
    } else {
        document.getElementById('nameError').innerHTML = '';
        isValid=true;
    }

    // Phone number validation
    var phoneNumber = document.getElementById('PhoneNumber').value;
    var phoneRegex = /^[0-9]{10}$/; // Adjust based on your requirement
    if(!phoneRegex.test(phoneNumber)) {
        document.getElementById('PhoneError').innerHTML = 'Invalid phone number. Please enter a 10 digit number.';
        isValidNumber = false;
    } else {
        document.getElementById('PhoneError').innerHTML = '';
        isValidNumber=true;
    }

    // Date of Birth validation
    var day = document.getElementById('day').value;
    var month = document.getElementById('month').value;
    var year = document.getElementById('year').value;
    // Basic check for day, month, year
    if(day < 1 || day > 31 || month < 1 || month > 12 || year < 1900 || year > new Date().getFullYear()) {
        document.getElementById('dateError').innerHTML = 'Invalid date of birth.';
        isValidDOB = false;
    } else {
        document.getElementById('dateError').innerHTML = '';
        isValidDOB=true;
    }

    // Email validation
    var email = document.getElementById('Email').value;
    var emailRegex = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    if(!emailRegex.test(email)) {
        document.getElementById('emailError').innerHTML = 'Invalid email address.';
        isValidEmail = false;
    } else {
        document.getElementById('emailError').innerHTML = '';
        isValidEmail=true;
    }

    // Password validation
    var password = document.getElementById('Password').value;
    if(password.length < 6) { // Example: minimum 6 characters
        document.getElementById('passwordError').innerHTML = 'Password must be at least 6 characters.';
        isValidPassword = false;
    } else {
        document.getElementById('passwordError').innerHTML = '';
        isValidPassword=true;
    }

    if(isValid==true && isValidNumber==true && isValidDOB==true && isValidEmail==true && isValidPassword==true){
        return true;
    }
    return false;
}


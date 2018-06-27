<%-- 
    Document   : upload
    Created on : 24-Jun-2018, 23:06:10
    Author     : adu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Upload</title>
        <link rel="stylesheet" type="text/css" href="css/registration.css">
    </head>
    
    <body>
    <div class="registrationBox" >
    <!--I need a target and probably a method on click()-->

    <form id="registrationForm" method="POST" action="#">

        <p class="heading">Upload</p>
        <label for="firstname">First Name</label>
        <input type="text" name="fname" id="fname" placeholder="Enter your first name" required>
        <br>

        <label for="lastname">Last Name</label>
        <input type="text" name="lname" id="lname" placeholder="Enter your last name" required>
        <br>

        <label for="email">Email</label>
        <input type="email" name="email" id="email" placeholder="Enter your email" required>
        <br>
        
        <label for="occupation">Occupation</label>
        <input type="text" name="occupation" id="occupation" placeholder="What do you do?" required>
        <br>

        <label for="password">Password</label>
        <input type="password" name="password" id="password" placeholder="Enter your password" required>
        <br>

        <label for="confirmPassword">Confirm Password</label>
        <input type="password" name="confirmPassword" id="confirmPassword" placeholder="Retype your password" required>
        <br>

        <label>Interests</label>
         <input type="checkbox" name="interests" value="drawings">Drawings
         <br>
        
        <input type="checkbox" name="interests" value="paintings">Paintings
        <br>
        
        <input type="checkbox" name="interests" value="photography">Photography
        <br>
        
        <input type="checkbox" name="interests" value="graphic_design">Graphic Design
        <br>
        
        <input type="checkbox" name="interests" value="interior_design">Interior Design    
        <br>
        
        <input type="submit" name="submitBtn" id="submitBtn" value="Register" onclick="checkForm()"/>

    </form>

    <p id="link">
        <a href="login.html" class="linksBelow">Already have an account? Sign in.</a>
    </p>

</div>
    </body>
</html>

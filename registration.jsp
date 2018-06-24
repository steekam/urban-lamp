<%-- 
    Document   : registration
    Created on : 23-Jun-2018, 23:23:47
    Author     : adu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
<head>
    <title>Register</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/registration.css">
    <link type="text/css" href="css/navigation-bar.css" rel="stylesheet"/>
    <script src="JS/jquery-3.3.1.js"></script>
    <script type="text/javascript">
       
        
        function checkForm(){
            var pwd = document.getElementById('password').value;
            var confirmPwd = document.getElementById('confirmPassword').value;
            
             //Ensure at least one textbox is chosen
            var check = document.getElementsByName("interests");
            var intChosen;

            for(var i=0, l = check.length; i<l; i++)
            {
                if(check[i].checked)
                {
                    intChosen= true;
                    break;
                }
            }
            
            if(pwd !== confirmPwd)
            {
                document.getElementById('password').value="";
                document.getElementById('confirmPassword').value="";
                alert("The passwords do not match!");
                return false;
            }
            
            else if(pwd.length<6){
                document.getElementById('password').value="";
                document.getElementById('confirmPassword').value="";
                alert("The password is too short!");
                return false;
                
            }else if(!intChosen){
                    alert("Pick at least one interest");
                    return false;
            }else{
                    return true;
            }
        }
        
        
   


        $(document).ready(function(){
            $("form").submit(function(e){
               if(!checkForm()){
                   e.preventDefault();
               }
            });
        });
           
    </script>
    
</head>
<body>
    
    <div class="title">Join the Art G Family</div>
    

    
<!--Registration form -->
<div class="registrationBox" >
    <!--I need a target and probably a method on click()-->

    <form id="registrationForm" method="POST" action="registration">

        <p class="heading">Register</p>
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

<div class="search-text">
    <div class="container">
        <div class="row text-center">

<!--            <div class="form">
                <h4>SIGN UP TO OUR NEWSLETTER</h4>
                <form id="search-form" class="form-search form-horizontal">
                    <input type="text" class="input-search" placeholder="Email Address">
                    <button type="submit" class="btn-search">SUBMIT</button>
                </form>
            </div>-->

        </div>
    </div>
</div>

<footer>
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-sm-6 col-xs-12">
                <ul class="menu">
                    <span>Menu</span>
                    <li>
                        <a href="home.html">Home</a>
                    </li>

                    <li>
                        <a href="#">About</a>
                    </li>

                    <li>
                        <a href="#">Blog</a>
                    </li>

                    <li>
                        <a href="#">Gallery </a>
                    </li>
                </ul>
            </div>

            <div class="col-md-4 col-sm-6 col-xs-12">
                <ul class="address">
                    <span>Contact</span>
                    <li>
                        <i class="fa fa-phone" aria-hidden="true"></i> <a href="#">Phone</a>
                    </li>
                    <li>
                        <i class="fa fa-map-marker" aria-hidden="true"></i> <a href="#">Adress</a>
                    </li>
                    <li>
                        <i class="fa fa-envelope" aria-hidden="true"></i> <a href="#">Email</a>
                    </li>
                </ul>
            </div>


        </div>
    </div>
</footer>
</body>
</html>


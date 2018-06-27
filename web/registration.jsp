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

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <!-- Font awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css">
    
    <link rel="stylesheet" href="css/style.css">
    
    <script src="JS/jquery-3.3.1.js"></script>
    <script type="text/javascript">  
        function checkForm(){
            var pwd = document.getElementById('password').value;
            var confirmPwd = document.getElementById('confirmPassword').value;
            
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
<body id="reg-body">
    <div class="container">

        <div id="registration-wrapper" class="col-md-8 col-lg-6 col-xs-10 col-sm-10">
            <center><h3>REGISTRATION</h3></center>
            <form id="registrationForm" method="POST" action="registration">
                <div class="form-group">
                    <label class="sr-only" for="firstname">First Name</label>
                    <input type="text" name="fname" id="fname" class="form-control" placeholder="First name" required>
                </div>
            
                <div class="form-group">
                    <label class="sr-only" for="lastname">Last Name</label>
                    <input type="text" name="lname" id="lname" class="form-control" placeholder="Last name" required>
                </div>
            
                <div class="form-group">
                    <label class="sr-only" for="email">Email</label>
                    <input type="email" name="email" id="email" class="form-control" placeholder="Email address" required>
                </div>
            
                <div class="form-group">
                    <label class="sr-only" for="password">Password</label>
                    <input type="password" name="password" id="password" class="form-control" placeholder="Password" required>
                </div>
            
                <div class="form-group">
                    <label class="sr-only" for="confirmPassword">Confirm Password</label>
                    <input type="password" name="confirmPassword" id="confirmPassword" class="form-control" placeholder="Confirm password"
                        required>
                </div>

                <div class="form-group">
                    <input type="submit" name="submitBtn" id="submitBtn" value="Register" class="form-control btn btn-success" onclick="checkForm()"
                        required>
                </div>
                <center id="bottom-link">
                    Already have an account? <a href="login.html">Login</a>
                </center>
            </form>
        </div>
    </div>

<!--Bootstrap dependencies  -->
<script src="JS/jquery-3.3.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

</body>
</html>


<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%
  String sessionUser = (String) session.getAttribute("user");
  String user = null;
  Cookie[] cookies = request.getCookies();
  if(cookies !=null){
    for(Cookie cookie : cookies){
      if(cookie.getName().equals("user")) user = cookie.getValue();
    }
  }
  if(user != null){
    response.sendRedirect("home.jsp");
    session = request.getSession();
    session.setAttribute("user", user);
  }
%>
<!DOCTYPE html>
<html>
    
    <head>
    <title>Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Bootstrap -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <!-- Font awesome -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css">

        <link rel="stylesheet" href="css/style.css">
    </head>
<body id="login-body">
    <div class="container">
        <div class="row">
            <div class="col-sm-6 col-sm-offset-3 form-box">
                <div class="form-top">
                    <div class="form-top-left">
                        <h3>ART GALLERY</h3>
                        <p>LOGIN</p>
                    </div>
                    <div class="form-top-right">
                        <i class="fa fa-lock"></i>
                    </div>
                </div>
                <div class="form-bottom">
                    <form role="form" action="login" method="post" class="login-form">
                        <div class="form-group">
                            <label class="sr-only" for="form-username">Email</label>
                            <input type="email" name="email" placeholder="Email" class="form-username form-control" id="form-username">
                        </div>
                        <div class="form-group">
                            <label class="sr-only" for="form-password">Password</label>
                            <input type="password" name="password" placeholder="Password" class="form-password form-control" id="form-password">
                        </div>
                        <div class="form-group">
                            <label for="remember" class="sr-only">Remember me</label>
                            <input type="checkbox" name="remember" id="remember" value="yes" class="form-check-inline" ><span style="color: white"> Remember me</span>
                        </div>
                        <button type="submit" name="submitBtn" class="btn btn-success">LOGIN</button>
                    </form>
                    <div id="register-wrap">
                        Don't have an account? <a href="registration.jsp" class="linksBelow">Register</a>
                    </div>
                </div>
            </div>
        </div>
    </div>



    <!--Bootstrap dependencies  -->
    <script src="JS/jquery-3.3.1.js"></script>
    <script src="JS/main.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>

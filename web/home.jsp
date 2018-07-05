<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>The Art Gallery</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <!-- Font awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css">
    <link rel="stylesheet" href="css/animate.css">
    
    <link rel="stylesheet" href="css/style.css">
    
</head>
<body>
<%
  String sessionUser = (String) session.getAttribute("user");
  String user = null;
  Cookie[] cookies = request.getCookies();
  if(cookies !=null){
    for(Cookie cookie : cookies){
      if(cookie.getName().equals("user")) user = cookie.getValue();
    }
  }
  if(user == null && sessionUser == null){
      response.sendRedirect("login.jsp");
  }else{
       session = request.getSession();
       session.setAttribute("user", user);
  }
%>
    
    <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
      <a class="navbar-brand" href="#">THE ART GALLERY</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarCollapse">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
            <a class="nav-link" href="#">Home</span></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Upload</a>
          </li>
          
        </ul>
        <div>
            <button class="btn btn btn-primary"><a style="color: white;" href="LogoutServelet">LOGOUT</a></button>
        </div>
      </div>
    </nav>

    <div class="fluid-container">
      <div id="uploadWrap">
        <button class="btn btn-info upload"><i class="fa fa-plus"></i> Upload image</button>
        <form method='post' enctype="multipart/form-data">
          <input type="file" name="image" id="imageUpload" accept="image/*">
        </form>
      </div>
      
      <div class="uploaded">
        <!--<img src="/black.jpeg">-->
      </div>

      <%-- Slider container --%>
      <div id="slider">
      </div>
    </div>
 

<!--Bootstrap dependencies  -->
<!-- Import libraries to help with animation -->
<script src="JS/jquery-3.3.1.js"></script>

<script src="JS/main.js">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>

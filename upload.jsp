<%-- 
    Document   : upload
    Created on : 24-Jun-2018, 23:06:10
    Author     : adu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@page import="java.util.Set" %>
<%@page import="java.util.HashSet" %>
<%@page import="java.util.Random" %>--%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Upload</title>
        <link rel="stylesheet" type="text/css" href="css/registration.css">
        <script src="JS/jquery-3.3.1.js"></script>
        <script type="text/javascript">
           
        //Ensures a category is chosen
           function isSelected(){
            var category = document.getElementById('category').value;
            var other = document.getElementById('other').value;
         
                if(category === ""){
                    alert("Please select a category");
                    return false;
                    
                }else if(category === "Other") {
                    
                    if(other===""){
                        alert("Enter the other category");
                        return false;
                    }
                }
                
                    return true;
                
           }
           
           function setDt(){
            //Set the date
             var today = new Date();
             var dd = today.getDate();
             var mm = today.getMonth()+1; //January is 0!
             var yyyy = today.getFullYear();
              var date;

             if(dd<10) {
                 dd = '0'+dd;
             } 

             if(mm<10) {
                 mm = '0'+mm;
             } 

             date  = yyyy + '-' + mm + '-' + dd;
             document.getElementById('date').value = date;
             
             //Set the time
             var d = new Date(); // for now
                var hr = d.getHours(); // => 9
                var min = d.getMinutes(); // =>  30
                var sec = d.getSeconds(); // => 51
                var time;
                
                if(hr<10){
                    hr = '0'+hr;
                }
             
                if(min<10){
                    min = '0'+min;
                }
             
                if(sec<10){
                    sec = '0'+sec;
                }
                
                time = hr+":"+min+":"+sec;
                document.getElementById('time').value = time;

           }
            
            $(document).ready(function(){
                
                $("#submitBtn").click(function(){
                   isSelected();
                   setDt();
                });
        
                //Hide the other field 
                $('.other').hide();

                $(".category").change(function(){
                   if($(this).val() === "Other"){
                       $('.other').slideDown();
                   }else{
                       $('.other').slideUp();
                   }
                });
                
                
                $("form").submit(function(e){
        
                    if(!isSelected()){
                       e.preventDefault();
                    }
                });
        
            });
                
        </script>
        
    </head>
    
    <body>
        
     <!--Navigation Bar-->
        
        
        
    <div class="registrationBox" >
    <!--I need a target and probably a method on click()-->

    <form method="POST" enctype="multipart/form-data" action="file_upload_servlet" >

        <p class="heading">Upload</p>
        <label for="artist">Artist</label>
        <input type="text" name="artist" id="artist" placeholder="Whose work is this" required>
        <br>

        <label for="image">Image</label>
        <input type="file" name="image" id="image" required>
        <br>

        <label for="category">Category</label>
        <select name="category" class="category" id="category" required>
            <option value="">.....</option>
            <option value="Pencil Sketch">Pencil Sketch</option>
            <option value="Fine Art">Fine Art</option>
            <option value="Photography">Photography</option>
            <option value="Graphic Design">Graphic Design</option>
            <option value="Interior Design">Interior Design</option>
            <option value="Drawing">Drawing</option>
            <option value="Painting">Painting</option>
            <option value="Graffiti">Graffiti</option>
            <option value="Other">Other</option>
        </select>
        <br>
        
        <label for="other" class="other">Other category</label>
        <input type="text" name="other" class="other" id="other" placeholder="Prefarably use one word">
        <br>
       
        <input type="hidden" name="time" id="time">
        
        <input type="hidden" name="date" id="date">
        
        <input type="submit" name="submitBtn" id="submitBtn" value="Upload"/>

    </form>

    </div>
    </body>
</html>

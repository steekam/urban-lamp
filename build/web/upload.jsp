
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
    <title>File Uploading Form</title>
    </head>
<body>
    <h3>File Upload:</h3>
    Select a file to upload: <br/>
    <form action="UploadServelet" method="post" enctype="multipart/form-data">
    <input type="file" name="image" size="50" required>
    <br/>
    <input type="submit" value="Upload File"/>
    </form>
</body>
</html>
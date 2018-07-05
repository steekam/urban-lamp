<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.net.URL"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>

<%
   int MAX_FILE_SIZE =  1024 * 1024 * 100; //100MB
   int MAX_MEM_SIZE = 1024 * 1024 * 50; //50MB
   
   String finalFileName="";
   
   String uploadDirectory = getServletContext().getInitParameter("file-upload");
   System.out.println(uploadDirectory);
   

   String contentType = request.getContentType();
   if ((contentType.indexOf("multipart/form-data") >= 0)) {

      DiskFileItemFactory factory = new DiskFileItemFactory();
      
      //Sets memory threshold - beyond which its stored on disk
      factory.setSizeThreshold(MAX_MEM_SIZE);
      
      //Store files temporarily if they exceed max file size
      factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
      
      ServletFileUpload upload = new ServletFileUpload(factory);
      
      //set max file upload size
      upload.setSizeMax( MAX_FILE_SIZE );
      
      // constructs the directory path to store upload file
        // this path is relative to application's directory
        String uploadPath = "assets/store"
                + File.separator + uploadDirectory;
         
        // creates the directory if it does not exist
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
      try{ 
         List fileItems = upload.parseRequest(request);
         Iterator i = fileItems.iterator();
         while ( i.hasNext () ) 
         {
            FileItem fi = (FileItem)i.next();
            if ( !fi.isFormField () )  {
                String fieldName = fi.getFieldName();
                String fileName = fi.getName();
                int genId = 100 + (int)(Math.random() * 100000);
                finalFileName = "up_"+genId+fileName;
                boolean isInMemory = fi.isInMemory();
                long sizeInBytes = fi.getSize();
                
                String filePath = uploadDirectory + File.separator + finalFileName;
                File storeFile = new File(filePath);
                
                // saves the file on disk
                fi.write(storeFile);
                out.println(finalFileName);
            }
         }
         
      }catch(Exception ex) {
         System.out.println(ex);
      }
   }else{
      out.println("No file uploaded"); 
   }
   
%>
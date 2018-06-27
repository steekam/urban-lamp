/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
        
public class Connect {
    
     //Database Credentials
    private static final String HOST = "jdbc:mysql://localhost:3306/the_art_gallery"; //Database URL
    private static final String USERNAME = "root";
    private static final String PASSWORD = "dracarys_";
    
   
    @SuppressWarnings("CallToPrintStackTrace")
    public static Connection getConnection(){
        
        Connection conn=null;
      
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(HOST, USERNAME, PASSWORD);
            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Connect.class.getName()).log(Level.SEVERE, null, ex);
            ex.printStackTrace();
        }
        return conn;
    }
    
}

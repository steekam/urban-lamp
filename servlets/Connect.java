/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
        
public class Connect {
    
     //Database Credentials
    private static String host = "jdbc:mysql://localhost:3306/the_art_gallery"; //Database URL
    private static String uName = "root";
    private static String uPass = "";
    
   
    public static Connection getConnection(){
        
        Connection conn=null;
      
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(host, uName, uPass);
            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Connect.class.getName()).log(Level.SEVERE, null, ex);
            ex.printStackTrace();
        }
        return conn;
    }
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

/**
 *
 * @author adu
 */
public class Master{
    private static String user_id;
    private static String fname;
    private static String lname;
    private static String email;
    private static String occupation;

    public static void setUser_id(String user_id) {
        Master.user_id = user_id;
    }

    public static void setFname(String fname) {
        Master.fname = fname;
    }

    public static void setLname(String lname) {
        Master.lname = lname;
    }

    public static void setEmail(String email) {
        Master.email = email;
    }

    public static void setOccupation(String occupation) {
        Master.occupation = occupation;
    }

    public static String getUser_id() {
        return user_id;
    }

    public static String getFname() {
        return fname;
    }

    public static String getLname() {
        return lname;
    }

    public static String getEmail() {
        return email;
    }

    public static String getOccupation() {
        return occupation;
    }
    
    
    
    
}

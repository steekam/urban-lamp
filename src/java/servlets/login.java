/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import ejb.Users;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;
import javax.transaction.HeuristicMixedException;
import javax.transaction.HeuristicRollbackException;
import javax.transaction.NotSupportedException;
import javax.transaction.RollbackException;
import javax.transaction.SystemException;


public class login extends HttpServlet {

    @PersistenceContext(unitName = "galleryprojectPU")
    private EntityManager em;
    @Resource
    private javax.transaction.UserTransaction utx;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");
        String stored_pwd;
        
        try (PrintWriter out = response.getWriter()) {
           
            
            try {
                
                Connection conn = Connect.getConnection();
                Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                String SQL = "SELECT * FROM `users` WHERE `email` = '"+email+"'";
                ResultSet rs = stmt.executeQuery(SQL);
                
                String errors = "";
                utx.begin();
                List compareUser = em.createQuery(
                    "SELECT u FROM Users u WHERE u.email LIKE :uEmail")
                    .setParameter("uEmail", email)
                    .setMaxResults(10)
                    .getResultList();
                
                if(compareUser.isEmpty()){
                    errors += "Email does not exist";
                }else {
                    Users current = (Users) compareUser.get(0);
                    stored_pwd = current.getPassword();
                    
                    if( BCrypt.checkpw(password, stored_pwd) ){
                                                                        
                        //Cookie set
                        if(remember != null){
                            Cookie loginCookie = new Cookie("user",Integer.toString(current.getUserId()));
                            //setting cookie to expiry in 30 days
                            loginCookie.setMaxAge(30*24*3600);
                            response.addCookie(loginCookie);
                        }
                        HttpSession session=request.getSession();  
                        session.setAttribute("user",Integer.toString(current.getUserId()));
                        
                        //Allow access
                        response.sendRedirect("home.jsp");
                    }else{
                        errors += "Invalid password";
                    }
                }
                
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/login.jsp");
                out.println("<div class='error fade show alert alert-warning alert-dismissable'>"
                        +"<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">\n" +
                        "    <span aria-hidden=\"true\">&times;</span>\n" +
                        "  </button>"+errors
                        + "</div>");
                rd.include(request, response);
                
                
                
            } catch (SQLException | NotSupportedException | SystemException ex) {
                Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    public void persist(Object object) {
        try {
            utx.begin();
            em.persist(object);
            utx.commit();
        } catch (IllegalStateException | SecurityException | HeuristicMixedException | HeuristicRollbackException | NotSupportedException | RollbackException | SystemException e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            throw new RuntimeException(e);
        }
    }

}

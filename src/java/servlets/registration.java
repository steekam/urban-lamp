
package servlets;

import ejb.Users;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;
import javax.transaction.HeuristicMixedException;
import javax.transaction.HeuristicRollbackException;
import javax.transaction.NotSupportedException;
import javax.transaction.RollbackException;
import javax.transaction.SystemException;

/**
 *
 * @author steekam
 */
public class registration extends HttpServlet {

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
     * @throws javax.transaction.NotSupportedException
     * @throws javax.transaction.SystemException
     * @throws javax.transaction.RollbackException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, NotSupportedException, SystemException, RollbackException {
        
       
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            //The request
            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String pw_hash = BCrypt.hashpw(password, BCrypt.gensalt()); 
            
            //Insert into database
            try {
                Users user = new Users();
                user.setFname(fname);
                user.setLname(lname);
                user.setEmail(email);
                user.setPassword(pw_hash);
                
                utx.begin();
                List compareUser = em.createQuery(
                    "SELECT u FROM Users u WHERE u.email LIKE :uEmail")
                    .setParameter("uEmail", user.getEmail())
                    .setMaxResults(10)
                    .getResultList();
                if(compareUser.isEmpty()){
                    em.persist(user);
                    utx.commit();
                    HttpSession session=request.getSession();  
                    session.setAttribute("user",user.getUserId());
                    response.sendRedirect("home.jsp");
                }else{
                    RequestDispatcher rd = getServletContext().getRequestDispatcher("/registration.jsp");
                    out.println("<div class='error fade show alert alert-warning alert-dismissable'>"
                            +"<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">\n" +
                            "    <span aria-hidden=\"true\">&times;</span>\n" +
                            "  </button>Email already exists"
                            + "</div>");
                    rd.include(request, response);
                }
                
            } catch (IOException ex) {
                Logger.getLogger(registration.class.getName()).log(Level.SEVERE, null, ex);
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/registration.jsp");
                out.println("<div class='error fade show alert alert-warning alert-dismissable'>"
                        +"<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">\n" +
                        "    <span aria-hidden=\"true\">&times;</span>\n" +
                        "  </button>There was a problem try again later"
                        + "</div>");
                rd.include(request, response);
               out.println(ex);
                
            } catch (HeuristicMixedException | HeuristicRollbackException | SecurityException | IllegalStateException ex) {
                Logger.getLogger(registration.class.getName()).log(Level.SEVERE, null, ex);
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
        try {
            processRequest(request, response);
        } catch (NotSupportedException | SystemException | RollbackException ex) {
            Logger.getLogger(registration.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (NotSupportedException | SystemException | RollbackException ex) {
            Logger.getLogger(registration.class.getName()).log(Level.SEVERE, null, ex);
        }
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

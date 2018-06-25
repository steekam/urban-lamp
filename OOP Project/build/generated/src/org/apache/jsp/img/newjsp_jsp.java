package org.apache.jsp.img;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class newjsp_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<!--\n");
      out.write("To change this license header, choose License Headers in Project Properties.\n");
      out.write("To change this template file, choose Tools | Templates\n");
      out.write("and open the template in the editor.\n");
      out.write("-->\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("    <title>Register</title>\n");
      out.write("    <meta charset=\"UTF-8\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"css/registration.css\">\n");
      out.write("    <link type=\"text/css\" href=\"css/navigation-bar.css\" rel=\"stylesheet\"/>\n");
      out.write("    <script type=\"text/javascript\">\n");
      out.write("        \n");
      out.write("        function checkPwd(){\n");
      out.write("            var pwd = document.getElementById('password').value;\n");
      out.write("            var confirmPwd = document.getElementById('confirmPassword').value;\n");
      out.write("            \n");
      out.write("            if(pwd !== confirmPwd)\n");
      out.write("            {\n");
      out.write("                document.getElementById('password').value=\"\";\n");
      out.write("                document.getElementById('confirmPassword').value=\"\";\n");
      out.write("                alert(\"The passwords do not match!\");\n");
      out.write("                \n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            else if(pwd.length<6){\n");
      out.write("                document.getElementById('password').value=\"\";\n");
      out.write("                document.getElementById('confirmPassword').value=\"\";\n");
      out.write("                alert(\"The password is too short!\");\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("        }\n");
      out.write("        \n");
      out.write("    </script>\n");
      out.write("    \n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    \n");
      out.write("    \n");
      out.write("<!--    Navigation bar-->\n");
      out.write("<ul class=\"dropdown\">\n");
      out.write("        <li><a class=\"active\" href=\"home.html\">FEED</a></li>\n");
      out.write("        <li><a href=\"#\">EXPLORE</a></li>\n");
      out.write("        <li><a href=\"#\">MY PROFILE</a></li>\n");
      out.write("        <li><a href=\"#\" class=\"logout\"><span style='font-size: 15px;'>LOGOUT</span></a></li>\n");
      out.write("    </ul>\n");
      out.write("\n");
      out.write("\n");
      out.write("<!--Registration form -->\n");
      out.write("<div class=\"registrationBox\" >\n");
      out.write("    <!--I need a target and probably a method on click()-->\n");
      out.write("\n");
      out.write("    <form id=\"registrationForm\" method=\"POST\" action=\"#\">\n");
      out.write("\n");
      out.write("        <p class=\"heading\">Register</p>\n");
      out.write("        <label for=\"firstname\">First Name</label>\n");
      out.write("        <input type=\"text\" name=\"firstname\" id=\"firstname\" placeholder=\"Enter your first name\" required>\n");
      out.write("        <br>\n");
      out.write("\n");
      out.write("        <label for=\"lastname\">Last Name</label>\n");
      out.write("        <input type=\"text\" name=\"lastname\" id=\"lastname\" placeholder=\"Enter your last name\" required>\n");
      out.write("        <br>\n");
      out.write("\n");
      out.write("        <label for=\"email\">Email</label>\n");
      out.write("        <input type=\"email\" name=\"email\" id=\"email\" placeholder=\"Enter your email\" required>\n");
      out.write("        <br>\n");
      out.write("        \n");
      out.write("        <label for=\"occupation\">Occupation</label>\n");
      out.write("        <input type=\"text\" name=\"occupation\" id=\"occupation\" placeholder=\"What do you do?\" required>\n");
      out.write("        <br>\n");
      out.write("\n");
      out.write("        <label for=\"password\">Password</label>\n");
      out.write("        <input type=\"password\" name=\"password\" id=\"password\" placeholder=\"Enter your password\" required>\n");
      out.write("        <br>\n");
      out.write("\n");
      out.write("        <label for=\"confirmPassword\">Confirm Password</label>\n");
      out.write("        <input type=\"password\" name=\"confirmPassword\" id=\"confirmPassword\" placeholder=\"Retype your password\" required>\n");
      out.write("        <br>\n");
      out.write("\n");
      out.write("        <label>Interests</label>\n");
      out.write("         <input type=\"checkbox\" name=\"interests\" value=\"drawings\">Drawings\n");
      out.write("         <br>\n");
      out.write("        \n");
      out.write("        <input type=\"checkbox\" name=\"interests\" value=\"paintings\">Paintings\n");
      out.write("        <br>\n");
      out.write("        \n");
      out.write("        <input type=\"checkbox\" name=\"interests\" value=\"photography\">Photography\n");
      out.write("        <br>\n");
      out.write("        \n");
      out.write("        <input type=\"checkbox\" name=\"interests\" value=\"graphic_design\">Graphic Design\n");
      out.write("        <br>\n");
      out.write("        \n");
      out.write("        <input type=\"checkbox\" name=\"interests\" value=\"interior_design\">Interior Design    \n");
      out.write("        <br>\n");
      out.write("        \n");
      out.write("        <input type=\"submit\" name=\"submitBtn\" id=\"submitBtn\" value=\"Register\" onclick=\"checkPwd()\"/>\n");
      out.write("\n");
      out.write("    </form>\n");
      out.write("\n");
      out.write("    <p id=\"link\">\n");
      out.write("        <a href=\"login.html\" class=\"linksBelow\">Already have an account? Sign in.</a>\n");
      out.write("    </p>\n");
      out.write("\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("<div class=\"search-text\">\n");
      out.write("    <div class=\"container\">\n");
      out.write("        <div class=\"row text-center\">\n");
      out.write("\n");
      out.write("<!--            <div class=\"form\">\n");
      out.write("                <h4>SIGN UP TO OUR NEWSLETTER</h4>\n");
      out.write("                <form id=\"search-form\" class=\"form-search form-horizontal\">\n");
      out.write("                    <input type=\"text\" class=\"input-search\" placeholder=\"Email Address\">\n");
      out.write("                    <button type=\"submit\" class=\"btn-search\">SUBMIT</button>\n");
      out.write("                </form>\n");
      out.write("            </div>-->\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("<footer>\n");
      out.write("    <div class=\"container\">\n");
      out.write("        <div class=\"row\">\n");
      out.write("            <div class=\"col-md-4 col-sm-6 col-xs-12\">\n");
      out.write("                <ul class=\"menu\">\n");
      out.write("                    <span>Menu</span>\n");
      out.write("                    <li>\n");
      out.write("                        <a href=\"home.html\">Home</a>\n");
      out.write("                    </li>\n");
      out.write("\n");
      out.write("                    <li>\n");
      out.write("                        <a href=\"#\">About</a>\n");
      out.write("                    </li>\n");
      out.write("\n");
      out.write("                    <li>\n");
      out.write("                        <a href=\"#\">Blog</a>\n");
      out.write("                    </li>\n");
      out.write("\n");
      out.write("                    <li>\n");
      out.write("                        <a href=\"#\">Gallery </a>\n");
      out.write("                    </li>\n");
      out.write("                </ul>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"col-md-4 col-sm-6 col-xs-12\">\n");
      out.write("                <ul class=\"address\">\n");
      out.write("                    <span>Contact</span>\n");
      out.write("                    <li>\n");
      out.write("                        <i class=\"fa fa-phone\" aria-hidden=\"true\"></i> <a href=\"#\">Phone</a>\n");
      out.write("                    </li>\n");
      out.write("                    <li>\n");
      out.write("                        <i class=\"fa fa-map-marker\" aria-hidden=\"true\"></i> <a href=\"#\">Adress</a>\n");
      out.write("                    </li>\n");
      out.write("                    <li>\n");
      out.write("                        <i class=\"fa fa-envelope\" aria-hidden=\"true\"></i> <a href=\"#\">Email</a>\n");
      out.write("                    </li>\n");
      out.write("                </ul>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("</footer>\n");
      out.write("</body>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}

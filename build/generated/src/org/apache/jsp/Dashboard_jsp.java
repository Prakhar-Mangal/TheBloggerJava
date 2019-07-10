package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.sql.Connection;

public final class Dashboard_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!doctype html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("  <head>\n");
      out.write("      ");

          String uname=request.getParameter("uname");
      
      out.write("\n");
      out.write("    <!-- Required meta tags -->\n");
      out.write("    <meta charset=\"utf-8\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\n");
      out.write("\n");
      out.write("    <!-- Bootstrap CSS -->\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css\" integrity=\"sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T\" crossorigin=\"anonymous\">\n");
      out.write("\n");
      out.write("    <title>Users</title>\n");
      out.write("    ");

           ResultSet q,a;
           int qi=0,ai=0;
            Class.forName("com.mysql.jdbc.Driver");
            String cs="jdbc:mysql://localhost:3306/blogger?autoReconnect=true&useSSL=false";
            Connection con=(Connection) DriverManager.getConnection(cs,"root","root");
           PreparedStatement ps1=con.prepareStatement("select * from question where uname=?");
            PreparedStatement ps2=con.prepareStatement("select * from answer where uname=?");
          ps1.setString(1, uname);
          ps2.setString(1, uname);
            q=ps1.executeQuery();
            a=ps2.executeQuery();
            while(q.next())
                qi++;
            
            while(a.next())
                ai++;
        
      out.write("\n");
      out.write("  </head>\n");
      out.write("  <body>\n");
      out.write("    \n");
      out.write("  <div class=\"container mt-3\">\n");
      out.write("      <span class=\"badge badge-danger container\"><h2>");
      out.print(uname);
      out.write("</h2></span>\n");
      out.write("  <div class=\"accordion\" id=\"accordionExample\">\n");
      out.write("  <div class=\"card\">\n");
      out.write("    <div class=\"card-header\" id=\"headingOne\">\n");
      out.write("      <h2 class=\"mb-0\">\n");
      out.write("        <button class=\"btn btn-link container\" type=\"button\" data-toggle=\"collapse\" data-target=\"#collapseOne\" aria-expanded=\"false\" aria-controls=\"collapseOne\">\n");
      out.write("          Ask Questions\n");
      out.write("        </button>\n");
      out.write("      </h2>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("    <div id=\"collapseOne\" class=\"collapse\" aria-labelledby=\"headingOne\" data-parent=\"#accordionExample\">\n");
      out.write("      <form action=\"Question\">\n");
      out.write("          <input type=\"hidden\" name=\"uname\" value=");
      out.print(uname);
      out.write("  >\n");
      out.write("  <div class=\"form-group\"> <!-- Question field -->\n");
      out.write("    <textarea class=\"form-control\" cols=\"25\" id=\"message\" name=\"que\" rows=\"10\"></textarea>\n");
      out.write("  </div>\n");
      out.write("  \n");
      out.write("  <div class=\"form-group\">\n");
      out.write("    <button class=\"btn btn-primary container\"  type=\"submit\">Submit</button>\n");
      out.write("  </div>\n");
      out.write("  \n");
      out.write("</form>             \n");
      out.write("    </div>\n");
      out.write("  </div>\n");
      out.write("  <div class=\"card\">\n");
      out.write("    <div class=\"card-header\" id=\"headingTwo\">\n");
      out.write("      <h2 class=\"mb-0\">\n");
      out.write("          <a href=\"QuestionAnswer.jsp?uname=");
      out.print(uname);
      out.write("\"><button class=\"btn btn-link collapsed container\" type=\"button\" data-toggle=\"collapse\" data-target=\"#collapseTwo\" aria-expanded=\"false\" aria-controls=\"collapseTwo\">\n");
      out.write("          Give Answers for Questions\n");
      out.write("            </button></a>\n");
      out.write("      </h2>\n");
      out.write("    </div>\n");
      out.write("    \n");
      out.write("  </div>\n");
      out.write("  <div class=\"card\">\n");
      out.write("    <div class=\"card-header\" id=\"headingThree\">\n");
      out.write("      <h2 class=\"mb-0\">\n");
      out.write("        <a href=\"AnsweredQuestion.jsp?uname=");
      out.print(uname);
      out.write("\"><button class=\"btn btn-link collapsed container\" type=\"button\" data-toggle=\"collapse\" data-target=\"#collapseThree\" aria-expanded=\"false\" aria-controls=\"collapseThree\">\n");
      out.write("          Check your questions here\n");
      out.write("            </button></a>\n");
      out.write("      </h2>\n");
      out.write("    </div>\n");
      out.write("   \n");
      out.write("  </div>\n");
      out.write("          <div class=\"card\">\n");
      out.write("    <div class=\"card-header\" id=\"headingThree\">\n");
      out.write("      <h2 class=\"mb-0\">\n");
      out.write("        <a href=\"AnswersByUsers.jsp?uname=");
      out.print(uname);
      out.write("\"><button class=\"btn btn-link collapsed container\" type=\"button\" data-toggle=\"collapse\" data-target=\"#collapseThree\" aria-expanded=\"false\" aria-controls=\"collapseThree\">\n");
      out.write("          Check Answers given by you\n");
      out.write("            </button></a>\n");
      out.write("      </h2>\n");
      out.write("    </div>\n");
      out.write("   \n");
      out.write("  </div>\n");
      out.write("</div>\n");
      out.write("      <div class=\"card container p-3  bg-warning text-white\" style=\"width: 18rem;\">\n");
      out.write("  <div class=\"card-body\">\n");
      out.write("    <h5 class=\"card-title p-3  bg-success text-white\">");
      out.print(uname);
      out.write("</h5>\n");
      out.write("  </div>\n");
      out.write("  <ul class=\"list-group list-group-flush p-3  bg-warning text-dark\">\n");
      out.write("      <li class=\"list-group-item p-3  bg-dark text-white\">Question Asked : ");
      out.print(qi);
      out.write("</li>\n");
      out.write("    <li class=\"list-group-item p-3  bg-dark text-white\">Answers Given : ");
      out.print(ai);
      out.write("</li>\n");
      out.write("  </ul>\n");
      out.write("  <div class=\"card-body\">\n");
      out.write("    <a href=\"#\" class=\"card-link text-danger\">Click here to see all users</a>\n");
      out.write("  </div>\n");
      out.write("</div>\n");
      out.write("    \n");
      out.write("    \n");
      out.write("  </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("    <!-- Optional JavaScript -->\n");
      out.write("    <!-- jQuery first, then Popper.js, then Bootstrap JS -->\n");
      out.write("    <script src=\"https://code.jquery.com/jquery-3.3.1.slim.min.js\" integrity=\"sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo\" crossorigin=\"anonymous\"></script>\n");
      out.write("    <script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js\" integrity=\"sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1\" crossorigin=\"anonymous\"></script>\n");
      out.write("    <script src=\"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js\" integrity=\"sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM\" crossorigin=\"anonymous\"></script>\n");
      out.write("  </body>\n");
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

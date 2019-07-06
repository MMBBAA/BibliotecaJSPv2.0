package org.apache.jsp.CarpetaObras;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.ArrayList;
import java.util.List;
import Entidades.Obra;
import Utilidades.ValidadorISBN;
import DAO.DAOObra;
import Conexion.DBConnection;

public final class V2formModificarObra2_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      Entidades.Obra obra = null;
      synchronized (_jspx_page_context) {
        obra = (Entidades.Obra) _jspx_page_context.getAttribute("obra", PageContext.PAGE_SCOPE);
        if (obra == null){
          obra = new Entidades.Obra();
          _jspx_page_context.setAttribute("obra", obra, PageContext.PAGE_SCOPE);
        }
      }
      out.write(' ');
      out.write('\n');
      org.apache.jasper.runtime.JspRuntimeLibrary.introspect(_jspx_page_context.findAttribute("obra"), request);
      out.write('\n');
      out.write('\n');

    String message = "";
    String tituloActualizar = "";
    String autorActualizar = "";
    String editorialActualizar = "";
    ValidadorISBN validarISBN=new ValidadorISBN();

    try {
        if (!request.getParameter("ISBN").isEmpty()) {
            
            DAOObra dao = new DAOObra();
            Obra obras = dao.selectByISBN(request.getParameter("ISBN"));
            if (obras == null) {
                message = "no existe ninguna obra con ese ISBN";
            } else {
                
                tituloActualizar = dao.selectByISBN(request.getParameter("ISBN")).getTitulo();
                autorActualizar = dao.selectByISBN(request.getParameter("ISBN")).getAutor();
                editorialActualizar = dao.selectByISBN(request.getParameter("ISBN")).getEditorial();
            }
        } else {
            message = "El ISBN de actualización no puede ser nulo.";
        }
    } catch (Exception ex) {
        message = ex.getMessage();
    }

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>V2formModificarObra2</title>\n");
      out.write("        <link href=\"../css/estilos.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("    </head>\n");
      out.write("    <body>  \n");
      out.write("        <div class=\"titulo\">\n");
      out.write("            <h1>BIBLIOTECA - Modificar datos de obra</h1>\n");
      out.write("            <div id=\"menu\">\n");
      out.write("                <div id=\"opciones\">\n");
      out.write("                    <h2><a href=\"../Menu.jsp\">Menu inicial</a></h2>\n");
      out.write("                    <h2><a href=\"V2formModificarObra.jsp\">Atras</a></h2> \n");
      out.write("                </div>\n");
      out.write("                <form method=\"POST\" action=\"V2formModificarObra3.jsp\">\n");
      out.write("\n");
      out.write("                    <input name=\"updating\" type=\"hidden\" value=\"1\"/>\n");
      out.write("\n");
      out.write("                    ");
if (!message.isEmpty()) {
      out.write("\n");
      out.write("                    <input class=\"mensajes\" name=\"message\" type=\"text\" style=\"width:400px\" value=\"");
      out.print(message);
      out.write("\"/>\n");
      out.write("                    ");
} else {
      out.write("\n");
      out.write("                    <fieldset>\n");
      out.write("                        <legend >Modifique datos de la obra</legend> \n");
      out.write("                        <br/>\n");
      out.write("                        <label for=\"ISBN\" id=\"r1\">ISBN</label><br>\n");
      out.write("                        <input name=\"ISBN\" type=\"text\" style=\"width:200px\" value=\"");
      out.write(org.apache.jasper.runtime.JspRuntimeLibrary.toString((((Entidades.Obra)_jspx_page_context.findAttribute("obra")).getISBN())));
      out.write("\" readonly=\"\"/>\n");
      out.write("                        <br/>\n");
      out.write("                        <label for=\"titulo\" id=\"r1\">titulo</label><br>\n");
      out.write("                        <input name=\"titulo\" type=\"text\" style=\"width:300px\" maxlength=\"50\" required=\"\" placeholder=\"");
      out.print(tituloActualizar);
      out.write("\" value=\"");
      out.print(tituloActualizar);
      out.write("\"/>\n");
      out.write("                        <br/>\n");
      out.write("                        <label for=\"autor\" id=\"r1\">autor</label><br>\n");
      out.write("                        <input name=\"autor\" type=\"text\" style=\"width:300px\" maxlength=\"30\" required=\"\" placeholder=\"");
      out.print(autorActualizar);
      out.write("\" value=\"");
      out.print(autorActualizar);
      out.write("\"/>\n");
      out.write("                        <br/>\n");
      out.write("                        <label for=\"editorial\" id=\"r1\">editorial</label><br>\n");
      out.write("                        <input name=\"editorial\" type=\"text\" style=\"width:300px\" maxlength=\"30\" required=\"\" placeholder=\"");
      out.print(editorialActualizar);
      out.write("\" value=\"");
      out.print(editorialActualizar);
      out.write("\"/>\n");
      out.write("                        <br/><br/>\n");
      out.write("                        <input type=\"submit\" class=\"boton_final\" value=\"Actualizar\"/>\n");
      out.write("                        ");
}
      out.write("\n");
      out.write("                    </fieldset>\n");
      out.write("                </form>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>");
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

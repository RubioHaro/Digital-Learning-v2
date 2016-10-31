<%-- 
    Document   : cargarmensajes
    Created on : 17/05/2016, 09:13:04 PM
    Author     : Rod
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="DCLPackage.BDD.CdeForo"%>
<%@page import="DCLPackage.BDD.Usuario"%>
<%@page import="DCLPackage.BDD.DataBase"%>
<%@page import="DCLPackage.ForoSRC.mensajesforo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
           HttpSession sesion = request.getSession(true);
            Usuario UsuarioIns = (Usuario) sesion.getAttribute("Usuario");
            if (UsuarioIns != null) {
                Integer IdUs = UsuarioIns.getId();
                if (IdUs == null) {
                    out.println("<script>aler('PORFAVOR INICIA SESION')</script>");
                    response.sendRedirect("index.html");
                }
            } else {
                out.println("<script>aler('PORFAVOR INICIA SESION')</script>");
                response.sendRedirect("../index.html");
            }
            CdeForo forito = (CdeForo) sesion.getAttribute("IdForoDesplegado");
            int IforoR = forito.getID();
            String Nombre = forito.getNombre();
            String Tema = forito.getTema();
            out.println("<input type='hidden' name='IdForo' value='" + IforoR + "'>");
            for (mensajesforo DatabaseJavasInstancia : new DataBase().DesplegarMensajes(IforoR)) {
                String PasswordRootDb = "DLDB";        
                String Nombrecito="";
                try {
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dldb", "root", "n0m3l0");
                    Statement Estamento = con.createStatement();
                    String querystring = "SELECT * FROM DLDB.usuario WHERE IdUsuario=\"" + DatabaseJavasInstancia.getIdUsuario() + "\"";
                    ResultSet result = Estamento.executeQuery(querystring);                    
                    if (result.next()) {
                        Nombrecito = result.getString("Nombre");
                        //out.println("<script> ocultar() </script>");
                        result.close();
                        Estamento.close();
                        con.close();
                    } 
                } catch (SQLException error) {
                    out.println("<script>alert('ERROR: " + error.toString() + "')</script>");
                    out.println("<META HTTP-EQUIV='REFRESH' CONTENT='0.0000001; URL=http://localhost:8080/DIGITAL%20CLOUD%20PROGRAM%20V1/DOCENTE/Bienvenida.jsp'/>");
                } catch (Exception e) {
                    out.println("<script>alert('ERROR: " + e.getLocalizedMessage() + "')</script>");
                    out.println("<META HTTP-EQUIV='REFRESH' CONTENT='0.0000001; URL=http://localhost:8080/DIGITAL%20CLOUD%20PROGRAM%20V1/DOCENTE/Bienvenida.jsp'/>");
                    e.printStackTrace();
                }
                if(Nombrecito!="")
                {
                    out.println("<b>"+ Nombrecito +"   (" + DatabaseJavasInstancia.getIdUsuario() + "):</b> " + DatabaseJavasInstancia.getMensaje() + "<br><hr>");
                }
                else
                {
                    out.println("<b>   (" + DatabaseJavasInstancia.getIdUsuario() + "):</b> " + DatabaseJavasInstancia.getMensaje() + "<br><hr>");
                }                
            }
        %>
    </body>
</html>

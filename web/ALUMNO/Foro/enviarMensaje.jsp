<%-- 
    Document   : enviarMensaje.jsp
    Created on : 18/05/2016, 12:37:01 AM
    Author     : Rod
--%>

<%@page import="DCLPackage.BDD.DataBase"%>
<%@page import="DCLPackage.ForoSRC.mensajesforo"%>
<%@page import="DCLPackage.BDD.CdeForo"%>
<%@page import="DCLPackage.BDD.Usuario"%>
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
                    out.println("<script>alert('PORFAVOR INICIA SESION')</script>");
                    response.sendRedirect("../index.html");
                }
            } else {
                out.println("<script>alert('PORFAVOR INICIA SESION')</script>");
                response.sendRedirect("../index.html");
            }
            String Nombre,Tema;
            int IdForo;
            CdeForo forito = new CdeForo();
            forito = (CdeForo) sesion.getAttribute("IdForoDesplegado");
            IdForo = forito.getID();
            Nombre = forito.getNombre();
            Tema = forito.getTema();
            
            int id =UsuarioIns.getId();
            String Mensaje =request.getParameter("Mensaje");
            mensajesforo mensaje = new mensajesforo();
            mensaje.setIdForo(IdForo);
            mensaje.setIdUsuario(id);
            mensaje.setMensaje(Mensaje);
            
            DataBase basesita = new DataBase();
            int numelo =basesita.agregarMensajeForo(mensaje);
            //sesion.removeAttribute("IdForoDesplegado");
            
            out.println("<META HTTP-EQUIV='REFRESH' CONTENT='0.0000001; URL=http://localhost:8080/DIGITAL%20CLOUD%20PROGRAM%20V1/ALUMNO/Foro/ForoPost.jsp'/>");
            

        %>
    </body>
</html>

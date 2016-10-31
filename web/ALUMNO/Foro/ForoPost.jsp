<%-- 
    Document   : ForoPost
    Created on : 17/05/2016, 08:12:46 PM
    Author     : Rod
--%>


<%@page import="DCLPackage.BDD.CdeForo"%>
<%@page import="DCLPackage.BDD.DataBase"%>
<%@page import="DCLPackage.ForoSRC.mensajesforo"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page import="DCLPackage.BDD.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="../../css.css"/>
        <link rel="icon" type="image/png" href="../../favicon.png" />
        <script src="../FunctionsBase.js"></script>
        <script src="../../jquery.js" type="text/javascript"></script>
    </head>
    <body class="PageContentCentralAlign" style="height: 100vh; width: 100%">
        <%@page import="java.io.*"%>
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

            CdeForo forito = new CdeForo();
            String Nombre, Tema;
            int IdForo;
            if (sesion.getAttribute("IdForoDesplegado") != null) {
                forito = (CdeForo) sesion.getAttribute("IdForoDesplegado");
                IdForo = forito.getID();
                Nombre = forito.getNombre();
                Tema = forito.getTema();
            } else {
                IdForo = Integer.parseInt(request.getParameter("IdForo"));
                Nombre = request.getParameter("NombreForo");
                Tema = request.getParameter("TemaForo");
            }

        %>
        <a class="letras">Foro:<%out.println(Nombre);%></a>
        <br>
        <a class="letras">Tema:<%out.println(Tema);%></a>
        <div>
            <iframe id="Foro" style="height: 40vh; width: 40%; overflow:  auto" src="cargarmensajes.jsp">

            </iframe>
        </div>
        <%
            forito.setID(IdForo);
            forito.setNombre(Nombre);
            forito.setTema(Tema);
            sesion.setAttribute("IdForoDesplegado", forito);
        %>
        <div>
            <form action="enviarMensaje.jsp" method="post">
                <textarea required  name="Mensaje"  class="cuadritosv1"  title="Comentario" style="resize: none; width: 500px; height: 100px; "  rows="3" cols="30" placeholder="COMENTAR..."></textarea>
                <br>
                <input type="submit" class="botoncito" title="Enviar" value="Comentar">
            </form>
            <a href="ForoPost.jsp"><input type="button" class="botoncitoColor2" title="Actualizar" value="Actualizar"/></a>
        </div>
    </body>
</html>

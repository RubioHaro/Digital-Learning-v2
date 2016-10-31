<%-- 
    Document   : BUSCARA
    Created on : 11/05/2016, 07:48:47 PM
    Author     : Rod
--%>

<%@page import="DCLPackage.BDD.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BUSCAR</title>
        <link rel="stylesheet" type="text/css" href="../css.css"/>
        <link rel="icon" type="image/png" href="../favicon.png" />
        <script src="FunctionsBase.js"></script>
    </head>
    <body class="PageContentCentralAlign">
        <%@page import=" java.sql.*, java.io.*"%>
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
        %>
        <div>
            <form action="consultar.jsp" method="post">
                <br><br>
                <a class="letras">Nombre de Usuario:</a>
                <input type="text" required name="USUARIO"  placeholder="IDUSUARIO O BOLETA" autocomplete="off" id="USUARIO" class="cuadritosv1">
                
                <input type="submit" class="botoncito" Value="Buscar">
            </form>
        </div>
    </body>
</html>

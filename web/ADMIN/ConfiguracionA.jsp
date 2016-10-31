<%-- 
    Document   : ConfiguracionA
    Created on : 11/05/2016, 12:30:45 PM
    Author     : Alumno
--%>

<%@page import="DCLPackage.BDD.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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

            Usuario User = new Usuario();
            User = (Usuario) sesion.getAttribute("Usuario");

            int IdUsuario = User.getId();
            int Edad = User.getEdad();
            String Nombre = User.getNombre();
            String Apellidos = User.getApellidos();
            String Tipo = User.getType();
            String Sexo = User.getSexo();
            String pass = User.getPass();
            String grup = User.getGrupo();
            out.println("<form action='cambios_1.jsp' method='post' name='cambios'>");
            out.println("<a class='letras'>Modificando:"+IdUsuario+"</a>");
            out.println("<input type='text' name='id'" + IdUsuario + "' style='display:none'>");
            out.println("<br><br>");
            out.println("Nombre:");
            out.println("<input type='text' class='cuadritosv2' name='nombre' placeholder='Nombre'  style='border-radius: 10px;' value='" + Nombre + "'>");
            out.println("<br><br>");
            out.println("Apellido:");
            out.println("<input type='text' class='cuadritosv2' name='apell' placeholder='Apellidos' style='border-radius: 10px;' value='" + Apellidos + "'>");
            out.println("<br><br>");
            out.println("Contraseña:");
            out.println("<input type='password' class='cuadritosv2' placeholder='PASSWORD' style='border-radius: 10px;' value='" + pass + "' name='contra'>");
            out.println("<br><br>");

            if (Sexo.equals("M")) {
                out.println("Sexo: <br>");
                out.println("<input type='radio' name='sexi' value='M' checked>Hombre");
                out.println("<input type='radio' name='sexi' value='F'>Mujer<br>");
            }
            if (Sexo.equals("F")) {
                out.println("Sexo: <br>");
                out.println("<input type='radio' name='sexi' value='M'>Hombre");
                out.println("<input type='radio' name='sexi' value='F' checked>Mujer<br>");
            }
            out.println("<br>");
            out.println("Edad:");
            out.println("<input type='number' class='cuadritosv2' name='edad' style='border-radius: 10px;' value='" + Edad + "'>");
            out.println("<br><br>");
            out.println("<input type='submit' class='botoncito' name='cambios' value='cambios'>");
            out.println("</form>");

        %> 
    </body>
</html>

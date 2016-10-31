<%-- 
    Document   : CONSULTAS
    Created on : 21/04/2016, 07:02:38 PM
    Author     : User
--%>
<%@page import="DCLPackage.BDD.Conexion"%>
<%@page import="DCLPackage.BDD.BDD"%>
<%@page import="DCLPackage.BDD.Sentencia"%>
<%@page import="DCLPackage.BDD.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CONSULTAS</title>
        <link rel="stylesheet" type="text/css" href=".../css.css"/>
        <link rel="icon" type="image/png" href=".../favicon.png" />
        <script src="FunctionsBase.js"></script>
    </head>
    <body class="PageContentCentralAlign">
        <%@page import="java.io.*"%>
        <%
            Integer IdUs=0;
            HttpSession sesion = request.getSession(true);
            Usuario UsuarioIns = (Usuario) sesion.getAttribute("Usuario");
            if (UsuarioIns != null) {
                IdUs = UsuarioIns.getId();
                if (IdUs == null) {
                    out.println("<script>aler('PORFAVOR INICIA SESION')</script>");
                    response.sendRedirect("index.html");
                }
            } else {
                out.println("<script>aler('PORFAVOR INICIA SESION')</script>");
                response.sendRedirect("../index.html");
            }
        %>
        <div >
            <form action="Borrar.jsp" method="post">
                <%@page import=" java.sql.*, java.io.*"%>
                <%
                    String IdUsuarioString = request.getParameter("USUARIO");
                    int IdUsuario = Integer.parseInt(IdUsuarioString);
                    try {
                        Sentencia Sentencita = new Sentencia();
                        int EstatusDeInicio = Sentencita.IniciarSentencia();
                        if (EstatusDeInicio == 1) {
                            Usuario UsuarioConsultado = Sentencita.ConsultarUsuario(IdUsuario);

                            if (UsuarioConsultado == null) {
                                out.println("El usuario no fue encontrado");
                            } else {
                                String Nombre, Apellidos, ApeM, Pass, Tipo, Sexo;
                                int Edad = 1, Id;
                                Id = UsuarioConsultado.getId();

                                if (Id == IdUs) {
                                    out.println("<META HTTP-EQUIV='REFRESH' CONTENT='0.0000001; URL=http://localhost:8080/DIGITAL%20CLOUD%20PROGRAM%20V1/ADMIN/ConfiguracionA.jsp'/>");
                                } else {

                                    Nombre = UsuarioConsultado.getNombre();
                                    Apellidos = UsuarioConsultado.getApellidos();
                                    //Pass = UsuarioConsultado.getPass();
                                    Tipo = UsuarioConsultado.getType();
                                    Sexo = UsuarioConsultado.getSexo();
                                    Edad = UsuarioConsultado.getEdad();

                                    out.println("<input type='text' name='USUARIOR' id='USUARIOR' style=\"display: none\">");
                                    out.println("<script> document.getElementById('USUARIOR').value='" + IdUsuario + "' </script>");
                                    out.println("<br> Id de Usuario: " + Id + "</P>");
                                    out.println("<p> Nombre: " + Nombre + "</P>");
                                    out.println("<P> Apellidos: " + Apellidos + "</P>");
                                    //out.println("<P> Contraseña: " + Pass + "</P>");
                                    out.println("<P> Tipo: " + Tipo + "</P>");
                                    out.println("<P> Sexo: " + Sexo + "</P>");
                                    out.println("<P> Edad: " + Edad + "</P>");
                                }
                            }
                        } else {
                            out.println("No se a podido establecer la conexion");
                        }
                        int EstatusCloseSentences=Sentencita.CerrarSentencia();
                        if(EstatusCloseSentences!=1){
                            out.println("<h3 style='color:red;'>Error: No se han cerrado las conexiones</h3>");
                        }
                    } catch (Error e) {
                        out.println(e.toString());
                        out.println("Error en la consulta");
                    } catch (Exception i) {
                        out.println(i.toString());
                        out.println("Error Logico");
                    }                                        
                %>
                <br>
                <input type="submit" name="Submit" value="Borrar" onclick="return borrar()">
                <input type="submit" name="Submit" value="Modificar">
            </form>
        </div>
    </body>
</html>

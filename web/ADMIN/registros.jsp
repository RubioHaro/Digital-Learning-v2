<%-- 
    Document   : registros
    Created on : 1/04/2016, 07:20:32 AM
    Author     : Alumno
--%>
<%@page import="DCLPackage.BDD.Sentencia"%>
<%@page import="DCLPackage.BDD.ValidadorRegistro"%>
<%@page import="DCLPackage.BDD.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>REGISTROS</title>
    </head>
    <body>
        <div>
            <%@page import=" java.sql.*, java.io.*"%>
            <%
                String LocalHost = "localhost:8080";                
                String urlIngresar = "http://" + LocalHost + "/DIGITAL%20CLOUD%20PROGRAM%20V1/ADMIN/AGREGARA.jsp";
                String urlAdminPrincipal = "http://" + LocalHost + "/DIGITAL%20CLOUD%20PROGRAM%20V1/ADMIN/PRINCIPALA.jsp";              
                
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

                String Edad1 = request.getParameter("EDAD");
                int Edad = 0;
                if (Edad1 == "") {
                    Edad = 0;
                } else {
                    Edad = Integer.parseInt(request.getParameter("EDAD"));
                }
                String Type = request.getParameter("TIPOUSUARIO");
                int id = 1;
                String Sexo = request.getParameter("SEXO");
                String Nombre = request.getParameter("USUARIO");
                String Apellidos = request.getParameter("APEL");
                String Pass = request.getParameter("PASSWORD");
                String Grupo = request.getParameter("Grupos");

                ValidadorRegistro Validacion = new ValidadorRegistro(Nombre, Apellidos, Pass, Type, Sexo, Edad, Grupo);
                boolean condicion = Validacion.ValidarTodo();
                if (condicion) {
                    try {
                        Sentencia Sentencita = new Sentencia();
                        int EstatusDeInicio = Sentencita.IniciarSentencia();
                        if (EstatusDeInicio == 1) {
                            String estatusUsuarioInsertado = Sentencita.InsertarUsuario(Nombre, Apellidos, Pass, Type, Sexo, Edad, Grupo); 
                            out.println(estatusUsuarioInsertado);
                            
                        } else {
                            out.println("No se a podido establecer la conexion");
                        }
                        int EstatusCloseSentences = Sentencita.CerrarSentencia();
                        if (EstatusCloseSentences != 1) {
                            out.println("<h3 style='color:red;'>Error: No se han cerrado las conexiones</h3>");
                        }
                    } catch (Error e) {
                        out.println(e.toString());
                        out.println("Error en la operacion con la Base de Datos");
                    } catch (Exception i) {
                        out.println(i.toString());
                        out.println("Error Logico");
                    }
                }
                out.println("<META HTTP-EQUIV='REFRESH' CONTENT='2.0000001; URL=" + urlIngresar + "'/>");

            %>
            <br>
        </div>
    </body>
</html>

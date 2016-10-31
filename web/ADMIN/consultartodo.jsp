<%-- 
    Document   : consultartodo
    Created on : 21/04/2016, 11:07:24 PM
    Author     : Rod
--%>

<%@page import="DCLPackage.BDD.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CONSULTAR TODO</title>
    </head>
    <body>
        <div style="width: 400px; height: 300px; overflow: auto ">
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

                String PasswordRootDb = "DLDB";
                String NombreB = request.getParameter("USUARIO");
                try {
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dldb", "root", "n0m3l0");
                    Statement Estamento = con.createStatement();
                    String querystring = "SELECT * FROM DLDB.usuario WHERE Nombre=\"" + NombreB + "\"";
                    ResultSet result = Estamento.executeQuery(querystring);
                    String Id, Nombre, Apellidos, ApeM, Pass, Tipo, Sexo;
                    int Edad;
                    while (result.next()) {
                        Id = result.getString("IdUsuario");
                        Nombre = result.getString("Nombre");
                        Apellidos = result.getString("Apellidos");
                        Pass = result.getString("Contraseña");
                        Tipo = result.getString("Tipo");
                        Sexo = result.getString("Sexo");
                        Edad = result.getInt("Edad");
                        out.println("<script> document.getElementById(\"cuadro\").value=\"" + Nombre + "\"</script>");
                        out.println("<br> Nombre: " + Nombre);
                        out.println("<P> Apellidos: " + Apellidos + "</P>");
                        out.println("<P> Contraseña: " + Pass + "</P>");
                        out.println("<P> Tipo: " + Tipo + "</P>");
                        out.println("<P> Sexo: " + Sexo + "</P>");
                        out.println("<P> Edad: " + Edad + "</P>");
                        //out.println("<script> ocultar() </script>");
                        result.close();
                        Estamento.close();
                        con.close();
                    }
                } catch (SQLException error) {
                    out.println("<script>alert('ERROR: " + error.toString() + "')</script>");
                    out.println("<META HTTP-EQUIV='REFRESH' CONTENT='0.0000001; URL=http://localhost:8080/DIGITAL_CLOUD_PROGRAM_V1/ADMIN/AGREGARA.html'/>");

                } catch (Exception e) {
                    out.println("<script>alert('ERROR: " + e.getLocalizedMessage() + "')</script>");
                    out.println("<META HTTP-EQUIV='REFRESH' CONTENT='0.0000001; URL=http://localhost:8080/DIGITAL_CLOUD_PROGRAM_V1/ADMIN/AGREGARA.html'/>");

                    e.printStackTrace();
                }
            %>
        </div>
    </body>
</html>

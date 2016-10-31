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
    <body>
        <div >
            <form action="Borrar.jsp" method="post">
                <%@page import=" java.sql.*, java.io.*"%>
                <%
                    //VALIDACION DE SESION
                    HttpSession sesion = request.getSession();
                    if (sesion == null) {
                        out.println("<script>alert('PORFAVOR INICIA SESION')</script>");
                        response.sendRedirect("index.html");
                    }

                    Usuario ui = (Usuario) sesion.getAttribute("Usuario");
                    
                    String TipU = ui.getType();
                    
                    if (TipU.equals("Alumno")) {
                        String PasswordRootDb = "DLDB";
                        String NombreB = request.getParameter("USUARIO");
                        try {
                            Class.forName("com.mysql.jdbc.Driver").newInstance();
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dldb", "root", "n0m3l0");
                            Statement Estamento = con.createStatement();
                            String querystring = "SELECT * FROM DLDB.usuario WHERE IdUsuario=\"" + NombreB + "\"";
                            ResultSet result = Estamento.executeQuery(querystring);
                            String Id, Nombre, Apellidos, ApeM, Pass, Tipo, Sexo;
                            int Edad;
                            if (result.next()) {
                                Id = result.getString("IdUsuario");
                                Nombre = result.getString("Nombre");
                                Apellidos = result.getString("Apellidos");
                                Pass = result.getString("Contraseña");
                                Tipo = result.getString("Tipo");
                                Sexo = result.getString("Sexo");
                                Edad = result.getInt("Edad");

                                if (Tipo.equals("Administrador")) {
                                    out.println("<script>alert('Este usuario no se puede consultar')</script>");
                                    out.println("<META HTTP-EQUIV='REFRESH' CONTENT='0.0000001; URL=http://localhost:8080/DIGITAL_CLOUD_PROGRAM_V1/DOCENTE/BUSCARD.html'/>");
                                    out.println("</form>");
                                } else {
                                    out.println("<input type='text' name='USUARIOR' id='USUARIOR' style=\"display: none\">");
                                    out.println("<script> document.getElementById('USUARIOR').value='" + NombreB + "' </script>");
                                    out.println("<br> Nombre: " + Nombre);
                                    out.println("<P> Apellidos: " + Apellidos + "</P>");
                                    out.println("<P> Tipo: " + Tipo + "</P>");
                                    out.println("<P> Sexo: " + Sexo + "</P>");
                                    out.println("<P> Edad: " + Edad + "</P>");
                                    //out.println("<script> ocultar() </script>");
                                    result.close();
                                    Estamento.close();
                                    con.close();
                                }
                            } else {
                                out.println("<script>alert('EL USUARIO NO FUE ENCONTRADO')</script>");
                                out.println("<META HTTP-EQUIV='REFRESH' CONTENT='0.0000001; URL=http://localhost:8080/DIGITAL_CLOUD_PROGRAM_V1/DOCENTE/BUSCARD.html'/>");
                                result.close();
                                Estamento.close();
                                con.close();
                            }

                        } catch (SQLException error) {
                            out.println("<script>alert('ERROR: " + error.toString() + "')</script>");
                            out.println("<META HTTP-EQUIV='REFRESH' CONTENT='0.0000001; URL=http://localhost:8080/DIGITAL%20CLOUD%20PROGRAM%20V1/ADMIN/BUSCARA.html'/>");

                        } catch (Exception e) {
                            out.println("<script>alert('ERROR: " + e.getLocalizedMessage() + "')</script>");
                            out.println("<META HTTP-EQUIV='REFRESH' CONTENT='0.0000001; URL=http://localhost:8080/DIGITAL%20CLOUD%20PROGRAM%20V1/ADMIN/BUSCARA.html'/>");
                            e.printStackTrace();
                        }
                    } else {
                        out.println("<script>alert('NOSEKIERAPASARDEBERGASHABO')</script>");
                        out.println("<META HTTP-EQUIV='REFRESH' CONTENT='0.0000001; URL=http://localhost:8080/DIGITAL_CLOUD_PROGRAM_V1/ALUMNO/.../ALUMNO/.../ALUMNO/.../index.html'/>");
                        sesion.invalidate();
                    }
                %>
            </form>
        </div>
    </body>
</html>


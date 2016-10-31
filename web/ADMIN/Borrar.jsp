<%@page import="DCLPackage.BDD.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BORRANDO</title>
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
                    response.sendRedirect("../index.html");
                }
            } else {
                out.println("<script>aler('PORFAVOR INICIA SESION')</script>");
                response.sendRedirect("../index.html");
            }
        
            String BotonSubmit = request.getParameter("Submit");
            out.println(BotonSubmit+':');
            Connection con = null;
            Statement est = null;
            ResultSet rs = null;
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dldb", "root", "n0m3l0");
                est = con.createStatement();
            } catch (SQLException error) {
                out.println(error.toString());
            }
            String NombreB = request.getParameter("USUARIOR");
            out.println(NombreB);

            if (BotonSubmit.equals("Borrar")) {
                String querystring = "DELETE FROM DLDB.Usuario WHERE IdUsuario=\"" + NombreB + "\"";
                String querystring2 = "SELECT * FROM DLDB.Usuario WHERE IdUsuario=\"" + NombreB + "\"";
                rs = est.executeQuery(querystring2);
                if (!rs.next()) {
                    out.println("<script>alert('El usuario no existe (Logic Database Error)')</script>");
                    out.println("<META HTTP-EQUIV='REFRESH' CONTENT='0.0000001; URL=http://localhost:8080/DIGITAL%20CLOUD%20PROGRAM%20V1/ADMIN/BUSCARA.jsp'/>");
                } else {
                    try {
                        est.executeUpdate(querystring);
                        out.println("<script>alert('El usuario a sido eliminado')</script>");
                        out.println("<META HTTP-EQUIV='REFRESH' CONTENT='0.0000001; URL=http://localhost:8080/DIGITAL%20CLOUD%20PROGRAM%20V1/ADMIN/BUSCARA.jsp'/>");
                    } catch (SQLException error) {
                        out.println(error.toString());
                    }
                }
            }
            if (BotonSubmit.equals("Modificar")) {
                String querystring2 = "SELECT * FROM DLDB.Usuario WHERE IdUsuario=\"" + NombreB + "\"";
                rs = est.executeQuery(querystring2);
                if (rs.next()) {
                    try {
                        String querystring = "SELECT * FROM DLDB.usuario WHERE IdUsuario=\"" + NombreB + "\"";
                        String aidi = rs.getString("idUsuario");
                        String nom = rs.getString("Nombre");
                        String ape = rs.getString("Apellidos");
                        String cont = rs.getString("Contraseña");
                        String tip = rs.getString("Tipo");
                        String sex = rs.getString("Sexo");
                        String edas = rs.getString("Edad");
                        String grup = rs.getString("Grupo");
                        out.println("<form action='cambios.jsp' method='post' name='cambios'>");
                        out.println("<input type='text' name='id' value='" + aidi + "' style='display: none'>");
                        out.println("<br><br>");
                        out.println("Nombre:");
                        out.println("<input type='text' name='nombre' value='" + nom + "'>");
                        out.println("<br><br>");
                        out.println("Apellido:");
                        out.println("<input type='text' name='apell' value='" + ape + "'>");
                        out.println("<br><br>");
                        out.println("Contraseña:");
                        out.println("<input type='text' name='contra' value='" + cont + "'>");
                        out.println("<br><br>");
                        out.println("Tipo:");
                        if (tip.equals("Alumno")) {
                            out.println("<select name='tipo'>");
                            out.println("<option SELECTED value='Alumno'>Alumno</option>");
                            out.println("<option value='Docente'>Docente</option>");
                            out.println("<option value='Administrador'>Administrador</option></select>");
                        }
                        if (tip.equals("Docente")) {
                            out.println("<select name='tipo'>");
                            out.println("<option value='Alumno'>Alumno</option>");
                            out.println("<option SELECTED value='Docente'>Docente</option>");
                            out.println("<option value='Administrador'>Administrador</option></select>");
                        }
                        if (tip.equals("Administrador")) {
                            out.println("<select name='tipo'>");
                            out.println("<option value='Alumno'>Alumno</option>");
                            out.println("<option value='Docente'>Docente</option>");
                            out.println("<option SELECTED value='Administrador'>Administrador</option></select>");
                        }
                        out.println("<br><br>");
                        
                        if (sex.equals("M")) {
                            out.println("Sexo: <br>");
                            out.println("<input type='radio' name='sexi' value='M' checked>Hombre");
                            out.println("<input type='radio' name='sexi' value='F'>Mujer<br>");
                        }
                        if (sex.equals("F")) {
                            out.println("Sexo: <br>");
                            out.println("<input type='radio' name='sexi' value='M'>Hombre");
                            out.println("<input type='radio' name='sexi' value='F' checked>Mujer<br>");
                        }
                        out.println("<br>");
                        out.println("Edad:");
                        out.println("<input type='number' name='edad' value='" + edas + "'>");
                        out.println("<br><br>");

                        String DATABASE = "dldb";
                        String PasswordRootDb = "n0m3l0";
                        out.println("Grupo:<select required name='Grupos' id='Grupos'><option selected disabled>Selecciona una opcion</option></select>");

                        try {
                            Class.forName("com.mysql.jdbc.Driver").newInstance();
                            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + DATABASE, "root", PasswordRootDb);
                            String querystringGrupos = "SELECT IdGrupo FROM dldb.grupos;";
                            Statement Estamento = con.createStatement();
                            ResultSet result = Estamento.executeQuery(querystringGrupos);
                            String Group;
                            int i = 0;

                            while (result.next()) {
                                Group = result.getString("IdGrupo");
                                if (Group.equals("")) {

                                } 
                                else
                                {
                                    if (Group.equals(grup)) {
                                        out.println("<script>agregar('" + Group + "')</script>");
                                        out.println("<script>seleccionar('" + Group + "')</script>");
                                    } 
                                    else
                                    {
                                        out.println("<script>agregar('" + Group + "')</script>");
                                    }
                                }
                            }
                        } catch (SQLException error) {
                            out.println(error.toString());
                        } catch (Exception e) {
                            out.println(e.getLocalizedMessage());
                            e.printStackTrace();
                        }
                        out.println("<br><br>");
                        out.println("<input type='submit' name='cambios' value='cambios'>");
                        out.println("</form>");
                    } catch (SQLException error) {
                        out.print(error.toString());
                    }
                } else {
                    out.println("<script>alert('El usuario no existe (Logic Database Error)')</script>");
                }
            }

        %> 

    </body>
</html>
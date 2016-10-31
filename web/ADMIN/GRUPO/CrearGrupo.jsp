<%-- 
    Document   : CrearForo
    Created on : 5/05/2016, 06:29:41 PM
    Author     : Rod
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crear Grupo</title>
    </head>
    <body>
        <%@page import=" java.sql.*, java.io.*"%>
        <%
            String Semestre = request.getParameter("Semestre");
            String turno = request.getParameter("Turno");
            String Ramas = request.getParameter("Ramas");
            String NGrupo = request.getParameter("Grupo");
            //que no lleguen vacios\\
            if (Semestre != null){
                if (turno != null){
                    if (Ramas != null){
                        if(NGrupo != null){
                            String Grupo = Semestre + Ramas +  turno+ NGrupo;
                            String DATABASE = "dldb";
                            String PasswordRootDb = "DLDB";
                            
                            //Variables de conexion\\
                            Connection con = null;
                            //Statement stm = null;\\
                            PreparedStatement pstatement = null;
                            try {
                                Class.forName("com.mysql.jdbc.Driver").newInstance();
                                con = DriverManager.getConnection("jdbc:mysql://192.168.5.91", "DigitalCloud", PasswordRootDb);
                                String querystring = "CALL CrearGrupo(?,?,?,?)";
                                pstatement = con.prepareStatement(querystring);
                                pstatement.setString(1, Semestre);
                                pstatement.setString(2, Ramas);
                                pstatement.setString(3, turno);
                                pstatement.setString(4, NGrupo);
                                pstatement.executeUpdate();
                                out.println("<script>alert('Se ha creado: " + Grupo +" ')</script>");
                                out.println("<META HTTP-EQUIV='REFRESH' CONTENT='0.0000001; URL=http://localhost:8080/DIGITAL%20CLOUD%20PROGRAM%20V1/ADMIN/GRUPO/GruposFunOc.jsp'/>");
                            } catch (SQLException error) {
                                out.println("Database Error:");
                                out.println(error.toString());
                                out.println("<script>alert('EL GRUPO YA EXISTE')</script>");
                                out.println("<META HTTP-EQUIV='REFRESH' CONTENT='0.0000001; URL=http://localhost:8080/DIGITAL%20CLOUD%20PROGRAM%20V1/ADMIN/GRUPO/GruposFunOc.jsp'/>");
                            } catch (Exception e) {
                                out.println(e.getLocalizedMessage());
                                e.printStackTrace();
                            }
                        }
                    }
                }
            }
        %>
    </body>
</html>

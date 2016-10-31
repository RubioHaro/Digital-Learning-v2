<%@page import="DCLPackage.BDD.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@page import=" java.sql.*, java.io.*"%>
        <%
            HttpSession sesion = request.getSession(true);
            Usuario UsuarioIns = (Usuario) sesion.getAttribute("Usuario");
            if (UsuarioIns != null) {
                Integer IdUs = UsuarioIns.getId();
                if (IdUs == null) {
                    out.println("<script>alert('PORFAVOR INICIA SESION')</script>");
                    response.sendRedirect("index.html");
                }
            } else {
                out.println("<script>alert('PORFAVOR INICIA SESION')</script>");
                response.sendRedirect("../index.html");
            }

            Connection c = null;
            Statement s = null;
            ResultSet r = null;

            int ID = Integer.parseInt(request.getParameter("id"));
            String nombre = request.getParameter("nombre");
            String apellidos = request.getParameter("apell");
            String contraseña = request.getParameter("contra");
            String tipo = request.getParameter("tipo");
            String sexo = request.getParameter("sexi");
            int edad = Integer.parseInt(request.getParameter("edad"));
            String grupo = request.getParameter("Grupos");

            Usuario usersito = new Usuario();
            usersito.setId(ID);
            usersito.setNombre(nombre);
            usersito.setApellidos(apellidos);
            usersito.setPass(contraseña);
            usersito.setType(tipo);
            usersito.setSexo(sexo);
            usersito.setEdad(edad);
            usersito.setGrupo(grupo);

            String user = "root";
            String password = "n0m3l0'";
            String host = "localhost";
            String db = "DLDB";
            String url = "jdbc:mysql://" + host + "/" + db;

            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                c = DriverManager.getConnection("jdbc:mysql://localhost:3306/dldb", "root", "n0m3l0");
                s = c.createStatement();
            } catch (SQLException error) {
                out.println(error.toString());
            }
            try {
                Integer IdUs = UsuarioIns.getId();
                if (ID == IdUs) {
                    sesion.setAttribute("Usuario", usersito);
                }

                s.executeUpdate("update Usuario set nombre='" + nombre + "', apellidos='" + apellidos + "', contraseña='" + contraseña + "', tipo='" + tipo + "', grupo='" + grupo + "', edad='" + edad + "', sexo='" + sexo + "' where idUsuario='" + ID + "'");
                out.println("<script>alert('cambios realizados con exito')</script>");
                out.println("<META HTTP-EQUIV='REFRESH' CONTENT='0.0000001; URL=http://localhost:8080/DIGITAL%20CLOUD%20PROGRAM%20V1/ADMIN/Bienvenida.jsp'/>");
            } catch (SQLException error) {
                out.print(error.toString());
            }
        %>
    </body>
</html>

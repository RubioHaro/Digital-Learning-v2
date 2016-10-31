<%-- 
    Document   : FOROD
    Created on : 15/05/2016, 06:17:03 PM
    Author     : Rod
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="DCLPackage.BDD.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>foro</title>
        <link rel="stylesheet" type="text/css" href="../css.css"/>
        <link rel="icon" type="image/png" href=".../favicon.png" />
        <script src="FunctionsBase.js"></script>
        <script src="../jquery.js" type="text/javascript"></script>
        <script>
            var posicion = 0;
            var imagenes = new Array();
            $(document).ready(function () {
                //alert(jQuery('.texto').html());
                var numeroImatges = document.getElementById('CampoI').value;
                if (numeroImatges <= 4) {
                    $('.derecha_flecha').css('display', 'none');
                    $('.izquierda_flecha').css('display', 'none');
                }

                $('.izquierda_flecha').live('click', function () {
                    if (posicion > 0) {
                        posicion = posicion - 1;
                    } else {
                        posicion = numeroImatges - 4;
                    }
                    $(".carrusel").animate({"left": -($('#product_' + posicion).position().left)}, 600);
                    return false;
                });

                $('.izquierda_flecha').hover(function () {
                    $(this).css('opacity', '0.5');
                }, function () {
                    $(this).css('opacity', '1');
                });
                
                $('.derecha_flecha').hover(function () {
                    $(this).css('opacity', '0.5');
                }, function () {
                    $(this).css('opacity', '1');
                });

                $('.derecha_flecha').live('click', function () {
                    if (numeroImatges > posicion + 4) {
                        posicion = posicion + 1;
                    } else {
                        posicion = 0;
                    }
                    $(".carrusel").animate({"left": -($('#product_' + posicion).position().left)}, 600);
                    return false;
                });
            });
        </script>
    </head>
    <body class="PageContentCentralAlign">
        <div style="width: 100%; height: 40%; vertical-align: middle; ">
            <div class="mitadfORO">
                <form action="FORO/CrearForo.jsp" method="POST">
                    <input type="image" name="agregar" class="imagenForoDoc" alt="Agregar" src="FORO/agregar.png"/>
                </form>
            </div>
            <div class="mitadfORO">
                <form action="FORO/BuscarForo.jsp" method="POST">
                    <input type="image" name="buscar" class="imagenForoDoc" alt="Buscar" style="display: none" src="FORO/buscar.png"/>
                </form>
            </div>
        </div>
        <div style="height: 60%; width: 100%; text-align: center;  ">

            <div id="carrusel" style="vertical-align: central; text-align: center ">
                <a href="#" class="izquierda_flecha"><img alt="izquierda" style="width: 40px; height: 40px;" src="IMAGENES/izq.png" /></a>
                <a href="#" class="derecha_flecha"><img alt="derecha" style="width: 40px; height: 40px;" src="IMAGENES/der.png" /></a>
                <div class="carrusel"><a class="letras">Foros Creados</a>
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
                        try {
                            String PasswordRootDb = "DLDB";
                            Integer IdUs = UsuarioIns.getId();
                            Class.forName("com.mysql.jdbc.Driver").newInstance();
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dldb", "root", "n0m3l0");
                            Statement Estamento = con.createStatement();

                            String querystring = "SELECT * FROM DLDB.foro WHERE IdUsuarioCreador=\"" + IdUs + "\"";
                            ResultSet result = Estamento.executeQuery(querystring);

                            String IdF, Nombre, Tema, Fecha;
                            int Edad;
                            int i=0;
                            while (result.next()) {
                                Nombre = result.getString("Nombre");
                                Tema = result.getString("Tema");
                                IdF = result.getString("IdForo");
                                out.println("<form action='FORO/ForoPost.jsp' method='post'>");
                                out.println("<div class='letras' id='product_"+i+"'><p>"+Nombre+"</p><p>"+Tema+"</p><p><input type='submit' class='botoncito2' name='SubmitRequestSelector' value='Abrir'/></p></div>");
                                out.println("<input type='hidden' name='IdForo' value='"+ IdF +"'>");
                                out.println("<input type='hidden' name='NombreForo' value='"+ Nombre +"'>");
                                out.println("<input type='hidden' name='TemaForo' value='"+ Tema +"'>");
                                out.println("</form>");
                                i = i + 1;
                            }
                            out.println("<input type='text' id='CampoI' value='"+i+" ' >");
                            sesion.removeAttribute("IdForoDesplegado");
                        } catch (SQLException error) {
                            out.println("<script>alert('ERROR: " + error.toString() + "')</script>");
                            out.println("<META HTTP-EQUIV='REFRESH' CONTENT='0.0000001; URL=http://localhost:8080/DIGITAL%20CLOUD%20PROGRAM%20V1/ADMIN/BUSCARA.html'/>");

                        } catch (Exception e) {
                            out.println("<script>alert('ERROR: " + e.getLocalizedMessage() + "')</script>");
                            out.println("<META HTTP-EQUIV='REFRESH' CONTENT='0.0000001; URL=http://localhost:8080/DIGITAL%20CLOUD%20PROGRAM%20V1/ADMIN/BUSCARA.html'/>");
                            e.printStackTrace();
                        }
                    %>
                </div>
            </div>
        </div>
    </body>
</html>

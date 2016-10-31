<%-- 
    Document   : PRINCIPALA
    Created on : 30/04/2016, 12:53:16 AM
    Author     : Rod
--%>

<%@page import="DCLPackage.BDD.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ADMINISTRADOR</title>
        <link rel="stylesheet" type="text/css" href="../css.css"/>
        <link rel="icon" type="image/png" href="../favicon.png" />
        <script src="FunctionsBase.js"></script>

    </head>
    <body id="BODYDC">
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

        <div id="LateralIzquierdo" class="LatIzq">
            <div id="Logo" class="Cuadrologo1">
                <a onclick="Cambiar('Bienvenida.jsp')"><img class="logo1" src="../LOGOS/Dc2Cf.png" alt="IMAGEN LOGO"></a>    
            </div>
            <div id="menu" class="Menucito">
                <ul>
                   <li><a onclick="Cambiar('INFORMACION.jsp')" ><img class="imagen" src="IMAGENES/BUSCAR.png" alt="IMAGEN INFORMACION"></a></li> 
                    <li><a onclick="Cambiar('MENSAJESA.html')"><img class="imagen" src="IMAGENES/MENSAJES.png" alt="IMAGEN MENSAJES"></a></li>
                    <li><a onclick="Cambiar('AGREGARA.jsp')" ><img class="imagen" src="IMAGENES/AGREGAR.png" alt="IMAGEN AGREGAR"></a></li>
                    <li><a onclick="Cambiar('ConfiguracionA.jsp')" ><img class="imagen" src="IMAGENES/CONFIGURACION.png" alt="IMAGEN CONFIGURACION"></a></li>
                    <li><a onclick="Cambiar('BUSCARA.jsp')" ><img class="imagen" src="IMAGENES/BUSCAR.png" alt="IMAGEN BUSCAR"></a></li>
                    <li><a href=".../SALIDASISTEMA.html"><img class="imagen"  src="IMAGENES/SALIR.png" onclick="return salir()" alt="IMAGEN SALIR"></a></li>
                    
                </ul>
            </div>
        </div>
        <div id="LateralDerecho" class="LatDer">
            <div class="social">
                <ul>
                    <li><a href="https://www.facebook.com/DigitalCloudOficial/" target="_blank" class="icon-facebook2"></a></li>
                    <li><a href="https://twitter.com/DigiCloudOfi" target="_blank" class="icon-twitter"></a></li>
                    <li><a href="https://www.youtube.com/channel/UCWnnTIAzDXLDbKRiygkcMBQ" target="_blank" class="icon-youtube"></a></li>
                    <li><a href="" target="_blank" class="icon-google-plus3"></a></li>
                </ul>
            </div>
            <div id="bienvenida" class="central">
                <iframe src="Bienvenida.jsp" id="VentanaCentral" class="WindowsCentral" frameborder=1 ></iframe>
            </div>
            <div id="footer" class="footer">
                <div id="footer1" class="footerSubclass">IPN 2016</div>
                <div id="footer2" class="footerSubclass">TODOS LOS DERECHOS RESERVADOS</div>
                <div id="footer3" class="footerSubclass">Digital Learning - Digital Cloud</div>
            </div>
        </div>
    </body>
</html>

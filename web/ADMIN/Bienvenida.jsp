<%-- 
    Document   : Bienvenida
    Created on : 3/05/2016, 11:37:35 PM
    Author     : Rod
--%>

<%@page import="DCLPackage.BDD.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html class="CentralSubPage">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href=".../css.css"/>
        <title></title>
    </head>
    <body class="colorprincipal">
        <div>
            <div class="mitad">
                <div class="Uno">
                    <img src="../LOGOS/Dc2.png" alt="IMAGEN PRINCIPAL" class="ImgCenral">
                </div>
            </div>
            <div class="mitad">
                <div class="Dos">
                    <h2>
                        <A class="letras">
                            Bienvenido 
                            <%
                                HttpSession sesion = request.getSession(true);
                                Usuario UsuarioIns = (Usuario) sesion.getAttribute("Usuario");
                                String Name = UsuarioIns.getNombre();
                                out.println(Name);
                            %> 
                        </A>
                    </h2>
                </div>
            </div> 
        </div>
    </body>
</html>

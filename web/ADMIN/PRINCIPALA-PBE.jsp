<!DOCTYPE html>
<%-- 
    Document   : PRINCIPALA
    Created on : 30/04/2016, 12:53:16 AM
    Author     : Rod
--%>

<%@page import="DCLPackage.BDD.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="es" >
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ADMINISTRADOR</title>        
        <link rel="icon" type="image/png" href="../favicon.png" />                
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/Estilos.css" rel="stylesheet" type="text/css"/>  
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css"/>  
    </head>
    <body>
        hola
        <nav class="navbar navbar-default no-margin navbar-static-top">
            <div class="container"><!-- Contenedor-->
                <div class="navbar-header fixed-brand "><!-- Principal NVAR-->
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" id="menu-toggle">
                        <span class="sr-only">Este boton despliega la barra de navegación</span>
                        <span class="glyphicon glyphicon-th-large" aria-hidden="true"></span>
                    </button>   
                    <a class="navbar-brand" href="#">
                        <i class="fa fa-globe fa-5"></i> 
                        DIGITAL CLOUD
                    </a>  
                </div><!-- navbar-header-->
                <div class="collapse navbar-collapse navbar-right" id="navbar">
                    <ul class="nav navbar-nav">
                        <li class="active "><button class="navbar-toggle collapse in " data-toggle="collapse" id="menu-toggle-2"> <span class="glyphicon glyphicon-th-large" aria-hidden="true"></span></button></li>
                    </ul>
                </div><!-- bs-example-navbar-collapse-1 -->
            </div>
            <!-- Brand and toggle get grouped for better mobile display -->
        </nav>
        <div id="wrapper">
            <!-- Sidebar -->
            <div id="sidebar-wrapper">
                <ul class="sidebar-nav nav-pills nav-stacked" id="menu">
                    <li>
                        <a href="#"><span class="fa-stack fa-lg pull-left"><i class="fa fa-home fa-stack-1x "></i></span>Bienvenida</a>
                    </li>
                    <li>
                        <a href="#"><span class="fa-stack fa-lg pull-left"><i class="fa fa-comments fa-stack-1x "></i></span>Mensajes</a>
                    </li>
                    <li>
                        <a href="#"><span class="fa-stack fa-lg pull-left"><i class="fa fa-users fa-stack-1x "></i></span> Usuarios</a>
                        <ul class="nav-pills nav-stacked" style="list-style-type: none; display: none;">
                            <li><a href="#"><span class="fa-stack fa-lg pull-left"><i class="fa fa-user-plus fa-stack-1x "></i></span>Agrear</a></li>
                            <li><a href="#"><span class="fa-stack fa-lg pull-left"><i class="fa fa-user-times fa-stack-1x "></i></span>Borrar</a></li>
                            <li><a href="#"><span class="fa-stack fa-lg pull-left"><i class="fa fa-search fa-stack-1x "></i></span>Consultar usuario</a></li>
                            <li><a href="#"><span class="fa-stack fa-lg pull-left"><i class="fa fa-users fa-stack-1x "></i></span>Consultar todos</a></li>

                        </ul>
                    </li>
                    <li>
                        <a href="#"><span class="fa-stack fa-lg pull-left"><i class="fa fa-cogs fa-stack-1x "></i></span> Configuracion</a>
                        <ul class="nav-pills nav-stacked" style="list-style-type: none; display: none;">
                            <li><a href="#"><span class="fa-stack fa-lg pull-left"><i class="fa fa-user fa-stack-1x "></i></span>Cuenta</a></li>                            
                            <li><a href="#"><span class="fa-stack fa-lg pull-left"><i class="fa fa-key fa-stack-1x "></i></span>Contraseña</a></li>
                            <li><a href="#"><span class="fa-stack fa-lg pull-left"><i class="fa fa-info fa-stack-1x "></i></span>Informacion</a></li>

                        </ul>
                    </li>
                    <li>
                        <a href="#"><span class="fa-stack fa-lg pull-left"><i class="fa fa-phone fa-stack-1x "></i></span>Contacto</a>
                    </li>
                    <li>
                        <a href="#"><span class="fa-stack fa-lg pull-left"><i class="fa fa-sign-out fa-stack-1x "></i></span>Cerrar Sesion</a>
                    </li>
                </ul>
            </div><!-- /#sidebar-wrapper -->
            <!-- Page Content -->
            <div id="page-content-wrapper">
                <div class="container-fluid xyz">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1>Simple Sidebar With Bootstrap 3 by <a href="#">Seegatesite.com</a></h1>
                            <p></p>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /#page-content-wrapper -->

        </div>
        <!-- /#wrapper -->
        <!-- jQuery -->
        <script src="js/jquery2.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/sidebar_menu.js"></script>        
    </body>
</html>

<%-- 
    Document   : GruposFunOc
    Created on : 5/05/2016, 05:50:15 PM
    Author     : Rod
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crear Grupo</title>
        <link rel="stylesheet" type="text/css" href="../../css.css"/>
        <link rel="icon" type="image/png" href="../../favicon.png" />
    </head>
    <body class="PageContentCentralAlign">
        <h1 style="color: mediumorchid">CREACION DE GRUPOS</h1>
        <section>
            <BR>
            <form action="CrearForo.jsp">
                <div>
                    <a class="letras">Semestre:</a><br>
                    <input type="radio" name="Semestre" value="1" checked="checked" />1
                    <input type="radio" name="Semestre" value="2" />2
                    <input type="radio" name="Semestre" value="3" />3
                    <input type="radio" name="Semestre" value="4" />4
                    <input type="radio" name="Semestre" value="5" />5
                    <input type="radio" name="Semestre" value="6" />6
                </div>
                <div>
                    <br><a class="letras">Turno:</a><br>

                    <input type="radio" name="Turno" value="M" checked="checked" />Matutino
                    <input type="radio" name="Turno" value="V"/>Vespertino
                </div>
                <div>
                    <br><a class="letras">Rama:</a><br>
                    <select name="Ramas" size="1">
                        <option selected value="I">Ingenieria Fisico-Metematico</option>
                        <option disabled value="CS">Ciencias Sociales-Administrativas</option>
                        <option disabled value="CM">Ciencias Medico-Biologicas</option>
                    </select>
                </div>
                <div>
                    <a class="letras">Grupo:</a><br>
                    <input type="radio" name="Grupo" value="1" checked="checked" />1
                    <input type="radio" name="Grupo" value="2" />2
                    <input type="radio" name="Grupo" value="3" />3
                    <input type="radio" name="Grupo" value="4" />4
                    <input type="radio" name="Grupo" value="5" />5
                    <input type="radio" name="Grupo" value="6" />6
                    <input type="radio" name="Grupo" value="7" />7
                    <input type="radio" name="Grupo" value="8" />8
                    <input type="radio" name="Grupo" value="9" />9
                </div>
                <div>
                    <input type="submit" value="CREAR" class="botoncito"/>
                </div>
            </form>
        </section>
    </body>
</html>

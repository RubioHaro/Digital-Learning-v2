<%-- 
    Document   : AGREGARA
    Created on : 10/05/2016, 11:03:42 AM
    Author     : DIGITAL CLOUD
--%>

<%@page import="DCLPackage.BDD.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>REGISTRAR</title>
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
                    response.sendRedirect("index.html");
                }
            } else {
                out.println("<script>aler('PORFAVOR INICIA SESION')</script>");
                response.sendRedirect("../index.html");
            }
        %>
        <div STYLE=" float: left; text-align:CENTER;">
            <form name="ALTAS" action="registros.jsp" METHOD="POST" autocomplete="off">            
                <table>
                    <tr>
                        <td STYLE="text-align: CENTER; width: 1100px">
                            <a class="letras"> Nombre(s):</a>
                        </td> 
                    </tr>
                    <tr>
                        <td STYLE="text-align: CENTER; width: 1100px">
                            <input required type="TEXT" Name="USUARIO" placeholder="Nombre(s)"  onkeypress="return Letras(event)" class="cuadritosv1" ID="USUARIO" autocomplete="off">
                        </td>
                    </tr>
                    <tr>
                        <td STYLE="text-align: CENTER; width: 1100px">
                            <br><br>
                             <a class="letras">Apellidos:</a>
                        </td>
                    </tr>
                    <tr>
                        <td STYLE="text-align: CENTER; width: 1100px">
                            <input required type="TEXT" Name="APEL" placeholder="Apellidos" onkeypress="return Letras(event)" class="cuadritosv1" ID="APEL" autocomplete="off">
                        </td>
                    </tr>
                    <tr>
                        <td STYLE="text-align: CENTER; width: 1100px">
                            <br><br>
                             <a class="letras">Contraseña:</a>
                        </td>
                    </tr>
                    <tr>
                        <td STYLE="text-align: CENTER; width: 1100px">
                            <input type='password' style='display:none;'/>
                            <input required type="password" Name="PASSWORD" placeholder="Contraseña" class="cuadritosv1" ID="PASSWORD" autocomplete="off">
                        </td>
                    </tr>
                    <tr>
                        <td STYLE="text-align: CENTER; width: 1100px">
                            <br><br>
                             <a class="letras">Edad:   </a>
                        </td>
                    </tr>
                    <tr>
                        <td STYLE="text-align: CENTER; width: 1100px">
                            <input  type="number" min="13" max="90" Name="EDAD" placeholder="Edad" class="cuadritosv1" ID="EDAD" autocomplete="ON" required>
                        </td>
                    </tr>
                    <tr>
                        <td STYLE="text-align: CENTER; width: 1100px">
                            <br><br>
                            <a class="letras">Sexo:</a>
                        </td>
                    </tr>
                    <tr>
                        <td STYLE="text-align: CENTER; width: 1100px">
                            <input type="radio" checked name="SEXO" value="M"><a class="letras">Masculino  </a>
                            <input type="radio" name="SEXO" value="F"><a class="letras">Femenino</a>
                        </td>
                    </tr>
                    <tr>
                        <td STYLE="text-align: CENTER; width: 1100px">
                            <br><br>
                             <a class="letras">Tipo de Ususario:</a>
                        </td>
                    </tr>
                    <tr>
                        <td STYLE="text-align: CENTER; width: 1100px">
                            <input type="radio"  name="TIPOUSUARIO" onchange="radioTipoUs(TIPOUSUARIO)" value="Administrador"><a class="letras">Administrador</a>
                            <input type="radio" checked name="TIPOUSUARIO" onchange="radioTipoUs(TIPOUSUARIO)" value="Alumno"><a class="letras">Alumno</a>
                            <input type="radio" name="TIPOUSUARIO" onchange="radioTipoUs(TIPOUSUARIO)" value="Docente"><a class="letras">Docente</a>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: center ">
                            <select required name="Grupos" id="Grupos">
                                <option selected disabled>Selecciona una opcion</option>
                            </select>
                            
                            
                            <%@page import=" java.sql.*, java.io.*"%>
                            <%

                                String DATABASE = "dldb";
                                String PasswordRootDb = "DLDB";

                                //Variables de conexion\\
                                Connection con = null;
                                //Statement stm = null;\\
                                PreparedStatement pstatement = null;
                                
                                try {
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dldb", "root", "n0m3l0");
                                    String querystring = "SELECT IdGrupo FROM dldb.grupos;";
                                    Statement Estamento = con.createStatement();
                                    ResultSet result = Estamento.executeQuery(querystring);
                                    String Group;
                                    
                                    while(result.next())
                                    {
                                        Group = result.getString("IdGrupo");
                                        if(Group.equals(""))
                                        {
                                            
                                        }
                                        else
                                        {
                                            out.println("<script>agregar('"+Group+"')</script>");
                                        }
                                    }
                                } catch (SQLException error) {
                                    out.println(error.toString());
                                } catch (Exception e) {
                                    out.println(e.getLocalizedMessage());
                                    e.printStackTrace();
                                }
                            %>
                        </td>
                    </tr>
                    <tr>
                        <td STYLE="text-align: CENTER; width: 1100px">
                            <br>
                            <input type="SUBMIT" Name="REGISTRAR" ID="REGISTRAR" VALUE="REGISTRAR">
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </body>
</html>

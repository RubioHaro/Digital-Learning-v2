/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function salir() {
    var res = confirm("¿Seguro que desea salir?");
    if (res) {
        return true;
    }
    else {
        return false;
    }
}
function Letras(e)
{
    var KeyL = e.which || e.keyCode;
    if ((KeyL >= 65 && KeyL <= 90) || (KeyL >= 97 && KeyL <= 122) || KeyL === 8 || KeyL === 32 || KeyL === 130 || (KeyL >= 160 && KeyL <= 165) || KeyL === 239||KeyL ===9||KeyL===2||KeyL===3||KeyL===13)                  
    {
        return true;
    }
    else {
        return false;
    }

}
function borrar()
{
    var res = confirm('Seguro que deseas eliminar el usuario?');
    if(res)
    {
        return true;
    }
    else
    {
        return false;
    }
}
function Cambiar(Page)
{
    document.getElementById("VentanaCentral").src=Page;
}

function agregar(Group)
{
    var x = document.getElementById("Grupos");
    var option = document.createElement("option");
    option.text = Group;
    option.value= Group;
    option.id=Group;
    x.add(option);
}
function seleccionar(GrupoOption)
{
    document.getElementById(GrupoOption).selected=true;
}

function radioTipoUs(Radio)
{
    if(Radio.value==="Alumno")
    {
        mostrarAlumno();
    }
    else
    {
        ocultarAlumno();
    }
}

function ocultarAlumno()
{
    document.getElementById("Grupos").style.display='none';
    document.getElementById("Grupos").required=false;
}
function mostrarAlumno()
{
    document.getElementById("Grupos").style.display='inline';
    document.getElementById("Grupos").required=true;
}
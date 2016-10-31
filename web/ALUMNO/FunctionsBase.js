/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function salir() {
    var res = confirm("¿Seguro que desea salir?");
    if (res) {
        return true;
    } else {
        return false;
    }
}

function Letras(e)
{
    var KeyL = e.which || e.keyCode;
    if ((KeyL >= 65 && KeyL <= 90) || (KeyL >= 97 && KeyL <= 122) || KeyL === 8 || KeyL === 32 || KeyL === 130 || (KeyL >= 160 && KeyL <= 165) || KeyL === 239)
    {
        return true;
    } else {
        return false;
    }

}
function Cambiar(Page)
{
    document.getElementById("VentanaCentral").src = Page;
}

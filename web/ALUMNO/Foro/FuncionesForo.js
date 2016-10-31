/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function iniciar() {
    cargarMensajes();
}
function CargarMensajes() {
    
    var x = document.getElementById("#ForoMensajes");
    x.load("CargarMensajes.jsp", 
    function (){
        setTimeout("CargarMensajes()", 1000);
    }
    );
}

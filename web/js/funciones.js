    function alertt(d){
        $('#mensajealerta').html(d);
        $('#myModalXX').modal();
    }
$(document).ready(function(){
    var out = "";
        out = out + "<div class='modal fade' id='myModalXX' role='dialog'>";
        out = out + "<div class='modal-dialog'>";
        out = out + "  <div class='modal-content'>";
        out = out + "    <div class='modal-header'>";
        out = out + "      <button type='button' class='close' data-dismiss='modal'>&times;</button>";
        out = out + "      <h4 class='modal-title'>Mensaje Emergente</h4>";
        out = out + "    </div>";
        out = out + "    <div class='modal-body'>";
        out = out + "        <p id='mensajealerta'></p>";
        out = out + "    </div>";
        out = out + "    <div class='modal-footer'>";
        out = out + "      <button type='button' class='btn btn-default' data-dismiss='modal'>Cerrar Ventana</button>";
        out = out + "    </div>";
        out = out + "  </div>";
        out = out + "</div>";
        out = out + "</div>   "; 
    $("body").append(out);
});
  
jQuery(init);
function init($) {

    $('#formItem').submit(function (e) {
        e.preventDefault();
        validation();
    });
    
}


function validation() {
    fieldstoval = $('#validationServer01','#validationServer02','#validationServer03','#validationServer04','#validationServer05','#validationServer06','#validationServer07','#validationServer08','#validationServer09');

    if (fieldstoval.val()==="") {
        fieldstoval.addClass('is-invalid');
        return false;
    }else {
       fieldstoval.addClass('is-valid');
    }
}
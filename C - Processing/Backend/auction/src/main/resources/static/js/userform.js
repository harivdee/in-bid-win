jQuery(init);
function init($) {

    $('#formUser').submit(function (e) {
//        e.preventDefault();
        let result1 = emailCheck();
        let result2 = validation();
        if(result1 == false) {
            e.preventDefault();
        }
        if (result2 == false) {
            e.preventDefault();
        }
    });
    
}

function emailCheck(){
    let email = $('#inputEmail');

    if(email.val()==""){
        email.addClass('is-invalid');
        return false;
    }else{
        let regMail     =   /^([_a-zA-Z0-9-]+)(\.[_a-zA-Z0-9-]+)*@([a-zA-Z0-9-]+\.)+([a-zA-Z]{2,3})$/;
        if(regMail.test(email.val()) == false){
            email.addClass('is-invalid');
            return false;
        }else{
            email.addClass('is-valid');
        }

    }
}

function validation() {
    if ($('#validationServer01','#validationServer02','#validationServerUsername','#inputPassword5','#invalidCheck3').val()=="") {
        $('#validationServer01','#validationServer02','#validationServerUsername','#inputPassword5','#invalidCheck3').addClass('is-invalid');
        return false;
    }else {
        $('#validationServer01','#validationServer02','#validationServerUsername','#inputPassword5','#invalidCheck3').addClass('is-valid');
    }
}


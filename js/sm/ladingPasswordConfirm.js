var check_pass_word = '';
var passwords = $('#password').get(0);
//alert(passwords);

$(function() {

    var character, index = 0;
    $("input.pass").attr("disabled", true);
    $("#password").attr("disabled", true);
    $('#keyboard li').click(function() {
        if ($(this).hasClass('delete')) {
           for(var i= 0,len=passwords.elements.length-1;len>=i;len--){
                if($(passwords.elements[len]).val()!=''){
                    $(passwords.elements[len]).val('');
                    break;
                }
            }
            return false;
        }
        if ($(this).hasClass('cancle')) {
            parentDialog.close();
            return false;
        }
        if ($(this).hasClass('symbol') || $(this).hasClass('tab')) {
            character = $(this).text();
			            for(var i= 0,len=passwords.elements.length;i<len;i++){
                if($(passwords.elements[i]).val()== null ||$(passwords.elements[i]).val()==undefined||$(passwords.elements[i]).val()==''){
                    $(passwords.elements[i]).val(character);
                    break;
                }
            }
            if ($(passwords.elements[5]).val() != '') {
                var temp_rePass_word = '';
                for (var i = 0; i < passwords.elements.length; i++) {
                    temp_rePass_word += $(passwords.elements[i]).val();
                }
                check_pass_word = temp_rePass_word;myan();
            }


        }
        return false;
    });
});


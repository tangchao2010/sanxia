var check_pass_word = '';
var passwords = $('#password').get(0);
//alert(passwords);

$(function() {
	
    var character, index = 0;
    $("input.pass").attr("disabled", true);
    $("#password").attr("disabled", true);
    $('#keyboard li').click(function() {
        if ($(this).hasClass('delete')) {
            $(passwords.elements[--index % 6]).val('');
            if ($(passwords.elements[0]).val() == '') {
                index = 0;
            }
           /* for(var i= 0,len=passwords.elements.length-1;len>=i;len--){
                if($(passwords.elements[len]).val()!=''){
                    $(passwords.elements[len]).val('');
                    break;
                }
            }*/
            return false;
        }
        if ($(this).hasClass('cancle')) {
            parentDialog.close();
            return false;
        }
        if ($(this).hasClass('symbol') || $(this).hasClass('tab')) {
            character = $(this).text();
			//alert(character);
            $(passwords.elements[index++ % 6]).val(character);
            if ($(passwords.elements[5]).val() != '') {
                index = 0;
            }
            /*for(var i= 0,len=passwords.elements.length;i<len;i++){
                if($(passwords.elements[i]).val()== null ||$(passwords.elements[i]).val()==undefined||$(passwords.elements[i]).val()==''){
                    $(passwords.elements[i]).val(character);
                    break;
                }
            }*/
			
            if ($(passwords.elements[5]).val() != '') {
				//alert(1);
                var temp_rePass_word = '';
                for (var i = 0; i < passwords.elements.length; i++) {
                    temp_rePass_word += $(passwords.elements[i]).val();
					//alert(temp_rePass_word);
                }
                check_pass_word = temp_rePass_word;
				//alert(check_pass_word);
                //$("#key").hide();
				$.showIndicator(); //加载。。。
				
				//如果绑定成功
				/*$.alert('银行卡绑定成功', function () {
					window.location.href='http://www.baidu.com';
				});*/
				//如果如果绑定失败
				$.alert('银行卡绑定失败', function () {
					//window.location.reload();微信内置浏览器失效
					window.location.href="window.location.href+随机数" ;
				});
				
				/*
                var action = 'modify';
                $.ajax({
                    url: 'confirmLadingPassword.do',
                    type: 'post',
                    data: {
                        userName: 'heboy18',
                        ladingPassword: check_pass_word
                    },
                    dataType: 'json',
                    success: function(data) {
                        var result = JSON.stringify(data);
                        if (result == "\"验证通过\"") {
                            if (action == "modify") {
                                window.parent.document.getElementById("modify_div").style.display = '';
                                window.parent.document.getElementById("modify_ladingPassword").disabled = 'disabled';
                                window.parent.document.getElementById("oldLadingPassword").value = check_pass_word;
                                parentDialog.close();  //如果验证成功关闭当前窗口并跳转到提单券号列表
                            } else if (action == "set") {
                                var ladingId = parent.window.document.getElementById("ladingId").value;
                                var ladingType = parent.window.document.getElementById("ladingType").value;
                                parent.window.location.href = "indexSeting.do";
                                //parentDialog.close(); //如果验证成功关闭当前窗口并跳转到提单券号列表
                            }
                        } else {
                            var result_text = '\
                           		<span>提货密码</span>\
                           		<span style="color: red;">验证失败</span>\
                           		';
                            $("#set_text").html(result_text);
                            $("#key").show();
                            for (var i = 0; i < passwords.elements.length; i++) {
                                $(passwords.elements[i]).val('');
                            }
							
                            //var t=1;
							//var t1 = window.setInterval(function(){
	    					//	t--;
	    					//	if(t==0){
		    				//		window.clearInterval(t1);
		    				//		if('set'==action){
		    				//			parent.window.location.href="queryLadingDetailWeixin.pfv?rm="+rm;
		    				//		}else if('modify'==action)
		                    //   		parent.window.location.href="http://www.baidu.com";
		    				//	}
	    					//},1000);
							
                        }
                    },
                    error: function(data) {
                        var result_text = '\
                           <span>网络异常</span>\
                           <span style="color: red;">验证失败</span>\
                           ';
                        $("#set_text").html(result_text);
                        var t = 1;
                        var t1 = window.setInterval(function() {
                            t--;
                            if (t == 0) {
                                window.clearInterval(t1);
                                if ('set' == action) {
                                    parent.window.location.href = "queryLadingDetailWeixin.do";
                                } else if ('modify' == action)
                                    parent.window.location.href = "#";
                            }
                        }, 1000);
                    }
                });
				*/
				
            }
			
        }
        return false;
    });
});


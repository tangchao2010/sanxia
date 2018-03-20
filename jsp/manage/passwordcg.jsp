<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="renderer" content="webkit" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<title>密码重置</title>
		<link href="<%=request.getContextPath()%>/css/bootstrap/bootstrap.min.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/bootstrap/bootstrap-theme.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/bootstrap/bootstrapValidator.min.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/bootstrap/buttons.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/webuploader.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/manage.css" rel="stylesheet" />

		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.11.3.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/wechat/layer.m.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap/bootstrap.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap/bootstrapValidator.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/webuploader.min.js"></script>
		<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
		<style>
			html,
			body {
				background: #f5f5f5;
				width: 100%;
				overflow-x: hidden;
				font-family: "Helvetica Neue", Helvetica, Arial, "Hiragino Sans GB", "Hiragino Sans GB W3", "Microsoft YaHei UI", "Microsoft YaHei", "WenQuanYi Micro Hei", sans-serif;
			}
			.panel-gray {
				
				margin-bottom: 0;
			}
			.panel-gray>.panel-heading {
				color: #222526;
				background-color: #f5f5f5;
				border-color: #f2f2f2;
				height: 40px;
				padding: 0;
				line-height:40px;
				height:40px;
			}
			
			.panel-gray>.panel-heading .panel-title {
				font-size: 16px;
				line-height: 40px;
				margin-left: 20px;
				color:#000;
			}
			.form-group {
				margin: 10px 0;
			}
			
			
			/*按钮效果*/
			.manage_containerb .form-control{ padding:0; line-height:34px; font-size:16px;}
			.manage_sh2{ padding-top:5%; padding-bottom:5%; border-bottom:solid 1px #e9e9e9;}
			.manage_sh2 .manage_co1{ color:#1a1a1a; font-size:14px; line-height:34px;}
		</style>
        
        <script>
        	$(function(){
        		
        		var ypasswd = $("#password");
        		
        	//	$('#subhold').attr('disabled',"true");  
        		
				$("#subhold").on("touchstart",function(){
					$(this).css({background:"-webkit-gradient(linear, left top, left bottom, from(#065376), to(#083d57))"});
				}).on("touchend",function(){
					$(this).css({background:"#073348"});	
				});
				
				function searchMrchName() {
					//alert(password);
					//alert($("input[name='password']").val());
					//alert($("input[name='loginName']").val());
					
        			$.post("<%=request.getContextPath()%>/Manage/businestjCheck", {
        				password:$("input[name='password']").val(),
        				loginName:$("input[name='loginName']").val()
					},function(json) {
        				//alert(json);						
						if(json.code != 0) {
							var loading = layer.open({
								type: 3,
								content: json.desc
							});
							 $('#subhold').attr('disabled',"true");  
							 //return false;
						}else
							{
							 $('#subhold').removeAttr("disabled");  
							 //return true;
							}
 
        	 
        			}, 'json');

        		};
        		
        		ypasswd.on("change", function() {
        		
        			if($(this).val() && $(this).val().length>0){
        			//	searchMrchName();
        			}
        		});
			});
        </script>
        
         <script>
		 	 var wAlert = window.alert;  
				window.alert = function (message) {  
					try {  
						var iframe = document.createElement("IFRAME");  
						iframe.style.display = "none";  
						iframe.setAttribute("src", 'data:text/plain,');  
						document.documentElement.appendChild(iframe);  
						var alertFrame = window.frames[0];  
						var iwindow = alertFrame.window;  
						if (iwindow == undefined) {  
							iwindow = alertFrame.contentWindow;  
						}  
						iwindow.alert(message);  
						iframe.parentNode.removeChild(iframe);  
					}  
					catch (exc) {  
						return wAlert(message);  
					}  
				}  
		 
			function check(f) {
				/* if (f.password.value == '') { alert('请输入原密码！'); f.password.focus(); return false }
				if (f.password.value.length < 6) { alert('密码长度至少为6位！'); f.password.select(); return false }
				 */
				if (f.pwd.value == '') { alert('请输入新密码！'); f.pwd.focus(); return false }
				if (f.pwd.value.length < 6) { alert('密码长度至少为6位！'); f.pwd.select(); return false }
				/*if (!f.pwd.value.match(/[a-z]/) || !f.pwd.value.match(/[A-Z]/) || !f.pwd.value.match(/[0-9]/)) { 
					alert("必须包括所有的字符以下类型：小写字母，大写字母和数字 "); 
					f.pwd.focus(); 
					return false; 
				}*/
				if (f.cpwd.value == '') { alert('请确认新密码！'); f.cpwd.focus(); return false }
				if (f.cpwd.value != f.pwd.value) { alert(' 密码和确认密码不一致！'); f.cpwd.select();return false}
				
				//return searchMrchName();
			}
		</script>
        
	</head>

	<body background="#f5f5f5">
		<!--<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
            <div class="jdxx">
                <a>账号注册</a>
            </div>      
         </nav>-->
            
		<div class="container-fluid manage_sh" style="margin-top:10px;">
		<div class="manage_containerb">
			<form id="defaultForm" onsubmit="return check(this)" method="post" action="<%=request.getContextPath()%>/Manage/passwordcg">

                                    <input type="hidden" name="loginName"  value="${loginName }"></input>
                                    <input type="hidden" name="oemid"  value="${oemid }"></input>
                                    <input type="hidden" name="openid"  value="${openid }"></input>
                                    
				<div class="panel panel-gray">
					<div class="panel-body">
                    	<div class=" container manage_sh2">
							<div class="row zc_main">
                            	<!-- <div class="col-md-3 col-sm-3 col-xs-3">
                                    <span  class="manage_co1">原密码</span>
                                </div> -->
                                <div class=" col-xs-offset-1 col-md-8 col-sm-8 col-xs-8">
                                    <input type="hidden"  style="box-shadow:none"   class="form-control register_box" id="password" name="password" placeholder="请输入原密码" />
                                </div>
                    		</div>
                        </div>
                        <div class=" container manage_sh2">
							<div class="row zc_main">
                            	<div class="col-md-3 col-sm-3 col-xs-3">
                                    <span  class="manage_co1">新密码</span>
                                </div>
                                <div class=" col-xs-offset-1 col-md-8 col-sm-8 col-xs-8">
                                    <input type="password"  style="box-shadow:none" class="form-control register_box"  name="pwd" placeholder="请输入新密码" />
                                </div>
                    		</div>
                        </div>
						<div class=" container manage_sh2">
							<div class="row zc_main">
                            	<div class="col-md-3 col-sm-3 col-xs-3">
                                    <span  class="manage_co1">确认新密码</span>
                                </div>
                                <div class=" col-xs-offset-1  col-md-8 col-sm-8 col-xs-8">
                                    <input type="password" style="box-shadow:none" class="form-control register_box"  name="cpwd" placeholder="请确认新密码" />
                                </div>
                    		</div>
						</div>
					</div>
               	</div>
                
                <div style=" text-align:center; padding-top:9%; padding-bottom:40%" >
              		<button id="subhold" type="submit" style=" text-shadow:none; background:#073348; border:none;  width:90%" class=" btn  btn-default btn-lg"><a style="font-weight:normal; text-decoration:none; color:#fff; font-family:'微软雅黑';  "> 提交保存</a></button>
                </div>
			</form>
		</div>
   </div>


<!--<input type="text" onblur="checkpass(this)" /> 
<script> 
function checkpass(pass){ 
var txt=pass.value; 
if (txt.length<8){ 
alert("必须至少8个字符长"); 
pass.focus(); 
return false; 
} 
if (!txt.match(/[a-z]/) || !txt.match(/[A-Z]/) || !txt.match(/[0-9]/)) 
{ 
alert("必须包括所有的字符以下类型：小写字母，大写字母和数字 "); 
pass.focus(); 
return false; 
} 
} 
</script>-->
	<!--onblur="alert('请输入6位以上字母或数字');this.focus()"-->
    </body>
    

</html>
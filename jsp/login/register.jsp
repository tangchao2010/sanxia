<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>用户注册</title>
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1, maximum-scale=1">
        <link rel="shortcut icon" href="/favicon.ico">
        <meta name="apple-mobile-web-app-capable" content="yes">  <!--删除默认的苹果工具栏和菜单栏-->
        <meta name="apple-mobile-web-app-status-bar-style" content="black"> <!-- 控制状态栏显示样式-->
        
        <!--新增-->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/sm/sm.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/sm/mystyle.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/sm/font-awesome.min.css">
        
        <!--
		<link href="<%=request.getContextPath()%>/css/bootstrap/bootstrap.min.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/bootstrap/bootstrap-theme.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/bootstrap/bootstrapValidator.min.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/bootstrap/buttons.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/webuploader.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" />
        -->

		<!--<style>
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
				color: #fff;
				background-color: #0cb6ff;
				border-color: #0cb6ff;
				height: 28px;
				padding: 0;
			}
			
			.panel-gray>.panel-heading .panel-title {
				font-size: 14px;
				line-height: 28px;
				margin-left: 8px;
			}
			
			.button {
				font-weight: 600;
				width: 100%;
			}
			
			.control-label {
				color: #626262;
				font-weight: 600;
			}
			
			
			.form-group {
				margin: 10px 0;
			}
			
			.magin0 {
				margin: 0 0 0 0;
				padding: 0;
			}
			
			.filePicker {
				width: 128px;
				overflow: hidden;
				margin: 0;
			}
			
			.webuploader-pick {
				position: relative;
				display: inline-block;
				cursor: pointer;
				line-height: 48px;
				background: none;
				height: 78px;
				width: 128px;
				color: #8C8C8C;
				text-align: center;
				border-radius: 3px;
				border: 1px dashed #ccc;
				overflow: hidden;
				background-repeat: no-repeat;
				background-size: 100% 100%;
			}
			
			.webuploader-pick .icon-add {
				padding: 20px;
				background-image: url("/img/RealName_AddBtn@2x.png");
				background-repeat: no-repeat;
				background-size: 100% 100%;
			}
			
			.filePicker.bg1 .webuploader-pick {
				background-image: url("/img/身份证正面@2x.png");
			}
			
			.filePicker.bg2 .webuploader-pick {
				background-image: url("/img/身份证反面@2x.png");
			}
			
			.filePicker.bg3 .webuploader-pick {
				background-image: url("/img/银行卡正面@2x.png");
			}
			
			.filePicker.bg4 .webuploader-pick {
				background-image: url("/img/银行卡反面@2x.png");
			}
			
			.webuploader-pick .preview {
				position: absolute;
				top: 0;
				left: 0;
				height: 100%;
				width: 100%;
			}
			.zj_logo img{ display:block; vertical-align:central; text-align:center; margin:auto;padding-bottom:8%; padding-top:10%;}
			.zc_container .register_box{box-shadow:none; border:none;}
			.help-block{ margin:0;}
		</style>-->
        
		<!--<script type="text/javascript">
		function resetcps() {
			$("input[name='cpassword']").val(""); 
			var $Validator = $('#defaultForm').data('bootstrapValidator');
			$('#defaultForm').bootstrapValidator('updateStatus', 'cpassword', 'INVALID');
		}
		
			$(function() {
				function sendValidCode() {
					$.post("<%=request.getContextPath()%>/LoginReg/sendValidCode1", {
						phoneNo: $("input[name='phoneNo']").val(),
						oemid  : $("input[name='oemid']").val()
					}, function(json) {						
						if(json.code != 0) {
							var loading = layer.open({
								type: 3,
								content: json.desc
							});
						}
					}, "json");
				}
				
				$("#btn-loadCode").on("click", function() {
					var $Validator = $('#defaultForm').data('bootstrapValidator');
					$Validator.validateField("phoneNo");
					var valid = $Validator.isValidField("phoneNo");
					if(!valid) return false;

					var btn = $(this);
					var orgHtml = btn.html();
					btn.attr("disabled", "disabled");
					sendValidCode();
					var progress = 60;
					btn.html("重新申请(" + progress + ")");
					var interval = setInterval(function() {
						progress--;
						btn.html("重新申请(" + progress + ")");
						if(progress === 1) {
							btn.html(orgHtml);
							btn.removeAttr("disabled");
							clearInterval(interval);
						}
					}, 1000);
				});
				$('#defaultForm').bootstrapValidator({
					excluded: ':disabled',
					feedbackIcons: {
						valid: 'glyphicon glyphicon-ok',
						invalid: 'glyphicon glyphicon-remove',
						validating: 'glyphicon glyphicon-refresh'
					},
					fields: {
						phoneNo: {
							validators: {
								notEmpty: {
									message: '请输入手机号码'
								},
								regexp: {
									regexp: /^1[3|4|5|7|8]\d{9}$/,
									message: '手机号码格式有误'
								}
							}
						},
						password: {
							validators: {
								notEmpty: {
									message: '请输入密码'
								},
								stringLength: {
									min: 6,
									message: '密码不小于6位'
								},
							}
						},
						cpassword: {
							validators: {
								notEmpty: {
			                        message: '请输入确认密码'
			                    },
			                    identical: {
			                        field: 'password',
			                        message: '两次密码不一致'
			                    }
							}
						},
						
						validCode: {
							validators: {
								notEmpty: {
									message: '请输入验证码'
								}
							}
						}
					}
				}).on('success.form.bv', function(e) {
					e.preventDefault();
					var $form = $(e.target);
					var loading = layer.open({
						type: 2,
						shadeClose: false
					});
					$.post($form.attr('action'), $form.serialize(), function(result) {
						layer.close(loading);
						if(result.code == 0) {
							var username = $("input[name='phoneNo']").val();
							var password=$("input[name='password']").val();
							var openid=$("input[name='openid']").val();
							var oemid=$("input[name='oemid']").val();
							var tjmrchorgcode=$("input[name='tjmrchorgcode']").val();
							var qrcode=$("input[name='qrcode']").val();

							window.location.href = "<%=request.getContextPath()%>/LoginReg/login1?openid=" + openid + "&username=" + username + "&password="+password + "&oemid="+oemid + "&tjmrchorgcode="+tjmrchorgcode + "&qrcode="+qrcode;
							
						} else {
							layer.open({
								type: 3,
								content: result.desc
							});
						}
					}, 'json');
				});
			});
		</script>-->
	</head>
	<body>
	<div class="page-group">
		<div class="page page-current">
        	<header class="bar bar-nav">
                <a class="icon icon-left pull-left back"></a>
                <h1 class='title'>用户注册</h1>
            </header>
            <div class="content">
            	<span class="wcb_logo">
                    <img  src="<%=request.getContextPath()%>/img/wcb/sanxialogob.png"/>
                </span>
                <form id="defaultForm" method="post" action="<%=request.getContextPath()%>/LoginReg/register">
                    <input type="hidden" value="boss" name="login_role">
                    <input type="hidden" value="mobile" name="login_type">
                    
                    <input type="hidden" id="openid" name="openid" value="<%=request.getParameter("openid") %>">
                    <input type="hidden" id="oemid" name="oemid" value="<%=request.getParameter("oemid") %>">
                    <input type="hidden" id="tjmrchorgcode" name="tjmrchorgcode" value="<%=request.getParameter("tjmrchorgcode") %>">
                    <input type="hidden" id="qrcode" name="qrcode" value="<%=request.getParameter("qrcode") %>">
                    <input type="hidden" id="tg_on_off" name="tg_on_off" value="<%=request.getParameter("tg_on_off") %>">
                    <!--<div class="content-block-title">请输入手机号与验证码</div>-->
                    <div class="list-block">
                        <ul>
                            <li>
                                <div class="item-content">
                                    <div class="item-media"></div>
                                    <div class="item-inner">
                                        <div class="item-title label ">手机号</div>
                                        <div class="item-input">
                                            <input id="phoneNo" name="phoneNo" type="tel" placeholder="请输入手机号"  >
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="item-content">
                                    <div class="item-media"></div>
                                    <div class="item-inner">
                                        <div class="item-title label ">验证码</div>
                                        <div class="item-input">
                                            <input id="validCode"  name="validCode" type="tel" placeholder="请输入验证码">
                                        </div>
                                        <div class="item-after">
                                        	<input class="obtain_code alert-text" id="btn-loadCode"  type="button" value="获取验证码">
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="item-content">
                                    <div class="item-media"></div>
                                    <div class="item-inner">
                                        <div class="item-title label ">密码</div>
                                        <div class="item-input">
                                            <input id="npassword" onkeydown="resetcps()" name="password" type="tel" placeholder="请输入6-20位密码"  >
                                        </div>
                                                                            </div>
                                </div>
                            </li>
							<li>
                                <div class="item-content">
                                    <div class="item-media"></div>
                                    <div class="item-inner">
                                        <div class="item-title label ">确认密码</div>
                                        <div class="item-input">
                                            <input id="nqpassowrd" name="cpassword" type="tel" placeholder="请输入6-20位密码"  >
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                         <%if("0".equals(request.getParameter("tg_on_off"))){ %>
                        <span style="display:block; margin-top:10px ; margin-left:20px; color:#f3513f">
  							0.38%费率，实时秒到！
						</span>
						<% }%>
                    </div>
                    
                    <div class="content-block">
                        <div class="row">
                            <div class="col-100"><button onclick="oncelogin()" type="button" class="button button-block button-fill button-big "> 立即登录</button></div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/sm/jquery-3.1.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/wechat/layer.m.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/sm/mypublic.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/sm/sm.min.js"></script>
       
	<script type="text/javascript">
			var wait = 60;
			function towait() {
				if (wait == 0) {
					$("#send_code").removeAttr("disabled");
					$("#send_code").attr("value", "发送验证码");
					wait = 60;
				} else {
					$("#send_code").attr("disabled", true);
					$("#send_code").attr("value", "重新发送(" + wait + "s)");
					wait--;
					setTimeout(function() {        
						towait();
					}, 1000);
				}
			}   
			
			//如果没有它input要添加 onClick="towait()"
			$(function(){
				$("#send_code").on('click',function () {
					var url = '';
					var phoneNo=$("#phoneNo").val();
					if(phoneNo==''){
						$.alert('手机号不能为空');
						return;
					}
					if(!isMobile(phoneNo)){
						$.alert("手机号码格式不正确！");
						return;
					}
					towait();
				});
			});
			
			//提交
			function oncelogin(){
				if(checkSmsLoginPhone() && checkCode() && checkPassword()){
					//
					$("#defaultForm").submit();
				}
				else{
					return false;	
				}
			}
			
			//提交时检查手机号
			function checkSmsLoginPhone(){
				var phoneNo = $('#phoneNo').val();   
				if (phoneNo == null || phoneNo == "" ) { // !(/^1(3|4|5|7|8)\d{9}$/.test(uname))  手机号正则
					$.alert("请输入手机号！");
					return false;
				}
				if(!isMobile(phoneNo)){
					$.alert("手机号码格式不正确！");
					return false;
				}else{
					return true;
				}
			}
			
			//手机号格式判断 
			function isMobile(object){
				var pattern = /^1(3|4|5|7|8)\d{9}$/; //原 /^[1]\d{10}$/;  
				return pattern.test(object);
			};	
			
			//检查验证码
			var checkCode = function() {
				var validCode = $("#validCode").val();
				if (validCode == null || validCode == "") {
					$.alert("请输入手机验证码");
					return false;
				}else{
					return true;
				}
			}
			
			//提交时检查密码
			var checkPassword = function() {               
				var password = $("#npassword").val();  //$.trim() 函数用于去除字符串两端的空白字符。
				var cqpassowrd = $("#nqpassowrd").val();
				if (password == null || password == ""  ) {
					$.alert("请输入密码");
					return false;
				}else if (password.length<6 || password.length>20) {
					$.alert("请输入6-20位密码");
					return false;
				}else if (cqpassowrd == null || cqpassowrd == "") {
					$.alert("请确认密码");
					return false;
				}else if (cqpassowrd !=password) {
					$.alert("两次输入的密码不相同");
					return false;
				}else{
					return true;
				}	
			}
			
	</script>

	</body>
</html>
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

		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.11.3.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/wechat/layer.m.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap/bootstrap.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap/bootstrapValidator.min.js"></script>

		<style>
			html,
			body {
				background: #E0DCE2;
				width: 100%;
				overflow-x: hidden;
				font-family: "Helvetica Neue", Helvetica, Arial, "Hiragino Sans GB", "Hiragino Sans GB W3", "Microsoft YaHei UI", "Microsoft YaHei", "WenQuanYi Micro Hei", sans-serif;
			}
			
			.panel-gray {
				border-color: #BCBBC1;
				margin-top: 5px;
				margin-bottom: 0;
			}
			
			.panel-gray>.panel-heading {
				color: #fff;
				background-color: #1B9AF7;
				border-color: #1B9AF7;
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
			
			.container,
			.container-fluid {
				padding: 0 10px;
			}
			
			.form-group {
				margin: 6px 0;
			}
			
			.panel-body {
				padding: 8px;
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
		</style>
		<script type="text/javascript">
			$(function() {
				function sendValidCode() {
					$.post("<%=request.getContextPath()%>/LoginReg/sendValidCode", {
						phoneNo: $("input[name='phoneNo']").val()
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
						validCode: {
							validators: {
								notEmpty: {
									message: '请输入验证码'
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
								}
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
							window.location.href = "<%=request.getContextPath()%>/LoginReg/recoverSucceed?openid=" + $("#openid").val();
						} else {
							layer.open({
								type: 3,
								content: result.desc
							});
						}
					}, 'json');
				});
			});
		</script>
	</head>

	<body>
		<div class="container-fluid">
			<form id="defaultForm" method="post" action="<%=request.getContextPath()%>/LoginReg/recoverPass">
				<div class="panel panel-gray">
					<div class="panel-heading">
						<h3 class="panel-title">重设密码</h3>
					</div>
					<div class="panel-body">
						<input type="hidden" id="openid" name="openid" value="${openid}" />
						<div class="form-group">
							<input type="tel" maxlength="11" class="form-control" name="phoneNo" placeholder="手机号" />
						</div>
						<div class="form-group" style="overflow: hidden;">
							<div class="col-xs-7" style="margin: 0; padding: 0;">
								<input type="tel" maxlength="4" name="validCode" class="form-control" placeholder="验证码" />
							</div>
							<div class="col-xs-5" style="margin: 0;padding: 0;">
								<button id="btn-loadCode" style="margin-left: 10px;" type="button" class="btn btn-default ">
									获取验证码
								</button>
							</div>
						</div>

						<div class="form-group">
							<input type="password"  class="form-control" name="password" placeholder="新密码"/>
						</div>
						<div class="form-group">
							<input type="password" class="form-control" name="cpassword" placeholder="密码确认"/>
						</div>
					</div>
				</div>
				<br />
				<button type="submit" class="button button-block  button-rounded  button-primary ">提交</button>
			</form>
			<p></p>
		</div>

	</body>

</html>
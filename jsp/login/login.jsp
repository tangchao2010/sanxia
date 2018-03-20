<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="renderer" content="webkit" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<title>商户登入</title>
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
		</style>
		<script type="text/javascript">
			$(function() {
				
				$('#defaultForm').bootstrapValidator({
					excluded: ':disabled',
					feedbackIcons: {
						valid: 'glyphicon glyphicon-ok',
						invalid: 'glyphicon glyphicon-remove',
						validating: 'glyphicon glyphicon-refresh'
					},
					fields: {
						username: {
							validators: {
								notEmpty: {
									message: '请输入账号'
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
								}
							}
						}
					}
				});
			});
		</script>
	</head>

	<body>
		<div class="container-fluid">
			<form id="defaultForm" method="post" action="<%=request.getContextPath()%>/LoginReg/login">
				<div class="panel panel-gray">
					<div class="panel-heading">
						<h3 class="panel-title">登入</h3>
					</div>
					<div class="panel-body">
						<div class="errorTip">${errorMessage}</div>
						<input type="hidden" id="openid" name="openid" value="${openid}" />
						<div class="form-group">
							<input type="tel" maxlength="11" class="form-control" name="username" placeholder="登入账号">
						</div>
						<div class="form-group">
							<input type="password" maxlength="30" class="form-control" name="password" placeholder="输入密码">
						</div>
					</div>
				</div>
				<br/>
				<button type="submit" class="button button-block  button-rounded  button-primary ">登入</button>
				<br />
				<p>
					<a style="float: left;" href="<%=request.getContextPath()%>/jsp/login/register.jsp?openid=${openid}">注册账号</a>
					<a style="float: right;" href="<%=request.getContextPath()%>/jsp/login/passwordRecover.jsp?openid=${openid}">忘记密码？</a>
				</p>
			</form>
			<p></p>
		</div>

	</body>

</html>
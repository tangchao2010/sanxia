﻿<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="renderer" content="webkit" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<title>信息提示</title>
		<link href="<%=request.getContextPath()%>/css/bootstrap/bootstrap.min.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/bootstrap/bootstrap-theme.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/bootstrap/bootstrapValidator.min.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/bootstrap/buttons.css" rel="stylesheet" />

		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.11.3.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/wechat/layer.m.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap/bootstrap.min.js"></script>
		<script src="/js/wechat/hideshare_and_toolbar.js"></script>
		<style>
			.container {
				padding-top: 20px;
			}
			
			#tip {
				display: none;
			}
			
			.error.t {
				font-size: 22px;
				font-weight: 600;
				color: #E4721D;
			}
			
			.error.d {
				margin-top: 14px;
			}
			
			.error.d .t {
				font-size: 16px;
				font-weight: 500;
			}
			
			.error.d p {
				font-size: 14px;
				color: #7A7A7A;
				font-weight: 500;
				margin-top: 14px;
			}
			
			.error.c {
				text-align: right;
				color: #7A7A7A;
			}
		</style>
		<script type="text/javascript">
		  setTimeout(reford,"3000");//二秒后执行
		  function reford(){
		        try{
		           // WeixinJSBridge.call("closeWindow");
		           window.location.href="<%=request.getContextPath()%>/Manage/machManage?openid=${openid}&oemid=${oemid}";
		        }catch(e){};
		   }
		</script>
	</head>

	<body>
		<div class="container">
			<span class="error t">获取参数失败</span>

			<div class="error d">
				<p>${errorMessage}</p>
				<p>·对不起,由于获取本地参数失败导致系统不能正常使用，请您关闭页面重新尝试。</p>
			</div>
			<div class="error c">
				3秒后自动关闭
			</div>
		</div>

	</body>

</html>

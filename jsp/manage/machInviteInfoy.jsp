<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="renderer" content="webkit" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<title>我的推广码</title>
		<link href="<%=request.getContextPath()%>/css/bootstrap/bootstrap.min.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/bootstrap/bootstrap-theme.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/bootstrap/bootstrapValidator.min.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/bootstrap/buttons.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/webuploader.css" rel="stylesheet" />
        <link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" />

		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.11.3.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/wechat/layer.m.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap/bootstrap.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap/bootstrapValidator.min.js"></script>
		<style>
		.tgm_containerz{
			background:#27af27;
			position:relative;
		}
		.tgm_container {
			text-align:center;
			color:#fff;
			font-size:.32rem;
			padding-top:.4rem;
			padding-bottom:.2rem;
		}
		.tgm_container dt ,.tgm_container dd{
			line-height:.6rem;	
		}
		.tgm_container a{ 
			text-decoration:none; 
			color:#fff;
		}
		.tgm_container1 img{
			width:.96rem;
			height:.96rem;
			border-radius:.96rem;
			border:solid 1px #fff;
			margin-top:.7rem;
			margin-bottom:.26rem;	
			position:relative;
		}
		.sh_icon img{
			position:absolute;
			width:.34rem;
			height:.34rem;
			margin-top:.4rem;
			margin-left:-.4rem;	
		}
		.tgm_containerz p{ 
			text-align:center;
			color:#fff;
			font-size:.32rem;
			padding-bottom:.32rem;
		}
		.tgm_containerz p strong{
			font-weight:normal;	
		}
		.qrcode_yh img{
		 width:100%;
  		 height:.2rem;
		}
		.tgm_containerm{
			margin-top:1rem;
		}
		.tgm_containerm span img{
			display:block;
			margin:auto;
		}
		.tgm_codes img{
			width:4.8rem;
			height:.64rem;
		}
		.tgm_code img{
			width:4rem;
			height:4rem;	
		}
		
    	.wcbButton {
			margin-top: 20%;
			text-align: center;
			margin-left: .3rem;
			margin-right: .3rem;
		}
		.wcbButton button {
			height: .86rem;
			border-radius: 4px;
			text-shadow: none;
			background: #27af27;
			border: none;
			width: 100%;
			margin: auto;
			font-size: .36rem;
			color: #fff;
		}
        </style>
        <script>
			(function () {
				document.addEventListener('DOMContentLoaded', function () {
					var html = document.documentElement;
					var windowWidth = html.clientWidth;
					html.style.fontSize = windowWidth / 7.5 + 'px';
				}, false);
			})();
			
			  function an(){
	            	var orgCode=document.getElementById("orgCode").value;
	            	window.location.href="<%=request.getContextPath()%>/Manage/machInviteInfoUI?orgCode="+orgCode+"&curPage="+1;
	            }
			  function bn(){
	            	var orgCode=document.getElementById("orgCode").value;
	            	window.location.href="<%=request.getContextPath()%>/Manage/machInviteInfoUItwo?orgCode="+orgCode+"&curPage="+1;
	            }
		</script>
	</head>
	<body style=" background:#fff;">
        <div class="container-fluid" >
        	<div class="tgm_containerz">
        	<input type="hidden" id="openid" name="openid" value="${openid}">
			<input type="hidden" id="oemid" name="oemid" value="${oemid}">
			<input type="hidden" id="orgCode" name="orgCode" value="${orgnaization.baseOrgCode}">
                <dl class="tgm_container">
                	<dt>推广人：<a>${orgnaization.baseOrgName}</a></dt>
                    <dd>推广码：<a>${qri}</a></dd>
                </dl> 
          	</div>
			<div class="qrcode_yh">
            	<img  src="<%=request.getContextPath()%>/img/wcb/person_codeh.png">
            </div>
            <div class="tgm_containerm">
                <span class="tgm_code">
                    <img  src="<%=request.getContextPath()%>/QRCode/qrview?qrcode=${qrcode}">
                </span>
            </div>
            <div class="wcbButton">
                <button id=" rePayment" onClick="an()" >已推广(一级)</button>
            </div>
            <c:if test="${tg_on_off eq '0' }">
            <div class="wcbButton" style=" margin-top:.3rem;">
                <button id=" rePayment" onClick="bn()" >已推广(二级)</button>
            </div>
            </c:if>
        </div>       
	</body>

</html>
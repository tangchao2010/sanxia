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
		<title>收款码</title>
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
		.yqm_containerz{
			background:#27af27;
		}
		.yqm_container {
			display: -webkit-box;
			display: -webkit-flex;
			display: -ms-flexbox;
			display: flex;
			-ms-flex-align: center;
			-webkit-box-align: center;
			box-align: center;
			-webkit-align-items: center;
			align-items: center;
			text-decoration: none;
			justify-content: center; 
		}
		.yqm_container1 img{
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
		.yqm_containerz p{ 
			text-align:center;
			color:#fff;
			font-size:.32rem;
			padding-bottom:.32rem;
		}
		.qrcode_yh img{
		 width:100%;
  		 height:.2rem;
		}
		.yqm_containerm{
			margin-top:.46rem;
		}
		.yqm_containerm span img{
			display:block;
			margin:auto;
		}
		.yqm_codes img{
			width:3.54rem;
			height:.64rem;
		}
		.yqm_code img{
			width:4rem;
			height:4rem;	
		}
		.yqm_codez img{
			width:3.46rem;
			height:.84rem;	
		}
		.yqm_codet{ display:block; margin-top:.36rem;}
		.yqm_codet img{
			width:3.72rem;
			height:.28rem;
		}
		.yqm_text{ margin-top:.08rem; }
		.yqm_text dd{
			font-size:.26rem;
			text-align:center;	
		}
		.yqm_text dd a{
			color:#27af27;
			text-decoration:none;	
		}
		.qrcode_bh{ margin-top:.36rem; margin-bottom:.1rem;}
		.qrcode_bh dd{
			color:#000; font-size:.18rem;
			line-height:.32rem;
			text-align:center;
		}
		.qrcode_bh dd a{
			color:#000;
			text-decoration:none;	
		}
		.yqm_containerz p strong{
			font-weight:normal;	
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
		</script>
	</head>
	<body style=" background:#fff;">
        <div class="container-fluid" >
        	<div class="yqm_containerz">
                <div class="yqm_container">
                    <div class="yqm_container1">
                        <img  src="<%=request.getContextPath()%>/img/imgs/invite_photo.jpg">
                    </div>
                    <span class="sh_icon">
                        <img  src="<%=request.getContextPath()%>/img/wcb/sh_icon.png">
                    </span>
                </div> 
                <p>我是&nbsp;<strong>${mrchname}</strong></p>
          	</div>
			<div class="qrcode_yh">
            	<img  src="<%=request.getContextPath()%>/img/wcb/person_codeh.png">
            </div>
            <div class="yqm_containerm">
            	<span class="yqm_codes">
            		<img  src="<%=request.getContextPath()%>/img/wcb/person_codes.png">
                </span>
                <span class="yqm_code">
                	<img  src="<%=request.getContextPath()%>/QRCode/qrview?qrcode=${qrcode}">
                </span>
                <span class="yqm_codez">
            		<img  src="<%=request.getContextPath()%>/img/wcb/person_code.png">
                </span>
                <span class="yqm_codet">
            		<img  src="<%=request.getContextPath()%>/img/wcb/person_codet.png">
                </span>
                <dl class="yqm_text">
                	<dd>推广1周，日赚<a>3千+</a>，月入<a>5万+</a>!</dd>
					<dd>有人教，有人带，已有30万创业会员！</dd>
                    <dd style="font-size:.2rem; padding-top:.04rem;">0.38%费率实时秒到 / 手机秒变POS机</dd>
					<dd style="font-size:.2rem;">返佣、分润实时结算 / 信用卡、储蓄卡、轻松支付</dd>
                </dl>
            </div>
              <dl class="qrcode_bh">
              	<dd>编号:&nbsp;<a>00030482</a>
                <dd>客服电话：&nbsp;<a href="tel:400-114-3788">400-114-3788</a>
              </dl>
        </div>       
	</body>

</html>
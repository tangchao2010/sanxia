<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="renderer" content="webkit" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<title>邀请码</title>
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
			position:relative;
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
			/*justify-content: center;*/ 
			padding-top:.6rem;
		}
		.yqm_container1 img{
			width:.96rem;
			height:.96rem;
			border-radius:.96rem;
			border:solid 1px #fff;
			position:relative;
			margin-left:.3rem;
		}
		.sh_icon img{
			position:absolute;
			width:.34rem;
			height:.34rem;
			margin-top: .2rem;
    		margin-left: -.3rem
		}
		.yqm_container dl{
			margin-left:.2rem;
			font-size:.3rem;
			color:#fff;	
		}
		.shy_dy{
			font-size:.22rem;
			color:#fff;
			width:2.7rem;
			padding-right: .3rem;
			border-radius:4rem ;
			-webkit-border-radius:4rem;
			line-height: .42rem;
			padding-left:.24rem;
			background:#000;
			opacity:0.4;
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
			width:3.54rem;
			height:.84rem;	
		}
		.yqm_code3{ display:block; margin-top:.5rem; padding-bottom:.3rem;}
		.yqm_code3 img{
			width:6.84rem;
			height:.51rem;
			display:block;
			margin:auto;
			margin-bottom:.18rem;	
		}
		.yqm_code3 a{
			color:#fce537;
			text-decoration:none;	
		}
		
		.yqm_code3 dd{
			color:#fff;
			text-align:center;
			font-size:.3rem;	
		}
		.yqm_text{ margin-top:.22rem; }
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
						<c:if  test="${hredpic =='' }">
            			<img  src="<%=request.getContextPath()%>/img/imgs/invite_photo.jpg">
            			</c:if>
						<c:if  test="${hredpic !='' }">
            			<img  src="${hredpic }">
						 </c:if>
                    </div>
                    <span class="sh_icon">
                        <img  src="<%=request.getContextPath()%>/img/wcb/sh_icon.png">
                    </span>
                    <dl>
                    	<dd>我是&nbsp;<strong>${machName}</strong></dd>
                    	<dd class="shy_dy">我为${platform_oemname }代言</dd>
                    </dl>
                </div> 
                <dl class="yqm_code3">
            		<img  src="<%=request.getContextPath()%>/img/wcb/person_code3.png">
                	<dd>推广1周，日赚<a>3千+</a>，月入<a>5万+</a>!</dd>
					<dd>有人教，有人带，已有30万创业会员！</dd>
                </dl>
          	</div>
			<div class="qrcode_yh">
            	<img  src="<%=request.getContextPath()%>/img/wcb/person_codeh.png">
            </div>
            <div class="yqm_containerm">
           		 <span class="yqm_codes">
            		<img  src="<%=request.getContextPath()%>/img/wcb/person_codes2.png">
                </span>
                <span class="yqm_code">
                    <img  src="<%=request.getContextPath()%>/QRCode/qrview?qrcode=${qrcode}">
                </span>
                <span class="yqm_codez">
            		<img  src="<%=request.getContextPath()%>/img/wcb/person_code.png">
                </span>
                <c:if test="${tg_on_off eq '0' }">
                <dl class="yqm_text">
                    <dd style="font-size:.2rem; padding-top:.04rem;">0.38%费率实时秒到 / 手机秒变POS机</dd>
					<dd style="font-size:.2rem;">返佣、分润实时结算 / 信用卡、储蓄卡、轻松支付</dd>
                </dl>
                </c:if>
                 <c:if test="${tg_on_off ne '0' }">
                <dl class="yqm_text">
                    <dd style="font-size:.2rem; padding-top:.04rem;">超低费率实时秒到 / 手机秒变POS机</dd>
					<dd style="font-size:.2rem;">返佣、分润实时结算 / 信用卡、储蓄卡、轻松支付</dd>
                </dl>
                </c:if>
            </div>
              <dl class="qrcode_bh">
             	<dd>编号:&nbsp;<a>00030482</a>
                <dd>客服电话：&nbsp;<a href="tel:400-114-3788">400-114-3788</a>
              </dl>
        </div>       
	</body>
</html>
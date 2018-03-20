<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>邀请码</title>
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1, maximum-scale=1">
    <link rel="shortcut icon" href="/favicon.ico">
    <meta name="apple-mobile-web-app-capable" content="yes">  <!--删除默认的苹果工具栏和菜单栏-->
    <meta name="apple-mobile-web-app-status-bar-style" content="black"> <!-- 控制状态栏显示样式-->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/sm/sm.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/sm/mystyle.css">
    <style>
		.page, .page-group{
			background: -webkit-linear-gradient(#ffb80f, #e29f00);
  			background: -o-linear-gradient(#ffb80f, #e29f00); 
  			background: -moz-linear-gradient(#ffb80f, #e29f00); 
  			background: linear-gradient(#ffb80f, #e29f00); 
		}
		.manage_bac{ bottom:-1px;}
		.text-center em{ font-size:.8rem; font-style:normal; opacity:1;}
		.bar{
			background:none;
		}
		.mybar .title{ color:#fff;}
		.mybar .icon{ color:#fff;}
		.bar:after{ height:0;}
		.manage_contaienr_top {
    		background: #007bc8;
		}
		.qrcodebottom{
		   margin-top:1.6rem;
		}
		.qrcodebottom img {
			width: 14rem;
			opacity: 0.9;
		}
    </style>
	</head>
	<body>
   	<div class="page-group">
		<div class="page page-current">
        	<header class="bar bar-nav mybar">
                <!--<a class="icon icon-left pull-left back"></a>-->
                <h1 class='title'>邀请码</h1>
            </header>
            
            <div class="content dashboard native-scroll" >
            	<div class="qrcode_bac">
                	<dl class="inputPay_top">
                        <c:if  test="${hredpic =='' }">
            			<!--<img  src="<%=request.getContextPath()%>/img/imgs/invite_photo.jpg">-->
            			</c:if>
						<c:if  test="${hredpic !='' }">
            			<img  src="${hredpic }">
						</c:if>
                        <dd>${machName}</dd>
                    </dl>
                    	
                    <div class="qrcode_ewm">
                    	<span>扫一扫加入我们</span>
                    	<img  src="<%=request.getContextPath()%>/QRCode/qrview?qrcode=${qrcode}">
                       	<!--<p></p>
                        <ul class="lpbulic">
                        	<li></li>
                            <li></li>
                        </ul>-->
                        <div class="lpbulic qrcodeicon">
                        	<!--<img src="<%=request.getContextPath()%>/img/wcb/alipay.png" />
                            <img src="<%=request.getContextPath()%>/img/wcb/wpay.png" />
                            <img src="<%=request.getContextPath()%>/img/wcb/ewmjd.png" />
                            <img src="<%=request.getContextPath()%>/img/wcb/ewmbd.png" />
                            <img src="<%=request.getContextPath()%>/img/wcb/ewmunion.png" />-->
                        </div>
                    </div>
                </div>
                
                <dl class="qrcodebottom">
                	<img src="<%=request.getContextPath()%>/img/wcb/invitebot.png" />
                    <!--<dd>客服电话：&nbsp;<a href="tel:400-114-3788">400-114-3788</a>-->
            	</dl>
                
            </div>
            
    	</div>        
	</div>            
	</body>

</html>
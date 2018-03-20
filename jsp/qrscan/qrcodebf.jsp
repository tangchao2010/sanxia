<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>收款码</title>
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1, maximum-scale=1">
    <link rel="shortcut icon" href="/favicon.ico">
    <meta name="apple-mobile-web-app-capable" content="yes">  <!--删除默认的苹果工具栏和菜单栏-->
    <meta name="apple-mobile-web-app-status-bar-style" content="black"> <!-- 控制状态栏显示样式-->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/sm/sm.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/sm/mystyle.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/sm/font-awesome.min.css">
    <style>
		.page, .page-group{
			background: -webkit-linear-gradient(#04a7ea, #007bc8);
  			background: -o-linear-gradient(#04a7ea, #007bc8); 
  			background: -moz-linear-gradient(#04a7ea, #007bc8); 
  			background: linear-gradient(#04a7ea, #007bc8); 
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
    </style>
	</head>
	<body>
   	<div class="page-group">
		<div class="page page-current">
        	<header class="bar bar-nav mybar">
                <!--<a class="icon icon-left pull-left back"></a>-->
                <h1 class='title'>收款码</h1>
            </header>
            
            <div class="content dashboard native-scroll" >
            	<div class="qrcode_bac">
                	<dl class="inputPay_top">
                    	<img src="<%=request.getContextPath()%>/img/wcb/achieve_photo.jpg" />
                        <dd>我是商户甲你咬我</dd>
                    </dl>
                    	
                    <div class="qrcode_ewm">
                    	<span>扫描下发二维码，完成付款</span>
                    	<img src="<%=request.getContextPath()%>/img/wcb/zjewm.jpg" />
                       	<p></p>
                        <ul class="lpbulic">
                        	<li></li>
                            <li></li>
                        </ul>
                        <div class="lpbulic qrcodeicon">
                        	<img src="<%=request.getContextPath()%>/img/wcb/ewmzfb.png" />
                            <img src="<%=request.getContextPath()%>/img/wcb/ewmwx.png" />
                            <img src="<%=request.getContextPath()%>/img/wcb/ewmjd.png" />
                            <img src="<%=request.getContextPath()%>/img/wcb/ewmbd.png" />
                            <img src="<%=request.getContextPath()%>/img/wcb/ewmunion.png" />
                        </div>
                    </div>
                </div>
                
                <dl class="qrcodebottom">
                	<dd>编号:&nbsp;<a>00030482</a>
                    <dd>客服电话：&nbsp;<a href="tel:400-114-3788">400-114-3788</a>
            	</dl>
                
            </div>
            
    	</div>        
	</div>            
   <!--     <div class="container-fluid" >
        	<div class="yqm_containerz">
                <div class="yqm_container">
                    <div class="yqm_container1">
						<c:if  test="${hredpic =='' }">
            			<img src="<%=request.getContextPath()%>/img/imgs/invite_photo.jpg">
            			</c:if>
						<c:if  test="${hredpic !='' }">
            				<img src="${hredpic }">
						</c:if>
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
            	
                <span class="yqm_code">
                	<img  src="<%=request.getContextPath()%>/QRCode/qrview?qrcode=${qrcode}">
                </span>
             
          
            </div>
              <dl class="qrcode_bh">
              	<dd>编号:&nbsp;<a>00030482</a>
                <dd>客服电话：&nbsp;<a href="tel:400-114-3788">400-114-3788</a>
              </dl>
        </div> -->      
	</body>

</html>
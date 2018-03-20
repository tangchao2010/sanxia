<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<title>我的推广码</title>
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1, maximum-scale=1">
    <link rel="shortcut icon" href="/favicon.ico">
    <meta name="apple-mobile-web-app-capable" content="yes">  <!--删除默认的苹果工具栏和菜单栏-->
    <meta name="apple-mobile-web-app-status-bar-style" content="black"> <!-- 控制状态栏显示样式-->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/sm/sm.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/sm/mystyle.css">
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
		.qrcodebottom{
		   margin-top:1.6rem;
		}
		.qrcode_bac  dl{
			margin: 0;
			padding-top: .5rem;
			padding-bottom: .5rem;
			padding-left: .75rem;
		}
		
    </style>
	</head>
	<body>
   	<div class="page-group">
		<div class="page page-current">
        	<header class="bar bar-nav mybar">
                <!--<a class="icon icon-left pull-left back"></a>-->
                <h1 class='title'>推广码</h1>
            </header>
            
            <div class="content dashboard native-scroll" >
            	<input type="hidden" id="openid" name="openid" value="${openid}">
				<input type="hidden" id="oemid" name="oemid" value="${oemid}">
				<input type="hidden" id="orgCode" name="orgCode" value="${orgnaization.baseOrgCode}">
                
            	<div class="qrcode_bac">
                	<dl class="inputPay_top">
                    	<dt>推广人</dt>
                        <dd>${orgnaization.baseOrgName}</dd>
                    </dl>
                    	
                    <div class="qrcode_ewm">
                    	<img src="<%=request.getContextPath()%>/QRCode/qrview?qrcode=${qrcode}">
                       	<p></p>
                        <ul class="lpbulic">
                        	<li></li>
                            <li></li>
                        </ul>
                        <dl class="tgcode" style=" background:none;">
                         	<dd class="shareLoana" id=" rePayment" onClick="an()" >已推广(一级)</dd>
                            
                            <c:if test="${tg_on_off eq '0' }">
                            <dd  class="shareLoana" id=" rePayment" onClick="bn()" >已推广(二级)</dd>
                            </c:if>
                        </dl>
                    </div>
                </div>
                
                <dl class="qrcodebottom" >
                	<dd style="opacity:0.8">推广码:&nbsp;<a>${qri}</a>
            	</dl>
                
            </div>
            
    	</div>        
	</div>  
    
	<script>
		function an(){
			var orgCode=document.getElementById("orgCode").value;
			window.location.href="<%=request.getContextPath()%>/Manage/machInviteInfoUI?orgCode="+orgCode+"&curPage="+1;
		}
		 function bn(){
			var orgCode=document.getElementById("orgCode").value;
	   		window.location.href="<%=request.getContextPath()%>/Manage/machInviteInfoUItwo?orgCode="+orgCode+"&curPage="+1;
		 }
    </script>
              
	</body>
</html>
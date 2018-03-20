<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>审核中</title>
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1, maximum-scale=1">
    <link rel="shortcut icon" href="/favicon.ico">
    <meta name="apple-mobile-web-app-capable" content="yes">  <!--删除默认的苹果工具栏和菜单栏-->
    <meta name="apple-mobile-web-app-status-bar-style" content="black"> <!-- 控制状态栏显示样式-->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/sm/sm.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/sm/mystyle.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/sm/font-awesome.min.css">
	</head>
	<body>
	<div class="page-group">
		<div class="page page-current">
        	<header class="bar bar-nav">
                <a class="icon icon-left pull-left back"></a>
                <h1 class='title'>审核中</h1>
            </header>
            <div class="content">
            	<span class="wcb_logo"><img style=" height:5.2rem" src="<%=request.getContextPath()%>/img/wcb/wcb_sh.png"></span>
            	<span></span>
                <div class="content-padded" style="margin-top:1rem;">
                	<p style=" font-size:.75rem; color:#666; ">您提交的资料正在审核中，开通后会以微信消息通知您，请注意查收</p>
            	</div>
            </div>
        </div>
    </div>
     
	<!--<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.11.3.min.js"></script>-->
	<script type='text/javascript' src='//g.alicdn.com/sj/lib/zepto/zepto.min.js' charset='utf-8'></script>
	<script type='text/javascript' src='//g.alicdn.com/msui/sm/0.6.2/js/sm.min.js' ></script> 
    
    <script>
    	function merch_off(){
		        try{
		            WeixinJSBridge.call("closeWindow");
		        }catch(e){};
		   }
    </script>
	</body>
</html>
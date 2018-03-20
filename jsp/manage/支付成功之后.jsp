<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1, maximum-scale=1">
    <link rel="shortcut icon" href="/favicon.ico">
    <meta name="apple-mobile-web-app-capable" content="yes">  <!--删除默认的苹果工具栏和菜单栏-->
    <meta name="apple-mobile-web-app-status-bar-style" content="black"> <!-- 控制状态栏显示样式-->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/sm/sm.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/sm/mystyle.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/sm/font-awesome.min.css">
    <style>
    .sfpaysuc{
		padding-top:1.5rem;
		background:#fff;
	}
	.sfpaysuc img{
		display: block;
		margin:auto;	
		width:3rem;
		height:3rem;
	}
	.sfpaysuc span{
		display:block;
		text-align:center;	
		color:#0368b1;
		font-weight:500;
		padding-top:.75rem;
		padding-bottom:1.5rem;
	}
	.sfbottom{
		margin-bottom: .75rem;
		bottom:0;
		position: fixed;
		width:100%;
	}
	.sfbottom img{
		display: block;
		margin:auto;
	}
    </style>
	</head>
	<body>
	<div class="page-group">
		<div class="page page-current">
        	<header class="bar bar-nav">
                <a class="icon icon-left pull-left" onclick="javascript:history.back(-1);"></a>
                <button id="rechfail" class="button button-link button-nav pull-right" onClick="merch_off()">关闭&nbsp;&nbsp;</button>
                <h1 class='title'>支付成功</h1>
            </header>
            <div class="content">
            	<div  class="sfpaysuc">
                	<img src="<%=request.getContextPath()%>/img/wcb/wcb_success.png">
                  	<span>支付成功</span>
                </div>
                <div class="sfbottom"><img style=" width:3rem;" src="<%=request.getContextPath()%>/img/wcb/tecsanxia.png"></div>
            </div>
        </div>
    </div>
     
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/sm/jquery-3.1.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/sm/mypublic.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/sm/sm.min.js"></script>
    
    <script>
    	function merch_off(){
			$("#rechfail").click(function(){
				window.location.href="http://www.baidu.com";	 
			})
		}
    </script>
	</body>
</html>
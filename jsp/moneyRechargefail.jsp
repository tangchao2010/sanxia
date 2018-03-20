<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>支付失败</title>
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
                <a class="icon icon-left pull-left" onclick="javascript:history.back(-1);"></a>
                <button id="rechfail" class="button button-link button-nav pull-right" onClick="merch_off()">关闭&nbsp;&nbsp;</button>
                <h1 class='title'>支付失败</h1>
            </header>
            <div class="content">
            	<div  class="moneyrsucmain">
                    <div class="moneyrsuctop moneyrsucpub" >
                        <img src="<%=request.getContextPath()%>/img/wcb/wcb_fail.png">
                        <span>支付失败</span>
                    </div>
                </div>
                
              <!--   <div class="content-block mybutton">
                        <div class="row">
                            <a href="javascript:;">
                                <div class="col-100">
                                    <button onclick="gopay()" type="button" class="button button-block button-fill button-big prompt-title-ok">重新支付</button>
                                 </div>
                            </a>
                        </div>
				</div> -->
                
            </div>
            
        </div>
    </div>
     
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/sm/jquery-3.1.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/sm/mypublic.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/sm/sm.min.js"></script>
    
    <script>
    	function merch_off(){
    		  $("#rechfail").click(function(){
  				window.location.href="<%=request.getContextPath()%>/wode/zichan?orgCode=${orgCode}&oemid=${oemid}&openid=${openid}";	 
  			})
		}
    </script>
	</body>
</html>
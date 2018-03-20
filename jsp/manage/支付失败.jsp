<!DOCTYPE html>
<html>
<head>
	<title>支付失败</title>
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1, maximum-scale=1">
    <link rel="shortcut icon" href="/favicon.ico">
    <meta name="apple-mobile-web-app-capable" content="yes">  <!--删除默认的苹果工具栏和菜单栏-->
    <meta name="apple-mobile-web-app-status-bar-style" content="black"> <!-- 控制状态栏显示样式-->
    <meta name="format-detection" content="telephone=no" /><!--禁止拨打电话-->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/sm/sm.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/sm/mystyle.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/sm/font-awesome.min.css">
	</head>
	<body> 
	<div class="page-group">
		<div class="page page-current">
        	<!--<header class="bar bar-nav">
                <h1 class='title'>支付成功</h1>
            </header>-->
            <div class="content" >
                    <div class="merch_success_container" >
                        <span class="merch_success_top"><img src="<%=request.getContextPath()%>/img/wcb/wcb_success.png"></span>
                        <em>支付成功</em>
                        <em style=" font-size:.68rem; color:#858585; margin-top: .1rem;">您已成为小夏专员</em>
                        <span style="height:.3rem;"></span>
                    </div>
                    
            	<div class="content-block">
                	<div class="row">
                		<div class="col-100"><button onclick="merchSubmit()" type="button" class="button button-block button-fill button-big">关闭</button></div>
                	</div>
				</div>        
            </div>
        </div>
    </div>
     
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/sm/jquery-3.1.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/sm/mypublic.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/sm/sm.min.js"></script>
    <script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
    
    <script>
		function merchSubmit(){
			$.showIndicator();
			window.location.href="";
		}
    </script>
	</body>
</html>
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
                <!--<a class="icon icon-left pull-left back"></a>-->
                <button class="button button-link button-nav pull-right" onClick="merch_off()">关闭&nbsp;&nbsp;</button>
                <h1 class='title'>支付失败</h1>
            </header>
            <div class="content">
                    <div class="merch_success_container" >
                        <span class="merch_success_top"><img src="<%=request.getContextPath()%>/img/wcb/wcb_fail.png"></span>
                        <em>支付失败</em>
                        <span style="height:.3rem;"></span>
                    </div>
                    <div class="content-padded" style="margin-top:1rem;">
                    	<p style=" font-size:.75rem; color:#666; ">${error_code}: ${error_desc}</p>
                    </div>
                    
            	<!--<div class="content-block">
                	<div class="row">
                		<div class="col-100"><button onclick="merchSubmit()" type="button" class="button button-block button-fill button-big "> 去修改</button></div>
                	</div>
				</div>-->
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
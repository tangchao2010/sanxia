<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>注册成功</title>
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1, maximum-scale=1">
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
                <button class="button button-link button-nav pull-right"  onclick="reford()">关闭&nbsp;&nbsp;</button>
                <h1 class='title'>注册成功</h1>
            </header>
            <div class="content">
				<input type="hidden"  id="oemid" value="${oemid }"/>  
          	 	<input type="hidden"  id="orgCode" value="${orgCode }"/>  
          	 	<input type="hidden"  id="openid" value="${openid }"/>  
             
                    <div class="merch_success_container" >
                        <span class="merch_success_top"><img src="<%=request.getContextPath()%>/img/wcb/wcb_success.png"></span>
                        <em>感谢您的注册，请关注公众号</em>
                        <span style="height:.3rem;"></span>
                    </div>
                    <div class="merch_success_gzh">
                        <p style="color:#073348; font-size:16px; text-align:center; font-family:'微软雅黑';">${oemname}</p>
                        <span><img src="<%=request.getContextPath()%>/img/imgs/phoneKe.png"></span>
                        <dl>
                            <img src="http://open.weixin.qq.com/qr/code/?username=${weixinname}">
                            <dt>长按识别二维码关注</dt>
                            <dd>公众号：<a>${weixinname}</a></dd>
                            <dd>服务热线：<a>${linkphone}</dd>
                        </dl>
                    </div>
            </div>
        </div>
	</div>
    <script type='text/javascript' src="<%=request.getContextPath()%>/js/sm/jquery-3.1.min.js" charset='utf-8'></script>
	<script type='text/javascript' src="<%=request.getContextPath()%>/js/sm/mypublic.js" ></script> 
	<script type='text/javascript' src="<%=request.getContextPath()%>/js/sm/sm.min.js" ></script> 
    
	<script type="text/javascript">
		function onBridgeReady(){
			 WeixinJSBridge.call('hideOptionMenu');
			}

			if (typeof WeixinJSBridge == "undefined"){
			    if( document.addEventListener ){
			        document.addEventListener('WeixinJSBridgeReady', onBridgeReady, false);
			    }else if (document.attachEvent){
			        document.attachEvent('WeixinJSBridgeReady', onBridgeReady); 
			        document.attachEvent('onWeixinJSBridgeReady', onBridgeReady);
			    }
			}else{
			    onBridgeReady();
			}
		
		  //setTimeout(reford,"3000");//二秒后执行
		  function reford(){
		        try{
		            WeixinJSBridge.call("closeWindow");
		        }catch(e){};
		   }
	</script>

	</body>
</html>
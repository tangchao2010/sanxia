<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="renderer" content="webkit" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<title>支付成功</title>
	<link href="<%=request.getContextPath()%>/css/bootstrap/bootstrap.min.css" rel="stylesheet" />
	<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" />
    <link href="<%=request.getContextPath()%>/css/wcbstyle.css" rel="stylesheet" />
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
<body style="background:#f2f2f2">
	<div class="container-fluid">    	
		<div class="wcb_container">
        	<div class="zfsuc-top" >
            	<img  src="<%=request.getContextPath()%>/img/imgs/paySuc.png">
                <span>支付成功</span>
                <em>您已开通&nbsp;<a>${goodsName }</a>&nbsp;</em>
                <span style="height:.3rem;"></span>
            </div>
            <div class="zfsuc-phone">
            	<span><img src="<%=request.getContextPath()%>/img/imgs/phoneKe.png"></span>
                <dl>
                    <img src="<%=request.getContextPath()%>/img/imgs/wcbewn.png">
                    <dt>长按识别二维码关注</dt>
                    <dd>公众号：OEM公众号</dd>
					<dd>网址：  www.xx.com</dd>
                    <dd>服务热线:400-114-3788</dd>
                </dl>
            </div>
            <button class="sucbutton" id="sucbutton" onclick="sucbuttona();return false;">关闭</button>
		</div>  
	</div>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.11.3.min.js"></script>
    <script>
    	$("#sucbutton").click(function(){
				try{
		            WeixinJSBridge.call("closeWindow");
		        }catch(e){};
		});
    </script>
    
</body>
</html>

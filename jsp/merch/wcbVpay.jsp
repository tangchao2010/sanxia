<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="renderer" content="webkit" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="initial-scale=1,maximum-scale=1, minimum-scale=1">
	<title>扫码未付款</title>
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
<body style=" background:#f2f2f2"">
    <section class="wcb-main-container">
    	<div class="wcb-main">
            <img src="<%=request.getContextPath()%>/img/imgs/userPhoto.jpg" >
            <dl>
                <dt>${orgName }</dt>
                <dd>Tel:${orgPhone }</dd>
            </dl>
        </div>
        
         <div class="wcb-body">
        	<span>商户暂未开此项业务！</span>
        </div>
    </section>
    <!--弹框-->
 
    <div class="wcbButton">
    	<button  id="rePayment" onclick="sucbuttona();return false;">关闭</button>
    </div>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.11.3.min.js"></script>
    <script>
			$("#rePayment").click(function(){
				try{
		            WeixinJSBridge.call("closeWindow");
		        }catch(e){};
			});
    </script>
    
</body>
</html>


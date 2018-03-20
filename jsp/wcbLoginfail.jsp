<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="renderer" content="webkit" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<title>注册失败</title>
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
            	<img  src="<%=request.getContextPath()%>/img/imgs/payFail.png">
                <span>支付失败</span>
                <em>您的订单&nbsp;<a>${goodsName }</a>&nbsp;</em>
                <em>金额&nbsp;<a>${money }</a>&nbsp;未支付成功！</em>
                <span style="height:.3rem;"></span>
            </div>
            
            <div class="wcbButton">
                <button id="sucbutton" onclick="sucbuttona();return false;" >关闭</button>
            </div>
		</div>  
	</div>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.11.3.min.js"></script>
    <script>
		function rePayment(){
			window.location.href="www.baidu.com" ;
		}
		
			$("#sucbutton").click(function(){
				try{
		            WeixinJSBridge.call("closeWindow");
		        }catch(e){};
			});
		
	
	
	//$(function(){
//		$("#rePayment").on("click",function(){
//			window.location.href="../../example_learn/aq.suning.com/input_zc.html" ;			
//		})
//	})
    
    </script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="renderer" content="webkit" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="initial-scale=1,maximum-scale=1, minimum-scale=1">
	<title>确认选择</title>
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
   <!-- <script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>  -->
        
		<script type="text/javascript">  
          //{""jsapi_appid":"wx5d4aa509b7a68610","jsapi_timestamp":"1479372886638","jsapi_noncestr":"8c2b0d6df02f46458031953e9331fcb3","jsapi_package":"prepay_id=wx20161117165445e51031033e0250610121","jsapi_signtype":"MD5","jsapi_paysign":"2D123F0971F9AF01EE040BCF92191192","nonce_str":"ZOs7ycPHtO","sign":"C3961F5C604BAEA613629232357F4F48"}

                function jsApiCall(){  
                	
                   WeixinJSBridge.invoke(  
                       'getBrandWCPayRequest', {  
                           "appId": "${weiXinPay.appId}",  
                            "timeStamp": "${weiXinPay.timeStamp}",  
                            "nonceStr": "${weiXinPay.nonceStr}",  
                            "package": "${weiXinPay.packagepay}",  
                            "signType": "${weiXinPay.signType}",  
                            "paySign": "${weiXinPay.paySign}"  
                       },  
                       function(res){  
                    	   
                          if (res.err_msg == "get_brand_wcpay_request:ok") {  
                        
                             // 使用以上方式判断前端返回,微信团队郑重提示：res.err_msg将在用户支付成功后返回ok，但并不保证它绝对可靠。   
                         }  
                         else if (res.err_msg == "get_brand_wcpay_request:cancel") {  
                        	
                        	
                             // 使用以上方式判断前端返回,微信团队郑重提示：res.err_msg将在用户支付成功后返回ok，但并不保证它绝对可靠。   
                         }  
                         else if (res.err_msg == "get_brand_wcpay_request:fail") {  
                        	
                             // 使用以上方式判断前端返回,微信团队郑重提示：res.err_msg将在用户支付成功后返回ok，但并不保证它绝对可靠。   
                         } 
                       }  
                   );   
                }  
                  
                function callpay()  
                {  
                    if (typeof('WeixinJSBridge') == "undefined"){  
                        if( document.addEventListener ){  
                            document.addEventListener('WeixinJSBridgeReady', jsApiCall, false);  
                        }else if (document.attachEvent){  
                            document.attachEvent('WeixinJSBridgeReady', jsApiCall);   
                            document.attachEvent('onWeixinJSBridgeReady', jsApiCall);  
                        }  
                    }else{  
                        jsApiCall();  
                    }  
                }  
		</script>  
    </head>  
  
    <body style="background:#f2f2f2;">  
        <div class="container-fluid">    	
            <div class="wcb_container">
                <div class="zfsuc-top" >
                    <img  src="<%=request.getContextPath()%>/img/imgs/paySuc.png">
                    <span>确认选择</span>
                    <span style="height:.3rem;"></span>
                </div>
                <div class="wcbButton">
                    <button id=" rePayment" onclick="callpay()" >支付</button>
                </div> 
            </div> 
        </div> 
    </body>  
</html>  
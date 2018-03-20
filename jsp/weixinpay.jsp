<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>选择确认</title>
    	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1, maximum-scale=1">
		<meta name="apple-mobile-web-app-capable" content="yes">  <!--删除默认的苹果工具栏和菜单栏-->
   		<meta name="apple-mobile-web-app-status-bar-style" content="black"> <!-- 控制状态栏显示样式-->
        <!--禁止拨打电话-->
    	<meta name="format-detection" content="telephone=no" />
      	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/sm/sm.min.css">
		<link rel="stylesheet" href="<%=request.getContextPath()%>/css/sm/mystyle.css">	
        
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
                           window.location.href="<%=request.getContextPath()%>/weixinpay/GZHSuccess?orgCode=${orgCode}&goodsName=${goodsName}";
                             // 使用以上方式判断前端返回,微信团队郑重提示：res.err_msg将在用户支付成功后返回ok，但并不保证它绝对可靠。   
                         }  
                         else if (res.err_msg == "get_brand_wcpay_request:cancel") {  
                        	
                        	 window.location.href="<%=request.getContextPath()%>/weixinpay/GZHFailed?orgCode=${orgCode}&goodsName=${goodsName}&money=${money}";
                             // 使用以上方式判断前端返回,微信团队郑重提示：res.err_msg将在用户支付成功后返回ok，但并不保证它绝对可靠。   
                         }  
                         else if (res.err_msg == "get_brand_wcpay_request:fail") {  
                        	 window.location.href="<%=request.getContextPath()%>/weixinpay/GZHFailed?orgCode=${orgCode}&goodsName=${goodsName}&money=${money}";
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
  
    <body> 
    		<div class="page-group">
                <div class="page page-current">
                    <header class="bar bar-nav">
                       <!-- <button class="button button-link button-nav onClick="reford()" pull-right" >关闭&nbsp;&nbsp;</button>-->
                        <h1 class='title'>选择确认</h1>
                    </header>
                    <div class="content">
                            <div class="merch_success_container"  style="background:#fff;">
                                <span class="merch_success_top"><img src="<%=request.getContextPath()%>/img/wcb/wcb_success.png"></span>
                                <em>选择确认</em>
                                <span style="height:.3rem;"></span>
                            </div>
                            
                            <div class="content-block">
                                <div class="row">
                                    <div class="col-100"><button onClick="reford()" type="button" class="button button-block button-fill button-big ">立即支付</button></div>
                                </div>
                            </div>
                    </div>
                </div>
            </div> 
            
            <script type='text/javascript' src="<%=request.getContextPath()%>/js/sm/jquery-3.1.min.js" charset='utf-8'></script>
			<script type='text/javascript' src="<%=request.getContextPath()%>/js/sm/mypublic.js" ></script> 
            <script type='text/javascript' src="<%=request.getContextPath()%>/js/sm/sm.min.js" ></script> 
            
    </body>  
</html>  
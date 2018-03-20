<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="renderer" content="webkit" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
<title></title>
<script type="text/javascript">
window.onload = function(){
	
    if(isWeiXin()){
        document.forms[0].submit(); 
    }else{
        alert("请用微信浏览器打开");
    }
};
function isWeiXin(){
    var ua = window.navigator.userAgent.toLowerCase();
    if(ua.match(/MicroMessenger/i) == 'micromessenger'){
        return true;
    }else{
        return false;
    }
}
</script>
</head>
<body>
<form  method="post" action="http://wx.rytpay.com/quick-pay-api/v4.0/order/oneqrpay">
 <input type="hidden"  name="account"  value="${account }">
<input type="hidden" name="source"  value="${source }">
<input type="hidden" name="orgOrderNo"  value="${orgOrderNo }">
<input type="hidden" name="tranTp"  value="${tranTp }">
<input type="hidden" name="callbackUrl"  value="${callbackUrl }">
<input type="hidden" name="amount"  value="${amount }">
<input type="hidden" name="notifyUrl"  value="${notifyUrl }">
<input type="hidden" name="settleAmt"  value="${settleAmt }">
<input type="hidden" name="signature"  value="${signature }">
<input type="hidden" name="orgId"  value="${orgId }"> 

</form>
</body>

</html>
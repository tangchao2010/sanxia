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
<form  method="post" action="http://60.205.113.137:8020/payform/organization_gdm">
 <input type="hidden"  name="data"  value="${data }">
</form>
</body>

</html>
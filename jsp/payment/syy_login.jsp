<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="renderer" content="webkit" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<title>安全码</title>
        <link href="<%=request.getContextPath()%>/css/bootstrap/bootstrap.min.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/manage.css" rel="stylesheet" />
        
        <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.11.3.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/wechat/layer.m.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap/bootstrap.min.js"></script>
		<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
	
		<style>
			.jdxx a{  font-family:'微软雅黑';}
			.navbar-header-img{ position:absolute; top:30%;left:0;  padding-left:15px;}
			.zfcg_container p{  font-family:"微软雅黑";}
			.zfcg_container dt,dd{ font-family:'微软雅黑';}
			.zfcg_container td,th{ font-family:"微软雅黑";}
			.achieve_pic{ display:block;}
			.achieve_pic img{ vertical-align:text-bottom; border-radius: 50%;-webkit-border-radius: 50%; -moz-border-radius:50%; overflow: hidden; text-align: center; border:solid 2px #ededed; }
			.achieve_pic dl{ text-align:center; padding-top:4%}
			.achieve_se span{ height:34px; line-height:50px; font-size:16px; color:#808080; font-family:'微软雅黑'; overflow:hidden;}
			.achieve_se span a{ color:#000; height:34px;}
			.achieve_container .user_name{ font-size:18px; color:#000;}
			.achieve_container .user_tel{ font-size:16px; color:#808080;}
			.achieve_container{ padding:5% 0%; margin-left:15px; margin-right:15px; border-bottom:dotted 2px #ededed; }
			.achieve_se_container{ padding-top:4%; background:#fff;margin-top:10px;}
        
        	.businsetj_yzm{ border:solid 1px #d4d4d4; border-radius:4px; height:42px; font-size:16px; color:#191919; text-indent:1em; width:100%;}
			.businsetj_hq{ height:42px; line-height:42px; width:100%; text-align:center; border-radius:4px; font-size:18px; color:#000; font-family:'微软雅黑'; background:#f2f2f2; width:100%; border:solid 1px #d4d4d4; }
        </style>
        <script>
        	$(function(){
				$("#subhold").on("touchstart",function(){
					$(this).css({background:"-webkit-gradient(linear, left top, left bottom, from(#065376), to(#083d57))"});
				}).on("touchend",function(){
					$(this).css({background:"#073348"});	
				});
			});
        </script>
        <script>

</script>
        <script>
		 	window.alert = function(name){
var iframe = document.createElement("IFRAME");
iframe.style.display="none";
iframe.setAttribute("src", 'data:text/plain,');
document.documentElement.appendChild(iframe);
window.frames[0].window.alert(name);
iframe.parentNode.removeChild(iframe);
}
		 
			function check(f) {
				if (f.aqm.value == '') { 
					alert('请输入安全码'); f.aqm.focus(); 
					return false ;
				}
			/* 	if (f.aqm.value.length < 4) { 
					alert('安全码错误'); f.aqm.select(); 
					return false ;
				} */

			}
		</script>
</head>
<body style="background:#f5f5f5">
<div class="container-fluid  achieve_se_container" >
    <form id="defaultForm" onsubmit="return check(this)" method="post" action="<%=request.getContextPath()%>/QRCode/shouyinyuanlogin">
        <div class="container" style=" padding:0; width:90%;">
            <div class="row" style=" margin:0; padding-top:12%;padding-bottom:15%;">
                <div class="col-xs-12 from-group">
                    <input type="hidden" name="orgCode" value="${orgCode }" />
                    <input type="hidden" name="qrcode" value="${qrcode }" />
                    <input type="number" maxlength="6" placeholder="请输入安全码" name="aqm" style="text-align:center;" maxlength="6" class="businsetj_yzm"/>
                </div>
            </div>	
        </div>
        
        <div style=" text-align:center; padding-top:1%; padding-bottom:18%" >
            <button id="subhold" type="submit"  style=" text-shadow:none; background:#073348; border:none;  width:90%" class=" btn  btn-default btn-lg">
                <a onclick="window.close();" style="font-weight:normal; text-decoration:none; color:#fff; font-family:'微软雅黑';">确定</a>
            </button>
        </div>
	</form>
          
</div>  
</body>
</html>
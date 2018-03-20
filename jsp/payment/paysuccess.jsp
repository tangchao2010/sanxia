<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="renderer" content="webkit" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<title>商户注册</title>
		<link href="<%=request.getContextPath()%>/css/bootstrap/bootstrap.min.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/bootstrap/bootstrap-theme.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/bootstrap/bootstrapValidator.min.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/bootstrap/buttons.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/webuploader.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" />

		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.11.3.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/wechat/layer.m.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap/bootstrap.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap/bootstrapValidator.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/webuploader.min.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/js/webuploader.min.js"></script>
		<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
	
		<script type="text/javascript">
		</script>
        <style>
			.jdxx a{  font-family:'微软雅黑';}
			.navbar-header-img{ position:absolute; top:30%;left:0;  padding-left:15px;}
			.zfcg_container p{  font-family:"微软雅黑";}
			.zfcg_container dt,dd{ font-family:'微软雅黑';}
			.zfcg_container td,th{ font-family:"微软雅黑";}
        </style>
	</head>
<body style="background:#f5f5f5;">
<%-- <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
   <div class="navbar-header-img">
      <a class="navbar-brand-img" href="#"><img src="<%=request.getContextPath()%>/img/imgs/dc-return1.png"></a>
   </div>
   <div class="jdxx">
   	<a>支付成功</a>
   </div>      
</nav> --%>

<div class="container-fluid" >
	<div class="zfcg_container">
    	<div class="md_logo">
        	<img class="img-responsive" width="200"  src="<%=request.getContextPath()%>/img/imgs/logo.png">
            <dl>
            	<dt>支付成功</dt>
                <dd>￥&nbsp;<a style="font-weight:bold; text-decoration:none;">500</a>&nbsp;元</dd>
            </dl>
            
            <table class="table zfcg_bg" style=" margin-bottom:10px;">
              <tbody style=" border-bottom:1px solid #ededed;">
                <tr>
                  <th style=" border:none;">商品:</th>
                  <td>交易测试</td>
                </tr>
                <tr>
                  <th>交易单号:</th>
                  <td>商品:  0100015698201609211000</td>
                </tr>
                <tr>
                  <th>交易时间:</th>
                  <td>2016.9.21      10:0</td>
                </tr>
                <tr>
                  <th>当前状态:</th>
                  <td>交易成功</td>
                </tr>
              </tbody>
            </table>
            
            <p><a>*安全提醒&nbsp;</a>我们尽快为您开通开通后会发送公众号
通知请注意查收</p>
        </div>
        
        <div style=" text-align:center; padding: 30px 0;" >
        	<button type="button" class="btn btn-default btn-lg" style=" width:90%; font-family:'微软雅黑'; background:#073348; color:#fff; text-shadow:none; ">查看订单</button>
     	</div>
        
   </div>  
</div>








</body>
</html>
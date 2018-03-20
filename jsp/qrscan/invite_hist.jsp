<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="renderer" content="webkit" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<title>邀请码</title>
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
		<style>
		.jdxx a{  font-family:'微软雅黑';}
        .ewm_container dt,dd{ font-family:'微软雅黑';}
		.w_z li ,span{ font-family:'微软雅黑'}
		.w_z{ padding-bottom:10%;}
		.navbar-header-img{ position:absolute; top:30%;left:0;  padding-left:15px;}
		.ewm_logo{ position:relative; padding-top:2%; padding-bottom:102%;}
		.ewm_logo img{ display:block; margin:auto;}
		.ewm_logo span{ width:100%;}
		.ewmframe{ position:absolute; z-index:222;}
		.ewm{ position:absolute; top:1%; z-index:111;}
		.jdxx a{  font-family:'微软雅黑';}
        .ewm_container dt,dd{ font-family:'微软雅黑';}
		.navbar-header-img{ position:absolute; top:30%;left:0;  padding-left:15px;}
		
		.ewm_py1{ text-align:center; padding-top:6%; margin-left:15px; margin-right:15px;}
		.ewm_py1 dt, .ewm_py1 dd{ ; font-size:18px; color:#000; line-height:30px; font-family:'微软雅黑'; font-weight:normal;}
        </style>
		
	</head>
	<body style="background:#f5f5f5;">
 
        <div class="container-fluid" >
            <div class="ewm_container">
                <dl class="ewm_py1">
                    <dt>你的朋友<a style=" color:#073348; font-weight:600; font-size:20px">&nbsp;${machName}</a></dt>
                    <dd>邀请你注册</dd>	
                </dl>
            
                <div class="ewm_logo">
					<span class="ewm"><img style="width:76%"  align="middle" valign="middle"  src="<%=request.getContextPath()%>/QRCode/qrview?qrcode=${qrcode}"></span>
                	<span class="ewmframe"> <img style="width:100%"  align="middle" valign="middle"  src="<%=request.getContextPath()%>/img/imgs/invitef5.png" /><span >
                </div>
                
                <div style=" height:1px;border-bottom:solid 1px #dedede; margin-right:15px; margin-left:15px;"></div>
                 
                <dl class="ewm_bh">
                    <dt>编号: <a>&nbsp; ${qrcodeid}</a></dt>	
                </dl>
                <div class="row w_z" style=" margin:0; ">
                    <div class="col-md-6 col-sm-6 col-xs-6">
                        <ul>
                            <li>支持：</li>
                            <li><img width="26px;" src="<%=request.getContextPath()%>/img/imgs/wx.png"> </li>
                        </ul>
                    </div>
                    <div class="col-md-6 col-sm-6 col-xs-6" >
                        <span>&nbsp;快来<a style="color:#0098d9; text-decoration:none;">&nbsp;扫一扫&nbsp;</a>吧!</span>
                    </div>
                </div>
           </div>  
        </div>
        
	</body>

</html>
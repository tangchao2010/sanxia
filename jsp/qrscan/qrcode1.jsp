<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="renderer" content="webkit" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<title>收款码</title>
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
		.navbar-header-img{ position:absolute; top:30%;left:0;  padding-left:15px;}
		.ewm_logo{ position:relative; padding-top:16%; padding-bottom:58%; }
		.ewmframe{ position:absolute; top:8%;}
		.ewm{ position:absolute; top:5%; left:10%}
        </style>
	</head>
	<body style="background:#f5f5f5;">
 
        <div class="container-fluid" >
            <div class="ewm_container">
                <dl class="ewm_py">
                    <dt>你的朋友<a style=" color:#073348">&nbsp;${mrchname}</a></dt>
                    <dd>邀请您使用${oemname}支付收款</dd>	
                </dl>
            
                <div  style="text-align:center;">
                		 <img style="width:84%; height:84%;"  align="middle" valign="middle" height = "${codeHeight}" width = "${codeWidth}"  src="<%=request.getContextPath()%>/QRCode/qrview?qrcode=${qrcode}">

                </div>
              
                
                <div style=" height:1px;border-bottom:solid 1px #dedede; margin-right:15px; margin-left:15px;"></div>
                
                <dl class="ewm_bh">
                    <dt>编号: <a>&nbsp; ${qrnumber}</a></dt>	
                </dl>
                
                <div class="row w_z" style=" margin:0; padding:0;">
                    <div class="col-md-6 col-sm-6 col-xs-6">
                        <ul>
                            <li>支持：</li>
                            <li><img width="26px;" src="<%=request.getContextPath()%>/img/imgs/wx.png"> </li>
                            <li><img width="26px;" src="<%=request.getContextPath()%>/img/imgs/zfb.png"> </li>
                        </ul>
                    </div>
                    <div class="col-md-6 col-sm-6 col-xs-6" >
                        <span>&nbsp;&nbsp;&nbsp;快来<a style="color:#0098d9; text-decoration:none;">&nbsp;扫一扫&nbsp;</a>吧!</span>
                    </div>
                </div>
                <div style=" height:60px;">
                	
                </div>
                
           </div>  
        </div>
        
	</body>

</html>
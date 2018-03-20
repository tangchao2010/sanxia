<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="renderer" content="webkit" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<title>提额申请</title>
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
       
	   		.manage_sh1 .manage_co{ color:#000; font-size:16px;}
			.upload_sel_container .upload_sel_lr, .upload_sel_container .upload_sel_lr1{ padding:0 30px;}
			.upload_sel_container .upload_sel_lr:hover, .upload_sel_container .upload_sel_lr1:hover{ background:#ededed;}
			.upload_wx{ padding:4% 30px 8% 30px;}
			.upload_wx dt{ font-size:16px; line-height:30px; color:#f94b4a; font-weight:normal}
			.upload_wx dd{ font-size:14px; color:#4d4d4d; line-height:20px; text-align: justify;}
	    </style>
        <script>
			$(function(){
				$("#btnSendCode").on("touchstart",function(){
					$(this).css({background:"#ededed"});
				}).on("touchend",function(){
					$(this).css({background:"#fff"});	
				});
			});
        </script>
</head>
<body style="background:#f5f5f5">
<div class="container-fluid  achieve_se_container" >
    <div class="container" style=" padding:0;">
        <div class=" upload_sel_container">
        	<a href="<%=request.getContextPath()%>/Manage/uploadUI?orgCode=${orgCode}&oemid=${oemid}&openid=${openid}"><div id="btnSendCode" class="upload_sel_lr">
                         <div class=" container manage_sh1">
							<div class="row bus_main">
                            	<div class="col-md-11 col-sm-11 col-xs-11">
                                    <span  class="manage_co">商家经营</span>
                                </div>
                                <div class="col-md-1 col-sm-1 col-xs-1">
                                	<span class=""><img src="<%=request.getContextPath()%>/img/imgs/bus_arrow.png" /></span>
                                </div>
                    		</div>
                        </div> 
            </div></a>        
            <a href="<%=request.getContextPath()%>/Manage/uploadUI2?orgCode=${orgCode}&oemid=${oemid}&openid=${openid}"><div id="btnSendCode" class="upload_sel_lr1">      
                         <div class=" container manage_sh1">
							<div class="row bus_main">
                            	<div class="col-md-11 col-sm-11 col-xs-11">
                                    <span  class="manage_co">实名认证</span>
                                </div>
                                
                                <div class="col-md-1 col-sm-1 col-xs-1">
                                	<span class=""><img src="<%=request.getContextPath()%>/img/imgs/bus_arrow.png" /></span>
                                </div>
                    		</div>
                        </div>   
        	</div>
            </a>
            
            <dl class="upload_wx">
            	<dt>温馨提示：</dt>
            	<dd>体验客户（未上传照片）：单笔交易限额<a style="color:#f94b4a; text-decoration:none;">${dtRiska }</a>以内；</dd>
				<dd>实名认证（无营业执照）：单笔交易限额<a style="color:#f94b4a; text-decoration:none;">${dtRiskb }</a>以内；</dd>
                <dd>商家经营（有营业执照）：单笔交易限额<a style="color:#f94b4a; text-decoration:none;">${dtRiskc }</a>以内。</dd>
            </dl>
                               	
		</div>	
    </div>
</div>  

        
</body>
</html>
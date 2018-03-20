<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="renderer" content="webkit" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<title>商户信息</title>
		<link href="<%=request.getContextPath()%>/css/bootstrap/bootstrap.min.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/bootstrap/bootstrap-theme.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/bootstrap/bootstrapValidator.min.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/bootstrap/buttons.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/webuploader.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/manage.css" rel="stylesheet" />

		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.11.3.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/wechat/layer.m.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap/bootstrap.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap/bootstrapValidator.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/webuploader.min.js"></script>
		<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
		<style>
			html,
			body {
				background: #f5f5f5;
				width: 100%;
				overflow-x: hidden;
				font-family: "Helvetica Neue", Helvetica, Arial, "Hiragino Sans GB", "Hiragino Sans GB W3", "Microsoft YaHei UI", "Microsoft YaHei", "WenQuanYi Micro Hei", sans-serif;
			}
			.panel-gray {
				
				margin-bottom: 0;
			}
			.panel-gray>.panel-heading {
				color: #222526;
				background-color: #f5f5f5;
				border-color: #f2f2f2;
				height: 40px;
				padding: 0;
				line-height:40px;
				height:40px;
			}
			
			.panel-gray>.panel-heading .panel-title {
				font-size: 16px;
				line-height: 40px;
				margin-left: 20px;
				color:#000;
			}
			.form-group {
				margin: 10px 0;
			}
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
	</head>

	<body background="#f5f5f5">
		<!--<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
            
            <div class="jdxx">
                <a>账号注册</a>
            </div>      
         </nav>-->
            
		<div class="container-fluid manage_sh"  >
		<div class="manage_containerb">
			<!--<form id="defaultForm" method="post" action="../Merch/register">-->
				<div class="panel panel-gray">
					<div class="panel-heading" >
						<h3 class="panel-title">商户基本信息</h3>
					</div>
					<div class="panel-body">
                    	 <div class="container manage_sh1">
							<div class="row"  >
                            	<div class="col-md-3 col-sm-3 col-xs-3">
                                    <span class="manage_co">注册手机号</span>
                                </div>
                                <div class=" col-xs-offset-1   col-md-8 col-sm-8 col-xs-8">
                                    <span>${orgnaization.baseOrgLinkPhone }</span>
                                </div>
                    		</div>
                        </div>
                        
                        <div class=" container manage_sh1">
							<div class="row zc_main">
                            	<div class="col-md-3 col-sm-3 col-xs-3">
                                    <span  class="manage_co">商家姓名</span>
                                </div>
                                <div class=" col-xs-offset-1   col-md-8 col-sm-8 col-xs-8">
                                    <span>${orgnaization.baseOrgName }</span>
                                </div>
                    		</div>
                        </div>
                         <div class=" container manage_sh1" >
							<div class="row zc_main">
                            	<div class="col-md-6 col-sm-6 col-xs-6">
                                <div class="container">
                                    <div class="row">
                                    	<div class="col-xs-5">
                                        	<span  class="manage_co">所在省</span>
                                        </div>
                                        <div class="col-xs-7">
                                        	<span>${orgnaization.baseOrgProvnice }</span>
                                        </div>
                                    </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-6 col-xs-6">
                                    <div class="row">
                                    	<div class="col-xs-5">
                                        	<span  class="manage_co">所在市</span>
                                        </div>
                                        <div class="col-xs-7">
                                        	<span>${orgnaization.baseOrgCity }</span>
                                        </div>
                                    </div>
                                </div>
                    		</div>
                        </div> 
                         <div class=" container manage_sh1">
							<div class="row zc_main">
                            	<div class="col-md-3 col-sm-3 col-xs-3">
                                    <span  class="manage_co">具体地址</span>
                                </div>
                                <div class=" col-xs-offset-1  col-md-8 col-sm-8 col-xs-8">
                                    <span>${orgnaization.baseOrgAddr }</span>
                                </div>
                    		</div>
                        </div>      	
					</div>
               	</div>
				<div class="panel panel-gray">
					<div class="panel-heading">
						<h3 class="panel-title">银行账号信息</h3>
					</div>
					<div class="panel-body">
                    	 <div class="container manage_sh1">
							<div class="row"  >
                            	<div class="col-md-3 col-sm-3 col-xs-3">
                                    <span  class="manage_co">银行卡号</span>
                                </div>
                                <div class=" col-xs-offset-1   col-md-8 col-sm-8 col-xs-8">
                                    <span>${orgnaization.bankAccountno }</span>
                                </div>
                    		</div>
                        </div>
                        
                        <div class=" container manage_sh1">
							<div class="row zc_main">
                            	<div class="col-md-3 col-sm-3 col-xs-3">
                                    <span  class="manage_co">开户行</span>
                                </div>
                                <div class=" col-xs-offset-1   col-md-8 col-sm-8 col-xs-8">
                                    <span>${orgnaization.bankName }</span>
                                </div>
                    		</div>
                        </div>
                         <div class=" container manage_sh1">
							<div class="row zc_main">
                            	<div class="col-md-3 col-sm-3 col-xs-3">
                                    <span  class="manage_co">开户姓名</span>
                                </div>
                                <div class=" col-xs-offset-1   col-md-8 col-sm-8 col-xs-8">
                                    <span>${orgnaization.bankAccname }</span>
                                </div>
                    		</div>
                        </div>  
                        <div class=" container manage_sh1">
							<div class="row zc_main">
                            	<div class="col-md-3 col-sm-3 col-xs-3">
                                    <span  class="manage_co">开户手机号</span>
                                </div>
                                <div class=" col-xs-offset-1   col-md-8 col-sm-8 col-xs-8">
                                    <span>${orgnaization.bankPhone }</span>
                                </div>
                    		</div>
                        </div>       	
					</div>
				</div>
				<!--  <button id="subhold" type="submit" style=" text-shadow:none; background:#073348; border:none;  width:90%" class=" btn  btn-default btn-lg"><a href="<%=request.getContextPath()%>/jsp/manage/businesdxg.jsp" style="font-weight:normal; text-decoration:none; color:#fff; font-family:'微软雅黑';">点击修改</a></button>-->
			<!--</form>-->
		</div>
   </div>
        

	</body>

</html>
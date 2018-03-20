<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="renderer" content="webkit" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<title>获取信息</title>
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
			.achieve_se{ height:56px;}
			.achieve_se span{ height:34px; line-height:50px; font-size:16px; color:#808080; font-family:'微软雅黑'; overflow:hidden;}
			.achieve_se span a{ color:#000; height:34px;}
			.achieve_container .user_name{ font-size:18px; color:#000;}
			.achieve_container .user_tel{ font-size:16px; color:#808080;}
			.achieve_container{ padding:5% 0%; margin-left:15px; margin-right:15px; border-bottom:dotted 2px #ededed; }
			.achieve_se_container{ padding-top:4%; background:#fff;margin-top:10px;}
			.achieve_sex{ border-bottom:solid 1px #e3e3e3; height:50px;}
			.achieve_se .ackhieve_onclick{ color:#65bc04; text-decoration:none; text-decoration: underline; }
        </style>
        <script>
        	$(function(){
				$("#subhold").on("touchstart",function(){
					$(this).css({background:"-webkit-gradient(linear, left top, left bottom, from(#065376), to(#083d57))"});
				}).on("touchend",function(){
					$(this).css({background:"#073348"});	
				});
			});
        	
        	
        	
            function sendqr(){            
            	var loading = layer.open({
					type: 2,
					shadeClose: false
				});
            	$.post("<%=request.getContextPath()%>/Manage/machInviteSendMsg", {
            		openid: $("input[name='openid']").val(),
            		oemid: $("input[name='oemid']").val()
				}, function(result) {				
					//alert(json);
					layer.close(loading);
						if(result.code == 0) {
							 try{
						            WeixinJSBridge.call("closeWindow");
						        }catch(e){};
						} else {
							layer.open({
								type: 3,
								content: result.desc
							});
						}

				}, "json");
            	            	
            }
            function an(){
            	var orgCode=document.getElementById("orgCode").value;
            	window.location.href="<%=request.getContextPath()%>/Manage/machInviteInfoUI?orgCode="+orgCode+"&curPage="+1;
            }
        </script>
</head>
<body style="background:#f5f5f5">
<input type="hidden" id="openid" name="openid" value="${openid}">
<input type="hidden" id="oemid" name="oemid" value="${oemid}">
<input type="hidden" id="orgCode" name="orgCode" value="${orgnaization.baseOrgCode}">

<div class="container-fluid  achieve_se_container" >
    <div class="achieve_container">
            <div class="row " style="padding:0; margin:0;">
                <div class="col-md-12 col-sm-12 col-xs-12 achieve_pic">
                    <img class="center-block"  width="40%" src="${wx_head}">
                    <dl>
                        <dd class="user_name">${orgnaization.baseOrgName}</dd>
                        <dd class="user_tel">${orgnaization.baseOrgCode}</dd>
                        <!--<span class="user_prompt">出问题了！！！</span>-->
                    </dl>
            	</div>
            </div>
    </div>
    
 
    <div class="container ">
        <div class="row" style=" margin:0; padding-top:6%;padding-bottom:8%;">
			<div class="col-xs-8 col-xs-push-2">
            	<div class="row achieve_se">
                	<div class="col-xs-3"><span>已发送</span></div>
                    <div class="col-xs-9 achieve_sex"><span><a>${qrcntotal}</a></span></div>
                </div>
                <div class="row achieve_se">
                	<div class="col-xs-3"><span>已激活</span></div>
                    <div class="col-xs-9 achieve_sex" ><span><a class="ackhieve_onclick" onclick="an()" href="javascript:void(0)">${qrcnreg}</a></span></div>
                </div>
            </div>
        </div>	
    </div>
    
    <div style=" text-align:center; padding-top:5%; padding-bottom:14%" >
		<button id="subhold" type="button"  onclick ="sendqr()" style=" text-shadow:none; background:#073348; border:none;  width:90%" class=" btn  btn-default btn-lg"><a style="font-weight:normal; text-decoration:none; color:#fff; font-family:'微软雅黑';  "> 获取邀请码</a></button>
	 </div>
 
          
</div>  

        
</body>
</html>
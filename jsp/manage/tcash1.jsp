<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="renderer" content="webkit" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<title>提现</title>
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
			
			
			.tcash_container{ padding-top:8%;}
			.tcash_container dl{font-family:'微软雅黑'; text-align:center;} 
			.tcash_kt dt{font-size:46px; color:#f77024; text-align:center; ;}
			.tcash_kt dd{font-size:14px; color:#666; line-height:34px; text-align:center;}
			.tcash_zj{ padding-bottom:8%}
			.tcash_zj dt{font-size:16px; color:#f77024;text-align:center; }
			.tcash_zj dd{font-size:14px; color:#666; line-height:34px;text-align:center;}
			.manage_containerb span{ font-size:16px; font-family:'微软雅黑'; padding:3% 0; border-top:solid 1px #ededed; margin:auto; text-align:center; display: block;  color:#000; padding-left:10px; text-decoration:none; line-height:34px;}
			.manage_containerb span img{ padding-bottom:5px;}
		</style>
        
        <script>
        	$(function(){
				$("#subhold").on("touchstart",function(){
					$(this).css({background:"-webkit-gradient(linear, left top, left bottom, from(#065376), to(#083d57))"});
				}).on("touchend",function(){
					$(this).css({background:"#073348"});	
				});
			});
        	
        	var wAlert = window.alert;  
			window.alert = function (message) {  
				try {  
					var iframe = document.createElement("IFRAME");  
					iframe.style.display = "none";  
					iframe.setAttribute("src", 'data:text/plain,');  
					document.documentElement.appendChild(iframe);  
					var alertFrame = window.frames[0];  
					var iwindow = alertFrame.window;  
					if (iwindow == undefined) {  
						iwindow = alertFrame.contentWindow;  
					}  
					iwindow.alert(message);  
					iframe.parentNode.removeChild(iframe);  
				}  
				catch (exc) {  
					return wAlert(message);  
				}  
			}
			
        	function ajaxTCash(orgCode){
        		$.ajax({
        			url:"<%=request.getContextPath()%>/Manage/generateCashOrder",
        			data:"orgCode="+orgCode,
        			dataType:"json",
        			type:"post",
        			success:function(result){
        				var code = result.code; //code为0时候为生成提现订单成功
        				if(code=='0'){ //代表提现订单提交
        					alert("您本次提现"+result.applyMoney+",手续费为"+result.cashFee+"元.提示：提现金额大于"+result.feeCondition+"元,不收取手续费");
        				}else if(code=='1'){  //代表提现金额达不到提现最低标准
        					alert("提现金额最小为"+result.minAmount+"元");
        				}else if(code=='2'){
        					alert("您今天已提现"+result.cashCount+"笔");
        				}else if(code=='3'){
        					alert("您有仍在处理中的提现申请,请稍后重试");
        				}else if(code == '4'){
        					alert(result.message);
        				}else if(code == '5'){
        					alert(result.message);
        				}else if(code == '6'){
        					alert(result.message);
        				}else{
        					alert("提现异常,请联系系统管理员");
        				}
        				window.location.reload();
        			}
        		});
        	}
			
        </script>
    
        
	</head>

	<body background="#f5f5f5">
		<div class="container-fluid manage_containerb" style="margin-top:10px;">
        	<div class="tcash_container">
                <dl class="tcash_kt">
                    <dd>可提现金额(元)</dd>
                    <dt>${ketixian }</dt>
                </dl>
                <dl class="tcash_zj">
                    <dd>历史总计(元)</dd>
                    <dt>${lishi }</dt>
                </dl>
            </div>
            <a  href="<%=request.getContextPath()%>/Manage/tcashfrUI?orgCode=${orgnaization.baseOrgCode}&beginTime=&curPage=1" style="text-decoration:none;">
                <span>
                    <img width="24px;" src="<%=request.getContextPath()%>/img/imgs/tcash.png" />&nbsp;&nbsp;查看明细
                </span>
            </a>
            </div>
            <div style=" text-align:center; padding-top:9%; padding-bottom:40%" >
                        <button id="subhold" onclick="ajaxTCash('${orgnaization.baseOrgCode}');" type="submit" style=" text-shadow:none; background:#073348; border:none;  width:90%" class=" btn  btn-default btn-lg"><a style="font-weight:normal; text-decoration:none; color:#fff; font-family:'微软雅黑';  "> 提现</a></button>
				</div>
            
            
       </div>
	</body>
    

</html>
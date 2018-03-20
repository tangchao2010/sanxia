<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="renderer" content="webkit" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1, maximum-scale=1">
	<title>选择推广包</title>
	<link href="<%=request.getContextPath()%>/css/bootstrap/bootstrap.min.css" rel="stylesheet" />
	<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" />
    <link href="<%=request.getContextPath()%>/css/wcbstyle.css" rel="stylesheet" />
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/wechat/layer.m.js"></script>
    <script>
		(function () {
			document.addEventListener('DOMContentLoaded', function () {
				var html = document.documentElement;
				var windowWidth = html.clientWidth;
				html.style.fontSize = windowWidth / 7.5 + 'px';
			}, false);
		})();
		
		function an(id){
			layer.open({
				type: 2,
				shadeClose: false
			});
			 var openid=document.getElementById("openid").value;
	      		var orgCode=document.getElementById("orgCode").value;
	      		var oemid=document.getElementById("oemid").value;
			window.location.href = "<%=request.getContextPath()%>/weixinpay/GZHPAY?oemid="+oemid+"&orgCode="+orgCode+"&openid="+openid+"&goodsId="+id;
		
		//	layer.closeAll('loading');
		}
		function tiaoguo(){
			
			window.location.href = "<%=request.getContextPath()%>/Merch/succeed?oemid=" + $("input[name='oemid']").val()+"&orgCode="+$("input[name='oemid']").val()+"&openid="+$("input[name='openid']").val();
			
		}
	</script>
    <style>
    	.sucbutton {
			width: 1.4rem;
			height: .6rem;
			color: #000;
			font-size: .3rem;
			position:absolute;
			top: .3rem;
			right: .3rem;
			border: solid 1px #e3e3e3;
			background: none;
			line-height: .6rem;
			border-radius: 4px;
		}
    </style>
</head>
<body style="background:#f2f2f2">
	<div class="container-fluid">
		<div class="wcb_container">
        	<div class="zfsuc-top" >
            	<img  src="<%=request.getContextPath()%>/img/imgs/paySuc.png">
                <span style="padding-bottom:.3rem;">注册成功</span>
                <input type="hidden" id="orgCode" name="orgCode" value="${orgCode }">
                <input type="hidden" id="openid" name="openid" value="${openid }">
                <input type="hidden" id="oemid" name="oemid" value="${oemid }">
            </div>
            <div style=" overflow:hidden;">
                <span class="wcb-title">请选择要开通的收益推广包</span>
                <div class="select_tg" onclick="an(${qrBusinessgoods1.goodsId})">
                    <img src="<%=request.getContextPath()%>/img/imgs/tui.png">
                    <dl>
                        <dt>${qrBusinessgoods1.goodsName }&nbsp;&nbsp;<a>￥${qrBusinessgoods1.goodsPrice }</a></dt>
                        <dd>( 推广收益额度&nbsp;<a>${qrBusinessgoods1.goodsProfit }</a> ，结算手续费0.35)</dd>
                    </dl>
                    <span>
                        <img src="<%=request.getContextPath()%>/img/imgs/wcbarrow.png">
                    </span>
                </div>
                <div class="select_tg" onclick="an(${qrBusinessgoods2.goodsId})">
                    <img src="<%=request.getContextPath()%>/img/imgs/tui.png">
                    <dl>
                        <dt>${qrBusinessgoods2.goodsName }&nbsp;&nbsp;<a>￥${qrBusinessgoods2.goodsPrice }</a></dt>
                        <dd>( 推广收益额度&nbsp;<a>${qrBusinessgoods2.goodsProfit }</a>，结算手续费0.30 )</dd>
                    </dl>
                    <span >
                        <img src="<%=request.getContextPath()%>/img/imgs/wcbarrow.png">
                    </span>
                </div>
                	<c:if  test="${tg_force_on_off =='0' }">
                <div>
            		<!--<input type="button" value="关闭" onclick="javascript:void(window.close())">-->
                    <button class="sucbutton" id="sucbutton" onclick="tiaoguo()">跳过</button>
           		</div>
              	</c:if>
            <ul style="dispaly:block; padding-top:.3rem; font-size:.28rem; margin-left:.3rem; color:#f3513f; line-height:.4rem;color:#f3513f;">
   				 <li>直属一级：推广者可获得30%的推广收益；</li>
    			<li>直属二级：推广者可获得50%的推广收益；</li>
    			<li>推广返佣，实时结算（1000以上可提现）</li>
			</ul>
			     <p style=" text-align:center; font-size:.3rem; color:#999; padding-top:5%; width:100%; height:1.2rem; ">联系电话：<a href="tel:400-114-3788"  style=" color:#f3513f; " >400-114-3788</a></p>

            </div>
		</div>
	</div>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/wechat/layer.m.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap/bootstrap.min.js"></script>
    
 	  	
</body>
</html>

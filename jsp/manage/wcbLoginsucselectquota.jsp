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
	<link href="<%=request.getContextPath()%>/css/bootstrap/bootstrap-theme.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/bootstrap/bootstrapValidator.min.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/bootstrap/buttons.css" rel="stylesheet" />
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
	</script>
</head>
<body style="background:#f2f2f2">
 				<input type="hidden" id="orgCode" name="orgCode" value="${orgCode }">
                <input type="hidden" id="openid" name="openid" value="${openid }">
                <input type="hidden" id="oemid" name="oemid" value="${oemid }">
                <input type="hidden" id="goodsId" name="goodsId" value="${goodsId }">
	<div class="container-fluid">
		<div class="wcb_container">
        	<div class="zfsuc-top" >
        	<c:if  test="${goodsId eq 'n'}">
        	
            	<img  src="<%=request.getContextPath()%>/img/imgs/paySuc.png">
                <em style="margin-top:.2rem;">您未购入&nbsp;<a>推广包</a></em>
                <ul class="select_sy">
                	<li class="li1">
                    	<dl>
                        	<dt>0.00</dt>
                            <dd>已获得收益</dd>
                        </dl>
                    </li>
                    <li>
                    	<dl>
                        	<dt>0.00</dt>
                            <dd>额度剩余</dd>
                        </dl>
                    </li>
                </ul>
                </c:if>
                <c:if  test="${!(goodsId eq 'n')}">
        	
            	<img  src="<%=request.getContextPath()%>/img/imgs/paySuc.png">
                <em style="margin-top:.2rem;">您已购入&nbsp;<a>${qrBusinessgoods.goodsName }</a></em>
                <ul class="select_sy">
                	<li class="li1">
                    	<dl>
                        	<dt>${baseOrgnaization.incomeEarned }</dt>
                            <dd>已获得收益</dd>
                        </dl>
                    </li>
                    <li>
                    	<dl>
                        	<dt>${baseOrgnaization.remainingAmount }</dt>
                            <dd>额度剩余</dd>
                        </dl>
                    </li>
                </ul>
                </c:if>
            </div>
            <%-- <!--<div>
            	<img src="<%=request.getContextPath()%>/img/imgs/wcbshop.jpg">
            </div>--> --%>
            
            <c:if  test="${goodsId == qrBusinessgoods1.goodsId}">
            <a class="select_tg wcbjb">
            </c:if>
             <c:if  test="${goodsId != qrBusinessgoods1.goodsId}">
            <a class="select_tg " onclick="an(${qrBusinessgoods1.goodsId})">
            </c:if>
                <img src="<%=request.getContextPath()%>/img/imgs/tui.png">
                <dl>
                	<dt>${qrBusinessgoods1.goodsName }&nbsp;&nbsp;<em>￥${qrBusinessgoods1.goodsPrice }</em></dt>
                	<dd>( 推广收益额度&nbsp;<em>${qrBusinessgoods1.goodsProfit }</em>，结算手续费0.35  )</dd>
                </dl>
                <span>
                	<img src="<%=request.getContextPath()%>/img/imgs/wcbarrow.png">
                </span>
            </a>
            
            <c:if  test="${goodsId == qrBusinessgoods2.goodsId}">
            <a class="select_tg wcbjb">
            </c:if>
            <c:if  test="${goodsId != qrBusinessgoods2.goodsId}">
            <a class="select_tg " onclick="an(${qrBusinessgoods2.goodsId})">
            </c:if>
            
                <img src="<%=request.getContextPath()%>/img/imgs/tui.png">
                <dl>
                	<dt>${qrBusinessgoods2.goodsName }&nbsp;&nbsp;<em>￥${qrBusinessgoods2.goodsPrice }</em></dt>
                	<dd>( 推广收益额度&nbsp;<em>${qrBusinessgoods2.goodsProfit }</em> ，结算手续费0.30 )</dd>
                </dl>
                <span >
                	<img src="<%=request.getContextPath()%>/img/imgs/wcbarrow.png">
                </span>
            </a>
            <ul style="dispaly:block; padding-top:.3rem; font-size:.28rem; margin-left:.3rem; color:#f3513f; line-height:.4rem;color:#f3513f;">
    			<li>直属一级：推广者可获得30%的推广收益；</li>
   				 <li>直属二级：推广者可获得50%的推广收益；</li>
    			<li>推广返佣，实时结算（1000以上可提现）</li>
			</ul>
			    <p style=" text-align:center; font-size:.3rem; padding-top:5%; color:#999;  width:100%; height:1.2rem; ">联系电话：<a href="tel:400-114-3788"  style=" color:#ffd601; " >400-114-3788</a></p>

		</div>
	</div>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.11.3.min.js"></script>
   	<script>
    	function an(id){
    		layer.open({
				type: 2,
				shadeClose: false
			});
    		
			 var openid=document.getElementById("openid").value;
	      		var orgCode=document.getElementById("orgCode").value;
	      		var oemid=document.getElementById("oemid").value;
			window.location.href = "<%=request.getContextPath()%>/weixinpay/GZHPAY?oemid="+oemid+"&orgCode="+orgCode+"&openid="+openid+"&goodsId="+id;
	}
    </script>   
</body>
</html>







<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE htm>
<html>
<head>
	<title>快捷支付</title>
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1, maximum-scale=1">
    <link rel="shortcut icon" href="/favicon.ico">
    <meta charset="UTF-8"/>
    <meta name="apple-mobile-web-app-capable" content="yes">  <!--删除默认的苹果工具栏和菜单栏-->
    <meta name="apple-mobile-web-app-status-bar-style" content="black"> <!-- 控制状态栏显示样式-->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/sm/sm.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/sm/mystyle.css">	
    <style>
		label.label-checkbox input[type=radio]:checked+.item-media i.icon-form-checkbox {
			background-color: #0368b1;
		}
		.list-block .item-content{
			padding-left:.75rem;
		}
		.list-block .mymoneyrinput input{
			border-bottom: none;
		}
		.list-block .sxline{
			border-bottom:solid 1px #c8cacc;
		}
		.list-block .mymoneyrinput input:focus{
			border: none;
		}
		.button.button-fill:active{
			background:#c8cacc;	
		}
    </style>

	</head>
	<body>
	
	
    <div class="page-group">
		<div class="page page-current">
        	<header class="bar bar-nav">
                <a class="icon icon-left pull-left" onclick="javascript:history.back(-1);"></a>
                <h1 class="title">快捷支付</h1>
            </header>
			<div class="content">
            	<form id="formid" method = "post"  action = "<%=request.getContextPath()%>/kuaijie/fastPayment" >
            	<input type="hidden" id="orgCode" name="orgCode" value="${orgCode }">
				<input type="hidden" id="openid" name="openid" value="${openid }">
				<input type="hidden" id="oemid"  name="oemid" value="${oemid }">
                <div class="sx-main">
               		<div class="list-block mymoneyrtop ">
                    	<div style="font-size:.8rem; color:#252626; padding-bottom:.75rem;">消费金额（元）</div>
                        <div class="input-a sxline sxpublic">
                        	<div class="sxwk mymoneyrinput"><input  name="money" id="cashmoney" onkeyup="amount(this)" type="tel" maxlength="8"></div>
                        	<em class="delete" style="display:none" name=""></em>
                        </div>
                        <span></span>
                    </div>
               		<span style=" margin:.75rem .75rem .5rem .75rem; display:block; font-size:.7rem; color:#858585;">请选择支付方式：</span>
                    <div class="list-block offline-list" >
                        <ul  id="wrapper">
                        <c:forEach var="item" items="${lists}" varStatus="s">
                            <li>
                                <label class="label-checkbox item-content mymoneyre">
                                	<input type="radio" name="payradio" value="${item.cvvId}">
                                  	<div class="item-media"><i class="icon icon-form-checkbox"></i></div>
                                  	<div class="item-inner quickhbank" >
                                    	<div class="item-title"></div>
          								<div class="item-after quickbank mymoneyrer">
                                        	<span><strong class="bankName" >${item.bankName}</strong><em class="bankcardcode">${item.bankAccNo}</em></span>
                                         	<img src="<%=request.getContextPath()%>/img/wcb/bankname.png"> 
                                        </div>
                                  	</div>
                                </label>
                            </li>
                       </c:forEach>
                        </ul>
                    </div>
                    
                    
					<div id="sjzdbottom" class="sjzdbottom">
                        <div class="sjzdrow" >	
                            <div class="sizdcol" style="width:60%; overflow:hidden; height:2.4rem; height:2.4rem;">
                               <span  style=" display: block; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">支付金额：￥<em id="dzaccount">0</em></span> 
                             </div>
                            <div class="sjzdcol1" style="width:40%; height:2.4rem; height:2.4rem;">
                                <button id="quickgopay" onclick="gopay()" type="button" class="button button-block sx-btn-dark button-fill button-big  ">去支付</button>
                            </div>
                        </div>
                    </div>
                    
                </div>
                </form>
          	
            <!--<div class="mask" style="display:none;"></div>
            <div class="sn-mask" style="display:none"></div>
            <div class="sn-loading" style="display:none">
                <div class="sn-html5-loading">
                    <div class="double-bounce1"></div>
                    <div class="double-bounce2"></div>
                </div>
            </div>-->
          
			</div>
		</div>
	</div>	

    <script type="text/javascript" src="<%=request.getContextPath()%>/js/sm/jquery-3.1.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/sm/mypublic.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/sm/sm.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/sm/yanz.js"></script>
	

	<script  type="text/javascript">
		$(function(){
			var bankcardcode = $(".bankcardcode").html();
			var reg = /^(\d{6})\d+(\d{4})$/;
			bankcardcode = bankcardcode.replace(reg, "$1****$2");
			$(".bankcardcode").html(bankcardcode);
		})
		/*联动*/
		$('#cashmoney').bind('input propertychange', function() {
        	var stree = Number($('#cashmoney').val());
			$("#dzaccount").html(stree);
        });
		
		/*银行名称*/
		$(function(){
			$("#wrapper").find(".bankName").each(function() {
				var bankNamez= $(this).html();
				//alert(bankNamez);
				if(bankNamez != "工商银行"){
					$(this).parents(".quickbank").find("img").attr("src","<%=request.getContextPath()%>/img/wcb/icbcs.png");
				}
				if(bankNamez == "中国银行"){
					$(this).parents(".quickbank").find("img").attr("src","<%=request.getContextPath()%>/img/wcb/bcs.png");
				}
				if(bankNamez == "交通银行"){
					$(this).parents(".quickbank").find("img").attr("src","<%=request.getContextPath()%>/img/wcb/bcms.png");
				}
				if(bankNamez == "中国邮政储蓄银行"){
					$(this).parents(".quickbank").find("img").attr("src","<%=request.getContextPath()%>/img/wcb/psbcs.png");
				}
				if(bankNamez == "招商银行"){
					$(this).parents(".quickbank").find("img").attr("src","<%=request.getContextPath()%>/img/wcb/cmbs.png");
				}
				if(bankNamez == "民生银行"){
					$(this).parents(".quickbank").find("img").attr("src","<%=request.getContextPath()%>/img/wcb/cmbcs.png");
				}
				if(bankNamez == "兴业银行"){
					$(this).parents(".quickbank").find("img").attr("src","<%=request.getContextPath()%>/img/wcb/cibs.png");
				}
				if(bankNamez == "光大银行"){
					$(this).parents(".quickbank").find("img").attr("src","<%=request.getContextPath()%>/img/wcb/cebs.png");
				}
				if(bankNamez == "平安银行"){
					$(this).parents(".quickbank").find("img").attr("src","<%=request.getContextPath()%>/img/wcb/pabs.png");
				}
				if(bankNamez == "中信银行"){
					$(this).parents(".quickbank").find("img").attr("src","<%=request.getContextPath()%>/img/wcb/cncbs.png");
				}
				if(bankNamez == "华夏银行"){
					$(this).parents(".quickbank").find("img").attr("src","<%=request.getContextPath()%>/img/wcb/hxbs.png");
				}
				if(bankNamez == "广发银行"){
					$(this).parents(".quickbank").find("img").attr("src","<%=request.getContextPath()%>/img/wcb/cgbs.png");
				}
				if(bankNamez == "浦发银行"){
					$(this).parents(".quickbank").find("img").attr("src","<%=request.getContextPath()%>/img/wcb/spdbs.png");
				}
				/*else{
					$(this).parents(".quickbank").find("img").attr("src","<%=request.getContextPath()%>/img/wcb/bankname.png");	
				}*/
		   });
		});
		
		
		/*防止回传值时del不消失*/
		$(function(){
			$("#shareCurrency").val("x");
			$(".qb-main input").trigger("input");
			
			$(".mymoneyrinput input").focus(function() {
					$(this).parents(".list-block  .sxline").css('border-bottom-color', '#0368b1');
				})
				.blur(function() { 
					$(this).parents(".list-block  .sxline").css('border-bottom-color', '#c8cacc');
		 	})

		})
		
		function gopay(){
			//alert(1);
				var cashmoney = $("#cashmoney").val();
				var pay_code=$("input[name='payradio']:checked").val();
				
				if ($("#quickgopay").hasClass("sx-btn-dark")) {
					return ;
				}
				if(cashmoney == ''){
					$.alert("请输入充值金额");
					/*$("#cashmoney").focus();*/
					return false;	
				}
				if(!pay_code||pay_code==''){
					$.alert("请选择支付方式");
					return false;
				}
				else{
					//loading();
            		$("#formid").submit();
				}
		}
			
		 function amount(th) {
				var regStrs = [['^0(\\d+)$', '$1'], //禁止录入整数部分两位以上，但首位为0
					['^\\.$', '0.'], //禁止第一个为点
					['[^\\d\\.]+$', ''], //禁止录入任何非数字和点
					['\\.(\\d?)\\.+', '.$1'], //禁止录入两个以上的点
					['^(\\d+\\.\\d{2}).+', '$1'] //禁止录入小数点后两位以上
				];
				for (i = 0; i < regStrs.length; i++) {
					var reg = new RegExp(regStrs[i][0]);
						th.value = th.value.replace(reg, regStrs[i][1]);
				}
		 }
		 
      /* var oHeight = $(document).height(); //浏览器当前的高度
	   $(window).resize(function(){
			if($(document).height() < oHeight){
			$(".sjzdbottom").css("position","fixed");
		}else{
			$(".sjzdbottom").css("position","absolute");
		}
	   });*/
 	</script>


</body>
</html>
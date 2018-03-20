<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="renderer" content="webkit" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<title>交易流水</title>
		<link rel="stylesheet"  href="<%=request.getContextPath()%>/css/sxs/reset.css"/>
        <link rel="stylesheet"  href="<%=request.getContextPath()%>/css/sxs/pullToRefresh.css"/>
        
        <link href="<%=request.getContextPath()%>/css/bootstrap/bootstrap.min.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/bootstrap/bootstrap-theme.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/bootstrap/bootstrapValidator.min.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/bootstrap/buttons.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/webuploader.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/datef.css" rel="stylesheet" />
        <link rel="stylesheet"  href="<%=request.getContextPath()%>/css/sxs/reset.css"/>
        <link rel="stylesheet"  href="<%=request.getContextPath()%>/css/sxs/pullToRefresh.css"/>
        
        <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.11.3.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/wechat/layer.m.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap/bootstrap.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap/bootstrapValidator.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/webuploader.min.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/js/webuploader.min.js"></script>
		<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
	
     	<script type="text/javascript" src="<%=request.getContextPath()%>/js/date/datef.js" ></script>
             	<script type="text/javascript" src="<%=request.getContextPath()%>/js/date/ss.js" ></script>

		<script type="text/javascript" src="<%=request.getContextPath()%>/js/date/iscroll.js" ></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/date/pullToRefresh.js"></script>
		
		<style>
			.jdxx a{  font-family:'微软雅黑';}
			.navbar-header-img{ position:absolute; top:30%;left:0;  padding-left:15px;}
			.zfcg_container p{  font-family:"微软雅黑";}
			.zfcg_container dt,dd{ font-family:'微软雅黑';}
			.zfcg_container td,th{ font-family:"微软雅黑";}
			.header-wrapper { left: 0; position: fixed; top: 0;  width: 100%; z-index: 1000;} 	
					
			.pullDown .pullDownIcon, .pullUp .pullUpIcon {
			background:url(<%=request.getContextPath()%>/img/imgs/arrow.png) no-repeat;
			width: 24px;
			height: 24px;
			position: absolute;
			margin-top: 8px;
			margin-bottom: 8px;
			background-position: center;
			margin-left: 30%;
			background-size: auto 100%;
			-webkit-background-size: auto 100%;
			-webkit-transition-property: -webkit-transform;
			-webkit-transition-duration: 250ms;
			-moz-background-size: auto 100%;
			-moz-transition-property: -moz-transform;
			-moz-transition-duration: 250ms;
		}
			.pullDown.loading .pullDownIcon, .pullUp.loading .pullUpIcon {
			background-image: url(<%=request.getContextPath()%>/img/imgs/loader.png);
			background-size: 100% auto;
			background-position: 0 100%;
			-webkit-transform: rotate(0deg) translateZ(0);
			-webkit-transition-duration: 0ms;
			-webkit-animation-name: loading;
			-webkit-animation-duration: 2s;
			-webkit-animation-iteration-count: infinite;
			-webkit-animation-timing-function: linear;
			-moz-transform: rotate(0deg) translateZ(0);
			-moz-transition-duration: 0ms;
			-moz-animation-name: loading;
			-moz-animation-duration: 2s;
			-moz-animation-iteration-count: infinite;
			-moz-animation-timing-function: linear;
		}
		/*.wd_main{ left: 0;top: 51px; position:absolute; width: 100%; z-index: 1000;} 
		.wd_sx{  left: 0;top: 51px; position:relative; width: 100%; z-index: 1001;}*/
        </style>
        
	    <script type="text/javascript">
	   
	    
            $(function(){
                $('#beginTime').date({theme:"date"},Ycallback);
        //        $('#endTime').date({theme:"datetime"});
            });
            
            function Ycallback(seldatatime,isappend){
            	//alert("ddd"); 
            	//alert(isappend);            	
				
				if(typeof(isappend) == "undefined"){
					$('#beginTime').val(seldatatime);
	            	$('#sumOrderAmount').val('0.00');
					$('#sumNum').val(0);
					$('#curPage').val(1);
					//alert("remove"); 
					//alert(document.querySelectorAll("#wrapper2 ul li").length);
					//var licn = document.querySelectorAll("#wrapper2 ul li").length;
					//for(var i=0;i<licn;i++){
					//	document.querySelectorAll("#wrapper2 ul li")[i].remove(); 
					//}
					
					var divs = document.querySelectorAll("#wrapper2 ul li"), i;

					for (i = 0; i < divs.length; ++i) {
					  divs[i].remove();
					}



				}
            	
            	$.post("<%=request.getContextPath()%>/QRPay/payOrderRecordsJson", {
            		beginTime: $("input[name='beginTime']").val(),
            		openid: $("input[name='openid']").val(),
            		curPage: $("input[name='curPage']").val()
				}, function(json) {				
					//alert(json);
					if(typeof(json) != "undifined") {
						//alert(json['orderTotalAmount']);
						if(json['orderTotalNum']=='0'){
							layer.open({
								type: 3,
								content: '没有交易记录'
							});
						}
						appendData(json,isappend);
					}else{
						layer.open({
							type: 3,
							content: '没有交易记录'
						});
					}

				}, "json");
            	
            	
            }
		</script>
</head>
<body>
<!--must content ul li,or shoupi-->
<input type="hidden" id="openid" name="openid" value="${openid}">
<input type="hidden" id="curPage" name="curPage" value="${curPage}">
<div class="parOrder_db ">
	<div class="data_container"> 
		<div class="lie container">
			<div class="row">
            	<div class="col-xs-2 data_img">
                	<a style=" color:#262626; font-size:14px; font-family:'微软雅黑'; width:20%"><img height="32px" src="<%=request.getContextPath()%>/img/imgs/paydata.png" /></a>
            	</div>
				<div class="col-xs-9" >
					<input  id="beginTime"  name ="beginTime" placeholder="请选择日期"  class="kbtn" />
				</div>
			</div>
		</div>
	</div>
	<div id="datePlugin"></div>
</div> 
</div>
  
<div id="wrapper2"> <!-- style=" padding-top:17%;;" -->
	<ul>
            <div class="wd_main container" >
                <div class="row" style=" margin:0; padding:0;">
                        <div class="col-md-6 col-sm-6 col-xs-6" style="border-right: solid 1px #ededed;">
                            <dl class="wd_main1">
                                <dt><img  width="16%" src="<%=request.getContextPath()%>/img/imgs/money.png"></dt>
                                <dd>交易成功总金额:</dd>
                                <dd class="paymoney"><input  style=" text-align:center; width:40%; "  type="text" id="sumOrderAmount"  name="sumOrderAmount" value="0.00"  /></dd>
                            </dl>
                        </div>
                        <div class="col-md-6 col-sm-6 col-xs-6">
                            <dl class="wd_main1">
                                <dt><img  width="16%" src="<%=request.getContextPath()%>/img/imgs/Numbers.png"></dt>
                                 <dd>交易成功总笔数:</dd>
                                <dd class="paymoney"><input style=" text-align:center; width:40%; " type="text" id="sumNum"  name="sumNum" value="${report.sumNum }" />笔</dd>
                            </dl>
                        </div>
                </div>
            </div>
            <div style="height:8px; background:#f0f0f0;"></div>
           <div class="wd_sx">
    
            </div>
	</ul>   	
</div>


	<script>
			for(var i=0;i<document.querySelectorAll("#wrapper ul li").length;i++){
			document.querySelectorAll("#wrapper2 ul li")[i]}
	
        	refresher.init({
			id:"wrapper2",
			//pullDownAction:Refresh,                                                            
			pullUpAction:Load 																			
			});	
		var generatedCount = 0;																			

		/* function Refresh() {																
			setTimeout(function () {	
				var el, li, i;																		
				el =document.querySelector("#wrapper2 ul");					
				 			
				document.getElementById("wrapper2").querySelector(".pullDownIcon").style.display="none";		
				document.getElementById("wrapper2").querySelector(".pullDownLabel").innerHTML="刷新成功";																					 
				setTimeout(function () {
					wrapper2.refresh();
					document.getElementById("wrapper2").querySelector(".pullDownLabel").innerHTML="";								
					},1000); 
			}, 1000);
		} */
		
		function Load() {
			setTimeout(function () {
				var cp = $("input[name='curPage']").val();
				var cpp = Number(cp)+1;
				//alert(cpp);
				$("input[name='curPage']").val(cpp)
				Ycallback($("input[name='beginTime']").val(),true);
				wrapper2.refresh();
			},1000);	
		}

		function appendData(data,isappend) {
 			var totalamount = data['orderTotalAmount'];
 
			//alert(isappend);
			//alert($('#curPage').val());
			//alert(data['totalPage']);
			if($('#curPage').val()<=data['totalPage']){
     		//alert(data.payRecordsList.length);

     			$('#sumOrderAmount').val(data['orderTotalAmount']);
				$('#sumNum').val(data['orderTotalNum']);
				$('#curPage').val(data['curPageNo']);
				//alert(document.querySelectorAll("#wrapper2 ul li").length);
				
					//data是返回结果的对象 (json数组) 
					//假设返回结果对象为:
					//[{id:D0,amount:10000,date:10-12 16:16},{id:D0,amount:10000,date:10-12 16:16},{id:D0,amount:10000,date:10-12 16:16}]
					var $wrapper2Ul = $("#wrapper2 ul");
					var liHtml = "";
					$.each(data.payRecordsList, function(index, item){//遍历数组
						var oa = item.orderAmount;
						//根据不同的数据生成有变化的HTML
						var tmpHtml = '<li>'+'<div class="payOrder_container2 container">'
								 	+'<div class="row payOrder_lb" style="margin:0; padding:0;">'
                                        +'<div class="payOrder_lbn col-md-2 col-sm-2 col-xs-2">'
											+'<a class="sh">'+item.settleType+'</a>'
										+'</div>';
										if(item.payWayCode =='WEIXIN'){
										tmpHtml +='<div class="payOrder_lbn col-md-2 col-sm-2 col-xs-2">'
											+'<img  width="50%" src="<%=request.getContextPath()%>/img/imgs/wxzf.png" />'
										+'</div>';
										}
										if(item.payWayCode=='ALIPAY'){
											tmpHtml +='<div class="payOrder_lbn col-md-2 col-sm-2 col-xs-2">'
										+'<img  width="50%" src="<%=request.getContextPath()%>/img/imgs/zfbzf.png" />'
										+'</div>';
										}
										tmpHtml +='<div class="payOrder_lbn col-md-4 col-sm-4 col-xs-4">'
											+'<dl>'
												+'<dd>'+'金额'+'</dd>'
												+'<dt>'+oa.toFixed(2)+'<a>'+'</a>'+'</dt>'
											+'</dl>'
										+'</div>'
										+'<div class="payOrder_lbn payOrder_lbn1 col-md-4 col-sm-4 col-xs-4">'
											+'<a>'+getLocalTime(item.createTime)+'</a>'
										+'</div>'
                                    +'</div>'
								 +'</div>'+'</li>';
						liHtml += tmpHtml;
					});
					//插入到wrapper2 ul 里面
					//$wrapper2Ul.empty();
					$wrapper2Ul.append(liHtml);
			}
		
		}	
		
		function getLocalTime(nS) { 
			var dt = new Date(parseInt(nS) );			 
			
			var year=dt.getYear(); 
 
			var month=dt.getMonth()+1; 
			if(month<10) month = '0' + month;   
			
			var date=dt.getDate(); 
			if(date<10) date = '0' + date; 
			
			var hour=dt.getHours();
			if(hour<10) hour = '0' + hour; 
			
			var minute=dt.getMinutes(); 
			if(minute<10) minute = '0' + minute; 
			
			var second=dt.getSeconds(); 
			if(second<10) second = '0' + second; 
			
			return month+"-"+date+" "+hour+":"+minute+":"+second; 
			// return new Date(parseInt(nS) ).toLocaleString().substr(0,17);
	    } 
		
		
		 Ycallback("${beginTime}");
	</script>   
	
   <!--  function Load() {
     		$.ajax({
				url:"",//服务端http接口
				type:"POST",//请求方式 POST 或者GET
				dataType:"json",// 一般用json格式来通信
				data:{},//http接口需要的参数
				success:function(data){
					//data是返回结果的对象 (json数组) 
					//假设返回结果对象为:
					//[{id:D0,amount:10000,date:10-12 16:16},{id:D0,amount:10000,date:10-12 16:16},{id:D0,amount:10000,date:10-12 16:16}]
					var $wrapper2Ul = $("#wrapper2 ul");
					var liHtml = "";
					$.each(data, function(index, item){//遍历数组
						//根据不同的数据生成有变化的HTML
						var tmpHtml = '<div class="payOrder_container2 container">'
								 	+'<div class="row payOrder_lb" style="margin:0; padding:0;">'
                                        +'<div class="payOrder_lbn col-md-2 col-sm-2 col-xs-2">'
											+'<a class="sh">'+item.id+'</a>'
										+'</div>'
                                        +'<div class="payOrder_lbn col-md-2 col-sm-2 col-xs-2">'
											+'<img  width="50%" src="img/imgs/wxzf.png" />'
										+'</div>'
                                        +'<div class="payOrder_lbn col-md-4 col-sm-4 col-xs-4">'
											+'<dl>'
												+'<dd>'+'金额'+'</dd>'
												+'<dt>'+item.amount+'<a>'+'￥'+'</a>'+'</dt>'
											+'</dl>'
										+'</div>'
										+'<div class="payOrder_lbn payOrder_lbn1 col-md-4 col-sm-4 col-xs-4">'
											+'<a>'+item.date+'</a>'
										+'</div>'
                                    +'</div>'
								 +'</div>';
						liHtml += tmpHtml;
					});
					//插入到wrapper2 ul 里面
					$wrapper2Ul.append(liHtml);
				}
			});
		}	
    -->
    
    
	<!--	function Load() {
			setTimeout(function () {
				var el, li, i;
				el =document.querySelector("#wrapper2 ul");
				for (i=0; i<2; i++) {
					li = document.createElement('li');
					li.innerHTML=
								'<div class="payOrder_container2 container">'
								 	+'<div class="row payOrder_lb" style="margin:0; padding:0;">'
                                        +'<div class="payOrder_lbn col-md-2 col-sm-2 col-xs-2">'
											+'<a class="sh">'+'D0'+'</a>'
										+'</div>'
                                        +'<div class="payOrder_lbn col-md-2 col-sm-2 col-xs-2">'
											+'<img  width="50%" src="/img/imgs/wxzf.png" />'
										+'</div>'
                                        +'<div class="payOrder_lbn col-md-4 col-sm-4 col-xs-4">'
											+'<dl>'
												+'<dd>'+'金额'+'</dd>'
												+'<dt>'+'100000'+'<a>'+'￥'+'</a>'+'</dt>'
											+'</dl>'
										+'</div>'
										+'<div class="payOrder_lbn payOrder_lbn1 col-md-4 col-sm-4 col-xs-4">'
											+'<a>'+'10-12 16:16'+'</a>'
										+'</div>'
                                    +'</div>'
								 +'</div>'	
					
					el.appendChild(li, el.childNodes[0]);
				}
				wrapper2.refresh();
				for(var i=0;i<document.querySelectorAll("#wrapper2 ul li").length;i++){
				document.querySelectorAll("#wrapper2 ul li")[i] }
			},1000);	
		}
	-->	
         
</body>
</html>
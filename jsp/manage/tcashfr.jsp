<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="renderer" content="webkit" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<title>提现明细</title>
		<link rel="stylesheet"  href="<%=request.getContextPath()%>/css/sxs/reset.css"/>
        <link rel="stylesheet"  href="<%=request.getContextPath()%>/css/sxs/pullToRefresh.css"/>
        
        <link href="<%=request.getContextPath()%>/css/bootstrap/bootstrap.min.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/bootstrap/bootstrap-theme.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/bootstrap/bootstrapValidator.min.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/bootstrap/buttons.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/webuploader.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" />
        <link href="<%=request.getContextPath()%>/css/manage.css" rel="stylesheet" />
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

		<script type="text/javascript" src="<%=request.getContextPath()%>/js/date/iscroll.js" ></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/date/pullToRefresh.js"></script>
		
		<style>
			.jdxx a{  font-family:'微软雅黑';}
			.navbar-header-img{ position:absolute; top:30%;left:0;  padding-left:15px;}
			.zfcg_container p{  font-family:"微软雅黑";}
			.zfcg_container dt,dd{ font-family:'微软雅黑';}
			.zfcg_container td,th{ font-family:"微软雅黑";}
			.header-wrapper { left: 0; position: fixed; top: 0;  width: 100%;  z-index: 1000;} 
			.daywrapper1{ display:none;}	
					
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
		
		.tcashfr a{ color:#62b900; font-family:'微软雅黑'; font-size:12px;}
		.tcashfr_mx_container{ border-bottom:solid 1px #e8e8e8;}
		.tcashfr_mx{ height:70px; line-height:70px; text-align:center; }
		.tcashfr_mxt{ top:14px; text-align:center; }
		.tcashfr_mxt dt{ font-size:16px;}
		.tcashfr_mxt dd{ font-size:14px; color:#666;}
		.tcashfr_mx1 a{ font-size:12px; color:#666; font-weight:bold; }
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
	            	//$('#sumOrderAmount').val('0.00');
					//$('#sumNum').val(0);
					$('#curPage').val(1);

					var divs = document.querySelectorAll("#wrapper2 ul li"), i;

					for (i = 0; i < divs.length; ++i) {
					  divs[i].remove();
					}
				}
            	
				$.ajax({
					url:"<%=request.getContextPath()%>/Manage/tcashfrJson",
					data:{
	            		"beginTime": $("input[name='beginTime']").val(),
	            		"orgCode": $("input[name='orgCode']").val(),
	            		"curPage": $("input[name='curPage']").val(),
	            		"type": $("input[name='type']").val()
					},
					type:"post",
					dataType:"json",
					success:function(json){
						if(typeof(json) != "undifined") {
							//alert(json['orderTotalAmount']);
							if(json['orderTotalNum']=='0'){
								layer.open({
									type: 3,
									content: '没有提现记录'
								});
							}
							appendData(json,isappend);
						}else{
							layer.open({
								type: 3,
								content: '没有提现记录'
							});
						}
					},
					error:function(xmlhttp,x,z){
						alert(xmlhttp.status);
					}
				});
				
				
            	<%-- $.post("<%=request.getContextPath()%>/Manage/tcashfrJson", {
            		beginTime: $("input[name='beginTime']").val(),
            		orgCode: $("input[name='orgCode']").val(),
            		curPage: $("input[name='curPage']").val()
				}, function(json) {				
					//alert(json);
					if(typeof(json) != "undifined") {
						//alert(json['orderTotalAmount']);
						if(json['orderTotalNum']=='0'){
							layer.open({
								type: 3,
								content: '没有提现记录'
							});
						}
						appendData(json,isappend);
					}else{
						layer.open({
							type: 3,
							content: '没有提现记录'
						});
					}

				}, "json"); --%>
            	
            	
            }
		</script>
</head>
<body>
<input type="hidden" id="orgCode" name="orgCode" value="${orgCode}">
<input type="hidden" id="type" name="type" value="${type}">
<input type="hidden" id="curPage" name="curPage" value="${curPage}">
<input type="hidden" id="beginTime" name="beginTime" value="">
<div id="wrapper2" >
	<ul style="padding-top:20px; background:#fff;">
	</ul>   	
</div>
	<script>
	refresher.init({
		id:"wrapper2",
		//pullDownAction:Refresh,                                                            
		pullUpAction:Load 																			
		});	
	var generatedCount = 0;																			
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
			//var totalamount = data['orderTotalAmount'];

		//alert(isappend);
		//alert($('#curPage').val());
		//alert(data['totalPage']);
		if($('#curPage').val()<=data['totalPage']){
 		//alert(data.payRecordsList.length);
			$('#curPage').val(data['curPageNo']);
			/* $('#createTime').val(data['createTime']); */
			//alert(document.querySelectorAll("#wrapper2 ul li").length);
			
				//data是返回结果的对象 (json数组) 
				//假设返回结果对象为:
				//[{id:D0,amount:10000,date:10-12 16:16},{id:D0,amount:10000,date:10-12 16:16},{id:D0,amount:10000,date:10-12 16:16}]
				var $wrapper2Ul = $("#wrapper2 ul");
				var liHtml = "";
				$.each(data.payRecordsList, function(index, item){//遍历数组
					//alert(item.profit);
					//var oa = item.profit;
					//根据不同的数据生成有变化的HTML
					var tmpHtml = '<li>'+'<div class="payOrder_container2 container">'
				 	+'<div class="row tcashfr_mx_container" style="margin:0; padding:0;">'
                    +'<div class="tcashfr_mx tcashfr_mx1  col-md-4 col-sm-4 col-xs-4">'
						+'<a>'+getLocalTime(item.createTime)+'</a>'
					+'</div>'
                    +'<div class=" tcashfr_mxt col-md-3 col-sm-3 col-xs-3" >'
						+'<dl>'
							+'<dt>'+'<a>'+'</a>'+ item.applyMoney +'</dt>'
							+'<dd>'+'金额'+'</dd>'
						+'</dl>'
					+'</div>'
					+'<div class=" tcashfr_mxt col-md-3 col-sm-3 col-xs-3">'
						+'<dl>'
							+'<dt>'+'<a>'+'</a>'+ item.procedureFee+'</dt>'
							+'<dd>'+'手续费'+'</dd>'
						+'</dl>'
					+'</div>'
					+'<div class="tcashfr_mx tcashfr col-md-2 col-sm-2 col-xs-2" >'
						+'<a>'+item.statusDesc+'</a>'
					+'</div>'
                +'</div>'
			 +'</div>'	+'</li>';
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
			/* for(var i=0;i<document.querySelectorAll("#wrapper ul li").length;i++){
			document.querySelectorAll("#wrapper2 ul li")[i]}
        	refresher.init({
			id:"wrapper2",
			pullUpAction:Load 																			
			});	
		var generatedCount = 0;																		
		
		function Load() {
			setTimeout(function () {
				var el, li, i;
				el =document.querySelector("#wrapper2 ul");
				for (i=0; i<2; i++) {
					li = document.createElement('li');
					li.innerHTML=
								'<div class="payOrder_container2 container">'
								 	+'<div class="row tcashfr_mx_container" style="margin:0; padding:0;">'
                                        +'<div class="tcashfr_mx tcashfr_mx1  col-md-3 col-sm-3 col-xs-3">'
											+'<a>'+'2016-10-12'+'</a>'
										+'</div>'
                                        +'<div class=" tcashfr_mxt col-md-4 col-sm-4 col-xs-4" >'
											+'<dl>'
												+'<dt>'+'<a>'+'</a>'+'100000'+'</dt>'
												+'<dd>'+'金额'+'</dd>'

											+'</dl>'
										+'</div>'
										+'<div class=" tcashfr_mxt col-md-3 col-sm-3 col-xs-3">'
											+'<dl>'
												
												+'<dt>'+'<a>'+'</a>'+'1000'+'</dt>'
												+'<dd>'+'手续费'+'</dd>'
											+'</dl>'
										+'</div>'
										+'<div class="tcashfr_mx tcashfr col-md-2 col-sm-2 col-xs-2" >'
											+'<a>'+'成功'+'</a>'
										+'</div>'
                                    +'</div>'
								 +'</div>'	
					el.appendChild(li, el.childNodes[0]);
				}
				wrapper2.refresh();
				for(var i=0;i<document.querySelectorAll("#wrapper2 ul li").length;i++){
				document.querySelectorAll("#wrapper2 ul li")[i] }
			},1000);	
		} */
	</script>   
</body>
</html>
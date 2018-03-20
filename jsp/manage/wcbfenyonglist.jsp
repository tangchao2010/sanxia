<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="renderer" content="webkit" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
    	<meta name="viewport" content="initial-scale=1,maximum-scale=1, minimum-scale=1">
		<title>分佣明细</title>
        <link href="<%=request.getContextPath()%>/css/bootstrap/bootstrap.min.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" />
        <link rel="stylesheet"  href="<%=request.getContextPath()%>/css/sxs/wcbpullToRefresh.css"/>
        <link href="<%=request.getContextPath()%>/css/wcbstyle.css" rel="stylesheet" />
        <script>
            (function () {
                document.addEventListener('DOMContentLoaded', function () {
                    var html = document.documentElement;
                    var windowWidth = html.clientWidth;
                    html.style.fontSize = windowWidth / 7.5 + 'px';
                }, false);
            })();
        </script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.11.3.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap/bootstrap.min.js"></script>
		<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
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
			.infor_list_container { padding: 2% 15px 2% 15px;  border-bottom: solid 1px #cfcfcf; background:#fff; margin-top:10px;}
			.infor_yc{overflow:hidden; text-overflow:ellipsis; white-space:nowrap; -ms-text-overflow: ellipsis;text-overflow: ellipsis;white-space: nowrap;}
			
			.zfsuc-top {
				margin-top: 0;
			}
			.zfsuc-top dl{
				text-align:center;	
				color:#fff;
			}
			.zfsuc-top dt{
				font-size:.9rem;
				line-height:1.2rem;
				height:1.2rem;
				font-weight:normal;
				color:#fff;
				-moz-text-shadow: 1px 1px 0px #cccccc; 
				text-shadow: 1px 1px 0px #ccc;
			}
			.zfsuc-top dd{
				padding-bottom:.2rem;
				padding-top:.2rem;
				color:#000;
				font-size:.3rem;
			}
					
			.pullDown .pullDownIcon, .pullUp .pullUpIcon {
				background:url(<%=request.getContextPath()%>/img/imgs/arrow.png) no-repeat;
				width: .4rem;
				height: .4rem;
				position: absolute;
				margin-top: .2rem;
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
		
			.tcashfr a{ color:#000; font-family:'微软雅黑'; font-size:16px;}
			.tcashfr_mx_container{ border-bottom:solid 1px #e8e8e8;}
			.tcashfr_mx{ height:70px; line-height:70px; text-align:center; }
			.tcashfr_mxt{ top:14px; text-align:center; }
			
			.infor_list_mc ,.infor_list_tel ,.infor_list_zc{ text-align:center; font-size:18px; color:#000;  line-height:60px; font-family:'微软雅黑';}
			#wrapper2 {
				-webkit-box-flex: 1;
				-webkit-flex: 1;
				-ms-flex: 1;
				flex: 1;
				background-color: #eee;
				overflow-y: scroll;
				-webkit-overflow-scrolling: touch;
			}
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
					url:"<%=request.getContextPath()%>/Manage/FYMXInfoJson",
					data:{
	            		"orgCode": $("input[name='orgCode']").val(),
	            		"curPage": $("input[name='curPage']").val()
					},
					type:"post",
					dataType:"json",
					success:function(json){
						if(typeof(json) != "undifined") {
							//alert(json['orderTotalAmount']);
							if(json['orderTotalNum']=='0'){
								layer.open({
									type: 3,
									content: '没有分佣记录'
								});
							}
							appendData(json,isappend);
						}else{
							layer.open({
								type: 3,
								content: '没有分佣记录'
							});
						}
					},
					error:function(xmlhttp,x,z){
						//alert(xmlhttp.status);
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
    <input type="hidden" id="curPage" name="curPage" value="${curPage}">
    <input type="hidden" id="beginTime" name="beginTime" value="">
	<div class="wcb_container">
    	<div class="zfsuc-top" style=" background:url(<%=request.getContextPath()%>/img/imgs/detailmx.jpg) no-repeat center ; width:7.5rem; height:3rem;" >
        	<dl style=" font-size:.3rem; color:#999;;">
            	<dt>${incomeEarned }</dt>
            	<dd>已获得推广收益( 元 )</dd>
        	</dl>
        </div>
        
        <div id="wrapper2" >
        	<ul>
            </ul>   	
        </div>
        
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
							var tmpHtml = '<li class="wcb_detailed" >'
												+'<dl>'
													+'<dt>'
														+'<em class="list_em1" >'+item.payerOrgName+'</em>'
														+'<em class="list_em2" >'+getLocalTime(item.createTime)+'</em>'
													+'</dt>'
													+'<dd class="list_d1">'
														+'<ul class="list_d1_u1">'
															+'<li>'+'级别：'+'<em>'+item.shortGoodsName+'</em>'+'</li>'
															+'<li>'+item.payerPhone+'</li>'
														+'</ul>'
														+'<ul class="list_d1_u2">'
															+'<li>推广收益</li>'
															+'<li>'+item.subMoney+'</li>'
														+'</ul>'
													+'</dd>'
												+'</dl>'
											+'</li>';	
			
					liHtml += tmpHtml;
				});
				//插入到wrapper2 ul 里面
				//$wrapper2Ul.empty();
				$wrapper2Ul.append(liHtml);
		}
	
	}	
	function getLocalTime(nS) { 
		var dt = new Date(nS);			 
		var year=dt.getFullYear(); 

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
		
		return year+"-"+ month+"-"+date; 
		// return new Date(parseInt(nS) ).toLocaleString().substr(0,17);
    } 
	 Ycallback("${beginTime}");
</script>   
</body>
</html>
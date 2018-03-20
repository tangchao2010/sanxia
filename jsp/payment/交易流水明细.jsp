<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="renderer" content="webkit" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
    	<meta name="viewport" content="initial-scale=1,maximum-scale=1, minimum-scale=1">
		<title>交易流水</title>
        <link href="<%=request.getContextPath()%>/css/bootstrap/bootstrap.min.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" />
        <link rel="stylesheet"  href="<%=request.getContextPath()%>/css/sxs/wcbpullToRefresh.css"/>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/sm/sm.min.css">
		<link rel="stylesheet" href="<%=request.getContextPath()%>/css/sm/mystyle.css">	
        <link href="<%=request.getContextPath()%>/css/wcbstyle.css" rel="stylesheet" />
        <link href="<%=request.getContextPath()%>/css/date.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/datef.css" rel="stylesheet" />
       
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
					
			.pullDown .pullDownIcon, .pullUp .pullUpIcon {
				background:url(<%=request.getContextPath()%>/img/imgs/arrow.png) no-repeat;
				width: .4rem;
				height: .4rem;
				position: absolute;
				margin-top: .25rem;
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
			/*覆盖*/
			.pullUp {
				text-align: center;
				height: 2.5rem;
				background: #f5f5f5;
				line-height: 2.5rem;
				font-size: .75rem;
				color: #333;
			}
			.pullDown .pullDownIcon, .pullUp .pullUpIcon {
				background: url(/webappnew/img/imgs/arrow.png) no-repeat;
				width: 1rem;
				height: 1rem;
				position: absolute;
				margin-top: .75rem;
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
        </style>
</head>
<body>
<input type="hidden" id="openid" name="openid" value="${openid}">
<input type="hidden" id="curPage" name="curPage" value="${curPage}">
	<div class="page-group">
		<div class="page page-current">
        	<header class="bar bar-nav">
                <a class="icon icon-left pull-left back"></a>
                <h1 class='title'>交易流水</h1>
            </header>
			<div class="content">
				<div class="content-block ">
					<div class="wcb_container">
              
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
                                        <!-- <dir class="col-xs-5 frtime">
                                            <span >截至时间：<a><font id="createTime" name="createTime"></font></a></span>
                                        </dir> -->
                                    </div>
                                </div>
                            </div>
                            <div id="datePlugin"></div>
                        </div> 
                        
                        <div id="wrapper2"> <!-- style=" padding-top:17%;;" -->
                        	<ul>
                                <div class="wd_main container" >
                                    <div class="row" style=" margin:0; padding:0;">
                                            <div class="col-md-6 col-sm-6 col-xs-6" style="border-right: solid 1px #ededed;">
                                                <dl class="wd_main1">
                                                    <dt><img  width="16%" src="<%=request.getContextPath()%>/img/imgs/money.png"></dt>
                                                    <dd>分润总金额:</dd>
                                                    <dd class="paymoney"><input  style=" text-align:center; width:40%; "  type="text" id="sumOrderAmount"  name="sumOrderAmount" value="0.00"  /></dd>
                                                </dl>
                                            </div>
                                            <div class="col-md-6 col-sm-6 col-xs-6">
                                                <dl class="wd_main1">
                                                    <dt><img  width="16%" src="<%=request.getContextPath()%>/img/imgs/Numbers.png"></dt>
                                                     <dd>分润总笔数:</dd>
                                                    <dd class="paymoney"><input style=" text-align:center; width:40%; " type="text" id="sumNum"  name="sumNum" value="${report.sumNum }" />笔</dd>
                                                </dl>
                                            </div>
                                    </div>
                                </div>
                                <div style="height:1px; background:#f0f0f0;"></div>
								<div class="wd_sx">
								</div>
                        	</ul>   	
						</div>
                        
					</div>
				</div>
			</div>
		</div>
	</div>

    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/date/iscroll.js" ></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/date/pullToRefresh.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/date/date.js" ></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/date/datef.js" ></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/date/ss.js" ></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/date/iscroll.js" ></script>

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

					var divs = document.querySelectorAll("#wrapper2 ul li"), i;

					for (i = 0; i < divs.length; ++i) {
					  divs[i].remove();
					}
				}
            	
            	$.post("<%=request.getContextPath()%>/Manage/frqueryJson", {
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
								content: '没有分润记录'
							});
						}
						appendData(json,isappend);
					}else{
						layer.open({
							type: 3,
							content: '没有分润记录'
						});
					}

				}, "json");
            	
            	
            }
		</script>
        
    <script>
		//	for(var i=0;i<document.querySelectorAll("#wrapper ul li").length;i++){
		//	document.querySelectorAll("#wrapper2 ul li")[i]}
	
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
				/* $('#createTime').val(data['createTime']); */
				//alert(document.querySelectorAll("#wrapper2 ul li").length);
				
					//data是返回结果的对象 (json数组) 
					//假设返回结果对象为:
					//[{id:D0,amount:10000,date:10-12 16:16},{id:D0,amount:10000,date:10-12 16:16},{id:D0,amount:10000,date:10-12 16:16}]
					var $wrapper2Ul = $("#wrapper2 ul");
					var liHtml = "";
					$.each(data.payRecordsList, function(index, item){//遍历数组
						//alert(item.profit);
						var oa = item.profit;
						//根据不同的数据生成有变化的HTML
						var tmpHtml = '<li>'+'<div class="payOrder_container2 container">'
								 	+'<div class="row payOrder_lb" style="margin:0; padding:0;">'
                                        +'<div class="payOrder_lbn col-md-2 col-sm-2 col-xs-2">'
											+'<a class="sh"></a>'
										+'</div>'
                                        +'<div class="payOrder_lbn col-md-2 col-sm-2 col-xs-2">'
											+'<img  width="50%" src="<%=request.getContextPath()%>/img/imgs/fr_pic.png" />'
										+'</div>'
                                        +'<div class="payOrder_lbn col-md-4 col-sm-4 col-xs-4">'
											+'<dl>'
												+'<dd>'+'分润'+'</dd>'
												+'<dt>'+oa+'<a>'+'</a>'+'</dt>'
											+'</dl>'
										+'</div>'
										+'<div class="payOrder_lbn payOrder_lbn1 col-md-4 col-sm-4 col-xs-4">'
											+'<a>'+getLocalTime(item.completeTime)+'</a>'
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
    
    
</body>
</html>
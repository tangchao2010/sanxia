<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
	<title>交易流水明细</title>
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-capable" content="yes">  <!--删除默认的苹果工具栏和菜单栏-->
    <meta name="apple-mobile-web-app-status-bar-style" content="black"> <!-- 控制状态栏显示样式-->
    <meta name="format-detection" content="telephone=no" /> <!--禁止拨打电话-->
    <meta charset="utf-8" >
        
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/sm/sm.min.css">
	<link rel="stylesheet"  href="<%=request.getContextPath()%>/css/sxs/pullToRefresh.css"/>
	<link href="<%=request.getContextPath()%>/css/datef.css" rel="stylesheet" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/sm/mystyle.css">	
	<style>
		/*覆盖*/
			.scroller li {
				height: 3rem;
				background-color: #fff;
				font-size: .7rem;
			}
	</style>
</head>
<body>

<div class="page-group">
        <div class="page page-current" >
            <header class="bar bar-nav rfreshDatetop">
            	<a class="icon icon-left pull-left back"></a>
                <h1 class="title">交易流水明细</h1>
            </header>
             <input type="hidden" id="openid" name="openid" value="${openid}">
             <input type="hidden" id="curPage" name="curPage" value="${curPage}">
            <section>
            	<div class="refreshDate shareLoana">
                	<div class="sxpublic refreshDateframe">
                    	<!--<span><img src="img/binddateh.png" ></span>-->
                    	<input  id="beginTime"  name ="beginTime" placeholder="请选择日期"  class="kbtn" />
               		</div>
           			<div id="datePlugin"></div>
            	</div>
            </section>
			<div class="content">
                <div id="wrapper">
                    <ul>
                    	<div class=" refreshMoney ">
                            <div class="row text-center topbox-d3" style="margin-left:0;">
                                <div class="col-50 jyline" style="width:50%; margin-left:0;">
                                    <input class="topbox-pp1"  style=" text-align:center; border:none; width:50%;"  type="text" id="sumOrderAmount"  name="sumOrderAmount" value="0.00"  />
                                    <p class="topbox-pp2">交易成功总金额（元）</p>
                                </div>
                                <div class="col-50" style="width:50%; margin-left:0;">
                                    <input class="topbox-pp1"  style=" text-align:center; border:none; width:50%;"  type="text" id="sumNum"  name="sumNum" value="${report.sumNum }"  />
                                    <p class="topbox-pp2">交易成功总笔数（笔）</p>
                                </div>
                            </div>
                        </div>
                        
                    </ul>   	
                </div>
    		</div>
        </div>
    </div>
    
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/sm/jquery-3.1.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/sm/mypublic.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/sm/sm.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/date/pullToRefresh.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/date/iscroll.js" ></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/date/datef.js" ></script>

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
					//alert(document.querySelectorAll("#wrapper ul li").length);
					//var licn = document.querySelectorAll("#wrapper ul li").length;
					//for(var i=0;i<licn;i++){
					//	document.querySelectorAll("#wrapper ul li")[i].remove(); 
					//}
					
					var divs = document.querySelectorAll("#wrapper ul li"), i;

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
							$.toast("没有交易记录");
						}
						appendData(json,isappend);
					}else{
						$.toast("没有交易记录");
					}

				}, "json");
            	
            	
            }
		</script>

	<script>
			for(var i=0;i<document.querySelectorAll("#wrapper ul li").length;i++){
			document.querySelectorAll("#wrapper ul li")[i]}
	
        	refresher.init({
			id:"wrapper",
			//pullDownAction:Refresh,                                                            
			pullUpAction:Load 																			
			});	
		var generatedCount = 0;																			

		/* function Refresh() {																
			setTimeout(function () {	
				var el, li, i;																		
				el =document.querySelector("#wrapper ul");					
				 			
				document.getElementById("wrapper").querySelector(".pullDownIcon").style.display="none";		
				document.getElementById("wrapper").querySelector(".pullDownLabel").innerHTML="刷新成功";																					 
				setTimeout(function () {
					wrapper.refresh();
					document.getElementById("wrapper").querySelector(".pullDownLabel").innerHTML="";								
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
				wrapper.refresh();
			},1000);	
		}

		function appendData(data,isappend) {
 			var totalamount = data['orderTotalAmount'];
 
			if($('#curPage').val()<=data['totalPage']){
     		//alert(data.payRecordsList.length);

     			$('#sumOrderAmount').val(data['orderTotalAmount']);
				$('#sumNum').val(data['orderTotalNum']);
				$('#curPage').val(data['curPageNo']);
				//alert(document.querySelectorAll("#wrapper ul li").length);
				
					//data是返回结果的对象 (json数组) 
					//假设返回结果对象为:
					//[{id:D0,amount:10000,date:10-12 16:16},{id:D0,amount:10000,date:10-12 16:16},{id:D0,amount:10000,date:10-12 16:16}]
					var $wrapperUl = $("#wrapper ul");
					var liHtml = "";
					$.each(data.payRecordsList, function(index, item){//遍历数组
						var oa = item.orderAmount;
						//根据不同的数据生成有变化的HTML
						var tmpHtml = '<li>'+'<div class="refreshMain shareLoana">'
										+'<i>'+item.settleType+'</i>';
										if(item.payWayCode =='WEIXIN'){
										tmpHtml +='<div class="refreshImg">'
											+'<img src="<%=request.getContextPath()%>/img/wcb/wxpay.png" />'
										+'</div>';
										}
										if(item.payWayCode=='ALIPAY'){
										tmpHtml +='<div class="refreshImg">'
											+'<img src="<%=request.getContextPath()%>/img/wcb/zfbpay.png" />'
										+'</div>';
										}
										if(item.payWayCode=='FASTPAYMENT'){
										tmpHtml +='<div class="refreshImg">'
											+'<img src="<%=request.getContextPath()%>/img/wcb/kjpay.png" />'
										+'</div>';
										}
										tmpHtml +='<dl class="refreshMid">'
												+'<dd>'+oa.toFixed(2)+'</dd>'
												+'<dd>'+'金额'+'</dd>'
											+'</dl>'
										+'<span>'+getLocalTime(item.createTime)+'</span>'
                                    +'</div>'
								 +'</div>'+'</li>';
								 
						liHtml += tmpHtml;
					});
					//插入到wrapper ul 里面
					//$wrapperUl.empty();
					$wrapperUl.append(liHtml);
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
					var $wrapperUl = $("#wrapper ul");
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
					//插入到wrapper ul 里面
					$wrapperUl.append(liHtml);
				}
			});
		}	
    -->
    
    
	<!--	function Load() {
			setTimeout(function () {
				var el, li, i;
				el =document.querySelector("#wrapper ul");
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
				wrapper.refresh();
				for(var i=0;i<document.querySelectorAll("#wrapper ul li").length;i++){
				document.querySelectorAll("#wrapper ul li")[i] }
			},1000);	
		}
	-->	
         
</body>
</html>
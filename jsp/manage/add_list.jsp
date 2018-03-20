<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
	<title>门店码信息</title>
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-capable" content="yes">  <!--删除默认的苹果工具栏和菜单栏-->
    <meta name="apple-mobile-web-app-status-bar-style" content="black"> <!-- 控制状态栏显示样式-->
    <meta name="format-detection" content="telephone=no" /> <!--禁止拨打电话-->
    <meta charset="utf-8" >
    
    <link href="<%=request.getContextPath()%>/css/bootstrap/bootstrap.min.css" rel="stylesheet" />
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
			#wrapper {
				position: absolute;
				z-index: 1;
				height: 100%;
				width: 100%;
			}
			.modal-backdrop{
				z-index: 9999;	
			}
			/*重置*/
			.modal{
				position:fixed;
				z-index: 11000;
				width: 13.5rem;
				height:7.6rem;
				margin-top:-3.8rem;
				margin-left: -6.75rem;
				text-align: center;
				border-radius: .35rem;
				opacity: 0;
				-webkit-transform: translate3d(0,0,0) scale(1.185);
				transform: translate3d(0,0,0) scale(1.185);
				-webkit-transition-property: -webkit-transform,opacity;
				transition-property: transform,opacity;
				color: #3d4145;	
			}
			.modal-content{
				border: none;
				box-shadow:none;		
			}
	</style>
 		
</head>
<body>
	<div class="page-group">
        <div class="page page-current" >
            <header class="bar bar-nav  rfreshDatetop">
            	<a class="icon icon-left pull-left back"></a>
                <h1 class="title">门店码信息</h1>
                <button class="button button-link button-nav pull-right"  data-toggle="modal" data-target="#myModal" >新增</button>
            </header>
            <section>
            <input type="hidden" id="orgCode" name="orgCode" value="${orgCode}">
                <input type="hidden" id="curPage" name="curPage" value="${curPage}">
                <input type="hidden" id="openid" name="openid" value="${openid}">
                <input type="hidden" id="beginTime" name="beginTime" value="">
            	<div class="addstoretop shareLoana">
                	<div class="sxpublic addstore">
                    	<em>名称</em>
                  		<em>编号</em>
                    	<em>安全码</em>
                	</div>
            	</div>
            </section>
			<div class="content">
                <input type="hidden" id="orgCode" name="orgCode" value="${orgCode}">
                <input type="hidden" id="curPage" name="curPage" value="${curPage}">
                <input type="hidden" id="openid" name="openid" value="${openid}">
                <input type="hidden" id="beginTime" name="beginTime" value="">
                <div id="wrapper">
                    <ul >
                    	
                    </ul>   	
                </div>
            </div>
        </div>
    </div>

    <!-- Modal -->
    <form method="post" id="myform" onsubmit="return check(this)" action="<%=request.getContextPath()%>/Manage/addMendian"  >
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="container_modal">
                        <ul class="addmodal">
                            <li class="sxpublic">
                                <span>名称</span>
                                <div class="addinput">
                                    <input type="hidden" class="fj "  name="org_code" value="${orgCode}" >
                                    <input type="hidden" class="fj "  name="openid" value="${openid}" >
                                    <input type="hidden" id="oemid" name="oemid" value="${oemid}">
                                    <input type="text" class="fj "  name="qrCodeName" maxlength="10"> 
                                </div>
                            </li>
                            <li class="sxpublic">
                                <span>安全码</span>
                                <div class="addinput">
                                    <input type="tel"  name="securityCode" maxlength="4" onkeyup='this.value=this.value.replace(/\D/gi,"")'/>
                                </div>
                            </li>
                        </ul>
                    </div>
                    
                    <div class="modal-footer sxpublic addmodalbot">
                        <a type="button" class=""  onclick="bn()" data-dismiss="modal"> 关闭 </a>
                        <a type="button" onclick="an()">确定</a>
                    </div>             
                </div>
            </div> 
        </div>
    </form>   
  
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/sm/jquery-3.1.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/sm/mypublic.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/sm/sm.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/date/iscroll.js" ></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/date/pullToRefresh.js"></script>

	<script>
       $(function () {
    	   $('#myModal').modal('hide');
    	   })
    </script>
    
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

					var divs = document.querySelectorAll("#wrapper ul li"), i;

					for (i = 0; i < divs.length; ++i) {
					  divs[i].remove();
					}
				}
            	
				$.ajax({
					url:"<%=request.getContextPath()%>/Manage/mendianJson",
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
								$.alert("没有门店二维码");
							}
							appendData(json,isappend);
						}else{
							$.alert("没有门店二维码");
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
            
            function an(){
            	$("#myform").submit();
            }
            function bn(){
            	$('#myModal').modal('hide');
            }
            function check(f) {
				if (f.qrCodeName.value == '') { alert('请输入名称！'); f.qrCodeName.focus(); return false }
				if (f.securityCode.value == '') { alert('请输入安全码！'); f.securityCode.focus(); return false }
				if (f.securityCode.value.length < 4) { alert('安全码应为4位！'); f.securityCode.select(); return false }
				//return searchMrchName();
			}
           
		</script>
    
	<script>
	refresher.init({
		id:"wrapper",
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
			wrapper.refresh();
		},1000);	
	}
	
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
			//var totalamount = data['orderTotalAmount'];

		//alert(isappend);
		//alert($('#curPage').val());
		//alert(data['totalPage']);
		if($('#curPage').val()<=data['totalPage']){
 		//alert(data.payRecordsList.length);
			$('#curPage').val(data['curPageNo']);
			/* $('#createTime').val(data['createTime']); */
			//alert(document.querySelectorAll("#wrapper ul li").length);
			
				//data是返回结果的对象 (json数组) 
				//假设返回结果对象为:
				//[{id:D0,amount:10000,date:10-12 16:16},{id:D0,amount:10000,date:10-12 16:16},{id:D0,amount:10000,date:10-12 16:16}]
				var $wrapperUl = $("#wrapper ul");
				var liHtml = "";
				$.each(data.payRecordsList, function(index, item){//遍历数组
					//alert(item.profit);
					//var oa = item.profit;
					//根据不同的数据生成有变化的HTML
					var tmpHtml = '<li>'
						+'<div class="refreshMain shareLoana">'
								+'<div>'
									+'<a href="<%=request.getContextPath()%>/QRCode/QRCodeViewByQrcode?openid=${openid}&oemid=${oemid}&mrchorgcode=${orgCode}&qrcode='+item.qr_code+'">'+item.qrCodeName+'</a>'
								+'</div>'
								+'<div>'
									+'<a href="<%=request.getContextPath()%>/QRCode/shouyinyuanlogin?orgCode=${orgCode}&qrcode='+item.qr_code+'&aqm='+item.securityCode+'" >'+item.qrmark+'</a>'
								+'</div>'
								+'<span>'+item.securityCode+'</span'
							
						+'</div>'	
					+'</li>';
				 
					liHtml += tmpHtml;
				});
				//插入到wrapper ul 里面
				//$wrapperUl.empty();
				$wrapperUl.append(liHtml);
		}
	
	}	
/*	function getLocalTime(nS) { 
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
    } */
	
	
	 Ycallback("${beginTime}");
			/* for(var i=0;i<document.querySelectorAll("#wrapper ul li").length;i++){
			document.querySelectorAll("#wrapper ul li")[i]}
        	refresher.init({
			id:"wrapper",
			pullUpAction:Load 																			
			});	
		var generatedCount = 0;																		
		
		function Load() {
			setTimeout(function () {
				var el, li, i;
				el =document.querySelector("#wrapper ul");
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
				wrapper.refresh();
				for(var i=0;i<document.querySelectorAll("#wrapper ul li").length;i++){
				document.querySelectorAll("#wrapper ul li")[i] }
			},1000);	
		} */
	</script>   
</body>
</html>
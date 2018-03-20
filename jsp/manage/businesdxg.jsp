<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="renderer" content="webkit" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<title>商户信息修改</title>
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
			
			.busines_x{ line-height:34px; font-family:'微软雅黑'; color:#000; font-size:16px; width:100%;}
			.manage_sh .help-block{ color:#a94442}
			
		</style>
        <script type="text/javascript">
			var cP, cC;

			function assignmentP() {
				var mark = false;
				$("#proviceCode option").each(function() {
					var _this = $(this);
					if(_this.text() == cP) {
						mark = true;
						$("#proviceCode").val(_this.val())
						$("#proviceCode").trigger("change");
					}
				});
				if(!mark)
					setTimeout(assignmentP, 300);
			}

			function assignmentC() {
				var mark = false;
				$("#regionCode option").each(function() {
					var _this = $(this);
					if(_this.text() == cC) {
						mark = true;
						$("#regionCode").val(_this.val())
						$("#regionCode").trigger("change");
					}
				});
				if(!mark)
					setTimeout(assignmentC, 300);
			}

			function assignment(province, city) {
				cP = province;
				cC = city;
				assignmentP();
				assignmentC();
			}

			function convertBaidu(point, callback) {
				$.ajax({
					type: "get",
					url: "http://api.map.baidu.com/geoconv/v1/?coords=" + point.x + "," + point.y + "&ak=20YP42eTMDBoNG9Gg4jzfZ4ToG0DNTG4&output=json",
					cache: false, //默认值true
					dataType: "jsonp",
					jsonp: "callback", //传递给请求处理程序或页面的，用以获得jsonp回调函数名的参数名(默认为:callback)
					jsonpCallback: "callback",
					success: function(json) {
						callback(json['result'][0]);
					},
					error: function(e, code) {
						alert(code);
					}
				});
			}
			wx.config({
				debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
				appId: '${appId}', // 必填，公众号的唯一标识
				timestamp: '${timestamp}', // 必填，生成签名的时间戳
				nonceStr: '${nonceStr}', // 必填，生成签名的随机串
				signature: '${signature}', // 必填，
				jsApiList: ['openLocation', 'getLocation'] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
			});
			wx.ready(function() {
				// config信息验证后会执行ready方法，所有接口调用都必须在config接口获得结果之后，config是一个客户端的异步操作，所以如果需要在页面加载时就调用相关接口，则须把相关接口放在ready函数中调用来确保正确执行。对于用户触发时才调用的接口，则可以直接调用，不需要放在ready函数中。
				wx.getLocation({
					type: 'wgs84', // 默认为wgs84的gps坐标，如果要返回直接给openLocation用的火星坐标，可传入'gcj02'
					success: function(res) {
						var latitude = res.latitude; // 纬度，浮点数，范围为90 ~ -90
						var longitude = res.longitude; // 经度，浮点数，范围为180 ~ -180。
						var speed = res.speed; // 速度，以米/每秒计
						var accuracy = res.accuracy; // 位置精度

						convertBaidu({
							x: longitude,
							y: latitude
						}, function(point) {
							$.ajax({
								type: "get",
								url: "http://api.map.baidu.com/geocoder/v2/?ak=20YP42eTMDBoNG9Gg4jzfZ4ToG0DNTG4&location=" + point.y + "," + point.x + "&output=json&pois=0", //实际上访问时产生的地址为: ajax.ashx?callbackfun=jsonpCallback&id=10
								cache: false, //默认值true
								dataType: "jsonp",
								jsonp: "callback", //传递给请求处理程序或页面的，用以获得jsonp回调函数名的参数名(默认为:callback)
								jsonpCallback: "callback",
								success: function(json) {
									var result = json['result']["addressComponent"];
									assignment(result['province'], result['city']);
									$("#merchAddr").val(result['district'] + result['street'] + result['street_number']);
								},
								error: function(e, code) {

								}
							});
						});
					}
				});
			});
			wx.error(function(res) {
				// config信息验证失败会执行error函数，如签名过期导致验证失败，具体错误信息可以打开config的debug模式查看，也可以在返回的res参数中查看，对于SPA可以在这里更新签名。
				//alert("error: "+res);
			});
		</script>
        <script>
        	$(function(){
				$("#subhold").on("touchstart",function(){
					$(this).css({background:"-webkit-gradient(linear, left top, left bottom, from(#065376), to(#083d57))"});
				}).on("touchend",function(){
					$(this).css({background:"#073348"});	
				});
			});
        </script>
         <script type="text/javascript">
			$(function() {
  				$('#defaultForm').bootstrapValidator({
					excluded: ':disabled',
					feedbackIcons: {
						valid: 'glyphicon glyphicon-ok',
						invalid: 'glyphicon glyphicon-remove',
						validating: 'glyphicon glyphicon-refresh'
					},
					fields: {
					/* 	agentId: {
							validators: {
								notEmpty: {
									message: '请输入手机号码'
								},
								regexp: {
									regexp: /^1[3|4|5|7|8]\d{9}$/,
									message: '手机号码格式有误'
								}
							}
						}, */
					 
						
						baseOrgName: {
							validators: {
								notEmpty: {
									message: '命名格式：个体户+姓名或营业执照名称'
								},
								/*stringLength: {
									min: 3,
									max: 18,
									message: '用户名长度必须在6到18位之间'
								},*/
							}
						},
						
						identitycard:{
							validators:{
								notEmpty: {
									message: '身份证不能为空'
								},
								regexp: {
									regexp: /^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$|^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|[xX])$/,
									message: '身份证格式有误'
								}
							}	
						},
						
						bankAccname:{
							validators:{
								notEmpty: {
									message: '开户行姓名不能为空'
								},
							}
						},
					
						bankNo:{
							validators:{
								notEmpty:{
									message:'请选择开户行'	
								},
							}	
						},
						
						baseOrgAddr:{
							validators:{
								notEmpty:{
									message:'请选择地址'	
								},
							}	
						},
						
						proviceCode:{
							validators:{
								notEmpty:{
									message:'请选择省份'	
								},
							}	
						},
						
						regionCode:{
							validators:{
								notEmpty:{
									message:'请选择城市'	
								},
							}	
						},
						
						bankAccountno:{
							validators:{
								notEmpty:{
									message:'银行卡号不能为空'	
								},
								regexp:{
									regexp:/^\d{16}|\d{19}$/,	
									message:'银行卡卡号有误'
								}
							}	
						},
						
						bankPhone:{
							validators:{
								notEmpty: {
									message: '请输入手机号码'
								},
								regexp: {
									regexp: /^1[3|4|5|7|8]\d{9}$/,
									message: '手机号码格式有误'
								}		
							}	
						} 
						
					}
				})
			});
		</script>
        <!--<script>
        function sel_prompt(obj){
			var bx;
			var nperson=prompt("请输入修改信息","");
			if (nperson!=null && nperson!=""){
				bx=nperson;
				//document.getElementById("busines_x").innerHTML=bx;
				$(obj).parents(".container").find(".busines_x").text(bx);
			}else{
				alert("请输入修改信息");
			}
		}
        </script>-->
       
  	</head>
<body background="#f5f5f5">
		<!--<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
            
            <div class="jdxx">
                <a>账号注册</a>
            </div>      
         </nav>-->
	<div class="container-fluid manage_sh"  >
		<div class="manage_containerb">
			<form id="defaultForm" method="post" action="<%=request.getContextPath()%>/Manage/businesdxg">
				<div class="panel panel-gray">
					<div class="panel-heading" >
						<h3 class="panel-title">基本信息</h3>
					</div>
					<div class="panel-body">
                    	 <div class="container manage_sh1">
							<div class="row bus_main"  >
                            	<div class="col-md-3 col-sm-3 col-xs-3">
                                    <span class="manage_co">注册手机号</span>
                                </div>
                                <div class=" col-xs-offset-1   col-md-8 col-sm-8 col-xs-8">
                                    <span class="busines_x">${orgnaization.baseOrgLinkPhone }</span>
                                     <input type="hidden" name="baseOrgLinkPhone"  value="${orgnaization.baseOrgLinkPhone }" >
                                    <input type="hidden" name="baseOrgCode"  value="${orgnaization.baseOrgCode }" >
                                    <input type="hidden" name="oemid"  value="${oemid }" >
                                    <input type="hidden" name="openid"  value="${openid }" >
                                </div>
                    		</div>
                        </div>
                        
                        <div class=" container manage_sh1">
							<div class="row bus_main">
                            	<div class="col-md-3 col-sm-3 col-xs-3">
                                    <span  class="manage_co">商户名称</span>
                                </div>
                                <div class=" col-xs-offset-1   col-md-8 col-sm-8 col-xs-8">
                                    <input type="text" name="baseOrgName"  value="${orgnaization.baseOrgName }" onkeyup="this.value=this.value.replace(/^ +| +$/g,'')" class="busines_x">
                                </div>
                    		</div>
                        </div>
                        
                         <div class=" container manage_sh1" >
							<div class="row ">
                            	<div class="col-md-12 col-sm-12 col-xs-12" style="overflow: hidden; ">
                                    <div class="col-xs-5 ">
                                        <select style="border:solid 1px #e3e3e3;" class="form-control bus_box" id="proviceCode" name="proviceCode">
                                            <option value="">请选择</option>
                                        </select>
                                        <input type="hidden" id="proviceName" name="proviceName" value="${orgnaization.baseOrgProvnice }"/>
                                    </div>
                                    <div class=" col-xs-6 col-xs-push-1 ">
                                        <select style="border:solid 1px #e3e3e3;" class="form-control col-xs-6 bus_box" id="regionCode" name="regionCode">
                                            <option value=" ">请选择</option>
                                        </select>
                                        <input type="hidden" id="regionName" name="regionName" value="${orgnaization.baseOrgCity }"/>
                                    </div>
                                </div>
                    		</div>
                        </div> 
                         <div class=" container manage_sh1">
							<div class="row bus_main">
                            	<div class="col-md-3 col-sm-3 col-xs-3">
                                     <span  class="manage_co">具体地址</span>
                                </div>
                                <div class=" col-xs-offset-1  col-md-8 col-sm-8 col-xs-8">
                                    <input type="text" name="baseOrgAddr"  value="${orgnaization.baseOrgAddr }" class="busines_x">
                                </div>
                    		</div>
                        </div>      	
					</div>
               	</div>
				<div class="panel panel-gray">
					<div class="panel-heading">
						<h3 class="panel-title">银行账号信息</h3>
					</div>
					<div class="panel-body">
                        	
                        <div class="container manage_sh1">
							<div class="row bus_main"  >
                            	<div class="col-md-3 col-sm-3 col-xs-3">
                                    <span  class="manage_co">身份证号</span>
                                </div>
                                <div class=" col-xs-offset-1   col-md-8 col-sm-8 col-xs-8">
                                    <input type="text"  name="legalIdcardno" value="${orgnaization.legalIdcardno }" class="busines_x">
                                </div>
                    		</div>
                        </div>
                        	
                    	 <div class="container manage_sh1">
							<div class="row bus_main"  >
                            	<div class="col-md-3 col-sm-3 col-xs-3">
                                    <span  class="manage_co">银行卡号</span>
                                </div>
                                <div class=" col-xs-offset-1   col-md-8 col-sm-8 col-xs-8">
                                    <input type="text"  name="bankAccountno" value="${orgnaization.bankAccountno }" class="busines_x">
                                </div>
                    		</div>
                        </div>
                        
                        <div class=" container manage_sh1">
							<div class="row bus_main">
                            	<div class="xlcontainer col-md-12 col-sm-12 col-xs-12">
                                    <select style="border:solid 1px #e3e3e3;" class="form-control bus_box" id="bankNo" name="bankNo">
                                        <option  value=" " >请选择</option>
                                    </select>
                                    <input type="hidden" id="bankName" name="bankName" value="${orgnaization.bankName }"/>
                                </div>
                    		</div>
                        </div>
                         <div class=" container manage_sh1">
							<div class="row bus_main">
                            	<div class="col-md-3 col-sm-3 col-xs-3">
                                    <span  class="manage_co">开户姓名</span>
                                </div>
                                <div class=" col-xs-offset-1   col-md-8 col-sm-8 col-xs-8">
                                    <input type="text" name="bankAccname" value="${orgnaization.bankAccname }" class="busines_x">
                                </div>
                    		</div>
                        </div>  
                        <div class=" container manage_sh1">
							<div class="row bus_main">
                            	<div class="col-md-3 col-sm-3 col-xs-3">
                                    <span  class="manage_co">开户手机号</span>
                                </div>
                                <div class=" col-xs-offset-1   col-md-8 col-sm-8 col-xs-8">
                                   <input type="text"  name="bankPhone" value="${orgnaization.bankPhone }" class="busines_x">
                                </div>
                    		</div>
                        </div>       	
					</div>
				</div>
                <div style=" text-align:center; padding-top:2%; padding-bottom:12%" >
              		<input id="subhold" type="submit" value="保存" style="text-shadow:none; font-weight:normal;text-decoration:none; color:#fff; font-family:'微软雅黑'; background:#073348; border:none; width:90%" class=" btn  btn-default btn-lg">
                </div>
			</form>
		</div>
   </div>
</body>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/merch/index1.js"></script>
</html>
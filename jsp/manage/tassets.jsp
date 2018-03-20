<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="renderer" content="webkit" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<title>总资产</title>
		<link href="<%=request.getContextPath()%>/css/bootstrap/bootstrap.min.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/bootstrap/bootstrap-theme.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/bootstrap/bootstrapValidator.min.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/bootstrap/buttons.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/webuploader.css" rel="stylesheet" />
        <link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" />
		<style>
		.tgm_containerz{
			background:#27af27;
			position:relative;
		}
		.tgm_container {
			text-align:center;
			color:#fff;
			font-size:.32rem;
			padding-top:.2rem;
			padding-bottom:.16rem;
		}
		.tgm_container dt{
			padding-top:.3rem;
			font-size:.3rem;	
		}
		.tgm_container dd{
			padding-top:.2rem;
			padding-bottom:.1rem;
			font-size:.8rem;	
			color:#ffdf25;
		}
		.tgm_container1 img{
			width:.96rem;
			height:.96rem;
			border-radius:.96rem;
			border:solid 1px #fff;
			margin-top:.7rem;
			margin-bottom:.26rem;	
			position:relative;
		}
		.qrcode_yh img{
		 width:100%;
  		 height:.2rem;
		}
		#container .highcharts-series-group{
			float:right;
		}
		#container .highcharts-legend{
			float:left;	
		}
		.tasset_y{
			display: -webkit-box;
			display: -webkit-flex;
			display: -ms-flexbox;
			display: flex;
			-ms-flex-align: center;
			-webkit-box-align: center;
			box-align: center;
			-webkit-align-items: center;
			align-items: center;
			text-decoration: none;
			/*justify-content: center; */
		}
		.tasset_y{
			padding-left:.3rem;
			padding-right:.3rem;
			background:#fff;
			margin-top:.2rem;
			height:1rem;
		}
		.tasset_y img{
			width:.4rem;
			height:.4rem;
		}
		.tasset_y p{
			font-size:.3rem;
			color:#000;
			padding-left:.14rem;	
			display: block;
			-webkit-box-flex: 1;
			-webkit-flex: 1;
			-ms-flex: 1;
			flex: 1;
			width: 100%;
		}
		.tasset_y span{
			color:#f65926;
			font-size:.32rem;	
		}
		.tasset_s{
			background:#fff;
		}
		.tasset_s li{
			display: -webkit-box;
			display: -webkit-flex;
			display: -ms-flexbox;
			display: flex;
			-ms-flex-align: center;
			-webkit-box-align: center;
			box-align: center;
			-webkit-align-items: center;
			align-items: center;
			text-decoration: none;
			/*justify-content: center; */
			/*line-height:1.1rem;
			height:1.1rem;*/
		}
		.tasset_s li .lidiv a{
			text-decoration:none;
			color:#181818;	
		}
		.tasset_s li .lidiv{
			width:50%;
			padding-left:.3rem;
			padding-right:.3rem;
			margin-top:.16rem;
			margin-bottom:.16rem;
			line-height:.8rem;
			height:.8rem;
		}
		.tasset_s li .lidiv a:nth-last-child(1){
			color:#666;
			font-size:.24rem;
			text-decoration:none;
			text-align:right;
			float:right
		}
		.lidivr{
			border-right:solid 1px #e3e3e3;	
		}
		.tasset_m{
			background:#fff;	
			overflow:hidden;
			padding-bottom:.3rem;
		}
		.tasset_m dl{
			display: -webkit-box;
			display: -webkit-flex;
			display: -ms-flexbox;
			display: flex;
			-ms-flex-align: center;
			-webkit-box-align: center;
			box-align: center;
			-webkit-align-items: center;
			align-items: center;
			text-decoration: none;
			justify-content: center; 
			-webkit-justify-content: center;	
		}
		.tasset_m dl dd{
			text-align:center;
			font-size:.26rem;
			color:#666
		}
		.tasset_m dl dd a{ text-decoration:none; color:#000000}
		.tasset_m em{
			display:block;
			width:.16rem;
			height:.16rem;
			float:left;
			margin-top:.06rem;
		}
		.tasset_m .em1{ background:#f94b4a; }
		.tasset_m .em2{ background:#1fbcff;	}
		.tasset_m .em3{ background:#5ec93d;	}
        </style>
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
	<body style=" background:#f2f2f2;">
        <div class="container-fluid" >
        	<div class="tgm_containerz">
                <dl class="tgm_container">
                	<dt>总资产（元）：</dt>
                    <dd>${amountEntity.allmoney }</dd>
                </dl> 
          	</div>
			<div class="qrcode_yh">
            	<img  src="<%=request.getContextPath()%>/img/wcb/person_codeh.png">
            </div>
			<div id="container" style=" min-width:4rem; height:4rem; margin-top:.2rem;"></div>
            <div class="tasset_m">
            	<dl>
                	<dd><em  class="em1"></em>&nbsp;推广奖励金&nbsp;<a>${amountEntity.alltgbonus }</a></dd>&nbsp;&nbsp;&nbsp;&nbsp;
                    <dd><em  class="em2"></em>&nbsp;升级金&nbsp;<a>${amountEntity.incomeEarned20 }</a></dd>&nbsp;&nbsp;&nbsp;&nbsp;
                    <dd><em  class="em3"></em>&nbsp;分润&nbsp;<a>${amountEntity.allprofit }</a></dd>
                </dl>
            </div>	
           	<div class="tasset_y">
            	<img src="<%=request.getContextPath()%>/img/wcb/zrsy.png">
                <p>昨日收益</p>
                <span>+${amountEntity.lastdaymoney }</span>
            </div>
            <div class="tasset_s">
            	<ul>
                	<li style="border-top:solid 1px #e3e3e3; border-bottom:solid 1px #e3e3e3; ">
                    	<div class="lidiv lidivr">
                        	<a>推广奖励金</a>
                        	<a>${amountEntity.tgbonus }</a>
                        </div>
                        <div class="lidiv">
                            <a>升级金</a>
                            <a>${amountEntity.levelupmoney }</a>
                        </div>
                    </li>
                    <li>
                    	<div class="lidiv lidivr">
                            <a>分润</a>
                            <a>${amountEntity.profit }</a>
                        </div>
                    </li>
                </ul>
            </div>
        </div>       
	</body>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.11.3.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/wechat/layer.m.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap/bootstrap.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap/bootstrapValidator.min.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/js/highcharts.js"></script>
        <script>
        	$(function () {
				$('#container').highcharts({
					chart: {
						plotBackgroundColor: null,
						plotBorderWidth: null,
						plotShadow: false
					},
					title: {
						text: ''
					},
					tooltip: {
						headerFormat: '{series.name}<br>',
						pointFormat: '{point.name}: <b>{point.percentage:.1f}%</b>'
					},
					plotOptions: {
						pie: {
							size:'100%',  //饼状图大小
							innerSize:'50', //饼状图的内置大小
							allowPointSelect: true,
							cursor: 'pointer',
							dataLabels: {
								enabled: false
							},
							//showInLegend: true
						}
					},
					series: [{
						type: 'pie',
						name: '收益占比',
						data: [
							['推广奖励金',   ${amountEntity.alltgbonus }],
							['升级金',       ${amountEntity.incomeEarned20 }],
							['分润',    ${amountEntity.allprofit }],
							
						]
					}]
				});
});
	</script>
</html>
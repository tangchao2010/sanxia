<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="renderer" content="webkit">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<title>交易记录</title>
		<link href="<%=request.getContextPath()%>/css/bootstrap/bootstrap.min.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/bootstrap/bootstrap-theme.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/wechat/common.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/bootstrap/buttons.css" rel="stylesheet" />
		
		<link href="<%=request.getContextPath()%>/css/bootstrap/bootstrap-datetimepicker.min.css" rel="stylesheet" />
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.11.3.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/iscroll/iscroll-probe.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/wechat/common.js"></script>
		<script src="<%=request.getContextPath()%>/js/wechat/hideshare_and_toolbar.js"></script>
		<!--处理进度条-->
		<link href="<%=request.getContextPath()%>/css/wechat/nprogress.css" rel="stylesheet" />
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/wechat/nprogress.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap/bootstrap.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap/datepicker/bootstrap-datetimepicker.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap/datepicker/locales/bootstrap-datetimepicker.zh-CN.js"></script>
		
		<script type="text/javascript">
			openid = "${openid}";
		</script>
		<style>
			html,
			body {
				height: 100%;
				width: 100%;
				overflow: hidden;
			}
			
			body,
			button,
			input,
			select,
			textarea,
			h1,
			h2,
			h3,
			h4,
			h5,
			h6 {
				font-family: Microsoft YaHei, '宋体', Tahoma, Helvetica, Arial, "\5b8b\4f53", sans-serif;
			}
			
			.panel {
				margin: 0;
				border: 0;
			}
			
			.container-fluid {
				padding: 0;
			}
			
			.panel-body {
				position: absolute;
				top: 50px;
				width: 100%;
				margin: 0;
				padding: 0;
				z-index: 1;
				background: #E3E2E4;
			}
			
			.panel-primary>.panel-heading {
				color: #000000;
				background-color: #FFFFFF;
				border-color: #ddd;
				background-image: none;
				overflow: hidden;
				border-radius: 0;
				width: 100%;
				text-align: center;
				position: absolute;
				z-index: 5;
				padding: 0;
				bottom: 0;
				box-shadow: 0 1px 1px 0 rgba(0, 0, 0, 0.05), 0 1px 3px 0 rgba(0, 0, 0, 0.25);
				/* box-shadow: 0px 0px 24px rgba(0, 0, 0, 0.4);*/
			}
			
			.panel-primary>.panel-heading table {
				margin: 0;
				font-size: 12px;
			}
			
			.button-borderless.button-small {
				font-size: 16.4px;
				line-height: 50px;
				text-shadow: 0 -1px 0 rgba(0, 0, 0, .25);
			}
			
			.panel-title {}
			
			.absolute-left {
				position: absolute;
				left: 0;
				top: 0;
			}
		</style>

		<style>
			.container-list {
				margin: 0;
				padding: 0;
				width: 100%;
				overflow: hidden;
				border: 0;
				border-top: 1px solid #ccc;
				list-style-type: none;
				box-shadow: none;
			}
			
			.container-list .list-group-item {
				border: none;
				padding: 10px 0 0px 0;
				width: 100%;
				margin: 0;
				border-radius: 0;
				overflow: hidden;
				border-bottom: 1px solid #ccc;
			}
			
			.container-list .list-group-item img {
				float: left;
				height: 45px;
				width: 50px;
				margin: 0px 8px 5px 6px;
			}
			
			.container-list .list-group-item .title {
				font-size: 15px;
				font-weight: 500;
				margin-top: 0px;
				display: block;
			}
			
			.container-list .list-group-item .desc {
				font-size: 11px;
				color: #7D798C;
				margin-top: 4px;
			}
			
			.container-list .list-group-item .badge {
				font-size: 12px;
				font-weight: 500;
				color: #7D798C;
				position: absolute;
				right: 50px;
				top: 13px;
				background-color: #fff;
				border: 0;
			}
			
			.container-list .list-group-item .icon {
				font-size: 18px;
				padding: 2px;
				color: #7D798C;
				position: absolute;
				right: 10px;
				top: 18px;
			}
			
			li.empty {
				height: 100px;
				line-height: 100px;
				text-align: center;
				color: #7D798C;
				background-color: #FFF;
			}
			
			.container-fluid.main .head {
				width: 100%;
				position: fixed;
				top: 0;
				left: 0;
				height: 50px;
				z-index: 100;
				background: #1B9AF7;
				overflow: hidden;
				box-shadow: inset 0 1px 0 #1B9AF7, 0 1px 0 rgba(0, 0, 0, .2);
				/*background:-webkit-linear-gradient(top,#f78297,#f56c7e); 
				background:-moz-linear-gradient(top,#f78297,#f56c7e); 
				background:-o-linear-gradient(top,#f78297,#f56c7e); 
				background:-ms-linear-gradient(top,#f78297,#f56c7e); 
				background:linear-gradient(top,#f78297,#f56c7e); */
			}
			
			.container-fluid.main .head .gohome {
				position: absolute;
				top: 0px;
				left: 3px;
			}
			
			.container-fluid.main .head .search {
				position: absolute;
				top: 0px;
				right: 3px;
			}
			
			.container-fluid.main .head .title {
				margin: auto;
				text-align: center;
				line-height: 50px;
				font-size: 16px;
				color: #fff;
			}
		</style>
	</head>

	<body>
		<div class="container-fluid main">
			<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-lg">
			    <div class="modal-content">
			     <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
			        <h5 class="modal-title" id="myModalLabel">搜索条件</h5>
			      </div>
			      <div class="modal-body">
			      	  <div class="form-group">
					    <label for="exampleInputEmail1">开始时间</label>
					    <input type="text" class="form-control" name="startdate" readonly class="form-control form_datetime">
					  </div>
			      	  <div class="form-group">
					    <label for="exampleInputEmail1">结束时间</label>
					    <input type="text" class="form-control" name="enddate" readonly class="form-control form_datetime">
					  </div>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-primary">搜索</button>
			      </div>
			    </div>
			  </div>
			</div>
			<div class="head">
				<a href="/m?openid=${openid}" class="button-left button button-small button-borderless button-plain gohome">
					<i class="glyphicon glyphicon-chevron-left"></i> 返回
				</a>
				<div class="title">基础信息</div>
				<a href="javascript:void(0);" data-toggle="modal" data-target=".bs-example-modal-lg"
					class="button-right button button-small button-borderless button-plain search">
					<i class="glyphicon glyphicon-search"></i>
				</a>
			</div>
			<div id="wrapper" class="panel-body">
				<div>
					<div id="pullDown">
						<div class="button">
							<span class="pullDownIcon"></span>
							<span class="pullDownLabel">下拉刷新...</span>
						</div>
					</div>
					<ul id="transportList" class="list-group container-list"></ul>
					<div id="pullUp">
						<div class="button">
							<span class="pullUpIcon"></span>
							<span class="pullUpLabel">上拉加载更多...</span>
						</div>
					</div>

				</div>
			</div>
			<!--<div class="panel-heading">
					<div class="panel-title">
						<table class="table">
							<thead>
								<tr>
									<th style="width: 60px;"></th>
									<th style="text-align: center;">总金额</th>
									<th style="text-align: center;">交易笔数</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th>今日</th>
									<td>${statistics.DATETOTAL}</td>
									<td>${statistics.DATETOTALCOUNT}</td>
								</tr>
								<tr>
									<th>总量</th>
									<td>${statistics.TOTAL}</td>
									<td>${statistics.TOTALCOUNT}</td>
								</tr>

							</tbody>
						</table>
						<div class="btn-group">
							<a style="color: #fff;" class="btn " data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								交易流水 <span class="caret"></span>
							</a>
							
					</div>
					</div>
		</div>-->
		</div>
		<script type="text/javascript">
			openid = "${openid}";
			var verticalScroll, page, request, $transportList, isHidePullUp = true;

			function changePerson(id) {
				page = new Page();
				page.conditions.persId = id;
				request = new Reuqest();
				request.listTransport(defaultCallBack);
			}
			var Page = function() {

				$transportList.empty();
				this.pageSize = 20;
				this.pageNo = 0;
				this.totalPage = 1;
				this.totalRecord = 0;
				this.conditions = {
					openid: openid
				};
				this.isNext = function() {
					if(this.totalPage >= this.pageNo) {
						return true;
					}
					return false;
				}
				this.next = function() {
					this.pageNo = this.pageNo + 1 > this.totalPage ? this.totalPage + 1 : this.pageNo + 1;
					return this.pageNo;
				}
			}

			function formatePayFlag(k) {
				if(k == 0)
					return "未收款";
				else if(k == 1)
					return "收款失败";
				else if(k == 2)
					return "收款成功";
				return "未知";
			}

			function formateImageName(k) {
				if(k == 1)
					return "/img/weixin.jpg";
				else if(k == 2)
					return "/img/alipay.jpg";
			}
			var itemEmptyModel = "<li class='empty'>暂时没有交易记录</li>";

			function validateEmpty() {
				if($transportList.children("li:not('.empty')").size() == 0 && $transportList.find(".empty").size() == 0) {
					$transportList.append(itemEmptyModel);
				} else if($transportList.children("li:not('.empty')").size() > 0) {
					$transportList.find("li.empty").remove();
				}
			}
			var Reuqest = function() {
				this.orgData = {
					openid: openid
				};

				this.itemModel = '<li data-tid="&{rid}" data-schoolid="&{schoolId}" class="list-group-item row">' +
					'<img src="&{inOut}" /> ' +
					'<span class="badge"></span>' +
					'<span class="title">金额:&{personName}</span>' +
					'<p class="desc">&{looktime}</p> ' +
					' <span class="glyphicon glyphicon-menu-right icon"></span></li>';
				this.listTransport = function(callBack) {
					var data = {
						pageSize: page.pageSize,
						pageNo: page.next()
					};
					if(!page.isNext()) {
						if(typeof callBack == 'function') {
							callBack.apply(request, [false]);
						}
						return;
					}
					NProgress.done();
					NProgress.start();
					data = $.extend(page.conditions, this.orgData, data);
					$.ajax({
						url: "/record/listRecords",
						dataType: "json",
						data: data,
						complete: function() {
							NProgress.done();TransRec
						},
						success: function(json) {
							if(typeof(json) != "undifined") {
								for(var i = 0; i < json.rows.length; i++) {
									var temp = request.itemModel
										.replace(/\&{rid}/g, json.rows[i]['recordId'])
										.replace(/\&{schoolId}/g, json.rows[i]['recordId'])
										.replace(/\&{inOut}/g, formateImageName(json.rows[i]['portType']))
										//.replace(/\&{payFlag}/g, formatePayFlag(json.rows[i]['payFlag']))
										//.replace(/\&{devposition}/g, json.rows[i]['person'] + "  " + json.rows[i]['deviceInfo']['devposition'])
										.replace(/\&{personName}/g, json.rows[i]['amount'])
										.replace(/\&{looktime}/g, new Date(json.rows[i]['dealTime']).Format("yyyy年MM月dd日 HH:mm:ss"));
									var $temp = $(temp);
									/*$temp.on("click", function() {
										Jump("/wechat/record/detail/" + $(this).data("tid"));
									});*/

									$transportList.append($temp);
								}
								page.pageNo = json['pageNo'];
								page.totalPage = json['totalPage'];
								callBack.apply(request, [true]);
							}
						}
					});
				}
			}

			function pullUpAction() {
				request.listTransport(defaultCallBack);
			}

			function pullDownAction() {
				window.setTimeout(function() {
					verticalScroll.refresh();

				}, 1000);
			}

			function resetHeight() {
				var totalHeight = $("body").height();
				var g1 = $(".main .head").outerHeight();

				var g3 = $(".panel-body").outerHeight() - $(".panel-body").height();
				$(".panel-body").height(totalHeight - (g1 + g3));

				$transportList.css("min-height", (totalHeight - (g1 + g3)) + "px");
			}

			$(document).ready(function(e) {
				
    			$(".form_datetime").datetimepicker({format: 'yyyy-mm-dd'});

				$transportList = $("#transportList");

				resetHeight();
				$(window).resize(function() {
					resetHeight();
				});
				page = new Page();
				request = new Reuqest();
				initVerticalScroll();
				request.listTransport(defaultCallBack);
			});

			function defaultCallBack(isRefresh) {
				page.next();
				if(!page.isNext()) {
					isHidePullUp = true;
				} else {
					isHidePullUp = false;
				}
				page.pageNo = page.pageNo - 1;
				if(isRefresh) {
					verticalScroll.refresh();
				}
				validateEmpty();
			}

			function initVerticalScroll() {
				var pullDownEl = document.getElementById('pullDown'),

					pullDownOffset = pullDownEl.offsetHeight + 3,

					pullUpEl = document.getElementById('pullUp'),

					pullUpOffset = pullUpEl.offsetHeight;

				verticalScroll = new IScroll('#wrapper', {
					useTransform: true,
					minScrollY: -1 * pullDownOffset,
					mouseWheel: true,
					click: true,
					probeType: 2
				});
				verticalScroll.on("refresh", function() {

					if(pullDownEl.className.match('loading')) {
						pullDownEl.className = '';
						pullDownEl.querySelector('.pullDownLabel').innerHTML = '下拉刷新...';
						this.minScrollY = -1 * pullDownOffset+4;
						this.scrollTo(0, this.minScrollY, 300);
					} else if(pullUpEl.className.match('loading')) {
						pullUpEl.className = '';
						pullUpEl.style.display = "none";
						this.maxScrollY = this.maxScrollY + 40;
						pullUpEl.querySelector('.pullUpLabel').innerHTML = '上拉加载更多...';
					}
				});
				verticalScroll.on("scroll", function() {

					if(this.y > 50 && !pullDownEl.className.match('flip')) {
						pullDownEl.className = 'flip';
						pullDownEl.querySelector('.pullDownLabel').innerHTML = '释放刷新...';
						this.minScrollY = 0;
					} else if(this.y < 50 && pullDownEl.className.match('flip')) {
						pullDownEl.className = '';
						pullDownEl.querySelector('.pullDownLabel').innerHTML = '下拉刷新...';
						this.minScrollY = -1 * pullDownOffset;
					} else if(this.y < (this.maxScrollY) && !pullUpEl.className.match('flip') && !isHidePullUp) {
						pullUpEl.style.display = "block";
						if(this.y < (this.maxScrollY - 40)) {
							pullUpEl.className = 'flip';
							pullUpEl.querySelector('.pullUpLabel').innerHTML = '释放刷新...';
							this.maxScrollY = this.maxScrollY - 40;
						}

					} else if(this.y > (this.maxScrollY + 20) && pullUpEl.className.match('flip')) {
						pullUpEl.className = '';
						pullUpEl.style.display = "none";
						pullUpEl.querySelector('.pullUpLabel').innerHTML = '上拉加载更多';
						this.maxScrollY = this.maxScrollY + 40;
					}
				});
				verticalScroll.on("scrollEnd", function() {
					if(pullDownEl.className.match('flip')) {
						pullDownEl.className = 'loading';
						pullDownEl.querySelector('.pullDownLabel').innerHTML = '正在加载...';
						pullDownAction();

					} else if(pullUpEl.className.match('flip') && !isHidePullUp) {
						pullUpEl.className = 'loading';
						pullUpEl.querySelector('.pullUpLabel').innerHTML = '正在加载...';
						pullUpAction();
					}
				});
			}
		</script>
	</body>

</html>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="renderer" content="webkit" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<title>文件上传</title>
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
		<style>
			html,
			body {overflow-x: hidden; }
			.panel-gray { border-color: #BCBBC1; margin-top: 5px; margin-bottom: 0;}
			.panel-gray>.panel-heading { color: #fff;background-color: #1B9AF7;border-color: #1B9AF7;height: 28px;padding: 0;}
			.panel-gray>.panel-heading .panel-title {font-size: 14px;line-height: 28px;margin-left: 8px;}
			.button {font-weight: 600;width: 100%;}
			.control-label {color: #626262;font-weight: 600;}
			.form-group {margin: 6px 0;}
			.panel-body {padding: 8px;}
			.magin0 {margin: 0 0 0 0;padding: 0; }
			
			.zccg_container{margin: 0; padding: 0 !important; background:#fff; margin-top:10px; margin-bottom:10px;}
			.upload_container{ padding-right:15px; padding-left:15px; padding-top:8%; padding-bottom:8%;}
			.upload_border{ border:solid 1px #21b101; border-radius:6px; position:relative;}
			.upload_borderjj{ margin-bottom:12%}
			.upload_border_top{ position:absolute; top:-14px; left:10%;}
			.upload_border_top a{ line-height:24px; font-size:16px; color:#000; font-family:'微软雅黑'; padding-left:6px; text-decoration:none; }
			.upload_border_top span{ background:#fff; padding:0 10%; display:block; width:138px; }
			.up_yl_border{padding:2%;}
			up_yl_border1{ padding:2%;}
			.up_yl_border img{border:solid 1px #e3e3e3; border-radius:6px;}
			.up_yl_container{ padding:6% 3% 0 3%;}
			.upload_container p{ padding:2% 5% 4% 5%; font-size:14px; font-family:'微软雅黑'; color:#666; text-align:justify}
			
			.upload_border_top1{ position:absolute; top:-14px; left:10%;}
			.upload_border_top1 a{ line-height:24px; font-size:16px; color:#000; font-family:'微软雅黑'; padding-left:6px; text-decoration:none; }
			.upload_border_top1 span{ background:#fff; padding:0 10%; display:block; width:138px;}
			.up_yl_container1{ padding:0% 3%;}
			.up_yl_container1 .upload_sm{ text-align:center; line-height:34px; font-size:16px; color:#666; font-family:'微软雅黑';}
			.help-block{ color:#f1562f; font-family:'微软雅黑'; text-align:center;}
		
		
			.webuploader-container {position: relative;}
			.webuploader-element-invisible {position: absolute !important;clip: rect(1px 1px 1px 1px); /* IE6, IE7 */clip: rect(1px,1px,1px,1px);}
			.webuploader-pick-hover { background: #00a2d4;}
			.webuploader-pick-disable {opacity: 0.6; pointer-events:none;}
			
			.filePicker.bg1 .webuploader-pick {
							background: url(<%=request.getContextPath()%>/img/pic/up_pictuer1.png);
							background-repeat: no-repeat;
							background-size: 100% 100%;
			}
			.filePicker.bg2 .webuploader-pick {
							background: url(<%=request.getContextPath()%>/img/shenfenzhengfanmian.png);
							background-repeat: no-repeat;
							background-size: 100% 100%;
			}
						
			.filePicker.bg3 .webuploader-pick {
							background: url(<%=request.getContextPath()%>/img/yinhangkazhengmian.png);
							background-repeat: no-repeat;
							background-size: 100% 100%;
			}
			.filePicker.bg4 .webuploader-pick {
							background: url(<%=request.getContextPath()%>/img/yinhangkafanmian.png);
							background-repeat: no-repeat;
							background-size: 100% 100%;
			}
			.filePicker.bg5 .webuploader-pick {
							background: url(<%=request.getContextPath()%>/img/shouchishenfenzheng.png);
							background-repeat: no-repeat;
							background-size: 100% 100%;
			}
			.filePicker.bg6 .webuploader-pick {
							background: url(<%=request.getContextPath()%>/img/yingyezhizhao.png);
							background-repeat: no-repeat;
							background-size: 100% 100%;
			}
			.webuploader-pick .preview {position: absolute;top: 0;left: 0;height: 100%;width: 100%;opacity: 0;}
			.left {float: left;}
			.right {float: right;}
			.progress{display: none; margin: 0;}
						
			@media screen and (max-width:320px){
				.filePicker {overflow: hidden;margin: 0; max-height: 76px;}
				.filePicker .webuploader-pick {
						background:green;
							position: relative;
							display: inline-block;
							cursor: pointer;
							background: none;
							width: 100%;
							height:76px;
							color: #8C8C8C;
							text-align: center;
							border-radius: 4px;
							border: 1px dashed #999;
							overflow: hidden;
							background-repeat: no-repeat;
							background-size: 100% 100%;
							padding:0;
						}
				.webuploader-pick .icon-add {
							position:absolute;
							
							height:40px; 
							width:60px;
							top:22%;
							left:25%;
							/*height: 100%;
							width: 100%;*/
							background-image:url(<%=request.getContextPath()%>/img/pic/up_pictuer1f.png);
							background-repeat: no-repeat;
							background-size: 100% 100%;
				}
			}
			
			@media screen and (min-width:321px) and (max-width:374px){
				.filePicker {overflow: hidden;margin: 0; max-height: 84px;}
				.filePicker .webuploader-pick {
							position: relative;
							display: inline-block;
							cursor: pointer;
							line-height: 64px;
							background: none;
							width: 100%;
							height:84px;
							color: #8C8C8C;
							text-align: center;
							border-radius: 3px;
							border: 1px dashed #999;
							overflow: hidden;
							background-repeat: no-repeat;
							background-size: 100% 100%;
						}
				.webuploader-pick .icon-add {
							padding: 15px 30px;
							background-image:url(<%=request.getContextPath()%>/img/pic/up_pictuer1f.png);
							background-repeat: no-repeat;
							background-size: 100% 100%;
				}
			}
			
			@media screen and (min-width:375px) and (max-width:414px){
				.filePicker {overflow: hidden;margin: 0; max-width: 252px;max-height: 90px;}
				.filePicker .webuploader-pick {
							position: relative;
							display: inline-block;
							cursor: pointer;
							line-height: 90px;
							background: none;
							width: 100%;
							height:90px;
							color: #8C8C8C;
							text-align: center;
							border-radius: 4px;
							border: 1px dashed #999;
							overflow: hidden;
							background-repeat: no-repeat;
							background-size: 100% 100%;
						}
				.webuploader-pick .icon-add {
							padding: 15px 30px;
							/*height: 100%;
							width: 100%;*/
							background-image:url(<%=request.getContextPath()%>/img/pic/up_pictuer1f.png);
							background-repeat: no-repeat;
							background-size: 100% 100%;
				}
			}
			
			@media screen and (min-width:415px) and (max-width:640px){
				.filePicker {overflow: hidden;margin: 0; max-width: 252px;max-height: 120px;}
				.filePicker .webuploader-pick {
							position: relative;
							display: inline-block;
							cursor: pointer;
							line-height: 120px;
							background: none;
							width: 100%;
							height:120px;
							color: #8C8C8C;
							text-align: center;
							border-radius: 4px;
							border: 1px dashed #999;
							overflow: hidden;
							background-repeat: no-repeat;
							background-size: 100% 100%;
						}
				.webuploader-pick .icon-add {
							padding: 15px 30px;
							/*height: 100%;
							width: 100%;*/
							background-image:url(<%=request.getContextPath()%>/img/pic/up_pictuer1f.png);
							background-repeat: no-repeat;
							background-size: 100% 100%;
				}
			}
			
			@media screen and (min-width:640px) and (max-width:1200px){
				.filePicker {overflow: hidden;margin: 0; max-width: 252px;max-height: 160px;}
				.filePicker .webuploader-pick {
							position: relative;
							display: inline-block;
							cursor: pointer;
							line-height: 160px;
							background: none;
							width: 100%;
							height:160px;
							color: #8C8C8C;
							text-align: center;
							border-radius: 4px;
							border: 1px dashed #999;
							overflow: hidden;
							background-repeat: no-repeat;
							background-size: 100% 100%;
						}
				.webuploader-pick .icon-add {
							padding: 15px 30px;
							/*height: 100%;
							width: 100%;*/
							background-image:url(<%=request.getContextPath()%>/img/pic/up_pictuer1f.png);
							background-repeat: no-repeat;
							background-size: 100% 100%;
				}
			}
					
		</style>
        <script>
        	$(function(){
				$("#upload").on("touchstart",function(){
					$(this).css({background:"-webkit-gradient(linear, left top, left bottom, from(#065376), to(#083d57))"});
				}).on("touchend",function(){
					$(this).css({background:"#073348"});	
				});
			});
		</script>		
	</head>

<body  style="background:#f5f5f5">
	<div class="container-fluid">
        <div class="zccg_container">
			<form id="defaultForm" method="post" action="/m/rAction">
				<input type="hidden" id="openid" value="${openid}" />
				<input type="hidden" id="merchId" value="${orgCode}" /><%-- ${merch.merchId} --%>
				<div class="upload_container">
					<div class="upload_border upload_borderjj">
						<div class="upload_border_top">
                        	<span>
                                <img width="36" src="<%=request.getContextPath()%>/img/pic/uphotosc1.png" />
                                <a>拍摄示例</a>
                            </span>
                        </div>
                        <div class="container">
                            <div class="row up_yl_container">
                                <div class="col-xs-6 up_yl_border">
                                    <img class="img-responsive" src="<%=request.getContextPath()%>/img/pic/up_yl1.png" />
                                </div>
                                <div class="col-xs-6 up_yl_border">
                                    <img class="img-responsive" src="<%=request.getContextPath()%>/img/pic/up_yl2.png" />
                                </div>
                            </div>
                        </div>
                        <p><a style="color:#f1562f;">*</a>您的照片用用于审核认证，我们将严格为您保密；请您保持上传照片清晰规范。</p>
					</div>
                    
                    <div class="upload_border">
                    	<div class="upload_border_top1">
                        	<span>
                                <img width="36" src="<%=request.getContextPath()%>/img/pic/uphotosc1.png" />
                                <a>上传照片</a>
                            </span>
                        </div>
                    
						<div class="container" >
							<div class="row up_yl_container1" style="padding-top:6%">
                                <div class="col-xs-6 up_yl_border">
                                	<div class="up_yl_border1"  style="border-bottom:dashed 1px #e3e3e3;">
                                    <input type="hidden" name="filePicker1" />
                                    <div id="filePicker1" class="filePicker bg1"><img src="${baseOrgnaization.pic1 }" alt="" /><img class="preview"><span class="icon-add"></span></div>
                                     <p class="upload_sm">上传身份证正面</p>
                                    </div>
                                </div>
                                <div class="col-xs-6 up_yl_border">
                                	<div class="up_yl_border1"  style="border-bottom:dashed 1px #e3e3e3;">
                                        <input type="hidden" name="filePicker2" />
                                        <div id="filePicker2" class="filePicker bg2"><img src="${baseOrgnaization.pic2 }" alt="" /><img class="preview" /><span class="icon-add"></span></div>
                                        <p class="upload_sm">上传身份证反面</p>
									</div>
                                </div>
                            </div>
                    	</div>
                        <div class="container" >
							<div class="row up_yl_container1" style="padding-top:2%">
                                <div class="col-xs-6 up_yl_border">
                                	<div class="up_yl_border1"  style="border-bottom:dashed 1px #e3e3e3;">
                                        <input type="hidden" name="filePicker3" />
                                        <div id="filePicker3" class="filePicker bg3"><img src="${baseOrgnaization.pic3 }" alt="" /><img class="preview" ><span class="icon-add"></span></div>
                                        <p class="upload_sm">上传银行卡正面</p>
                                    </div>
                                </div>
                                <div class="col-xs-6 up_yl_border">
                                	<div class="up_yl_border1"  style="border-bottom:dashed 1px #e3e3e3;"> 
                                        <input type="hidden" name="filePicker4" />
                                        <div id="filePicker4" class="filePicker bg4"><img src="${baseOrgnaization.pic4 }" alt="" /><img class="preview" /><span class="icon-add"></span></div>
                                        <p class="upload_sm">上传银行卡反面</p>
                                    </div>
                                </div>
                            </div>
                    	</div> 
                        <div class="container" >
							<div class="row up_yl_container1" style="padding-top:2%">
                                <div class="col-xs-6 up_yl_border">
                                	<div class="up_yl_border1">
                                        <input type="hidden" name="filePicker5" />
                                        <div id="filePicker5" class="filePicker bg5"><img src="${baseOrgnaization.pic5 }" alt="" /><img class="preview" ><span class="icon-add"></span></div>
                                        <p class="upload_sm">手持身份证</p>
                                    </div>
                                </div>
                                <div class="col-xs-6 up_yl_border">
                                	<div class="up_yl_border1">
                                         <input type="hidden" name="filePicker6" />
                                        <div id="filePicker6" class="filePicker bg6"><img src="${baseOrgnaization.pic6 }" alt="" /><img class="preview" /><span class="icon-add"></span></div>
                                        <p class="upload_sm">上传企业法人执照</p>
                                    </div>
                                </div>
                            </div>
                    	</div>     
					</div>
                    
				</div>
				<div style=" text-align:center; padding-top:1%; padding-bottom:8%;" >
                    <button id="upload" type="submit"  style=" text-shadow:none; background:#073348; border:none;  width:90%" class=" btn  btn-default btn-lg">
                        <a onclick="window.close();" style="font-weight:normal; text-decoration:none; color:#fff; font-family:'微软雅黑';">提交</a>
                    </button>
                </div>
			</form>
		</div>
	</div>
</body>
<script type="text/javascript">
$(document).ready(function() {

	function Trim(str) {
		return str.replace(/(^\s*)|(\s*$)/g, "");
	}
	/**
	 * 初始化上传文件控件
	 */
	var initWebUpload = function(options) {
		var uploader = WebUploader.create({
			pick: {
				id: options["filePicker"]
			},
			swf: '../Uploader.swf',
			chunked: false,
			chunkSize: 512 * 1024,
			server: '<%=request.getContextPath()%>/m/uploadFile',
			disableGlobalDnd: true,
			fileNumLimit: 1,
			fileSizeLimit: 6 * 1024 * 1024, // 200 M
			fileSingleSizeLimit: 6 * 1024 * 1024, // 2 M
			accept: {
				title: 'Images',
				extensions: 'gif,jpg,jpeg,bmp,png',
				mimeTypes: 'image/*'
			}
		});
		$(options["progress"]).show();
		uploader.processBar = $(options["progress"]).find(".progress-bar");

		uploader.on('ready', function() {
			window.uploader = uploader;
		});

		function addFile(file) {
			uploader.makeThumb(file, function(error, src) {
				var img;
				if(error) {
					layer.open({
						shade: false,
						time: 2,
						content: '不能预览图片'
					});
					return;
				}
				options['addFile'].apply(uploader, [src]); //$li.find("img").attr("src", src);
			}, 1, 1);

			return true;
		}

		uploader.onUploadProgress = function(file, percentage) {
			uploader.processBar.find(".sr-only").text(Math.round(percentage * 100) + '%');
			uploader.processBar.css('width', percentage * 100 + '%');
		};

		uploader.onFileQueued = function(file) {
			addFile(file);
		};

		uploader.onFileDequeued = function(file) {

		};

		uploader.on('all', function(type) {
			switch(type) {
				case 'uploadFinished':
					var files = this.getFiles();
					if(files.length > 0) {
						for(var i = 0; i < files.length; i++) {
							this.removeFile(files[i]);
						}
					}
					break;
				case 'uploadError':
					layer.open({
						shade: false,
						time: 2,
						content: '上传文件出错'
					});
					break;

				case 'uploadSuccess':

					break;

			}
		});

		uploader.onError = function(code) {
			if(code === 'F_DUPLICATE') {
				layer.open({
					shade: false,
					time: 2,
					content: '文件已存在,请勿重复添加同一张图片'
				});
			} else if(code === 'Q_EXCEED_NUM_LIMIT') {
				layer.open({
					shade: false,
					time: 2,
					content: '最多上传图片1张'
				});
			} else if(code === 'Q_EXCEED_SIZE_LIMIT') {
				layer.open({
					shade: false,
					time: 2,
					content: '所有文件累计大小已经超出范围，请压缩文件后在进行上传'
				});

			} else if(code === 'F_EXCEED_SIZE') {
				layer.open({
					shade: false,
					time: 2,
					content: '单张图片大小不能够超过2M'
				});
			} else {
				layer.open({
					shade: false,
					time: 2,
					content: '未知异常'
				});
			}
		};

		uploader.on("beforeFileQueued", function(file, response) {
			uploader.reset();
		});
		return uploader;
	}

	var upload1 = initWebUpload({
		filePicker: "#filePicker1",//filePicker
		progress: "#progress1",
		addFile: function(src) {
			var $preview = $("#filePicker1 .preview");
			$preview.css("opacity", 1);
			$preview.attr("src", src);
			$('#defaultForm').data('bootstrapValidator')
				.updateStatus("filePicker1", 'NOT_VALIDATED')
				.validateField("filePicker1");
		}
	});

	var upload2 = initWebUpload({
		filePicker: "#filePicker2",
		progress: "#progress2",
		addFile: function(src) {
			var $preview = $("#filePicker2 .preview");
			$preview.css("opacity", 1)
			$preview.attr("src", src);
			$('#defaultForm').data('bootstrapValidator')
				.updateStatus("filePicker2", 'NOT_VALIDATED')
				.validateField("filePicker2");
		}
	});

	var upload3 = initWebUpload({
		filePicker: "#filePicker3",
		progress: "#progress3",
		addFile: function(src) {
			var $preview = $("#filePicker3 .preview");
			$preview.css("opacity", 1)
			$preview.attr("src", src);
			$('#defaultForm').data('bootstrapValidator')
				.updateStatus("filePicker3", 'NOT_VALIDATED')
				.validateField("filePicker3");
		}
	});

	var upload4 = initWebUpload({
		filePicker: "#filePicker4",
		progress: "#progress4",
		addFile: function(src) {
			var $preview = $("#filePicker4 .preview");
			$preview.css("opacity", 1)
			$preview.attr("src", src);

			$('#defaultForm').data('bootstrapValidator')
				.updateStatus("filePicker4", 'NOT_VALIDATED')
				.validateField("filePicker4");
		}
	});
	var upload5 = initWebUpload({
		filePicker: "#filePicker5",
		progress: "#progress5",
		addFile: function(src) {
			var $preview = $("#filePicker5 .preview");
			$preview.css("opacity", 1)
			$preview.attr("src", src);
			$('#defaultForm').data('bootstrapValidator')
				.updateStatus("filePicker5", 'NOT_VALIDATED')
				.validateField("filePicker5");
		}
	});
	var upload6 = initWebUpload({
		filePicker: "#filePicker6",
		progress: "#progress6",
		addFile: function(src) {
			var $preview = $("#filePicker6 .preview");
			$preview.css("opacity", 1)
			$preview.attr("src", src);
		}
	});
	var uploadArray = [upload1, upload2, upload3, upload4, upload5, upload6];
	var uploadFinished = 0;
	var uploadNumber = 0;
	function checkFinished() {
		alert(1);
		if(uploadFinished == uploadNumber) {
			alert(2);
			layer.closeAll();
			$.post("<%=request.getContextPath()%>/m/uploadFinished", {
				openid: $("#openid").val()
			}, function(json) {
				layer.open({
					shade: false,
					time: 3,
					style: 'background-color:#09C1FF; color:#fff; border:none;',
					content: json['desc'],
					fixed: false
				});
			}, "json");
		}
	}
/* 	for(var i = 0; i < uploadArray.length; i++) {
		uploadArray[i].on("uploadFinished", function(file, response) {
			uploadFinished++;
			checkFinished();
		});
	} */

	$('#defaultForm').bootstrapValidator({
		
		excluded: ':disabled',
		feedbackIcons: {
			valid: 'glyphicon glyphicon-ok',
			invalid: 'glyphicon glyphicon-remove',
			validating: 'glyphicon glyphicon-refresh'
		},
		fields: {
			filePicker1: {
				validators: {
					callback: {
						message: "请选择身份证正面图片",
						callback: function() {
							if(upload1.getFiles().length > 0){
								upload1.options.formData = {
										'merchId': $("#merchId").val(),
										'openid': $("#openid").val(),
										'file': upload1.getFiles(),
										'folderName':'shenfenzhengzhengmian',
										'typeFF': 1
									};
								upload1.upload();
									return true;
							}
								
							return false;
						}
					}
				}
			},
			filePicker2: {
				validators: {
					callback: {
						message: "请选择身份证反面图片",
						callback: function() {
							if(upload2.getFiles().length > 0){
								upload2.options.formData = {
									'merchId': $("#merchId").val(),
									'openid': $("#openid").val(),
									'file': upload2.getFiles(),
									'folderName':'shenfenzhengfanmian',
									'typeFF': 2
								};
							upload2.upload();
								return true;
								}
							return false;
						}
					}
				}
			},
			filePicker3: {
				validators: {
					callback: {
						message: "请选择银行卡正面图片",
						callback: function() {
							if(upload3.getFiles().length > 0){
								upload3.options.formData = {
										'merchId': $("#merchId").val(),
										'openid': $("#openid").val(),
										'file': upload3.getFiles(),
										'folderName':'yinhangkazhengmian',
										'typeFF': 3
									};
								upload3.upload();
									return true;
							}
							return false;
						}
					}
				}
			},
			filePicker4: {
				validators: {
					callback: {
						message: "请选择银行卡反面图片",
						callback: function() {
							if(upload4.getFiles().length > 0){
								upload4.options.formData = {
										'merchId': $("#merchId").val(),
										'openid': $("#openid").val(),
										'file': upload4.getFiles(),
										'folderName':'yinhangkafanmian',
										'typeFF': 4
									};
								upload4.upload();
									return true;
							}
							return false;
						}
					}
				}

			},
			filePicker5: {
				validators: {
					callback: {
						message: "请选择手持身份证",
						callback: function() {
							if(upload5.getFiles().length > 0){
								upload5.options.formData = {
										'merchId': $("#merchId").val(),
										'openid': $("#openid").val(),
										'file': upload5.getFiles(),
										'folderName':'shouchishenfenzheng',
										'typeFF': 5
									};
								upload5.upload();
									return true;
							}
							return false;
						}
					}
				}

			},
			filePicker6: {
				validators: {
					callback: {
						message: "请选择企业法人执照",
						callback: function() {
							if(upload6.getFiles().length > 0){
								upload6.options.formData = {
										'merchId': $("#merchId").val(),
										'openid': $("#openid").val(),
										'file': upload6.getFiles(),
										'folderName':'qiyefarenzhizhao',
										'typeFF': 6
									};
								upload6.upload();
									return true;
							}
							return true;
						}
					}
				}

			}
		}
	}).on('success.form.bv', function(e) {
		e.preventDefault();
		var $form = $(e.target);
		var loading = layer.open({
			type: 2,
			shadeClose: false
		});
		
	});

});


</script>
</html>
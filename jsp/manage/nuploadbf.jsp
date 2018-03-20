<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<!DOCTYPE html>
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1, maximum-scale=1">
        <meta name="apple-mobile-web-app-capable" content="yes">  <!--删除默认的苹果工具栏和菜单栏-->
   		<meta name="apple-mobile-web-app-status-bar-style" content="black"> <!-- 控制状态栏显示样式-->
		<title>文件上传</title>
		<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap/bootstrap.min.css"/>
		<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap/bootstrapValidator.min.css" />
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/sm/webuploader.css" />
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/sm/sm.min.css">
		<link rel="stylesheet" href="<%=request.getContextPath()%>/css/sm/mystyle.css">	
		
		<style>
			.zccg_container{margin: 0; padding: 0 !important; background:#fff; margin-top:10px; margin-bottom:10px;}
			.upload_border{ border:solid 1px #c2c2c2; border-radius:6px; position:relative;}
			.upload_borderjj{ margin-bottom:10%}
			.upload_border_top{ position:absolute; top:-14px; left:10%;}
			.upload_border_top a{ line-height:24px; font-size:16px; color:#000; font-family:'微软雅黑'; padding-left:6px; text-decoration:none; }
			.upload_border_top span{ background:#fff; padding:0 10%; display:block; width:138px; }
			.up_yl_border{padding:2%;}
			up_yl_border1{ padding:2%;}
			.up_yl_border img{border:solid 1px #e3e3e3; border-radius:6px;}
			.up_yl_container{ padding:6% 3% 0 3%;}
		
			.up_yl_container1{ padding:0% 3%;}
			.up_yl_container1 .upload_sm{ text-align:center; line-height:34px; font-size:16px; color:#666; font-family:'微软雅黑';}
			.help-block{ color:#f1562f; font-family:'微软雅黑'; text-align:center;}
		
		
			.webuploader-container {position: relative;}
			.webuploader-element-invisible {position: absolute !important;clip: rect(1px 1px 1px 1px); /* IE6, IE7 */clip: rect(1px,1px,1px,1px);}
			.webuploader-pick-hover { background: #00a2d4;}
			.webuploader-pick-disable {opacity: 0.6; pointer-events:none;}
			
			.bg1 .webuploader-pick {
							background: url(<%=request.getContextPath()%>/img/pic/up_pictuer1.png);
							background-repeat: no-repeat;
							background-size: 100% 100%;
			}
			.bg2 .webuploader-pick {
							background: url(<%=request.getContextPath()%>/img/shenfenzhengfanmian.png);
							background-repeat: no-repeat;
							background-size: 100% 100%;
			}
						
			.bg3 .webuploader-pick {
							background: url(<%=request.getContextPath()%>/img/yinhangkazhengmian.png);
							background-repeat: no-repeat;
							background-size: 100% 100%;
			}
			.bg4 .webuploader-pick {
							background: url(<%=request.getContextPath()%>/img/mendian.png);
							background-repeat: no-repeat;
							background-size: 100% 100%;
			}
			.bg5 .webuploader-pick {
							background: url(<%=request.getContextPath()%>/img/shouchishenfenzheng.png);
							background-repeat: no-repeat;
							background-size: 100% 100%;
			}
			.bg6 .webuploader-pick {
							background: url(<%=request.getContextPath()%>/img/yingyezhizhao.png);
							background-repeat: no-repeat;
							background-size: 100% 100%;
			}
			
			.webuploader-pick .preview {position: absolute;top: 0;left: 0;height: 100%;width: 100%;opacity: 0;}
			.left {float: left;}
			.right {float: right;}
			.progress{display: none; margin: 0;}
			.popup_yc span{ font-size:14px; font-family:'微软雅黑'; color:#f94b4a; padding-top:6%; display:block; }
			
		.black_overlay
		{  
			display: none;
			position: absolute;
			top: 0%;  left: 0%;
			width: 100%;  height: 100%;
			background-color: black;  
			z-index:1001;  
			-moz-opacity: 0.8;  
			opacity:.80;  
			filter: alpha(opacity=80); 
		}  
		.white_content 
		{  
			display: none;  
			position: absolute;  
			top:30%; left:10%;  
			border-radius:4px;
			width:80%; height:160px;
			background-color: white;  
			z-index:1002;  
			overflow: auto; 
			margin:atuo; 
		}  
		#onclick_off{ right:0; top:0; position:absolute; margin-right:15px; margin-top:15px;}
		.white_content span{ width: 80%;top: 20px;display: block; margin-top: 42px; font-size: 16px; margin-left: 10%;font-size:16px; font-family:'微软雅黑';}
		.jdxx_text{ text-align:center; width:100%; background:#fff; border:none;}
		.jdxx_text a{ font-size:16px; color:#000; border:none; font-family:'微软雅黑'; background:none; text-decoration:none; margin:auto; line-height:40px;}
			
		</style>
        <script>
        	$(function(){
				$("#upload").on("touchstart",function(){
					$(this).css({background:"-webkit-gradient(linear, left top, left bottom, from(#065376), to(#083d57))"});
				}).on("touchend",function(){
					$(this).css({background:"#073348"});	
				});
				
				$("#return_firstpage").on("touchstart",function(){
					$(this).css({background:"#e3e3e3"});
				}).on("touchend",function(){
					$(this).css({background:"#fff"});	
				});
			});
        	function an(){
        		var openid=documen.getElementById("openid").value;
        		var merchId=documen.getElementById("merchId").value;
        		var oemid=documen.getElementById("oemid").value;
        		var rcGrade=documen.getElementById("rcGrade").value;
        		window.location.href="<%=request.getContextPath()%>/Manage/uploadJiaoYan?openid="+openid+"&orgCode="+merchId+"&oemid="+oemid+"&rcGrade="+rcGrade;
        	}
        	
        	function check() {
    			$.post("<%=request.getContextPath()%>/Manage/uploadJiaoYan", {
    				orgCode:$("input[name='orgCode']").val(),
    				oemid:$("input[name='oemid']").val(),
    				openid:$("input[name='openid']").val(),
    				rcGrade:$("input[name='rcGrade']").val()
    			},function(json) {
    				//alert(json);						
    				if(json.code != 0) {
    					var loading = layer.open({
    						type: 3,
    						content: json.desc
    					});
    				}else
    					{
    					document.getElementById('submit_tj').style.display='block'; 
    					document.getElementById('fade_yc').style.display='block';
    					}

    	 
    			}, 'json');
    		}
        	</script>		
	</head>

<body  style="background:#f5f5f5">
	<div class="page-group">
		<div class="page page-current">
        	<header class="bar bar-nav">
                <a class="icon icon-left pull-left back"></a>
                <h1 class='title'>商家经营</h1>
            </header>
			<div class="content">
            	<div class="content-block-title"></div>
				<div class="content-block ">
                	<!--样本-->
                	<div class="row upload-container" style="margin-bottom:1rem;">
                  		<div class="col-50">
                        	<a href="#" >
                        		<span>
                                	<img src="<%=request.getContextPath()%>/img/wcb/upload_example.png">
                                </span>
                        	</a>
                        </div>
                        <div class="col-50 col-50-left">
                        	<a href="#" >
                        		<span>
                                	<img src="<%=request.getContextPath()%>/img/wcb/upload_example.png">
                                </span>
                        	</a>
                        </div>
                	</div>
                   
					<form id="defaultForm" method="post" action="#">
                        <input type="hidden" id="openid" name="openid" value="${openid}" />
                        <input type="hidden" id="merchId" name="orgCode" value="${orgCode}" />
                        <input type="hidden" id="oemid" name="oemid" value="${oemid}" />
                        <input type="hidden" id="rcGrade" name="rcGrade" value="${rcGrade}" /><%-- ${merch.merchId} --%>
                        <div class="upload-main">
                        	<div class="row upload-container">
                            	<div class="col-50">
                                	<span class="up_yl_border1">
                                        <input type="hidden" name="filePicker1" />
                                        <div id="filePicker1" class="filePicker bg1">
                                            <img class="preview" >
                                        </div>
                                        <p class="upload_sm">上传身份证正面</p>
                                    </span>
                                </div>
                                <div class="col-50 col-50-left">
                                	<span class="up_yl_border1">
                                        <input type="hidden" name="filePicker2" />
                                        <div id="filePicker2" class="filePicker bg2">
                                            <img class="preview" />
                                         </div>
                                        <p class="upload_sm">上传身份证反面</p>
                                    </span>
                                </div>
                            </div>
                            <!--2-->
                            <div class="row upload-container upload-jj">
                                <div class="col-50">
                                	<span class="up_yl_border1">
                                        <input type="hidden" name="filePicker3" />
                                        <div id="filePicker3" class="filePicker bg3"><img class="preview" ></div>
                                        <p class="upload_sm">上传银行卡正面</p>
                                    </span>
                                </div>
                                <div class="col-50 col-50-left">
                                	<span class="up_yl_border1">
                                        <input type="hidden" name="filePicker4" />
                                        <div id="filePicker4" class="filePicker bg4"><img class="preview" /></span></div>
                                        <p class="upload_sm">门头照片</p>
                                    </span>
                                </div>
                            </div>
                            <!--3-->
                            <div class="row upload-container">
                                <div class="col-50">
                                	<span class="up_yl_border1">
                                        <input type="hidden" name="filePicker5" />
                                        <div id="filePicker5" class="filePicker bg5"><img class="preview" ></span></div>
                                        <p class="upload_sm">手持身份证</p>
                                	</span>
                                </div>
                                <div class="col-50 col-50-left">
                                	<span class="up_yl_border1">
                                	<input type="hidden" name="filePicker6" />
                                	<div id="filePicker6" class="filePicker bg6"><img class="preview" /></span></div>
                            		<p class="upload_sm">上传企业法人执照</p>
                                    </span>
                                </div>
                            </div>     
                                   
                    	</div>
                	</form>  
				</div>
			
                <div class="content-block">
                    <div class="row" style="margin-left:-4%;">
                        <div class="col-100"><button  onclick="window.close();"  id="upload" type="submit" class="button button-block button-fill button-big ">提交</button></div>
                    </div>
                </div> 
            </div>
		</div>
    </div>


			

<!--弹框-->
	<div id="submit_tj" class="white_content">
		<span>您的申请已提交办理成功后将收到通知。</span> 
         <div style=" border-top:solid 1px #cfcfcf;  margin-top:30px;">
            <button id="return_firstpage" class="jdxx_text">
                <a href="<%=request.getContextPath()%>/Manage/machManage?openid=${openid}&oemid=${oemid}">返&nbsp;&nbsp;&nbsp;&nbsp;回</a>
            </button>
         </div>
		
	</div> 
	<div id="fade_yc" class="black_overlay" style=""></div> 
    
    	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.11.3.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/wechat/layer.m.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap/bootstrap.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap/bootstrapValidator.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/webuploader.min.js"></script>
    
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
			swf: '../Uploader.swf',
			pick: {
				id: options["filePicker"]
			},
			chunked: false,
			chunkSize: 512 * 1024,
			server: '<%=request.getContextPath()%>/m/uploadFile',
			disableGlobalDnd: true,
			fileNumLimit: 1,//上传数量限制
			fileSizeLimit: 6 * 1024 * 1024,//限制上传所有文件大小
			fileSingleSizeLimit: 6* 1024 * 1024, // 限制上传单个文件大小
			resize: true,
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
			uploader.makeThumb( file, function( error, src ) {
				var img;
				if(error) {
					/*layer.open({
						shade: false,
						time: 2,
						content: '不能预览图片'
					});*/
					alert(不能预览图片);
					return;
				}
				options['addFile'].apply(uploader, [src]); //$li.find("img").attr("src", src);
			}, 1, 1 );
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
			$('#defaultForm').data('bootstrapValidator')
			.updateStatus("filePicker6", 'NOT_VALIDATED')
			.validateField("filePicker6");
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
						message: "请选择门头照片",
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
							return false;
						}
					}
				}

			}
		}
	}).on('success.form.bv', function(e) {
		check();
		return false;
	});

});


</script>
</html>
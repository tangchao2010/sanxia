<!DOCTYPE htm>
<html>
<head>
	<title>实名认证</title>
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1, maximum-scale=1">
    <link rel="shortcut icon" href="/favicon.ico">
    <meta charset="UTF-8"/>
    <meta name="apple-mobile-web-app-capable" content="yes">  <!--删除默认的苹果工具栏和菜单栏-->
    <meta name="apple-mobile-web-app-status-bar-style" content="black"> <!-- 控制状态栏显示样式-->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/sm/sm.min.css">
	<link href="<%=request.getContextPath()%>/css/webuploader.css" rel="stylesheet" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/sm/mystyle.css">	
</head>
<body>
    <div class="page-group">
		<div class="page page-current">
        	<header class="bar bar-nav">
                <a class="icon icon-left pull-left" onclick="javascript:history.back(-1);"></a>
                <h1 class="title">实名认证</h1>
            </header>
			<div class="content">
            	<form id="formid" method = "post"  action = "<%=request.getContextPath()%>/kuaijie/fastPayment" >
          			<input type="hidden" id="openid" name="openid" value="${openid}" />
					<input type="hidden" id="merchId" name="orgCode" value="${orgCode}" />
					<input type="hidden" id="oemid" name="oemid" value="${oemid}" />
					<input type="hidden" id="rcGrade" name="rcGrade" value="${rcGrade}" /><%-- ${merch.merchId} --%>
                    
                    <div class="content-padded grid-demo" style=" margin:0;">
                    	<div class="uploadmain">
                    	<div class="upload_title sxpublic shareLoana">
                        	<img src="<%=request.getContextPath()%>/img/wcb/uploadpic.png" />
                            <span>上传图片</span>
                        </div>
                        <div class="row uploadid">
                            <div class="col-50">
                                <div class="up_yl_border1 uploadecont">
                                    <input type="hidden" name="filePicker1" />
                                    <div id="filePicker1" class="filePicker bg1 uploadborder">
                                        <img class="preview" >
                                    </div>
                                    <p>上传身份证正面</p>
                                </div>
                            </div>
                            
                            <div class="col-50">
                            	<div class="up_yl_border1 uploadecont">
                            		<input type="hidden" name="filePicker2" />
                                    <div id="filePicker2" class="filePicker bg2 uploadborder">
                                    	<img class="preview" />
                                    </div>
                                    <p>上传身份证反面</p>
								</div>
                            </div>
						</div>
                        
                        <div class="row uploadid">
                            <div class="col-50">
                                <div class="up_yl_border1 uploadecont">
                                	<input type="hidden" name="filePicker3" />
                                    <div id="filePicker3" class="filePicker bg3 uploadborder">
                                    	<img class="preview" >
                                    </div>
                                    <p class="upload_sm">上传银行卡正面</p>
                                </div>
                            </div>
                            
                            <div class="col-50">
                            	<div class="up_yl_border1 uploadecont">
                                	<input type="hidden" name="filePicker5" />
                                	<div id="filePicker5" class="filePicker bg5 uploadborder">
                                    	<img class="preview" >
                                    </div>
                                	<p class="upload_sm">手持身份证</p>
                            	</div>
                            </div>
						</div>
                        </div>
                    </div>
                    <div class="content-block">
                        <div class="row">
                            <div class="col-100"><button id="tcashbc" onclick="merchSubmit()" type="button" class="button button-block button-fill button-big">提交</button></div>
                        </div>
					</div>
                </form>
			</div>
		</div>
	</div>	

    <script type="text/javascript" src="<%=request.getContextPath()%>/js/sm/jquery-3.1.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/sm/mypublic.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/sm/sm.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/webuploader.min.js"></script>
	
	<script  type="text/javascript">
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
				}
				else{
					document.getElementById('submit_tj').style.display='block'; 
					document.getElementById('fade_yc').style.display='block';
				}
    		}, 'json');
    	}
 	</script>
    
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

			}
		
		}
	}).on('success.form.bv', function(e) {
		check();
		return false;
	//	e.preventDefault();
	//	var $form = $(e.target);
	//	var loading = layer.open({
	//		type: 2,
	//		shadeClose: false
	//	}); 
	//	var openid=documen.getElementById("openid").value;
	//	var merchId=documen.getElementById("merchId").value;
	//	var oemid=documen.getElementById("oemid").value;
	//	var rcGrade=documen.getElementById("rcGrade").value;
	});

});


</script>


</body>
</html>
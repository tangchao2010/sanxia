$(document).ready(function() {
	$("#warning").html("申请B类额度需要上传 身份证正面 , 身份证反面, 银行卡正面，银行卡反面，手持身份证（正面）");
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
			server: options["server"] ? options["server"] : "/m/uploadFile",
			disableGlobalDnd: true,
			fileNumLimit: 1,
			fileSizeLimit: 10 * 1024 * 1024, // 200 M
			fileSingleSizeLimit: 10 * 1024 * 1024, // 2 M
			compress:{
				width: 460,
				height: 360,
				// 图片质量，只有type为`image/jpeg`的时候才有效。
				quality: 90,
				
				// 是否允许放大，如果想要生成小图的时候不失真，此选项应该设置为false.
				allowMagnify: false,
				
				// 是否允许裁剪。
				crop: false,
				
				// 是否保留头部meta信息。
				preserveHeaders: true,
				
				// 如果发现压缩后文件大小比原来还大，则使用原来图片
				// 此属性可能会影响图片自动纠正功能
				noCompressIfLarger: false,
				
				// 单位字节，如果图片大小小于此值，不会采用压缩。
				compressSize: 0
			},
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
		filePicker: "#filePicker1",
		progress: "#progress1",
		addFile: function(src) {
			var $preview = $("#filePicker1 .preview");
			$preview.css("opacity", 1)
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
		if(uploadFinished == uploadNumber) {
			layer.closeAll();
			if(typeof(uploadFinishedC)!="undefined"){
				uploadFinishedC();
			}
		}
	}
	for(var i = 0; i < uploadArray.length; i++) {
		uploadArray[i].on("uploadFinished", function(file, response) {
			uploadFinished++;
			checkFinished()
		});
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
						message: "请输入身份证正面图片",
						callback: function() {
							if(upload1.getFiles().length > 0)
								return true;
							return false;
						}
					}
				}
			},
			filePicker2: {
				validators: {
					callback: {
						message: "请输入身份证反面图片",
						callback: function() {
							if(upload2.getFiles().length > 0)
								return true;
							return false;
						}
					}
				}
			},
			filePicker3: {
				validators: {
					callback: {
						message: "请输入银行卡正面图片",
						callback: function() {
							if(upload3.getFiles().length > 0)
								return true;
							return false;
						}
					}
				}
			},
			filePicker4: {
				validators: {
					callback: {
						message: "请输入银行卡反面图片",
						callback: function() {
							if(upload4.getFiles().length > 0)
								return true;
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
							if(upload5.getFiles().length > 0)
								return true;
							return false;
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
		for(var i = 0; i < uploadArray.length; i++) {
			if(uploadArray[i].length == 0)
				continue;
			uploadNumber++;
			uploadArray[i].options.formData = {
				'merchId': $("#merchId").val(),
				'openid': $("#openid").val(),
				'typeFF': i
			};
			uploadArray[i].upload();
		}
	});

});
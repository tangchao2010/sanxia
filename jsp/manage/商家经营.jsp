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
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/sm/webuploader.css" />
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/sm/sm.min.css">
		<link rel="stylesheet" href="<%=request.getContextPath()%>/css/sm/mystyle.css">	
		<style>
			.help-block{ color:#f1562f; font-family:'微软雅黑'; text-align:center;}
			.webuploader-container {position: relative;}
			.webuploader-element-invisible {position: absolute !important;clip: rect(1px 1px 1px 1px); /* IE6, IE7 */clip: rect(1px,1px,1px,1px);}
			.webuploader-pick-hover { background: #00a2d4;}
			.webuploader-pick-disable {opacity: 0.6; pointer-events:none;}
			
			.bg1{
				background: url(<%=request.getContextPath()%>/img/wcb/upload_example.png)  center  no-repeat;
				height: 5.2rem;
			}
			.bg2{
				background: url(<%=request.getContextPath()%>/img/wcb/upload_example.png)  center  no-repeat;
				height: 5.2rem;
			}
						
			.bg3 {
				background: url(<%=request.getContextPath()%>/img/wcb/upload_example.png)  center  no-repeat;
				height: 5.2rem;
			}
			.bg4  {
				background: url(<%=request.getContextPath()%>/img/wcb/upload_example.png)  center  no-repeat;
				height: 5.2rem;
			}
			.bg5{
				background: url(<%=request.getContextPath()%>/img/wcb/upload_example.png)  center  no-repeat;
				height: 5.2rem;
			}
			.bg6 {
				background: url(<%=request.getContextPath()%>/img/wcb/upload_example.png)  center  no-repeat;
				height: 5.2rem;
			}
			
			 .preview {position: absolute;top: 0;left: 0;height: 100%;width: 100%;opacity: 0;}
			.left {float: left;}
			.right {float: right;}
			.progress{display: none; margin: 0;}
			.popup_yc span{ font-size:14px; font-family:'微软雅黑'; color:#f94b4a; padding-top:6%; display:block; }
				
			.black_overlay{  
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
			.white_content {  
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
			.white_content span{ width: 80%;top: 20px;display: block; margin-top: 42px; font-size: 16px; margin-left: 10%;font-size:16px; font-family:'微软雅黑';}
			.jdxx_text{ text-align:center; width:100%; background:#fff; border:none;}
			.jdxx_text a{ font-size:16px; color:#000; border:none; font-family:'微软雅黑'; background:none; text-decoration:none; margin:auto; line-height:40px;}
			
			label{ margin-bottom:0;}
			.help-block{
				margin-top:.2;
				font-size:.7rem;
				color:#ff4f4f;
			}
			
			/*sm样式补充*/
			.list-block .item-title.label{
				width: initial;	
			}
			.list-block .item-inner{ margin-left:.75rem;}
		</style>
	</head>

	<body>
		<div class="page-group">
			<div class="page page-current">
                <header class="bar bar-nav">
                    <a class="icon icon-left pull-left back"></a>
                    <h1 class='title'>商家经营</h1>
                </header>
                <div class="content">
                	
					<div class="upload-body">
                
						<form id="defaultForm" method="post" action="#">
                            <input type="hidden" id="openid" name="openid" value="${openid}" />
                            <input type="hidden" id="merchId" name="orgCode" value="${orgCode}" />
                            <input type="hidden" id="oemid" name="oemid" value="${oemid}" />
                            <input type="hidden" id="rcGrade" name="rcGrade" value="${rcGrade}" /><%-- ${merch.merchId} --%>
                        
                        	<div class="list-block">
                            	<ul>
                            		<li>
                                        <div class="item-content">
                                        	<div class="item-inner">
                                                <div class="myuploadlabel item-title label">商户营业执照号</div>
                                                <div class="myuploadiput item-input">
                                                  <input id="shyyzz" type="tel" placeholder="请输入商户营业执照号" value="" style=" font-size: .8rem;">
                                                </div>
                                        	</div>
                                        </div>
                                	</li>
								</ul>
                    		</div>
                            
							<div class="upload-main">
                            	<div class="row upload-container" style="margin-bottom:.6rem;">
                                    <div class="col-50">
                                        <div class="col-xs-12 ">
                                            <input type="hidden" name="filePicker1" />
                                            <div id="filePicker1" class="filePicker bg1">
                                                <img id="wqndy" class="preview" >
                                                <p class="upload_sm">上传身份证正面</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-50 col-50-left">
                                        <div class="col-xs-12 ">
                                            <input type="hidden" name="filePicker2" />
                                            <div id="filePicker2" class="filePicker bg2"><img class="preview" /> <p class="upload_sm">上传身份证反面</p></div>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="row upload-container" style="margin-bottom:.6rem;">
                                    <div class="col-50">
                                        <div class="col-xs-12 ">
                                            <input type="hidden" name="filePicker3" />
                                            <div id="filePicker3" class="filePicker bg3"><img class="preview" >  <p class="upload_sm">上传银行卡正面</p></div>
                                        </div>
                                    </div>
                                    <div class="col-50 col-50-left">
                                        <div class="col-xs-12 ">
                                            <input type="hidden" name="filePicker4" />
                                            <div id="filePicker4" class="filePicker bg4"><img class="preview" /><p class="upload_sm">门头照片</p></div>
                                        </div>
                                    </div>
                                </div> 
                                
                                <div class="row upload-container" style="margin-bottom:1rem;">
                                    <div class="col-50">
                                        <div class="col-xs-12 ">
                                            <input type="hidden" name="filePicker5" />
                                            <div id="filePicker5" class="filePicker bg5"><img class="preview" > <p class="upload_sm">手持身份证</p></div>
                                        </div>
                                    </div>
                                    <div class="col-50 col-50-left">
                                        <div class="col-xs-12 ">
                                            <input type="hidden" name="filePicker6" />
                                            <div id="filePicker6" class="filePicker bg6"><img class="preview" /> <p class="upload_sm">上传企业法人执照</p></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="content-block">
                                <div class="row">
                                    <div class="col-100">
                                        <button id="upload" type="button" onclick="oncelogin()" class="button button-block button-fill button-big ">提交</button>
                                    </div>
                                </div>
                            </div>
                            
                    	</form>
                
                	</div>
                
                </div>
            </div>
		</div>    
        
    	<script type='text/javascript' src="<%=request.getContextPath()%>/js/sm/zepto.min.js"></script>
		<script type='text/javascript' src="<%=request.getContextPath()%>/js/sm/sm.min.js" ></script> 
    	<script type="text/javascript" src="<%=request.getContextPath()%>/js/webuploader.min.js"></script>
    	<script type="text/javascript" src="<%=request.getContextPath()%>/js/wechat/layer.m.js"></script>    

	<script type="text/javascript">
		function an(){
    		var openid=documen.getElementById("openid").value;
       		var merchId=documen.getElementById("merchId").value;
       		var oemid=documen.getElementById("oemid").value;
      		var rcGrade=documen.getElementById("rcGrade").value;
     		window.location.href="<%=request.getContextPath()%>/Manage/uploadJiaoYan?openid="+openid+"&orgCode="+merchId+"&oemid="+oemid+"&rcGrade="+rcGrade;
    	}
        	
		/*function check() {
			$.showIndicator();
			$.post("<%=request.getContextPath()%>/Manage/uploadJiaoYan", {
				orgCode:$("input[name='orgCode']").val(),
    			oemid:$("input[name='oemid']").val(),
    			openid:$("input[name='openid']").val(),
    			baseOrgLicence:$("input[name='baseOrgLicence']").val(),
    			rcGrade:$("input[name='rcGrade']").val()
    		},function(json) {
    		if(json.code != 0) {
				alert(22);
    			$.alert(json.desc);
    		}else
    		{
				alert(11);
				$.alert('您的申请已提交办理成功后将收到通知', function () {
					window.location.href="<%=request.getContextPath()%>/Manage/machManage?openid=${openid}&oemid=${oemid}"
				});
    		}
    		}, 'json');
    	}*/
	</script>

	<script type="text/javascript">
        function Trim(str) {
            return str.replace(/(^\s*)|(\s*$)/g, "");
        }
		
		function oncelogin(){
			if(checkUploadpic()){
				$.showIndicator();
				$.post("<%=request.getContextPath()%>/Manage/uploadJiaoYan", {
					orgCode:$("input[name='orgCode']").val(),
					oemid:$("input[name='oemid']").val(),
					openid:$("input[name='openid']").val(),
					baseOrgLicence:$("input[name='baseOrgLicence']").val(),
					rcGrade:$("input[name='rcGrade']").val()
				},function(json) {
				if(json.code != 0) {
					//alert(22);
					$.alert(json.desc);
				}else
				{
					//alert(11);
					$.alert('您的申请已提交办理成功后将收到通知', function () {
						window.location.href="<%=request.getContextPath()%>/Manage/machManage?openid=${openid}&oemid=${oemid}"
					});
				}
				}, 'json');
				
			}else{
				$.hideIndicator();
				return false;
			}
		}
	
		function checkUploadpic(){
			var shyyzz = $("#shyyzz").val();
			if(shyyzz==null||shyyzz==""){
				$.alert("请输入商户营业执照号");
				return false;
			}
			if(upload1.getFiles().length == 0){
				upload1.options.formData = {
					'merchId': $("#merchId").val(),
					'openid': $("#openid").val(),
					'file': upload1.getFiles(),
					'folderName':'shenfenzhengzhengmian',
					'typeFF': 1
				}
				$.alert("请上传身份证正面");
				upload1.upload();
				return false;
			}
			if(upload2.getFiles().length == 0){
				upload2.options.formData = {
					'merchId': $("#merchId").val(),
					'openid': $("#openid").val(),
					'file': upload2.getFiles(),
					'folderName':'shenfenzhengfanmian',
					'typeFF': 2
				}
				$.alert("请上传身份证反面");
				upload2.upload();
				return false;
			}
			if(upload3.getFiles().length == 0){
				upload3.options.formData = {
					'merchId': $("#merchId").val(),
					'openid': $("#openid").val(),
					'file': upload3.getFiles(),
					'folderName':'yinhangkazhengmian',
					'typeFF': 3
				}
				$.alert("请上传银行卡正面");
				upload3.upload();
				return false;
			}
			if(upload4.getFiles().length == 0){
				upload4.options.formData = {
					'merchId': $("#merchId").val(),
					'openid': $("#openid").val(),
					'file': upload4.getFiles(),
					'folderName':'yinhangkafanmian',
					'typeFF': 4
				}
				$.alert("请上传门头照片");
				upload4.upload();
				return false;
			}
			if(upload5.getFiles().length == 0){
				upload5.options.formData = {
					'merchId': $("#merchId").val(),
					'openid': $("#openid").val(),
					'file': upload5.getFiles(),
					'folderName':'shouchishenfenzheng',
					'typeFF': 5
				}	
				$.alert("请上传手持身份证");
				upload5.upload();
				return false;
			}
			if(upload6.getFiles().length == 0){
				upload6.options.formData = {
					'merchId': $("#merchId").val(),
					'openid': $("#openid").val(),
					'file': upload6.getFiles(),
					'folderName':'qiyefarenzhizhao',
					'typeFF': 6
				}
				$.alert("请上传企业法人执照");
				$.upload6.upload();
				return false;
			}
			else{
				//check();
				return true;
			}
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
                        $.alert('不能预览图片');
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
                        $.alert('上传文件出错');
                        break;
    
                    case 'uploadSuccess':
    
					break;
                }
            });
    
            uploader.onError = function(code) {
                if(code === 'F_DUPLICATE') {
                    $.alert('文件已存在,请勿重复添加同一张图片');
                } else if(code === 'Q_EXCEED_NUM_LIMIT') {
                    $.alert('最多上传图片1张');
                } else if(code === 'Q_EXCEED_SIZE_LIMIT') {
                    $.alert('所有文件累计大小已经超出范围，请压缩文件后在进行上传');
    
                } else if(code === 'F_EXCEED_SIZE') {
                    $.alert('单张图片大小不能够超过2M');
                } else {
                    $.alert('未知异常');
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
            }
        });
    
        var upload2 = initWebUpload({
            filePicker: "#filePicker2",
            progress: "#progress2",
            addFile: function(src) {
                var $preview = $("#filePicker2 .preview");
                $preview.css("opacity", 1)
                $preview.attr("src", src);
            }
        });
    
        var upload3 = initWebUpload({
            filePicker: "#filePicker3",
            progress: "#progress3",
            addFile: function(src) {
                var $preview = $("#filePicker3 .preview");
                $preview.css("opacity", 1)
                $preview.attr("src", src);
            }
        });
    
        var upload4 = initWebUpload({
            filePicker: "#filePicker4",
            progress: "#progress4",
            addFile: function(src) {
                var $preview = $("#filePicker4 .preview");
                $preview.css("opacity", 1)
                $preview.attr("src", src);
            }
        });
        var upload5 = initWebUpload({
            filePicker: "#filePicker5",
            progress: "#progress5",
            addFile: function(src) {
                var $preview = $("#filePicker5 .preview");
                $preview.css("opacity", 1)
                $preview.attr("src", src);
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
            //alert(1);
            if(uploadFinished == uploadNumber) {
               // alert(2);
                layer.closeAll();
                $.post("<%=request.getContextPath()%>/m/uploadFinished", {
                    openid: $("#openid").val()
                }, function(json) {
					alert(1);
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
    </script>
</body>
</html>













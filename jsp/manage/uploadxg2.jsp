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
			.upload_container{ padding-right:15px; padding-left:15px; padding-top:4%; padding-bottom:4%;}
			.upload_border{ border:solid 1px #c2c2c2; border-radius:6px; position:relative;}
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
			.popup_yc span{ font-size:14px; font-family:'微软雅黑'; color:#f94b4a; padding-top:6%;  display:block; }
			
			<!--modal-->
			/*.modal-dialog{ padding-left:7%; padding-right:7%; margin-top:48%; }
			.modal-content{z-index:100000; box-shadow:none; border:none; border-radius:4px;}
			.add_list_bottom{ text-align:center;}
			.add_list_bottom a{ font-size:18px; padding-left:30px; padding-right:30px; font-family:'微软雅黑'; color:#000; text-decoration:none;}
			.container_modal .top_bottom { margin-left:12px; margin-right:12px; list-style: none outside none; padding-top: 12px;}
			.jdxx_text{ text-align:center; font-size:16px; font-family:'微软雅黑'; color:#000;}
			.infor_list_zc{overflow:hidden; text-overflow:ellipsis; white-space:nowrap; -ms-text-overflow: ellipsis;text-overflow: ellipsis;white-space: nowrap;}
			.fj{overflow:hidden; font-size:16px; text-overflow:ellipsis; white-space:nowrap; -ms-text-overflow: ellipsis; text-overflow: ellipsis;white-space: nowrap; text-align:left;}
			.jdxx_text button{ font-size:16px; color:#000; border:none; font-family:'微软雅黑'; background:none;}
        	.top_bottom dt{ text-align:center; font-size:16px; padding-bottom:6px;}
			.top_bottom dd{ font-size:12px; color:#333;}*/
					
						
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
			.up_sfzzm{width:100%; height:76px;}		
		</style>
        <script>
        	$(function(){
				$("#upload").on("touchstart",function(){
					$(this).css({background:"-webkit-gradient(linear, left top, left bottom, from(#065376), to(#083d57))"});
				}).on("touchend",function(){
					$(this).css({background:"#073348"});	
				});
			});
        	function an(){
        		var openid=documen.getElementById("openid").value;
        		var merchId=documen.getElementById("merchId").value;
        		var oemid=documen.getElementById("oemid").value;
        		window.location.href="<%=request.getContextPath()%>/Manage/uploadChooseUI?openid="+openid+"&orgCode="+merchId+"&oemid="+oemid;
        	}
		</script>		
	</head>

<body  style="background:#f5f5f5">
	<div class="container-fluid">
        <div class="zccg_container">
			<form id="defaultForm" method="post" action="<%=request.getContextPath()%>/Manage/uploadChooseUI?openid=${openid }&orgCode=${orgCode }&oemid=${oemid}">
				<input type="hidden" id="openid" value="${openid}" />
				<input type="hidden" id="merchId" value="${orgCode}" />
				<input type="hidden" id="oemid" value="${oemid}" /><%-- ${merch.merchId} --%>
				<div class="upload_container">
				<% if("WAIT_SP".equals(request.getAttribute("status"))){ %>
                    <div class="popup_yc  upload_borderjj">
                        <span>*提示：<a style="color:#f94b4a;">待审核</a></span>
					</div>
					<% }else if("SP_REJECT".equals(request.getAttribute("status"))){ %>
					<div class="popup_yc upload_borderjj">
                        <span>*提示：<a style="color:#f94b4a;">审核驳回:${remark }</a></span>
					</div>
					<% }else { %>    
					<div class="popup_yc upload_borderjj">
                        <span>*提示：<a style="color:#f94b4a;">审核通过:${remark }</a></span>
					</div>      
					<% } %>      
                    <div class="upload_border">
                    	<div class="upload_border_top1">
                        	<span>
                                <img width="36" src="<%=request.getContextPath()%>/img/pic/up_pictuer1fh.png" />
                                <a>上传照片</a>
                            </span>
                        </div>
                    
						<div class="container" >
							<div class="row up_yl_container1" style="padding-top:6%">
                                <div class="col-xs-6 up_yl_border">
                                	<div class="up_yl_border1"  style="border-bottom:dashed 1px #e3e3e3;">
                                    <input type="hidden" name="filePicker1" />
                                    <div id="filePicker1" class="filePicker bg1"><img class="up_sfzzm" src="<%=request.getContextPath()%>/Manage/picView?imgPath=${amountUpEntity.pic1 }" alt="" /><img class="preview" ></span></div>
                                     <p class="upload_sm">上传身份证正面</p>
                                    </div>
                                </div>
                                <div class="col-xs-6 up_yl_border">
                                	<div class="up_yl_border1"  style="border-bottom:dashed 1px #e3e3e3;">
                                        <input type="hidden" name="filePicker2" />
                                        <div id="filePicker2" class="filePicker bg2"><img class="up_sfzzm" src="<%=request.getContextPath()%>/Manage/picView?imgPath=${amountUpEntity.pic2 }" alt="" /><img class="preview" /></span></div>
                                        <p class="upload_sm">上传身份证反面</p>
									</div>
                                </div>
                            </div>
                    	</div>
                        <div class="container" >
							<div class="row up_yl_container1" style="padding-top:2%">
                                <div class="col-xs-6 up_yl_border">
                                	<div class="up_yl_border1" >
                                        <input type="hidden" name="filePicker3" />
                                        <div id="filePicker3" class="filePicker bg3"><img class="up_sfzzm" src="<%=request.getContextPath()%>/Manage/picView?imgPath=${amountUpEntity.pic3 }" alt="" /><img class="preview" ></span></div>
                                        <p class="upload_sm">上传银行卡正面</p>
                                    </div>
                                </div>
                                <div class="col-xs-6 up_yl_border">
                                	<div class="up_yl_border1">
                                        <input type="hidden" name="filePicker5" />
                                        <div id="filePicker5" class="filePicker bg5"><img class="up_sfzzm" src="<%=request.getContextPath()%>/Manage/picView?imgPath=${amountUpEntity.pic5 }" alt="" /><img class="preview" ></span></div>
                                        <p class="upload_sm">手持身份证</p>
                                    </div>
                                </div>
                            </div>
                    	</div> 
					</div>
					
				</div>
				<% if("WAIT_SP".equals(request.getAttribute("status"))){ %>
				<div style=" text-align:center; padding-top:1%; padding-bottom:8%;" >
                </div>
				<% }else{ %>
				<div style=" text-align:center; padding-top:1%; padding-bottom:8%;" >
                    <button id="upload" type="submit"  style=" text-shadow:none; background:#073348; border:none;  width:90%" class=" btn  btn-default btn-lg">
                        <a onclick="window.close();" style="font-weight:normal; text-decoration:none; color:#fff; font-family:'微软雅黑';">修改/更新</a>
                    </button>
                </div>
                 <% } %>
			</form>
		</div>
	</div>
</body>
<script type="text/javascript">


</script>
</html>
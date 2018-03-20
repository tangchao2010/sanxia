(function($)
{
	if(typeof $ !="undefined")
	{	
		$.fn.autoHeight = function(){
				function autoHeight(elem){
					elem.style.height = 'auto';
					elem.scrollTop = 0; //防抖动
					elem.style.height = elem.scrollHeight + 'px';
				}
				
				this.each(function(){
					autoHeight(this);
					$(this).on('keyup', function(){
						autoHeight(this);
					});
				});
	
		}
	}
})(jQuery);
var openid = "";
// 显示错误信息
var ErrorTip = {
	show : function(result) {
		$("#tip").removeClass("alert-success");
		$("#tip").removeClass("alert-danger");
		if (result['code']==0) {
			$("#tip").addClass("alert-success");
			window.location.href ="/success";
		} else {
			$("#tip").addClass("alert-danger");
		}
		
		$("#tip").show();
		$("#tip .message").html(result['message']);
		
		
	}
}

var Jump = function(url, json,hash) {
	var params="";
	if (url.lastIndexOf("?") == -1) {
		params += "?openid=" + openid;
	} else {
		params += "&openid=" + openid;
	}
	if (typeof (json) == "object") {
		for ( var key in json) {
			params += "&" + key + "=" + json[key];
		}
	}
	url=url+params;
	if(typeof hash!="undefined")
	{
		url=url+"#"+hash;
	}
	window.location.href = url;
}

Date.prototype.Format = function(formatStr)   
{   
	var str = formatStr;   
	var Week = ['日','一','二','三','四','五','六'];  
  
	str=str.replace(/yyyy|YYYY/,this.getFullYear());   
	str=str.replace(/yy|YY/,(this.getYear() % 100)>9?(this.getYear() % 100).toString():'0' + (this.getYear() % 100));   
  
	str=str.replace(/MM/,this.getMonth()>=9?(this.getMonth()+1).toString():'0' + (this.getMonth()+1));   
	str=str.replace(/M/g,(this.getMonth()+1));   
  
	str=str.replace(/w|W/g,Week[this.getDay()]);   
  
	str=str.replace(/dd|DD/,this.getDate()>9?this.getDate().toString():'0' + this.getDate());   
	str=str.replace(/d|D/g,this.getDate());   
  
	str=str.replace(/hh|HH/,this.getHours()>9?this.getHours().toString():'0' + this.getHours());   
	str=str.replace(/h|H/g,this.getHours());   
	str=str.replace(/mm/,this.getMinutes()>9?this.getMinutes().toString():'0' + this.getMinutes());   
	str=str.replace(/m/g,this.getMinutes());   
  
	str=str.replace(/ss|SS/,this.getSeconds()>9?this.getSeconds().toString():'0' + this.getSeconds());   
	str=str.replace(/s|S/g,this.getSeconds());   
  
	return str;   
} 
var formatContent=function(str,length)
{
	//length=length>str.length?str.length:length;
	if(length>str.length)
	{
		return str.substring(0,str.length);
	}else
	{
		return str.substring(0,length)+"...";
	}
	
}
var tipView=function(options)
{
	var defualtOptions={top:50},
		className=options.mode==2?"refreshTip errorTip":"refreshTip";
		
	for(var key in options)
	{
		defualtOptions[key]=options[key];
	}
	layer.open({
				shade:false,
				className:className,
				top:defualtOptions.top,
				time:2,
				style: 'width:100%;border:none;max-width: 100%; ',
				content:options.content,
				fixed:false
			});
}
var removeView=function()
{
	layer.closeAll();
}
var loadView=function(url)
{
	 var _load=function(url,target){
		 var selector, type, response, self = this,
				off = url.indexOf(" ");
	
			if (off >= 0) {
				selector = url.slice(off, url.length);
				url = url.slice(0, off);
			}
			
		 jQuery.ajax({
			url: url,
			type:"GET",
			async:true,
			 dataType: "html",
			complete: function (jqXHR, status) {
			   
			}
		}).done(function (responseText) {
	
			// Save response for use in complete callback
			response = arguments;
	
			// See if a selector was specified
			jQuery(target).html(selector ?
	
			// Create a dummy div to hold the results
			jQuery("<div>")
			
			.append(responseText)
			// Locate the specified elements
			.find(selector) :
	
			// If not, just inject the full result
			responseText);
	
		});
	 }
	 var html="<div class='page-show'><img src='/css/images/loading-0.gif'><span>正在加载页面</span></div>";
		
	 layer.open({
			type: 1,
			content: html,
			shade:false,
			style: 'width:100%; height:'+ document.documentElement.clientHeight +'px; background-color:#F2F2F2; border:none;',
			success:function(elem)
			{
				_load(url,$(elem).find(".page-show"));
			}
	 });
}
var showCommentPanel=function(options)
{
	var html='<div class="page-show">'
				+'<div class="container-fluid page">'
				+'<div class="panel panel-primary">'
				+'<div class="panel-heading">'
				+'<div id="myDropdown" class="btn-group">'
				+'<span class="dropdown-toggle js-activated panel-title"  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">'
				+'<span class="text">'+options['title']+'</span>'
				+'</span>'
				+'</div>'
				+'<a href="javascript:void(0);" id="cancel" aria-label="Back"'
				+'	class="button-left button button-small button-borderless button-plain left">取消</a>'
				+'</div>'
				+'	<div id="wrapper" class="panel-body">'
				+'		<div class="container-fluid content">'
				+'			<div class="inputcontent">'
				+'				<textarea id="inputcontent" autoHeight="true" placeholder="记录开心的事...." class="form-control"></textarea>'
				+'			</div>'
				+'			<ul class="images-e"></ul>'
				+'		</div>'
				+'	</div>'
				+'	<div class="panel-footer">'
				+'  <a style="margin:6px 0 6px 0; width:120px;" id="send" href="javascript:void(0);" class="button button-highlight button-rounded  button-small">发送</a>'
				+'	</div>'
				+'</div>'
				+'</div>'
				+'</div>';
		 layer.open({
			type: 1,
			content: html,
			shade:false,
			style: 'width:100%; height:'+ document.documentElement.clientHeight +'px; background-color:#F2F2F2; border:none;',
			success:function(elem)
			{
				var resetHeight= function() 
				{
					var totalHeight = $("body").height();
					var g1 = $(".page-show>.page .panel-heading").outerHeight();
					var g2 = $(".page-show>.page .panel-footer").outerHeight();
					var g3 = $(".page-show>.page .panel-body").outerHeight() - $(".page .panel-body").height();
					$(".page-show>.page .panel-body").height(totalHeight - (g1 +g2+ g3));
				};
				resetHeight();
				$('.page-show>.page textarea[autoHeight]').focus();
	  			$('.page-show>.page textarea[autoHeight]').autoHeight();
				
				$('.page-show>.page #cancel').click(function()
				{	
					 layer.closeAll();
					 if(typeof(options['cancel'])=="function")
					 {
						options['cancel'].apply(this,[true]);
					 } 
				 });
				
				$('.page-show>.page #send').click(function()
				{
					var text=$('.page-show>.page #inputcontent').val().trim();
					if(text=="")
					{
						 layer.open({shade:false,time:2,content:'必须填写内容'});
					}else if(text.length>300)
					{
						layer.open({shade:false,time:2,content:'内容不允许超过300个字'});
					}else if(typeof(options['save'])=="function")
					{
						options['save'].apply(this,[text]);
					}
				});
			}
	 	});
}
String.prototype.replaceAll=function(str1,str2)
{
	return this.replace (eval('/\\'+str1+'/g'), str2);
}

function bindcodeFormate(data)
{
	return {id:data.id,image:'/pp/'+data.school.id +'/'+data.personId};
}
//点击文本框复制其内容到剪贴板上方法
function copyToClipboard(txt) {
    if (window.clipboardData) {
        window.clipboardData.clearData();
        window.clipboardData.setData("Text", txt);
        alert("已经成功复制到剪帖板上！");
    } else if (navigator.userAgent.indexOf("Opera") != -1) {
        window.location = txt;
    } else if (window.netscape) {
        try {
            netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
        } catch (e) {
            alert("被浏览器拒绝！\n请在浏览器地址栏输入'about:config'并回车\n然后将'signed.applets.codebase_principal_support'设置为'true'");
        }
        var clip = Components.classes['@mozilla.org/widget/clipboard;1'].createInstance(Components.interfaces.nsIClipboard);
        if (!clip) return;
        var trans = Components.classes['@mozilla.org/widget/transferable;1'].createInstance(Components.interfaces.nsITransferable);
        if (!trans) return;
        trans.addDataFlavor('text/unicode');
        var str = new Object();
        var len = new Object();
        var str = Components.classes["@mozilla.org/supports-string;1"].createInstance(Components.interfaces.nsISupportsString);
        var copytext = txt;
        str.data = copytext;
        trans.setTransferData("text/unicode", str, copytext.length * 2);
        var clipid = Components.interfaces.nsIClipboard;
        if (!clip) return false;
        clip.setData(trans, null, clipid.kGlobalClipboard);
        alert("已经成功复制到剪帖板上！");
    }
}

function isEmpty(object)
{
	if(object&&object!="")
	{
		return false;
	}
	return true;
}
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>注册失败</title>
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1, maximum-scale=1">
    <link rel="shortcut icon" href="/favicon.ico">
    <meta name="apple-mobile-web-app-capable" content="yes">  <!--删除默认的苹果工具栏和菜单栏-->
    <meta name="apple-mobile-web-app-status-bar-style" content="black"> <!-- 控制状态栏显示样式-->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/sm/sm.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/sm/mystyle.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/sm/font-awesome.min.css">
	</head>

	<body>
    
    <div class="page-group">
		<div class="page page-current">
        	<header class="bar bar-nav">
                <a class="icon icon-left pull-left back"></a>
                <h1 class='title'>注册失败</h1>
            </header>
            <div class="content">
            	<input type="hidden"  id="oemid" name="oemid"  value="${oemid }"/>
				<input type="hidden"  id="orgCode" name="orgCode"  value="${orgCode }"/>
				<input type="hidden"  id="openid" name="openid"  value="${openid }"/>
            
				<div class="merch_success_container" >
					<span class="merch_success_top"><img src="<%=request.getContextPath()%>/img/wcb/wcb_fail.png"></span>
					<em>注册失败</em>
					<span style="height:.3rem;"></span>
				</div>
                
				<div class="content-padded" style="margin-top:1rem;">
					<p style=" font-size:.75rem; color:#666; "><a>${errdesc}</a>可能是您提交的结算信息有误，若提交后仍失败，请您更换结算银行卡，建议为如下银行的储蓄卡：中国银行、农业银行、工商银行、建设银行、邮政储蓄银行。</p>
				</div>
                    
            	<div class="content-block">
                	<div class="row">
                    	<% if (request.getAttribute("errdesc")!=null && request.getAttribute("errdesc").equals("此二维码已经被其他人注册，请确认并关闭此界面")) { %>       
                        <div class="col-100" ><button  onclick="method()" type="button" class="button button-block button-fill button-big "> 关闭</button></div>
                 		<% } else {%>   
                        <div class="col-100" ><button  onclick="method()" type="button" class="button button-block button-fill button-big "> 去修改</button></div>  
                 		<% }%> 
                	</div>
				</div>
            </div>
        </div>
    </div>
	
        <div class="container-fluid grcontainer_main">
			<div class="zccg_container">
            
                
         <% if (request.getAttribute("errdesc")!=null && request.getAttribute("errdesc").equals("此二维码已经被其他人注册，请确认并关闭此界面")) { %>       
                <div style=" text-align:center; padding-top:4%; padding-bottom:12%" >
              		<a href="javascript:void(0);" onclick="closewin()"><input id="subhold" type="button" value="关闭" style="text-shadow:none; font-weight:normal;text-decoration:none; color:#fff; font-family:'微软雅黑'; background:#073348; border:none; width:90%" class=" btn  btn-default btn-lg"></a>
                </div>
         <% } else {%>   
          		<div style=" text-align:center; padding-top:4%; padding-bottom:12%" >
              		<a href="javascript:void(0);" onclick="closewin()"><input id="subhold" type="button" value="关闭" style="text-shadow:none; font-weight:normal;text-decoration:none; color:#fff; font-family:'微软雅黑'; background:#073348; border:none; width:90%" class=" btn  btn-default btn-lg"></a>
                </div>   
              
         <% }%>  
           </div>  
           
        </div>

		<script type='text/javascript' src="<%=request.getContextPath()%>/js/sm/jquery-3.1.min.js" charset='utf-8'></script>
		<script type='text/javascript' src="<%=request.getContextPath()%>/js/sm/mypublic.js" ></script> 
		<script type='text/javascript' src="<%=request.getContextPath()%>/js/sm/sm.min.js" ></script> 

		<script>
        	function method(){
        		var oemid=document.getElementById("oemid").value;
        		var orgCode=document.getElementById("orgCode").value;
        		var openid=document.getElementById("openid").value;
        		window.location.href="<%=request.getContextPath()%>/Manage/businesdxgUI?orgCode="+orgCode+"&oemid="+oemid+"&openid="+openid;
        	}
        	
        	function closewin(){
		        try{
		           WeixinJSBridge.call("closeWindow");
		          }catch(e){};
		   }
		</script>
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="renderer" content="webkit" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<title></title>
		<link href="<%=request.getContextPath()%>/css/bootstrap/bootstrap.min.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/bootstrap/bootstrap-theme.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/bootstrap/bootstrapValidator.min.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/bootstrap/buttons.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" />

		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.11.3.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/wechat/layer.m.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap/bootstrap.min.js"></script>
		<script src="<%=request.getContextPath()%>/js/wechat/hideshare_and_toolbar.js"></script>
		<style>
				.navbar-default{ background:#073348;}
			.jdxx{ text-align:center; line-height:50px;}
			.jdxx a{ font-size:18px; font-family:'微软雅黑'; color:#fff;}
			.grcontainer_main{ display:block; margin-top:20%; overflow:hidden;}
			.container-fluid{ padding:0;}
			.navbar{ border:none;}
			
			.zc_container{
				overflow:hidden;
				margin: 0;
				padding: 0 !important;
				background: #fff;
				margin-top: 10px;
				
			}
			.form-control{ border:none; box-shadow:none; }
			.has-error .form-control{ box-shadow: none;}
			.panel{ box-shadow:none;}
			
			body{margin:0;}
			*{color:;}
			a{text-decoration:none}
			img{ border:none;}
			input{ border:none; margin:0; padding:0;}
			dd,dl{ margin:0;}
			ol,li,ul,P,li{ margin:0; padding:0;}
			li{ list-style:none; display:block; }
			.img { max-width: 100%;}
			
			.navbar-default { background:#073348}
			.border-color{ none}
			.navbar-default .navbar-brand1{ color:white;}
			.navbar-brand1 {float: right; min-height: 50px; line-height:50px; padding-right:15px; font-size: 18px; font-family:'微软雅黑';}
			.navbar-header-img{ position:absolute; top:30%;left:0;  padding-left:15px;}
			.navbar-header-img1{ position:absolute; top:0;right:0; line-height:50px; padding-right:15px;}
			.navbar-header1{ position:absolute; top:0; right:0; line-height:50px;}
			.jdxx{ text-align:center; line-height:50px;}
			.jdxx a{ font-size:18px; font-family:'微软雅黑'; color:#fff;}
			.container-fluid{ padding:0;}
			.navbar{ border:none;}
			
			.zccg_container{margin: 0; padding: 0 !important; background:#fff; margin-top:10px;}
			.zccg_img p{ padding-left:18px; padding-right:18px; color:#333; padding-top:20px; padding-bottom:40px; font-size:14px; line-height:20px; font-family:'微软雅黑'; }
			.zccg_container a{ color:#073348; font-family:'微软雅黑';}
			.zccg_img img{ display:block; vertical-align:central; text-align:center; margin:auto; padding-top:10%;}
			.zccg_img dl{ text-align:center; padding-top:10px; padding-bottom:10px;border-bottom:1px solid #ededed;}
			.zccg_img dt{ line-height:60px; font-size:18px; font-weight:normal; color:#1e2426; font-family:'微软雅黑';}

		</style>
		<script type="text/javascript">
		  setTimeout(reford,"3000");//二秒后执行
		  function reford(){
		        try{
		            WeixinJSBridge.call("closeWindow");
		        }catch(e){};
		   }
		</script>
	</head>

	<body background="#f5f5f5" style="margin-top:51px;">
    
        
        <div class="container-fluid grcontainer_main">
            <div class="zccg_container">
                <div class="zccg_img">
                    <img class="img-responsive" width="100%"  src="<%=request.getContextPath()%>/img/imgs/pagemn.png">
                     
                </div>
                
           </div>  
        </div>


	</body>

</html>
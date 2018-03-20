<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="renderer" content="webkit" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<title>收款码</title>
		<link href="<%=request.getContextPath()%>/css/bootstrap/bootstrap.min.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/bootstrap/bootstrap-theme.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/bootstrap/bootstrapValidator.min.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/bootstrap/buttons.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/webuploader.css" rel="stylesheet" />
        <link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" />

		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.11.3.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/wechat/layer.m.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap/bootstrap.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap/bootstrapValidator.min.js"></script>
		<style>
		
		.jdxx a{  font-family:'微软雅黑';}
		.yqm_container{ margin-top: .86rem; margin-left: .4rem;}
		.yqm_container dt,.yqm_container dd{ color:#fff; font-size: .3rem; line-height: .46rem;;}
		.yqm_code{
			display: -webkit-box;
		    display: -webkit-flex;
		    display: -ms-flexbox;
		    display: flex;
		    -ms-flex-align: center;
		    -webkit-box-align: center;
		    box-align: center;
		    -webkit-align-items: center;
		    align-items: center;
		    text-decoration: none;
		    padding-top:1.2rem;
		    justify-content: center; 
		    -webkit-justify-content: center; 
		    -webkit-justify-content: space-around; /* Safari 6.1+ */
		    justify-content: space-around;
		   }
		.yqm_code img{ width: 4rem; height: 4rem; border-radius:.2rem; ;}
		.yqm_kf { font-size: .26rem; color: #fff; margin-top: .2rem; text-align: center; display: block;;}
		.yqm_text{
			margin-top:.45rem;
		}
		.yqm_text img{
			width:3.72rem;
			height: 1.56rem;
			display:block;
			margin: auto;
			text-align: center;;
		}
        </style>
        <script>
			(function () {
				document.addEventListener('DOMContentLoaded', function () {
					var html = document.documentElement;
					var windowWidth = html.clientWidth;
					html.style.fontSize = windowWidth / 7.5 + 'px';
				}, false);
			})();
		</script>
	</head>
	<body style="background:url(<%=request.getContextPath()%>/img/imgs/yqm.jpg)  top center no-repeat; background-size:cover;;">
 
        <div class="container-fluid" >
            <div class="yqm_container">                
            	<dl >
                    <dt>你的朋友<a style=" color:#fff">&nbsp;${mrchname}</a></dt>
                    <dd>邀请您使用${oemname}支付收款</dd>	
                </dl>
               
            </div> 
            <div class="yqm_code">
             
                <img  src="<%=request.getContextPath()%>/QRCode/qrview?qrcode=${qrcode}">
        	</div>
        	<span class="yqm_kf">客服电话 400-114-3788</span>
        	<div class="yqm_text">
        		<img src="<%=request.getContextPath()%>/img/imgs/yqm_text.png"  />
        	</div>
        </div>       
	</body>

</html>
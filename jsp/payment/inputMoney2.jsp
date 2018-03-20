<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="renderer" content="webkit" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<title>支付</title>
		<link href="<%=request.getContextPath()%>/css/bootstrap/bootstrap.min.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/bootstrap/bootstrap-theme.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/bootstrap/bootstrapValidator.min.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/bootstrap/buttons.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/webuploader.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/wxzf.css" rel="stylesheet" />

		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.11.3.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/wechat/layer.m.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap/bootstrap.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap/bootstrapValidator.min.js"></script>


    <script src="bootstrap/js/bootstrap.min.js"></script>
	<script src="js/jquery.js"></script>
	<script type="text/javascript">
    $(function(){
            //数字显示隐藏
       	/*$(".xiaq_tb").click(function(){
            $(".numb_box").slideUp(500);
        });
        $(".mm_box").click(function(){
            $(".numb_box").slideDown(500);
        });*/
          /*  var i = 0;
            
            $(".nub_ggg li .del").click(function(){
                
                if(i>0){
                    i--
                    $(".nub_ggg li").eq(i).removeClass(" ");
                    i==0;
                    }
		});*/
    });
	
    
    </script>
    <script type="text/javascript">

    $(function(){
        $(".click-num").each(function(){
            $(this).on("touchend",function(){
                var newStr =$("#inputMoney").text();
                if($(this).text()==""){
                    newStr=newStr.substring(0,newStr.length-1);
                }else{
                    newStr+=$(this).text();
                }
                $("#inputMoney").text(newStr);
                //$("#money").text(newStr);
			})	
		})
	});

    </script>
    </script>

    <style>
	.jdxx a{  font-family:'微软雅黑';}
	.navbar-header-img{ position:absolute; top:30%;left:0;  padding-left:15px;}
	.btn-group-lg>.btn, .btn-lg{ font-size:14px;}
    .nub_ggg li span.del img{ margin-top:10%;}
	.srzfmm_box img{ display:block; vertical-align:central; text-align:center; margin:auto; padding-bottom:8%;}
	.click-num,.click-num-bac{ background:#f2f2f2;}
	.zfewm_logo img{ display:block; vertical-align:central; text-align:center; margin:auto; padding-top:4%  }
	.btn{ padding:3% 8%;}
	.xiaq_tb:hover{ background:#e0e0e0;}
	</style> 
</head>
<body style="background:#fff;">
<%-- <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
   <div class="navbar-header-img">
      <a class="navbar-brand-img" href="#"><img src="<%=request.getContextPath()%>/img/imgs/dc-return1.png"></a>
   </div>
   <div class="jdxx">
   	<a>输入金额</a>
   </div>      
</nav> --%>

<div class="container-fluid grcontainer_main">
	<div class="qrzf_container">
   </div>  
</div>
 
<form method="post" action="<%=request.getContextPath()%>/QRCode/QRCodePay" name="zf" onsubmit="return submitvriefy()" >
<input type="hidden" name="oemid" value="${oemid}"/>
<input type="hidden" name="openid" value="${openid}"/>
<input type="hidden" name="mrchorgcode" value="${mrchorgcode}"/>
<input type="hidden" name="isweixinbrowse" value="${isweixinbrowse}"/>
<input type="hidden" name="qrcode" value="${qrcode}"/>
<input type="hidden" name="sign" value="${sign}"/>

<div class="ftc_wzsf" style="overflow:scroll;">
	<div class="srzfmm_box">
    	<!-- <div class="sjuser">商家名称：<a style="color:#262626; text-decoration:none;">中技同创</a></div> -->
	<img class="img-responsive"  width="50%" src="<%=request.getContextPath()%>/OemInfo/OemLogo?oemid=${oemid}"> 
        <div class="row" >
            <div class="form-group inputtext col-xs-offset-1 col-md-11 col-sm-11 col-xs-11"  style="overflow: hidden; ">
                <form method="post" action="" name="zf">
                    <div class="item form-group">
                       <!-- <div style="padding-left: 15%;padding-top: 20px;">付款金额</div>-->
                            <div class="col-md-8 col-sm-8 col-xs-12 col-md-offset-2 ">
                                <div class="col-xs-12 mm_box inputDiv"><strong style=" color:#0b233c; font-family:'微软雅黑'; font-size:20px;">￥</strong><strong id="inputMoney" style="color:#000"  /></strong>
</div>
                                
                            </div>
                    </div>  			
                </form> 
            </div>
        </div>
    	<div style=" border-bottom:solid 1px #e3e3e3; height:6px;"></div>
		<p style=" font-size:12px; color:#333; font-family:'微软雅黑';  padding-top:10px;">您正在向商家:<a style="color:#0d435c; font-size:14px;">&nbsp;&nbsp;${mrchname}&nbsp;</a> 付款</p>
        <div style="overflow:hidden; margin-top:20px; ">
            <!--  <input id="btnwx" class="btn btn-group btn-success" type="button" value="微信支付">-->
            <input id="btnwx"  name="btnwx" style="color:#fff; background:#4da54d" class="btn btn-group  inf-conten-but"  type="submit" value="确认支付">
        </div>
        <div class="zfewm_logo" style=" margin-top:12%;">
         <p style="color:#073348; font-size:16px; font-family:'微软雅黑';"><a style="color:#388a38; text-decoration:none;">扫一扫</a>，关注我们!</p>
        	<img class="img-responsive" width="46%"  src="http://open.weixin.qq.com/qr/code/?username=${weixingzh}">
        </div>
        
        <div style=" text-align:center; padding-top:1%; padding-bottom:1%" >
			<a href="<%=request.getContextPath()%>/QRCode/shouyinyuanloginUI?orgCode=${mrchorgcode}&qrcode=${qrcode}"><button type="button" class="btn btn-default btn-lg" style="padding:3% 8%;  font-family:'微软雅黑'; background:#fff; color:#000; text-shadow:none; ">收银员登陆</button></a>
		</div>
		
	
<!-- <input type="hidden" id = "money" name="money"  value="xxxx" />
-->  </div>
  </form> 
	<div class="numb_box">
   <div class="xiaq_tb"><img width="93px" src="<%=request.getContextPath()%>/img/pic/jftc_141.png" ></div> 
        <ul class="nub_ggg">
          <li><a class="click-num" >1</a></li>
          <li><a class="zj_x click-num">2</a></li>
          <li><a class="click-num">3</a></li>
          <li><a class="click-num">4</a></li>
          <li><a class="zj_x click-num">5</a></li>
          <li><a class="click-num">6</a></li>
          <li><a class="click-num">7</a></li>
          <li><a class="zj_x click-num">8</a></li>
          <li><a class="click-num">9</a></li>
          <li><a class="click-num">.</a></li>
          <li><a class="zj_x click-num">0</a></li>
          <li><a class="del click-num click-num-bac"><img  src="<%=request.getContextPath()%>/img/pic/de1.png"></a></li>
        </ul>
	</div>
</div>
</body>
</html>




</body>
</html>
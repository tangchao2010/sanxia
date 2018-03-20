<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>绑定银行卡</title>
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-capable" content="yes">  <!--删除默认的苹果工具栏和菜单栏-->
    <meta name="apple-mobile-web-app-status-bar-style" content="black"> <!-- 控制状态栏显示样式-->
    <meta name="format-detection" content="telephone=no" /> <!--禁止拨打电话-->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/sm/sm.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/sm/mystyle.css">
</head>

	<body>
    <div class="page-group">
        <div class="page page-current" >
            <header class="bar bar-nav">
                <a class="icon icon-left pull-left back"></a>
                <h1 class="title">提交快捷支付</h1>
            </header>
            
			<div class="content native-scroll">
        		<form action="<%=request.getContextPath()%>/quickPay/shangfupayResult" method="post">
                    <div class="content-block-title">请输入消费短信验证码</div>
                    <div class="list-block">
                        <ul>  
                            <li class="item-content ">
                                    <div class="item-media"></div>
                                    <div class="item-inner">
                                        <div class="item-title label">订单号</div>
                                        <div class="item-input myregister">
                                            <input type="text" name="out_trade_no" value="20178928322132" readonly >
                                       </div>
                                    </div>
                            </li>
                            <li class="item-content">
                                    <div class="item-media"></div>
                                    <div class="item-inner">
                                        <div class="item-title label" >银行名称</div>
                                       <div class="item-input myregister">
                                            <input  type="tel"  name="bankName" value="中国银行" readonly >
                                       </div>
                                    </div>
                            </li>  
                            <li class="item-content">
                                    <div class="item-media"></div>
                                    <div class="item-inner">
                                        <div class="item-title" style="width:66%;">银行卡号</div>
                                       <div class="item-input myregister">
                                            <input type="tel" name="bankAccNo" value="621788477444400290" readonly >
                                       </div>
                                    </div>
                            </li>
                            <li class="item-content ">
                                    <div class="item-media"></div>
                                    <div class="item-inner">
                                        <div class="item-title label">银行预留手机号</div>
                                        <div class="item-input myregister">
                                            <input type="text" name="bankPhone" value="13683215467" readonly >
                                       </div>
                                    </div>
                            </li>
                            <li class="item-content">
                                    <div class="item-media"></div>
                                    <div class="item-inner">
                                        <div class="item-title" style="width:66%;">订单金额</div>
                                       <div class="item-input myregister">
                                            <input type="tel" name="money" value="100" readonly >
                                       </div>
                                    </div>
                            </li>
                            <li class="item-content ">
                                    <div class="item-media"></div>
                                    <div class="item-inner">
                                        <div class="item-title label">消费短信</div>
                                        <div class="item-input myregister">
                                            <input type="text" id="messagecode" name="password" value=""  placeholder="请输入消费短信验证码" maxlength="6" onkeyup="this.value=this.value.replace(/[^\d]/g,'') " onafterpaste="this.value=this.value.replace(/[^\d]/g,'') " >
                                       </div>
                                    </div>
                            </li>
                         </ul>
                    </div>
                  
                	<div class="content-block">
                        <div class="row">
                            <div class="col-100"><button id="tcashbc" onclick="merchSubmit()" type="button" class="button button-block button-fill button-big ">提交订单</button></div>
                        </div>
					</div>
                    
            	</form>
			</div>
            
		</div>  
    </div>

	<script type='text/javascript' src="<%=request.getContextPath()%>/js/sm/jquery-3.1.min.js" charset='utf-8'></script>
	<script type='text/javascript' src="<%=request.getContextPath()%>/js/sm/mypublic.js" ></script> 
	<script type='text/javascript' src="<%=request.getContextPath()%>/js/sm/sm.min.js" ></script> 

	<script type="text/javascript">	
		//提交注册
		function merchSubmit(){
			if(checkBindbank()){
				$('#tcashbc').submit(); 
			}
			else{
				return false;	
			}
		}
	
		//检查信息
		var checkBindbank = function() {
			var messagecode = $("#messagecode").val();
			
			if (messagecode == null || messagecode == "") {
				$.alert("请输入消费短信验证码");
				return false;
			}
			else{
				return true;
			}
		}
	</script>
    
	</body>
</html>
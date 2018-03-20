<!DOCTYPE html>
<html>
<head>
	<title>获取验证码</title>
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
                <h1 class='title'>获取验证码</h1>
            </header>
            <div class="content">
            
            	<form  method="post" id="formid" action="http://www.baidu.com" >
                    <div class="content-block-title">请输入验证码</div>
                    <div class="list-block">
                        <ul>
                            <li>
                                <div class="item-content">
                                    <div class="item-media"></div>
                                    <div class="item-inner">
                                        <div class="item-title label ">验证码</div>
                                        <div class="item-input">
                                            <input id="validCode" name="validCode" type="tel" placeholder="请输入验证码">
                                        </div>
                                        <div class="item-after">
                                        	<input class="obtain_code alert-text" id="send_code" type="button" value="获取验证码">
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="content-block">
                        <div class="row">
                            <div class="col-100"><button id="" onclick="oncelogin()" type="button" class="button button-block button-fill button-big ">提交修改信息</button></div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
        
	<!--<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.11.3.min.js"></script>-->
	<script type='text/javascript' src='//g.alicdn.com/sj/lib/zepto/zepto.min.js' charset='utf-8'></script>
	<script type='text/javascript' src='//g.alicdn.com/msui/sm/0.6.2/js/sm.min.js' ></script> 
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/sm/myjs.js"></script>
       
	<script type="text/javascript">
			var wait = 60;
			function towait() {
				if (wait == 0) {
					$("#send_code").removeAttr("disabled");
					$("#send_code").attr("value", "发送验证码");
					wait = 60;
				} else {
					$("#send_code").attr("disabled", true);
					$("#send_code").attr("value", "重新发送(" + wait + "s)");
					wait--;
					setTimeout(function() {        
						towait();
					}, 1000);
				}
			}   
			
			//如果没有它input要添加 onClick="towait()"
			$(function(){
				$("#send_code").on('click',function () {
					var url = '';
					var phoneNo=$("#phoneNo").val();
					if(phoneNo==''){
						$.alert('手机号不能为空');
						return;
					}
					if(!isMobile(phoneNo)){
						$.alert("手机号码格式不正确！");
						return;
					}
					towait();
				});
			});
			
			//提交
			function oncelogin(){
				if(checkSmsLoginPhone() && checkCode() && checkPassword()){
					//
					$("#formid").submit();
				}
				else{
					return false;	
				}
			}
			
			//提交时检查手机号
			function checkSmsLoginPhone(){
				var phoneNo = $('#phoneNo').val();   
				if (phoneNo == null || phoneNo == "" ) { // !(/^1(3|4|5|7|8)\d{9}$/.test(uname))  手机号正则
					$.alert("请输入手机号！");
					return false;
				}
				if(!isMobile(phoneNo)){
					$.alert("手机号码格式不正确！");
					return false;
				}else{
					return true;
				}
			}
			
			//手机号格式判断 
			function isMobile(object){
				var pattern = /^1(3|4|5|7|8)\d{9}$/; //原 /^[1]\d{10}$/;  
				return pattern.test(object);
			};	
			
			//检查验证码
			var checkCode = function() {
				var validCode = $("#validCode").val();
				if (validCode == null || validCode == "") {
					$.alert("请输入手机验证码");
					return false;
				}else{
					return true;
				}
			}
		
	</script>
 
	</body>

</html>
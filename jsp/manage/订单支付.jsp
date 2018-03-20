<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<title>订单支付</title>
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1, maximum-scale=1">
    <link rel="shortcut icon" href="/favicon.ico">
    <meta name="apple-mobile-web-app-capable" content="yes">  <!--删除默认的苹果工具栏和菜单栏-->
    <meta name="apple-mobile-web-app-status-bar-style" content="black"> <!-- 控制状态栏显示样式-->
    <meta name="format-detection" content="telephone=no" /> <!--禁止拨打电话-->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/sm/sm.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/sm/mystyle.css">
    <style>
  
	</style>
	</head>
	<body>
	<div class="page-group">
		<div class="page page-current">
        	<header class="bar bar-nav">
                <a class="icon icon-left pull-left" onclick="javascript:history.go(-1)"></a>
                <h1 class="title">订单支付</h1>
            </header>
            <div class="content">
            	<div class="content-block codemoney">
                	<dl><dt><em>￥</em>10000</dt><dd>订单金额</dd></dl>
                </div>
            	<div class="content-block codephone" style="margin-top:1rem;">
                	<span>输入验证码完成支付，验证码已经发送到&nbsp;<em>1588885558${phone }</em></span>
                </div>
                                
				<div>
                	<div id="set_text" >
                    	<!--<span>请输入提货密码验证本次操作</span>-->
                    </div>
                    
                    <div class="bcmm_box" style="text-align: center;">
                        <form id="password" >
                        	<input type="hidden" name="oemid" value="${oemid }">
                        	<input type="hidden" name="openid" value="${openid }">
                        	<input type="hidden" name="orgCode" value="${orgCode }">
                        	<input type="hidden" name="phone" value="${phone }">
                        	<input type="hidden" name="cvvId" value="${cvvId }">
                            <input id="numid1" name="numid1" class="inputpass"  readonly="readonly"  type="password" maxlength="1" value=""><input id="numid2" name="numid2" class="inputpass myborder"  readonly="readonly"  type="password"maxlength="1"value=""><input id="numid3" name="numid3" class="inputpass"  readonly="readonly"  type="password"maxlength="1"value=""><input id="numid4" name="numid4" class="inputpass myborder"  readonly="readonly"  type="password"maxlength="1"value=""><input id="numid5" name="numid5" class="inputpass"  readonly="readonly"  type="password"maxlength="1"value=""><input id="numid6" name="numid6" class="inputpass"  readonly="readonly"  type="password"maxlength="1"value=""  >
                        </form>
                    </div>
                    
				</div>
                
                    <div id="key" class="bcnumb_box">
                        <div class="bcxiaq_tb"> <img src="<%=request.getContextPath()%>/img/wcb/jftc_14.png" height="10"> </div>
                        <ul id="keyboard" class="bcnub_ggg">
                            <li class="symbol" onclick="number('1')"><a>1</a></li>
                            <li class="symbol" onclick="number('2')"><a class="bczj_x">2</a></li>
                            <li class="symbol" onclick="number('3')"><a>3</a></li>
                            <li class="tab" onclick="number('4')"><a>4</a></li>
                            <li class="symbol" onclick="number('5')"><a class="bczj_x">5</a></li>
                            <li class="symbol" onclick="number('6')"><a>6</a></li>
                            <li class="tab" onclick="number('7')"><a>7</a></li>
                            <li class="symbol" onclick="number('8')"><a class="bczj_x">8</a></li>
                            <li class="symbol" onclick="number('9')"><a>9</a></li>
                            <li><span></span></li>
                            <li class="symbol" onclick="number('0')"><a class="bczj_x">0</a></li>
                            <li class="delete" onclick="number('-')"><span class="bcdel"> <img src="<%=request.getContextPath()%>/img/wcb/jftc_18.png"   ></span></li>
                        </ul>
                    </div>
            </div>
        </div>
    </div>	

                    
	
    <script type='text/javascript' src="<%=request.getContextPath()%>/js/sm/jquery-3.1.min.js" charset='utf-8'></script>
	<script type='text/javascript' src="<%=request.getContextPath()%>/js/sm/mypublic.js" ></script> 
	<script type='text/javascript' src="<%=request.getContextPath()%>/js/sm/sm.min.js" ></script>
    
 <%--    <script type='text/javascript' src="<%=request.getContextPath()%>/js/sm/ladingPasswordConfirm.js" ></script> 
    --%> 
	<script type="text/javascript">
		function number(s){
			
			numid1= $("input[name='numid1']").val();
			numid2 = $("input[name='numid2']").val();
			numid3= $("input[name='numid3']").val();
			numid4 = $("input[name='numid4']").val();
			numid5= $("input[name='numid5']").val();
			numid6 = $("input[name='numid6']").val();
			
			if(numid1==''){
				if(s!='-'){
				document.getElementById("numid1").value=s;
				}
			}
			else if(numid2==''){
				if(s!='-'){
					document.getElementById("numid2").value=s;
				}else{
					document.getElementById("numid1").value='';
				}
			}
			else if(numid3==''){
				if(s!='-'){
					document.getElementById("numid3").value=s;
				}else{
					document.getElementById("numid2").value='';
				}
			}
			else if(numid4==''){
				if(s!='-'){
					document.getElementById("numid4").value=s;
				}else{
					document.getElementById("numid3").value='';
				}
			}
			else if(numid5==''){
				if(s!='-'){
					document.getElementById("numid5").value=s;
				}else{
					document.getElementById("numid4").value='';
				}
			}
			
			else if(numid6==''){
				if(s!='-'){
					document.getElementById("numid6").value=s;
					myan();
				}else{
					document.getElementById("numid5").value='';
				}
			}else{
				if(s=='-'){
					document.getElementById("numid6").value='';
					}
			}
		}
	
		function myan(){
			$.post("<%=request.getContextPath()%>/kuaijie/jiebangend", {
				oemid: $("input[name='oemid']").val(),
				openid: $("input[name='openid']").val(),
				orgCode: $("input[name='orgCode']").val(),
				phone: $("input[name='phone']").val(),
				cvvId: $("input[name='cvvId']").val(),
				numid1: $("input[name='numid1']").val(),
				numid2  : $("input[name='numid2']").val(),
				numid3: $("input[name='numid3']").val(),
				numid4  : $("input[name='numid4']").val(),
				numid5: $("input[name='numid5']").val(),
				numid6  : $("input[name='numid6']").val()
			}, function(json) {						
				if(json.code == 0) {
					$.alert('支付成功', function () {
						window.location.href='';
					});
					
				}else{
					$.alert('验证码错误，请重新输入');
				}
				}, "json");
			}
		
		
	
        $(function() {
            //数字显示隐藏
            $(".bcxiaq_tb").click(function() {
                $(".bcnumb_box").slideUp(500);
            });
            $(".bcmm_box").click(function() {
                $(".bcnumb_box").slideDown(500);
            });
            
          /*  var i = 0;
            $(".bcnub_ggg li a").click(function() {
                i++
                if (i < 6) {
                    $(".bcmm_box li").eq(i - 1).addClass("bcmmdd");

                } else {
                    $(".bcmm_box li").eq(i - 1).addClass("bcmmdd");
					location.href = "http://www.baidu.com";
                    setTimeout(function() {
                        location.href = "http://www.baidu.com";
                    }, 500);
                }
            });

            $(".bcnub_ggg li .bcdel").click(function() {
                if (i > 0) {
                    i--
                    $(".bcmm_box li").eq(i).removeClass("bcmmdd");
                    i == 0;
                }
            });*/
        });
    </script>
    
	</body>
</html>
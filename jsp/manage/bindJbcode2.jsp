<!DOCTYPE html>
<html>
<head>
	<title>解绑卡片</title>
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
                <h1 class="title">解绑卡片</h1>
            </header>
            <div class="content">
            	<div class="content-block codephone">
                	<span>验证码已经发送到&nbsp;<em>18811001122</em></span>
                </div>
                                
				<div>
                	<div id="set_text" >
                    	<!--<span>请输入提货密码验证本次操作</span>-->
                    </div>
                    
                    <div class="bcmm_box" style="text-align: center;">
                        <form id="password" >
                            <input readonly class="inputpass" type="password" maxlength="1" value=""><input readonly class="inputpass" type="password"maxlength="1"value=""><input readonly class="inputpass" type="password"maxlength="1"value=""><input readonly class="inputpass" type="password"maxlength="1"value=""><input readonly class="inputpass" type="password"maxlength="1"value=""><input readonly class="inputpass"  type="password"maxlength="1"value="">
                        </form>
                    </div>
                    
				</div>
                
                    <div id="key" class="bcnumb_box">
                        <div class="bcxiaq_tb"> <img src="<%=request.getContextPath()%>/img/wcb/jftc_14.png" height="10"> </div>
                        <ul id="keyboard" class="bcnub_ggg">
                            <li class="symbol"><a>1</a></li>
                            <li class="symbol"><a class="bczj_x">2</a></li>
                            <li class="symbol"><a>3</a></li>
                            <li class="tab"><a>4</a></li>
                            <li class="symbol"><a class="bczj_x">5</a></li>
                            <li class="symbol"><a>6</a></li>
                            <li class="tab"><a>7</a></li>
                            <li class="symbol"><a class="bczj_x">8</a></li>
                            <li class="symbol"><a>9</a></li>
                            <li><span></span></li>
                            <li class="symbol"><a class="bczj_x">0</a></li>
                            <li class="delete"><span class="bcdel"> <img src="<%=request.getContextPath()%>/img/wcb/jftc_18.png"   ></span></li>
                        </ul>
                    </div>
            </div>
        </div>
    </div>	

                    
	
    <script type='text/javascript' src="<%=request.getContextPath()%>/js/sm/jquery-3.1.min.js" charset='utf-8'></script>
	<script type='text/javascript' src="<%=request.getContextPath()%>/js/sm/mypublic.js" ></script> 
	<script type='text/javascript' src="<%=request.getContextPath()%>/js/sm/sm.min.js" ></script>
    
    <script type='text/javascript' src="<%=request.getContextPath()%>/js/sm/ladingPasswordConfirm.js" ></script> 
    
	<script type="text/javascript">
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
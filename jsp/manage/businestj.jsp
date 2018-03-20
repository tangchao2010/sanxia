<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>验证修改</title>
    	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1, maximum-scale=1">
		<meta name="apple-mobile-web-app-capable" content="yes">  <!--删除默认的苹果工具栏和菜单栏-->
   		<meta name="apple-mobile-web-app-status-bar-style" content="black"> <!-- 控制状态栏显示样式-->
        <!--禁止拨打电话-->
    	<meta name="format-detection" content="telephone=no" />
      	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/sm/sm.min.css">
		<link rel="stylesheet" href="<%=request.getContextPath()%>/css/sm/mystyle.css">	
		<style>
       	.businsetj_hq{ height:42px; line-height:42px; width:100%; text-align:center; border-radius:4px; font-size:18px; color:#000; font-family:'微软雅黑'; background:#f2f2f2; width:100%; border:solid 1px #d4d4d4; }
       </style>
  	</head>
<body>
	<div class="page-group">
		<div class="page page-current">
        	<header class="bar bar-nav">
               <!-- <button class="button button-link button-nav onClick="reford()" pull-right" >关闭&nbsp;&nbsp;</button>-->
                <h1 class='title'>验证修改</h1>
            </header>
            <div class="content">
           		<form id="myForm" onsubmit="" method="post" action="<%=request.getContextPath()%>/Manage/businestj">
                    <div class="content-block-title">请输入验证码</div>
                    <div class="list-block">
                        <ul>
                            <li>
                                <div class="item-content">
                                    <div class="item-media"></div>
                                    <div class="item-inner">
                                        <div class="item-title label ">验证码</div>
                                        <div class="item-input">
                                            <input id="code"  name="code" type="tel" placeholder="请输入验证码">
                                        </div>
                                        <div class="item-after">
                                        	<!--<input class="obtain_code alert-text businsetj_hq" id="send_code" type="button" value="获取验证码">-->
                                            <!--<p class="businsetj_hq" ></p>-->
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <input type="hidden" id="biaoshi" value="" />
                    <input type="hidden" name="openid" value="${orgnaization.openid }" >
                    <input type="hidden" name="oemid" value="${orgnaization.oemid }" >
                    <input type="hidden" name="baseOrgLinkPhone" value="${orgnaization.baseOrgLinkPhone }" >
                    <input type="hidden" name="baseOrgCode" value="${orgnaization.baseOrgCode }" >
                    <input type="hidden" name="baseOrgName" value="${orgnaization.baseOrgName }" >
                    <input type="hidden" name="proviceName" value="${orgnaization.proviceName }" >
                    <input type="hidden" name="regionName" value="${orgnaization.regionName }" >
                    <input type="hidden" name="baseOrgAddr" value="${orgnaization.baseOrgAddr }" >
                    <input type="hidden" name="bankAccountno" value="${orgnaization.bankAccountno }" >
                    <input type="hidden" name="bankName" value="${orgnaization.bankName }" >
                    <input type="hidden" name="bankAccname" value="${orgnaization.bankAccname }" >
                    <input type="hidden" name="bankPhone" value="${orgnaization.bankPhone }" >
                    <input type="hidden" name="legalIdcardno" value="${orgnaization.legalIdcardno }" >
                    <div class="content-block">
                        <div class="row">
                            <div class="col-100"><button onclick="an()" type="button" class="button button-block button-fill button-big ">提交修改信息</button></div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div> 
        
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/sm/jquery-3.1.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/sm/mypublic.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/sm/sm.min.js"></script>
    <script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>

	<script type="text/javascript">
        $(document).ready(function() {
            var times = 60 * 100; // 60秒
            countTime = setInterval(function() {
                times = --times < 0 ? 0 : times;
                var ms = Math.floor(times / 100).toString();
    
                if(ms.length <= 1) {
                    ms = "0" + ms;
                }
                /*var hm = Math.floor(times % 100).toString();*/
                /*if(hm.length <= 1) {
                    hm = "0" + hm;
                }*/
                if(times == 0) {
                    /*alert("结束");*/
                    clearInterval(countTime);
                }
                // 获取分钟、毫秒数
                $(".businsetj_hq").html(ms);
                /*$(".b").html(hm);*/
            }, 10);
        });
        
        $(function(){
            var codemi = $("#code");
        //	$('#subhold').attr('disabled',"true");  
            
            function check() {
                $.post("<%=request.getContextPath()%>/Manage/Check", {
                    baseOrgLinkPhone:$("input[name='baseOrgLinkPhone']").val(),
                    code:$("input[name='code']").val()
                },function(json) {
                    //alert(json);						
                    if(json.code != 0) {
                        $.alert(json.desc);
                        $('#subhold').attr('disabled',"true");  
                    //	return false;
                    }else
                        {
                         $('#subhold').removeAttr("disabled");  
                         document.getElementById("biaoshi").value="biaoshi";;
                    //	 return true;
                        }
    
         
                }, 'json');
            }
            codemi.on("change", function() {
                
                if($(this).val() && $(this).val().length>0){
                    check();
                }
            });
        });
       /* function an(){
            $('#subhold').attr('disabled',"true");  
            var biaoshi=$('#biaoshi').val();
            if(biaoshi=='biaoshi'){
                $('#myForm').submit();
            }
        }*/

		
	    //提交
		function an(){
			if(checkCode()){
				var biaoshi=$('#biaoshi').val();
				if(biaoshi=='biaoshi'){
					$.showIndicator();
					$('#myForm').submit();
				}
				else{
					$.hideIndicator();
				};
			}
			else{
				return false;	
			}
		}
		function checkCode(){
			var code = $("#code").val();
			if( code == '' || code == null){
				$.alert('请输入验证码');
				return false;
			}else{
				return true;	
			}
		}
		
		
	</script>
    
    
    
	</body>
</html>
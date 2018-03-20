<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>我的卡片</title>
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-capable" content="yes">  <!--删除默认的苹果工具栏和菜单栏-->
    <meta name="apple-mobile-web-app-status-bar-style" content="black"> <!-- 控制状态栏显示样式-->
    <meta name="format-detection" content="telephone=no" /> <!--禁止拨打电话-->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/sm/sm.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/sm/mystyle.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/sm/font-awesome.min.css">
	<link href="<%=request.getContextPath()%>/css/datef.css" rel="stylesheet" />
	<style>
		.list-block #datePlugin ul {
			padding-left: inherit;
			background:none;
		}
		#beginTime{ height:1.2rem; width:1.2rem;
			margin-left:.5rem;}
		#beginTime img{
			width: 1.2rem;
			height:1.2rem;	
		}
		.shareLoan:before{ background:#e7e7e7;}
	</style>
</head>

	<body>
    <div class="page-group" >
        <div class="page page-current" >
            <header class="bar bar-nav">
                <a class="icon icon-left pull-left back"></a>
                <a class="icon  pull-right"><img style=" width:1rem; margin-top:.1rem; margin-right:.3rem;" src="<%=request.getContextPath()%>/img/wcb/add.png" /></a>
                <h1 class="title">我的卡片</h1>
            </header>
            
			<div class="content">
                <ul id="cardmain" class="cardmain">
                	<li class="bindcard boc">
                        <div class="lpbulic">
                        	<img src="<%=request.getContextPath()%>/img/wcb/bankchina.png" />
                            <img src="<%=request.getContextPath()%>/img/wcb/unionpay.png" />
                        </div>
                        <dl class="lpbulic">
                        	<dt class="bankcardcode">6218951101101203658</dt>
                            <dd>储蓄卡</dd>
                        </dl>
                    </li>
                    <li class="bindcard icbc">
                        <div class="lpbulic">
                        	<img src="<%=request.getContextPath()%>/img/wcb/icbc.png" />
                            <img src="<%=request.getContextPath()%>/img/wcb/unionpay.png" />
                        </div>
                        <dl class="lpbulic">
                        	<dt class="bankcardcode">6318951101101203658</dt>
                            <dd>储蓄卡</dd>
                        </dl>
                    </li>
                    <li class="bindcard abc">
                        <div class="lpbulic">
                        	<img src="<%=request.getContextPath()%>/img/wcb/abc.png" />
                            <img src="<%=request.getContextPath()%>/img/wcb/unionpay.png" />
                        </div>
                        <dl class="lpbulic">
                        	<dt class="bankcardcode">6418951101101203658</dt>
                            <dd>储蓄卡</dd>
                        </dl>
                    </li>
                    <li class="bindcard cmcb">
                        <div class="lpbulic">
                        	<img src="<%=request.getContextPath()%>/img/wcb/cmcb.png" />
                            <img src="<%=request.getContextPath()%>/img/wcb/unionpay.png" />
                        </div>
                        <dl class="lpbulic">
                        	<dt id="bankcardcode" class="bankcardcode">6518951101101203658</dt>
                            <dd>储蓄卡</dd>
                        </dl>
                    </li>
                    <li class="bindcard jsyh">
                        <div class="lpbulic">
                        	<img src="<%=request.getContextPath()%>/img/wcb/abc.png" />
                            <img src="<%=request.getContextPath()%>/img/wcb/unionpay.png" />
                        </div>
                        <dl class="lpbulic">
                        	<dt class="bankcardcode">6418951101101203658</dt>
                            <dd>储蓄卡</dd>
                        </dl>
                    </li>
                    <li class="bindcard gdyh">
                        <div class="lpbulic">
                        	<img src="<%=request.getContextPath()%>/img/wcb/cmcb.png" />
                            <img src="<%=request.getContextPath()%>/img/wcb/unionpay.png" />
                        </div>
                        <dl class="lpbulic">
                        	<dt id="bankcardcode" class="bankcardcode">6518951101101203658</dt>
                            <dd>储蓄卡</dd>
                        </dl>
                    </li>
                </ul>
			</div>
            
		</div>  
    </div>

	<script type='text/javascript' src="<%=request.getContextPath()%>/js/sm/jquery-3.1.min.js" charset='utf-8'></script>
	<script type='text/javascript' src="<%=request.getContextPath()%>/js/sm/mypublic.js" ></script> 
	<script type='text/javascript' src="<%=request.getContextPath()%>/js/sm/sm.min.js" ></script> 

	<script type="text/javascript">	
		$(function(){
			var bankcardcode = $(".bankcardcode").html();
			var reg = /^(\d{6})\d+(\d{4})$/;
			bankcardcode = bankcardcode.replace(reg, "$1****$2");
			$(".bankcardcode").html(bankcardcode);
		})
		
		
	</script>
	<script>
		$(function(){
			$('#cardmain li').click(function(){
				//var bankcardcode = $("#bankcardcode").val();
				//var cardmainli = $('#cardmain li').index(this)+1;
				//alert($(this).index());
				$.confirm('是否要解除此银行卡的绑定？', function () {
					window.location.href='http://www.baidu.com';
				});
			})
		})
	
		/*$(function(){
			var ul = document.getElementById("cardmain");
            var ul_child = ul.getElementsByTagName('li');
            for (var i = 0; i < ul_child.length; i++) {
            	ul_child[i].index = i;
            	ul_child[i].onclick = function(){
                   var j = this.index;
    　               alert("元素索引为" +this.index);
				}
			}		
		})*/
		
		<!--function Jdwuliu(jdNumber){
			$.ajax({
				url: "",
				data:{jdNumber:jdNumber},
				type: "post",
				dataType:"json",
				success:function(obj){//ｏｂｊ为一个ｊｓｏｎ
					if(obj!=null){
						var jsonObj=JSON.parse(obj);//通过转换后的json对象
						if(jsonObj.success==true && jsonObj.result!=null){
							$('.wuliulist tr').remove();
							var html="<tr style='border-bottom:1px solid #ccc;height:40px;'>
							<td style='width:400px;text-align:center;'>配送内容</td>
							<td style='width:150px;text-align:center;'>操作时间</td>
							<td style='width:150px;text-align:center;'>操作人</td>
							</tr>";//拼接表头
			  $('.wuliulist').append(html);
			  //jsonObj.result.orderTrack.reverse()为json里的一个list集合
			$.each(jsonObj.result.orderTrack.reverse, function (i, item) {//循环list集合
			var afsDetailType = item.afsDetailType;
									  if(afsDetailType == 10){
										  afsDetailType="主商品";
									  }else if(afsDetailType == 20){
										  afsDetailType="赠品";
									  }else if(afsDetailType == 30){
										  afsDetailType="附件";
									  }
			  var time_html="<time style='float:right;'>"+(new Date(item.createDate)).toLocaleDateString()+" "+(new Date(item.createDate)).toLocaleTimeString()+"</time>";
			   var tr_html="<tr style='border-bottom:1px solid #ccc;height:40px;'><td style='width:400px;text-align:center;'>"+item.content
									+"</td><td style='width:150px;text-align:center;'>"+item.msgTime
									+"</td><td style='width:120px;text-align:center;'>"+item.operator
									+"</td><td style='width:120px;text-align:center;'>"+time_html//拼接时间
									+"</td><td style='width:120px;text-align:center;'>"+afsDetailType//拼接判断语句
									+"</td></tr>"
									$('.wuliulist').append(tr_html);
							 });
						}           
					}
					
				}
				
			});
		}-->

    </script>
    
	</body>
</html>
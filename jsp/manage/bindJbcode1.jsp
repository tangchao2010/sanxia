<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>解绑卡片</title>
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-capable" content="yes">  <!--删除默认的苹果工具栏和菜单栏-->
    <meta name="apple-mobile-web-app-status-bar-style" content="black"> <!-- 控制状态栏显示样式-->
    <meta name="format-detection" content="telephone=no" /> <!--禁止拨打电话-->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/sm/sm.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/sm/mystyle.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/sm/font-awesome.min.css">
	<link href="<%=request.getContextPath()%>/css/datef.css" rel="stylesheet" />
</head>
	<body>
    <div class="page-group" >
        <div class="page page-current" >
            <header class="bar bar-nav">
                <a class="icon icon-left pull-left back"></a>
                <h1 class="title">解绑卡片</h1>
            </header>
            
			<div class="content">
            	<div class=" list-block">
                	<ul>
                    	<li>
                    		<div class="item-content">
                      			<div class="item-inner">
                                	<div class="item-title label">Name</div>
                                    <div class="item-input">
                                      <input type="text" placeholder="Your name">
                                    </div>
                            	</div>
                        	</div>
                  		</li>
                    </ul>	
                </div>
			</div>
            
		</div>  
    </div>

	<script type='text/javascript' src="<%=request.getContextPath()%>/js/sm/jquery-3.1.min.js" charset='utf-8'></script>
	<script type='text/javascript' src="<%=request.getContextPath()%>/js/sm/mypublic.js" ></script> 
	<script type='text/javascript' src="<%=request.getContextPath()%>/js/sm/sm.min.js" ></script> 

	</body>
</html>
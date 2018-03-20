<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>管理后台</title>
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1, maximum-scale=1">
    <link rel="shortcut icon" href="/favicon.ico">
    <meta name="apple-mobile-web-app-capable" content="yes">  <!--删除默认的苹果工具栏和菜单栏-->
    <meta name="apple-mobile-web-app-status-bar-style" content="black"> <!-- 控制状态栏显示样式-->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/sm/sm.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/sm/mystyle.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/sm/font-awesome.min.css">
    <style>
		.manage_bac{ bottom:-1px;}
		.text-center em{ font-size:.8rem; font-style:normal; opacity:1;}
		.mybar{
			background:#007bc8;
		}
		.mybar .title{ color:#fff;}
		.mybar .icon{ color:#fff;}
		.bar:after{ height:0;}
		.manage_contaienr_top {
    		background: #007bc8;
		}
    </style>
	</head>
	<body>
   	<div class="page-group">
		<div class="page page-current">
        	<header class="bar bar-nav mybar">
                <!--<a class="icon icon-left pull-left back"></a>-->
                <h1 class='title'>管理后台</h1>
            </header>
    		
            <div class="content dashboard native-scroll" >
                <div class="manage_contaienr_top">
                	<p class="text-center" style="font-size: .75rem; color:#fff; opacity:0.8">${orgnaization.baseOrgCode}</p>
               		<p class="text-center" style="font-size: 0.8rem; color:#fff;"><em>${orgnaization.baseOrgName}</em>&nbsp;&nbsp;<em>费率:${ratio}‰</em></p>
                    <img class="manage_photo" src="${wx_head}">
                    <img class="manage_bac" src="<%=request.getContextPath()%>/img/wcb/manage_bac.png">
            	</div>
                <div class=" manage_money">
                	<div class="row text-center topbox-d3" style="margin-left:0;">
                    	<div class="col-50" style="width:50%; margin-left:0;">
                     		<p class="topbox-pp1">${SumOrderAmount}</p>
                            <p class="topbox-pp2">当日交易额（元）</p>
                        </div>
                        <div class="col-50" style="width:50%; margin-left:0;">
                            <p class="topbox-pp1">${SumNum}</p>
                            <p class="topbox-pp2">交易笔数汇总（笔）</p>
                        </div>
					</div>
				</div>
                
                <div style="background: #efeff4; height: 0.5rem;"></div>
				<div class="content-padded grid-demo" style="margin:0;">
					<div class="row text-center u-tab shareLoan" style="margin:0;">
						<div class="manage_col-33">
                        	<a href="<%=request.getContextPath()%>/QRPay/payOrderRecords?openid=${openid}">
                                <i><img src="<%=request.getContextPath()%>/img/wcb/manage_lpic.png"></i>
                                <p>流水查询</p>
                            </a>
                   		</div>
                        <c:if test="${e_wallet eq '0' }">
                        <div class="manage_col-33">
                        	<a href="<%=request.getContextPath()%>/wode/zichan?orgCode=${orgnaization.baseOrgCode}&oemid=${oemid}&openid=${openid}">
                                <i><img  src="<%=request.getContextPath()%>/img/wcb/tcash.png"></i>
                                <p>我的资产</p>
                            </a>
                   		</div>
                        </c:if>
                        <div class="manage_col-33">
                        	<a href="<%=request.getContextPath()%>/Manage/uploadChoose?orgCode=${orgnaization.baseOrgCode}&oemid=${oemid}&openid=${openid}">
                                <i><img src="<%=request.getContextPath()%>/img/wcb/sc_up.png"></i>
                                <p>提额申请</p>
                            </a>
                   		</div>
                        <div class="manage_col-33">
                        	<a href="<%=request.getContextPath()%>/Manage/machInviteInfo?openid=${openid}&oemid=${oemid}&qrtype=1">
                                <i><img src="<%=request.getContextPath()%>/img/wcb/manage_invite.png"></i>
                                <p>我的推广</p>
                            </a>
                   		</div>
					</div>
                    <div class="row text-center u-tab shareLoan shareLoana" style="margin:0;">
                        <div class="manage_col-33">
                        	<a href="<%=request.getContextPath()%>/Manage/machDetail?orgCode=${orgnaization.baseOrgCode}&beginTime=&curPage=1">
                                <i><img  src="<%=request.getContextPath()%>/img/wcb/manage_spic.png"></i>
                                <p>商户信息</p>
                            </a>
                   		</div>
                        <div class="manage_col-33">
                        	<a href="<%=request.getContextPath()%>/Manage/businesdxgUI?orgCode=${orgnaization.baseOrgCode}&oemid=${oemid}&openid=${openid}">
                                <i><img src="<%=request.getContextPath()%>/img/wcb/manage_bxg.png"></i>
                                <p>商户信息修改</p>
                            </a>
                   		</div>
                        <div class="manage_col-33">
                        	<a href="<%=request.getContextPath()%>/Manage/passwordcgUI?loginName=${orgnaization.baseOrgLinkPhone}&openid=${openid}&oemid=${oemid}">
                                <i><img  src="<%=request.getContextPath()%>/img/wcb/manage_password.png"></i>
                                <p>修改密码</p>
                            </a>
                   		</div>
                        <div class="manage_col-33">
                        	<a href="bindCardinfor.jsp">
                                <i><img  src="<%=request.getContextPath()%>/img/wcb/manage_bindc.png"></i>
                                <p>绑定卡片</p>
                            </a>
                   		</div>
					</div>
                    <div class="row text-center u-tab shareLoan shareLoana" style="margin:0;">
                    	<c:if test="${e_wallet eq '1' }">
						<div class="manage_col-33">
                        	<a href="<%=request.getContextPath()%>/Manage/frquery?orgCode=${orgnaization.baseOrgCode}&beginTime=&curPage=1">
                                <i><img src="<%=request.getContextPath()%>/img/wcb/manage_share.png"></i>
                                <p>分润查询</p>
                            </a>
                   		</div>
                        <div class="manage_col-33">
                        	<a href="<%=request.getContextPath()%>/Manage/tcashUI?orgCode=${orgnaization.baseOrgCode}&oemid=${oemid}&openid=${openid}">
                                <i><img src="<%=request.getContextPath()%>/img/wcb/tcash.png"></i>
                                <p>提现</p>
                            </a>
                   		</div>
                        </c:if>
					</div>
                    <c:if test="${tg_on_off eq '0' }">
                    <div class="row text-center u-tab shareLoan " style="margin:0;">
						<div class="manage_col-33">
                        	<a href="<%=request.getContextPath()%>/Manage/TGED?orgCode=${orgnaization.baseOrgCode}&oemid=${oemid}&openid=${openid}">
                                <i><img src="<%=request.getContextPath()%>/img/wcb/moneyed.png"></i>
                                <p>推广包额度</p>
                            </a>
                   		</div>
                        <div class="manage_col-33">
                        	<a href="<%=request.getContextPath()%>/Manage/FYMX?orgCode=${orgnaization.baseOrgCode}&curPage=1">
                                <i><img src="<%=request.getContextPath()%>/img/wcb/detailfy.png"></i>
                                <p>返佣明细</p>
                            </a>
                   		</div>
                        <div class="manage_col-33">
                        	<a href="<%=request.getContextPath()%>/Manage/allAsset?orgCode=${orgnaization.baseOrgCode}&oemid=${oemid}&openid=${openid}">
                                <i><img  src="<%=request.getContextPath()%>/img/wcb/tcash.png"></i>
                                <p>总资产</p>
                            </a>
                   		</div>
					</div>
                    </c:if>
                    
                    <%--<div class="row text-center u-tab shareLoan" style="margin:0;">
						<div class="manage_col-33">
                        	<a href="<%=request.getContextPath()%>/Manage/sqUI?orgCode=${orgnaization.baseOrgCode}&oemid=${oemid}&openid=${openid}">
                                <i><img src="<%=request.getContextPath()%>/img/wcb/moneyed.png"></i>
                                <p>升迁</p>
                            </a>
                   		</div>
                        <div class="manage_col-33">
                        	<a href="<%=request.getContextPath()%>/Manage/uploadUI?orgCode=${orgnaization.baseOrgCode}&oemid=${oemid}&openid=${openid}">
                                <i><img src="<%=request.getContextPath()%>/img/wcb/detailfy.png"></i>
                                <p>完善信息</p>
                            </a>
                   		</div>
					</div>--%>
                    
                    <div class="content-block"></div>
				</div>
            </div>
        </div>
    </div> 
        
</body>
</html>
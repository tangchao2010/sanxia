<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="renderer" content="webkit" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		<title>管理后台</title>
        <link href="<%=request.getContextPath()%>/css/bootstrap/bootstrap.min.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/bootstrap/bootstrap-theme.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/bootstrap/bootstrapValidator.min.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/bootstrap/buttons.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/webuploader.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/manage.css" rel="stylesheet" />
        
        <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.11.3.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/wechat/layer.m.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap/bootstrap.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap/bootstrapValidator.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/webuploader.min.js"></script>
		<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
	
		<style>
			
			.jdxx a{  font-family:'微软雅黑';}
			.navbar-header-img{ position:absolute; top:30%;left:0;  padding-left:15px;}
			.zfcg_container p{  font-family:"微软雅黑";}
			.zfcg_container dt,dd{ font-family:'微软雅黑';}
			.zfcg_container td,th{ font-family:"微软雅黑";}
			.manage_container .user_hl{margin-top:2px;}
			.manage_container .user_hl a{ text-decoration:none; color:#000;}
			
			.modal-dialog{ padding-left:7%; padding-right:7%; margin-top:48%; }
			.modal-content{z-index:100000; box-shadow:none; border:none; border-radius:4px;}
			.add_list_bottom{ text-align:center;}
			.add_list_bottom a{ font-size:18px; padding-left:30px; padding-right:30px; font-family:'微软雅黑'; color:#000; text-decoration:none;}
			.container_modal .top_bottom { margin-left:12px; margin-right:12px; list-style: none outside none; padding-top: 12px;}
			.jdxx_text{ text-align:center; font-size:16px; font-family:'微软雅黑'; color:#000;}
			.infor_list_zc{overflow:hidden; text-overflow:ellipsis; white-space:nowrap; -ms-text-overflow: ellipsis;text-overflow: ellipsis;white-space: nowrap;}
			.fj{overflow:hidden; font-size:16px; text-overflow:ellipsis; white-space:nowrap; -ms-text-overflow: ellipsis; text-overflow: ellipsis;white-space: nowrap; text-align:left;}
			.jdxx_text button{ font-size:16px; color:#000; border:none; font-family:'微软雅黑'; background:none;}
        	.top_bottom dt{ text-align:center; font-size:16px; padding-bottom:6px;}
			.top_bottom dd{ font-size:12px; color:#333;}
        </style>
  
</head>
<body style="background:#f5f5f5">
<div class="container-fluid manage_containerz" >
    <div class="manage_container">
            <div class="row " style="padding:0; margin:0;">
                <div class="manage_pic col-md-4 col-sm-4 col-xs-4 ">
                    <img class="img-responsive " src="${wx_head}">
                </div>
                <div class="col-md-7 col-sm-7 col-xs-7 manage_user">
                    <dl>
                        <%-- <dd class="user_code">${wx_name}</dd> --%>
                    	<dd class="user_name">${orgnaization.baseOrgCode}</dd>
                        <dd class=" user_tel">${orgnaization.baseOrgName}</dd>
                        <dd class=" user_hl" style="color:#ee3608;">费率:${ratio}‰<a></a></dd>
                       <%--  <dd class="user_tel">${orgnaization.baseOrgLinkPhone}</dd> --%>
                    </dl>
                    
                </div>
            </div>
    </div>
    
    <div class="container manage_eb">
        <div class="row " style=" margin:0; padding:0;">
            <div class="col-md-6 col-sm-6 col-xs-6">
                <dl class="manage_e">
                    <dd class="manage_money1">当日交易额:</dd>
                    <dd class="manage_money"><a>${SumOrderAmount}</a></dd>
                </dl>
            </div>
            <div class="col-md-6 col-sm-6 col-xs-6">
                <dl class="manage_b">
                    <dd class="manage_money1">交易笔数汇总:</dd>
                    <dd class="manage_money"><a>${SumNum}</a>笔</dd>
                </dl>
            </div>
        </div>	
    </div>
    <div class="manage_bac"></div>
    <div class="manage_ls">
    	<div class="row" style=" margin:0;">
        	<div class="col-md-6 col-sm-6 col-xs-6" style="border-right: solid 1px #ededed;  padding:6% 0;">
            	<a href="<%=request.getContextPath()%>/QRPay/payOrderRecords?openid=${openid}" style=" text-decoration:none;">
                    <dl class="manage_l">
                        <dt><img class="img-responsive  center-block" width="40px;"  src="<%=request.getContextPath()%>/img/imgs/manage_lpic.png"></dt>
                        <dd>流水查询</dd>
                    </dl>
                </a>
            </div>
            <div class="col-md-6 col-sm-6 col-xs-6" style=" padding:6% 0;">
            	<a href="<%=request.getContextPath()%>/Manage/frquery?orgCode=${orgnaization.baseOrgCode}&beginTime=&curPage=1" style=" text-decoration:none;">
                    <dl class="manage_l">
                        <dt><img class="img-responsive  center-block" width="40px;"  src="<%=request.getContextPath()%>/img/imgs/manage_share.png"></dt>
                        <dd>分润查询</dd>
                    </dl>
                </a>
            </div>
        </div>
                
        <div class="row" style=" margin:0;  border-top: solid 1px #ededed;  ">
            <div class="col-md-6 col-sm-6 col-xs-6" style="border-right: solid 1px #ededed;padding:6% 0;">
            	<a href="<%=request.getContextPath()%>/Manage/machDetail?orgCode=${orgnaization.baseOrgCode}&beginTime=&curPage=1" style=" text-decoration:none;">
                    <dl class="manage_s">
                        <dt><img class="img-responsive center-block"  width="40px;"  src="<%=request.getContextPath()%>/img/imgs/manage_spic.png"></dt>
                        <dd>商户信息</dd>
                    </dl>
                </a>     
            </div>
            <div class="col-md-6 col-sm-6 col-xs-6" style="padding:6% 0;">
            	<a href="<%=request.getContextPath()%>/Manage/machInviteInfo?openid=${openid}&oemid=${oemid}&qrtype=1" style=" text-decoration:none;">
                    <dl class="manage_l">
                        <dt><img class="img-responsive  center-block" width="40px;"  src="<%=request.getContextPath()%>/img/imgs/manage_invite.png"></dt>
                        <dd>我的推广</dd>
                    </dl>
                </a>
            </div>
        </div>
        
        <div class="row" style=" margin:0;  border-top: solid 1px #ededed;  ">
        	<div class="col-md-6 col-sm-6 col-xs-6" style="border-right: solid 1px #ededed; padding:6% 0;">
            	<a href="<%=request.getContextPath()%>/Manage/businesdxgUI?orgCode=${orgnaization.baseOrgCode}&oemid=${oemid}&openid=${openid}" style=" text-decoration:none;">
                    <dl class="manage_l">
                        <dt><img class="img-responsive  center-block" width="40px;"  src="<%=request.getContextPath()%>/img/imgs/manage_bxg.png"></dt>
                        <dd>商户信息修改</dd>
                    </dl>
                </a>
            </div>
            <div class="col-md-6 col-sm-6 col-xs-6" style="padding:6% 0;">
            	<a href="<%=request.getContextPath()%>/Manage/passwordcgUI?loginName=${orgnaization.baseOrgLinkPhone}&openid=${openid}&oemid=${oemid}" style=" text-decoration:none;">
                    <dl class="manage_s">
                        <dt><img class="img-responsive center-block"  width="40px;"  src="<%=request.getContextPath()%>/img/imgs/manage_password.png"></dt>
                        <dd>修改密码</dd>
                    </dl>
                </a>     
            </div>
        </div>
        
        <div class="row" style=" margin:0;  border-top: solid 1px #ededed;  ">
        	<div  class="col-md-6 col-sm-6 col-xs-6 mdmanage_bac" style="border-right: solid 1px #ededed; padding:6% 0;">
            	<a href="<%=request.getContextPath()%>/Manage/tcashUI?orgCode=${orgnaization.baseOrgCode}&oemid=${oemid}&openid=${openid}" style=" text-decoration:none;">
                    <dl class="manage_l">
                        <dt><img class="img-responsive  center-block" width="40px;"  src="<%=request.getContextPath()%>/img/imgs/tcash.png"></dt>
                        <dd>提现</dd>
                    </dl>
                </a>
            </div>
             <div  class="col-md-6 col-sm-6 col-xs-6 mdmanage_bac" style="border-right: solid 1px #ededed; padding:6% 0;">
            	<a href="<%=request.getContextPath()%>/Manage/mendianUI?orgCode=${orgnaization.baseOrgCode}&oemid=${oemid}&openid=${openid}&curPage=1" style=" text-decoration:none;">
                    <dl class="manage_l">
                        <dt><img class="img-responsive  center-block" width="40px;"  src="<%=request.getContextPath()%>/img/imgs/manage_infor.png"></dt>
                        <dd>门店管理</dd>
                    </dl>
                </a>
            </div>
        </div>
        
        <div class="row" style=" margin:0;  border-top: solid 1px #ededed;  ">
        	<div class="col-md-6 col-sm-6 col-xs-6" style="border-right: solid 1px #ededed; padding:6% 0;">
            	<a href="<%=request.getContextPath()%>/Manage/uploadChoose?orgCode=${orgnaization.baseOrgCode}&oemid=${oemid}&openid=${openid}" style=" text-decoration:none;" >
                    <dl class="manage_l">
                        <dt><img class="img-responsive  center-block" width="40px;"  src="<%=request.getContextPath()%>/img/imgs/sc_up.png"></dt>
                        <dd>提额申请</dd>
                    </dl>
                </a>
            </div>
            <div class="col-md-6 col-sm-6 col-xs-6" style="border-right: solid 1px #ededed; padding:6% 0;">
            	<a href="<%=request.getContextPath()%>/Manage/TGED?orgCode=${orgnaization.baseOrgCode}&oemid=${oemid}&openid=${openid}" style=" text-decoration:none;" >
                    <dl class="manage_l">
                        <dt><img class="img-responsive  center-block" width="40px;"  src="<%=request.getContextPath()%>/img/imgs/moneyed.png"></dt>
                        <dd>推广包额度</dd>
                    </dl>
                </a>
            </div>
            </div>
            <div class="row" style=" margin:0;  border-top: solid 1px #ededed;  ">
            <div class="col-md-6 col-sm-6 col-xs-6" style="border-right: solid 1px #ededed; padding:6% 0;">
            	<a href="<%=request.getContextPath()%>/Manage/FYMX?orgCode=${orgnaization.baseOrgCode}&curPage=1" style=" text-decoration:none;" >
                    <dl class="manage_l">
                        <dt><img class="img-responsive  center-block" width="40px;"  src="<%=request.getContextPath()%>/img/imgs/detailfy.png"></dt>
                        <dd>返佣明细</dd>
                    </dl>
                </a>
            </div>
            <div class="col-md-6 col-sm-6 col-xs-6" style="border-right: solid 1px #ededed; padding:6% 0;">
            	<a href="<%=request.getContextPath()%>/Manage/allAsset?orgCode=${orgnaization.baseOrgCode}&oemid=${oemid}&openid=${openid}" style=" text-decoration:none;" >
                    <dl class="manage_l">
                        <dt><img class="img-responsive  center-block" width="40px;"  src="<%=request.getContextPath()%>/img/imgs/sc_up.png"></dt>
                        <dd>总资产</dd>
                    </dl>
                </a>
            </div>
             </div>
           <%--  <div  class="col-md-6 col-sm-6 col-xs-6 mdmanage_bac" style="padding:6% 0;">
            	<a href="<%=request.getContextPath()%>/Manage/sqUI?orgCode=${orgnaization.baseOrgCode}&oemid=${oemid}&openid=${openid}" style=" text-decoration:none;">
                    <dl class="manage_s">
                        <dt><img class="img-responsive center-block"  width="40px;"  src="<%=request.getContextPath()%>/img/imgs/sq.png"></dt>
                        <dd>升迁</dd>
                    </dl>
                </a>     
            </div> --%>
        
        <div class="row" style=" margin:0;  border-top: solid 1px #ededed;  ">
        	
           <%--    <div  class="col-md-6 col-sm-6 col-xs-6 mdmanage_bac" style="padding:6% 0;">
            	<a href="<%=request.getContextPath()%>/Manage/sqUI?orgCode=${orgnaization.baseOrgCode}&oemid=${oemid}&openid=${openid}" style=" text-decoration:none;">
                    <dl class="manage_s">
                        <dt><img class="img-responsive center-block"  width="40px;"  src="<%=request.getContextPath()%>/img/imgs/sq.png"></dt>
                        <dd>升迁</dd>
                    </dl>
                </a>     
            </div>  --%> 
        </div>
        
     <%-- <div class="row" style=" margin:0;  border-top: solid 1px #ededed;  ">
        	<div  class="col-md-6 col-sm-6 col-xs-6 mdmanage_bac" style="border-right: solid 1px #ededed; padding:6% 0;">
            	<a href="<%=request.getContextPath()%>/Manage/uploadUI?orgCode=${orgnaization.baseOrgCode}&oemid=${oemid}&openid=${openid}" style=" text-decoration:none;">
                    <dl class="manage_l">
                        <dt><img class="img-responsive  center-block" width="40px;"  src="<%=request.getContextPath()%>/img/imgs/manage_infor.png"></dt>
                        <dd>完善信息</dd>
                    </dl>
                </a>
            </div>
             
        </div>  --%>
	</div>        
    <div class="manage_bac"></div>
</div>       
  
	
        
</body>
</html>
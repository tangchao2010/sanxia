<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>公众号支付</title>
</head>
<body>
	<form name="form" action="http://brcb.pufubao.net/gateway" method="post">
		<input type="hidden" name="service_type" value="${service_type }" />
		<input type="hidden" name="mch_id" value="${mch_id }" />
		<input type="hidden" name="out_trade_no" value="${out_trade_no }" />
		<input type="hidden" name="body" value="${body }" />
		<input type="hidden" name="attach" value="${attach }" />
		<input type="hidden" name="total_fee" value="${total_fee }" />
		<input type="hidden" name="spbill_create_ip" value="${spbill_create_ip }" />
		<input type="hidden" name="notify_url" value="${notify_url }" />
		<input type="hidden" name="nonce_str" value="${nonce_str }" />
		<input type="hidden" name="sign" value="${sign }" />
	</form>
	<script type="text/javascript">
		/* 自动提交表单 */
		document.forms["form"].submit();
	</script>
</body>
</html>
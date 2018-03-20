
$(document).ready(function() {
	
	var tjmrchphone = $("#agentId");
	var tjmrchname = $("#tjmrchname");
	var defaultPrivnceCode="";
	
	function searchMrchName(mrchphone) {
		$.post("../Merch/searchMrchName/"+mrchphone, function(result) { 			
//			alert(result.desc);
			$("#tjmrchname").val(result.desc);
 
		}, 'json');

	}
	
	tjmrchphone.on("change", function() {
//		alert("change");
//		$("#tjmrchname").val("ddddd");
		if($(this).val() && $(this).val().length>0){
			searchMrchName($(this).val());
		}else{
			$("#tjmrchname").val($("#orgmrchname").val());
		}
	});
	
	
	
	var $proviceCode = $("#proviceCode");
	var currP, currB;

	function Trim(str) {
		return str.replace(/(^\s*)|(\s*$)/g, "");
	}

	function listProvince() {
//		$.post("http://localhost:8081/ditiy-pay-web-h5/Merch/listProvince", function(result) {
		$.post("../Merch/listProvince", function(result) { 
			//alert('0');
			if(result && result.length > 0) {
				var pname=$("#proviceName").val();
			//	alert(pname);
				for(var i = 0; i < result.length; i++) {
					
					if(pname==result[i]['value']){
						$proviceCode.append('<option selected="true" value="'+ result[i]['code'] + '">' + Trim(result[i]['value']) + '</option>');
						defaultPrivnceCode= result[i]['code'];
						listCity(defaultPrivnceCode);
						
					}else{
						$proviceCode.append('<option value="'+ result[i]['code'] + '">' + Trim(result[i]['value']) + '</option>');

					}
					
									}
			}
			
		}, 'json');

	}
	var $regionCode = $("#regionCode");

	function listCity(province) {
		$.post("../Merch/listCity/" + province, function(result) {
			if(result && result.length > 0) {
				var regionName=$("#regionName").val();
				$regionCode.children().not(":first").remove();
				for(var i = 0; i < result.length; i++) {
					if(regionName==result[i]['value']){
					$regionCode.append('<option selected="true" value="' + result[i]['code'] + '">' + result[i]['value'] + '</option>');
				}else{
					$regionCode.append('<option value="' + result[i]['code'] + '">' + result[i]['value'] + '</option>');
					
				}}
			}
		}, 'json');
	}
	listProvince();
	
	$proviceCode.on("change", function() {
		listCity($(this).val());
		$("input[name='proviceName']").val($(this).find("option:selected").text());
	});
	$regionCode.on("change", function() {
		currP = $(this).val();
		$("input[name='regionName']").val($(this).find("option:selected").text());

		//listBank(currB, currP);
	});
	var $bankNo = $("#bankNo");

	function listBankType() {
		$.post("../Merch/listBankType", function(result) {
			$bankNo.children().not(":first").remove();
			if(result && result.length > 0) {
				var bankName=$("#bankName").val();
				for(var i = 0; i < result.length; i++) {
					if(bankName==result[i]['bankName']){
					$bankNo.append('<option selected="true"  value="' + result[i]['bankName'] + '">' + result[i]['bankName'] + '</option>');
				}else{
					$bankNo.append('<option value="' + result[i]['bankName'] + '">' + result[i]['bankName'] + '</option>');
					
				}}
			}
		}, 'json');
	}

	/*function listBank(bankTypeCode, areaCode) {
		if(!bankTypeCode || !areaCode) return false;
		var $bankNo = $("#bankNo");
		$.post("Merch/listBank/" + bankTypeCode + "/" + areaCode, function(result) {
			$bankNo.children().not(":first").remove();
			if(result && result.length > 0) {
				for(var i = 0; i < result.length; i++) {
					$bankNo.append('<option value="' + result[i]['bankcode'] + '">' + result[i]['subbranch'] + '</option>');
				}
			}
		}, 'json');
	}*/
	listBankType();
	$("#bankNo").on("change", function() {
		$("input[name='bankName']").val($(this).find("option:selected").text());
	});
	

	

});

function loading() {
    $(".sn-mask").show();
    $(".sn-mask").css({
        opacity: "0.3"
    });

    $(".sn-loading").show()
}

(function() {
	//on() 方法是 bind()、live() 和 delegate() 方法的新的替代品。
    $(".sx-main input").on("input propertychange ", function() {
        //$(".match-list").hide(); 
		var d = $(this).val();
        var f = $(this).parents(".input-a").find(".delete");
		 
		//如果d，f显示/隐藏
        if (d != '') {
			//alert(d);
            f.show()
        } else {
            f.hide()
        }
		b();
    });
	//$(".qb-main input").change();
    function b() {
		//$("input").keyup(function () {
            var d = true;
            $(".sx-main input").each(function () {
                if ($.trim(this.value) =="") {   //this.value.trim() == ''
                    /*ok = false;
                    return false*/
					var e = $(this).val();
					if(!e.trim()){
						d=false	
					}else{
						d=true;	
					}
                }
            });
			
            if (d) {
				$(".button-block").removeClass("sx-btn-dark").addClass("sx-btn-positive")
			} else {
				$(".button-block").removeClass("sx-btn-positive").addClass("sx-btn-dark")
			}
		 //})
       }
	   
	//删除
    $(".sx-main .delete").on("click", function() {
        var d = $(this).parents(".input-a").find("input");
        	d.val("");  //如果input为null   
        	$(this).hide(); 
			$('#dzaccount').html(0.00);
        	b(); //执行b();
    });	
})();

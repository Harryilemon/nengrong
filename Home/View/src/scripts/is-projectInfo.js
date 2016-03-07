$(function(){
	var param = $.parseQueryParam();
	$(".l-nav").find(".projectInfo").addClass("active");

	$("#remarkbtn").click(function(){ 
		
		if ($(".remark").hasClass("move")) {
			$(".remark").show();
			setTimeout(function(){
				$(".remark").removeClass("move");
			}, 20);
			// $(".remark").show().removeClass("move");
			// $(this).parent().parent().css({
			// 	width:"38px"
			// });
		}
		else{
			$(".remark").addClass("move");
			setTimeout(function(){
				$(".remark").hide();
			}, 500);
			// $(this).parent().parent().css({
			// 	width:"293px"
			// });
		}
	});

	$("#commentbtn").click(function(){ 
		var commenttexval= $.trim($("#commenttex").val());

		$.ajax({
		    type: "post",
		    url: "?c=InnerStaff&a=projectInfo&no="+param.no+"&token="+param.token,
		    data: {	
		    	comment: commenttexval,
		    	rtype: 1
		    },
			dataType: "json"
		}).done(function(data){
			if (data.code== 0) {
				alert("保存成功");
			}
			else{
				alert(data.msg || "保存失败");
			}
		});
	});
});
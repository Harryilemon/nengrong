$(function() {

	$(".l-nav").find(".recommendedProject").addClass("active");
	

	require("common/erqi/pager.js");

	// 查看项目详情
	$(".bd").on("click", "a", function(){
		var data = $(this).data();
		window.open("?c=ProjectInvestorMyPro&a=projectInfoView&no="+data.id+"&token="+data.idm);
	});

});
$(function() {

	$(".l-nav").find(".awaitingAssessment").addClass("active")
		.children("a").attr("href", "javascript:;");

	require("common/erqi/list-opt.js");
	require("common/erqi/pager.js");

	// 跳转项目详情页或编辑页
	$(".list .bd a").click(function(e) {
		var data = $(this).data();
		if(data.status == 11) {
			window.open("?c=ProjectProviderMyPro&a=projectInfoEdit&uid=" + data.uid + "&no=" + data.id + "&token=" + data.idm);
		} else {
			window.open("?c=ProjectProviderMyPro&a=projectInfoView&no=" + data.id + "&token=" + data.idm);
		}
		return false;
	});

	window.addEventListener('message',function(e) {
		if(e.origin === location.origin && e.data && e.data.type === "refreshProjectCode") {
			// var data = e.data.data,
			// 	oldInfo = data.oldInfo || {},
			// 	newInfo = data.newInfo || {};
			// if(oldInfo.uid) {
			// 	$(".list").find('[data-uid="'+oldInfo.uid+'"]').text(newInfo.id).attr({
			// 		"data-id": newInfo.id,
			// 		"data-idm": newInfo.idm
			// 	}).data({
			// 		"id": newInfo.id,
			// 		"idm": newInfo.idm
			// 	});
			// } else {
			// 	$(".list").find('[data-id="'+oldInfo.id+'"]').text(newInfo.id).attr({
			// 		"data-id": newInfo.id,
			// 		"data-idm": newInfo.idm
			// 	}).data({
			// 		"id": newInfo.id,
			// 		"idm": newInfo.idm
			// 	});
			// }

			location.reload();
			return;
		}
    }, false);
});
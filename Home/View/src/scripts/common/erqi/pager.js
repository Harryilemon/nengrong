/* 分页 */
// $(".pager span").click(function() {
// 	var $this = $(this);
// 	if(!$this.hasClass("active")) {
// 		location.href = location.href.replace(/&?\bpage=\w+/, "") + "&page=" + $this.data("pageIndex");
// 	}
// 	return false;
// });

$(function($) {
	var ITEMS_PER_PAGE = 6;

	var total = $(".pagination").data("total") || 0;
	if(total/ITEMS_PER_PAGE > 1) {
		var param = $.parseQueryParam(),
			current_page = +(param.page || 1);
		
		$(".pagination").show().pagination(total, {
	        callback: function(page_id, ct) { // 回调函数
	        	// var $this = $(this);
				// if(!$this.hasClass("active")) {
					// location.href = location.href.replace(/&?\bpage=\w+/, "") + "&page=" + page_id;
				// }
				return false;
	        },
	        prev_text: "上一页",
	        prev_show_always: false,
	        next_text: "下一页",
	        next_show_always: false,
	        items_per_page: ITEMS_PER_PAGE, // 每页的数据个数
	        num_display_entries: 6, // 连续分页主体部分显示的分页条目数
	        current_page: current_page - 1,   // 当前页码
	        num_edge_entries: 5, // 两侧显示的首尾分页的条目数
	        link_to: "__id__"
	    });

		$(".pagination a").click(function() {
			var $this = $(this);
			// if(!$this.hasClass("active")) {
				location.href = location.href.replace(/&?\bpage=\w+/, "") + "&page=" + (+$this.attr("href")+1);
			// }s
			return false;
		});
	}
	
});
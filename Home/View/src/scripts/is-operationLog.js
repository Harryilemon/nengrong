$(function() {

	/* 分页 */
	$(".pager span").click(function() {
		var $this = $(this);
		if(!$this.hasClass("active")) {
			location.href = "?c=InnerStaff&a=operationLog&page="+$this.data("page-index");
		}
		return false;
	});
	
});
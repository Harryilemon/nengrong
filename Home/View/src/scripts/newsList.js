$(function() {
	require("widgets/top-fixed.js");
	$("#topNav").topFixed(); /* 滚动时顶部导航栏停靠在页面上方 */
	
	$("nav li .News").addClass("am-active");
	
	var l_items = $(".l-nav li");
	l_items.filter(".newsList").addClass("active");
	l_items.click(function() {
		location.href = $(this).data("href");
	});
	
	/* 查看新闻详情  */
	var r_items = $(".bd .list li");
	r_items.click(function(){
		location.href = "?c=News&a=newsContent&id="+$(this).data("id");
	});
	
	/* 分页 */
	$(".pager a").click(function() {
		var $this = $(this);
		if(!$this.hasClass("active")) {
			location.href = "?c=News&a=newsList&page="+$this.data("pageno");
		}
		return false;
	});

});
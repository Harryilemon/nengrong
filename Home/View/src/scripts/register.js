$(function(){
	function warning() {
		$("#warning").show();
	}
	function warning2() {
		$("#warning2").show();
	}
	function warning3() {
		$("#warning3").show();
	}

	$("#registerbtn").click(function(){ 
		var mailval= $.trim($("#mailinput").val());
		var passval= $.trim($("#passinput").val());
		var repeatpassval= $.trim($("#repeatpassinput").val());

		if (!mailval || !/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.test(mailval)) {
			warning();
			return ;
		};
		if (!passval) {
			warning3();
			return ;
		};
		if(passval!== repeatpassval) {
			warning2();
			return ;
		}

		$.ajax({
		    type: "post",
		    url: "?c=User&a=signIn" ,
		    data: {
		    	email: mailval,
		    	password: passval
		    },
			dataType: "json"
		}).done(function(data){
			location.href="http://www.enetf.com";
			var aa=1;
		});
	});
});
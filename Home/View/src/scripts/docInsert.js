require("lib/jquery.form");
$(function() {
	var options = {
	   	// target: '#output',          //把服务器返回的内容放入id为output的元素中      
	   	beforeSubmit: beforeSubmit, //提交前的回调函数  
	   	success: successCallback,  	//提交后的回调函数
	   	dataType: "json",           //html(默认), xml, script, json...接受服务端返回的类型  
	   	// clearForm: true,         //成功提交后，清除所有表单元素的值  
	   	// resetForm: true,         //成功提交后，重置所有表单元素的值  
	   	timeout: 3000               //限制请求的时间，当请求大于3秒后，跳出请求  
	};
	  
	function beforeSubmit(formData, jqForm, options){

		if($("#submit").hasClass("disabled")) {
			return false;
		}

	   	//formData: 数组对象，提交表单时，Form插件会以Ajax方式自动提交这些数据，格式如：[{name:user,value:val },{name:pwd,value:pwd}]  
	   	//jqForm:   jQuery对象，封装了表单的元素
	   	//options:  options对象
	   	var queryString = $.param(formData);   //name=1&address=2  
	   	var formElement = jqForm[0];              //将jqForm转换为DOM对象  
	   	var token = formElement.token.value.trim(),
	   		files = formElement.files.value.trim();

	   	if(!token) {
	   		alert("请输入token");
	   		return false;
	   	}

	   	if(!files) {
	   		alert("请选择要上传的资料");
	   		return false;
	   	}

	   	$("#submit").addClass("disabled");

	   	return true;
	}

	function successCallback(data) {
		if(data.code == "0") {
			$("input[name=files]").val("");
			$("#submit").removeClass("disabled");
			alert("上传成功！");
		} else {
			alert("上传失败！\n"+data.msg);
		}
	}

	$("#docForm").ajaxForm(options);
});
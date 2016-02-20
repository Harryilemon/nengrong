$(function() {

	$(".l-nav").find(".myInformation").addClass("active")
		.children("a").attr("href", "javascript:;");

	// 省市区级联
	require("common/erqi/AreaData");
	require("common/erqi/cascadeSelect");
	$(".detail.part1 .area select").cascadeSelect(AreaData);

	require("common/erqi/customUpload");
	require("lib/jquery.form");
	
	// 上传图片
	$(".detail.part2 .item input[type=file]").customUpload({
		bg_url: "upload.png",
		uploadType: "image",
		width: "120px",
		height: "120px",
		fileSizeLimit: {
			size: 10*1024*1024
		}
	});

	// 上传文件
	$(".detail.part2 .finance input[type=file]").customUpload({
		content: "+",
		uploadType: "file",
		width: "20px",
		height: "38px",
		fileSizeLimit: {
			size: 10*1024*1024
		}
	});

	// 保存资料
	var options = {
		data: {
			rtype: 1
		},
	   	// target: '#output',          //把服务器返回的内容放入id为output的元素中      
	   	beforeSubmit: beforeSubmit, //提交前的回调函数  
	   	success: successCallback,  	//提交后的回调函数
	   	error: failCallback,		//服务器出错的回调函数
	   	dataType: "json",           //html(默认), xml, script, json...接受服务端返回的类型  
	   	// clearForm: true,         //成功提交后，清除所有表单元素的值  
	   	// resetForm: true,         //成功提交后，重置所有表单元素的值  
	   	timeout: 121000             //限制请求的时间，当请求大于121秒后，跳出请求
	};
	  
	function beforeSubmit(formData, jqForm, options) {
		$.loading("正在保存，请稍侯");
	   	return true;
	}

	function successCallback(data) {
		var takeTime = new Date().getTime() - $._loadingDialog.timeStamp;
		setTimeout(function() {
			$.closeLoading();
			if(data.code == "0") {
				alert("保存成功！");
				location.href="?c=ProjectProviderMyPro&a=awaitingAssessment";
			} else {
				alert(data.msg || "保存失败！");
			}
		}, takeTime > 1000 ? 0 : 1000 - takeTime);
	}

	function failCallback(xhr, status, error, $form) {
		var takeTime = new Date().getTime() - $._loadingDialog.timeStamp;
		setTimeout(function() {
			$.closeLoading();
			if(xhr.status === 413) {
				alert("本次提交的附件太大，请尽量上传小附件，或者分批保存再提交！");
			} else {
				alert("操作失败,请稍后再试！");
			}
		}, takeTime > 1000 ? 0 : 1000 - takeTime);
	}

	$form = $("#infoForm");
	$form.validate({
		ignore: ':hidden',
		rules: {
			"company_name": "required",
			"company_contacts": "required",
			"company_contacts_phone": {
				"required": true,
				"mobile": true
			}
		},
		messages: {
			"company_name": "请填写企业名称",
			"company_contacts": "请填写联系人",
			"company_contacts_phone": {
				"required": "请填写联系人手机",
				"mobile": "手机号格式不对"
			}
		},
		errorClass: 'validate-error',
		focusInvalid: true,
   		errorPlacement: function(error, element) {
   			// element.focus();
   		},
   		submitHandler: function(form) {
   			$form.ajaxSubmit(options);
   		},
   		invalidHandler: function(event, validator) {
   			try{
   				alert(validator.errorList[0].message);
   			} catch(ex) {
   			}
   		}
	});

	// $("#infoForm").ajaxForm(options);
});
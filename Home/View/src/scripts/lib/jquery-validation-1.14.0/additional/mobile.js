$.validator.addMethod("mobile", function(value, element) {
	return value && $.trim(value) && /^1[\d]{10}$/.test($.trim(value));
});

$.validator.addMethod("mobileOrPhone", function(value, element) {
	return value && $.trim(value) && ( /^1[\d]{10}$/.test($.trim(value)) || /^\+?[\d\s-]+$/.test($.trim(value)) );
});

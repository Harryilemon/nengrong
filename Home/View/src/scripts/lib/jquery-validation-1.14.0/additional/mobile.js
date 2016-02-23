$.validator.addMethod("mobile", function(value, element) {
	value = value && $.trim(value) || "";
	return !value || /^1[\d]{10}$/.test($.trim(value));
});

$.validator.addMethod("phone", function(value, element) {
	value = value && $.trim(value) || "";
	return !value || /^\+?[\d\s-]+$/.test(value);
});

$.validator.addMethod("mobileOrPhone", function(value, element) {
	value = value && $.trim(value) || "";
	return !value && ( /^1[\d]{10}$/.test(value) || /^\+?[\d\s-]+$/.test(value) );
});

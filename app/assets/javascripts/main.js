
// $("#register-btn").click(function(){
// 	console.log("on click");
// 	$("#register-modal").toggleClass("is-active");
// });

$(document).on('click', '#register-btn', function(){
	$("#register-modal").toggleClass("is-active");
	$("form#register_user_form").bind("ajax:success", function(e, data, status, xhr) {
	  if (data.success) {
	    $("#register-modal").toggleClass("is-active");
	  } else {
	    return alert('failure!');
	  }
	});
});

$(document).on('click', '#register-modal .modal-close', function(){
	$("#register-modal").toggleClass("is-active");

});

$(document).on('click', '#login-btn', function(){
	$("#login-modal").toggleClass("is-active");
	$("form#login_user_form").bind("ajax:success", function(e, data, status, xhr) {
		if (data.success) {
			$("#login-modal").toggleClass("is-active");
		} else {
			return alert('failure!');
		}
	});
});

$(document).on('click', '#login-modal .modal-close', function(){
	$("#login-modal").toggleClass("is-active");
});


// $("#register-btn").click(function(){
// 	console.log("on click");
// 	$("#register-modal").toggleClass("is-active");
// });

$(document).on('click', '#register-btn', function(){
	$("#register-modal").toggleClass("is-active");
});

$(document).on('click', '#register-modal .modal-close', function(){
	$("#register-modal").toggleClass("is-active");
});

$(document).on('click', '#login-btn', function(){
	$("#login-modal").toggleClass("is-active");
});

$(document).on('click', '#login-modal .modal-close', function(){
	$("#login-modal").toggleClass("is-active");
});

$(document).on('click', '#profile-btn', function(){
	$("#profile-modal").toggleClass("is-active");
});

$(document).on('click', '#profile-modal .modal-close', function(){
	$("#profile-modal").toggleClass("is-active");
});

$(document).on('click', '#pay-btn', function(){
	var form = $(this).parent().siblings()[1];
	$(form).toggleClass("is-hidden");
});
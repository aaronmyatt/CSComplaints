
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

$(document).ready(function(){
	$(".photo-slider").unslider({
		arrows:{
			prev: '<a class="unslider-arrow prev"><i class="fa fa-chevron-left"></i></a>',
			next: '<a class="unslider-arrow next"><i class="fa fa-chevron-right"></i></a>'
		},
		nav: true
	});

$(document).on('click', '#profile-btn', function(){
	$("#profile-modal").toggleClass("is-active");
});

$(document).on('click', '#profile-modal .modal-close', function(){
	$("#profile-modal").toggleClass("is-active");
});
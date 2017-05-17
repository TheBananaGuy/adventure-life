
$(document).ready(function(){
	// click on the hamburger icon
	$('#nav-icon').click(function(){
		$(this).toggleClass('open');
		$('#main-nav').toggleClass('open');
	});

	// click on the activity banner arrow down, scrolls until to breadcrumbs
	$('.activity-banner i, .activity-banner-2 i, .activity-banner-3 i').click(function(){
		$('html, body').animate({
			scrollTop: ($(".breadcrumb").offset().top - $('.header').outerHeight())
		}, 1500);
	});
});

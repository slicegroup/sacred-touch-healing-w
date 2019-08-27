// Menú fixed
$(window).scroll(function () {
    if ($(document).scrollTop() > 70 && ($(window).width() >= 768)) {
        $('.navbar-fixed-js').addClass('fixed');
        $("#iso").addClass('img-size').attr('src', 'assets/img/logo-horizontal.png').removeClass('scroll-up');

    } else {
        $('.navbar-fixed-js').removeClass('fixed');
        $("#iso").removeClass('img-size').attr('src', 'assets/img/logo.png').removeClass('scroll-up');

    }
});
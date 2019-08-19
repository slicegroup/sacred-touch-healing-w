/* ---------------------------------------------------------------------------
 * Sticky header
 * --------------------------------------------------------------------------- */
var topBarTop = '61px';
var mfn_header_height = 0;
// header height
function mfn_stickyH() {
    if (jQuery('body').hasClass('header-below')) {
        // header below slider
        mfn_header_height = jQuery('.mfn-main-slider').innerHeight() + jQuery('#Header').innerHeight();
    } else {
        // default
        mfn_header_height = jQuery('#Top_bar').innerHeight() + jQuery('#Action_bar').innerHeight();
    }
}
// init
function mfn_sticky() {
    if (jQuery('body').hasClass('sticky-header')) {
        var start_y = mfn_header_height;
        var window_y = jQuery(window).scrollTop();
        if (window_y > start_y) {
            if (!(jQuery('#Top_bar').hasClass('is-sticky'))) {
                jQuery('.header-classic .header_placeholder').css('height', jQuery('#Top_bar').innerHeight() - jQuery('#Action_bar').innerHeight());
                jQuery('.header-stack   .header_placeholder').css('height', 71);
                jQuery('.header-below   .header_placeholder').css('height', jQuery('#Top_bar').innerHeight());
                jQuery('.minimalist-header .header_placeholder').css('height', jQuery('#Top_bar').innerHeight());
                jQuery('#Top_bar').addClass('is-sticky').css('top', -60).animate({
                    'top': jQuery('#wpadminbar').innerHeight()
                }, 300);
            }
        } else {
            if (jQuery('#Top_bar').hasClass('is-sticky')) {
                jQuery('.header_placeholder').css('height', 0);
                jQuery('#Top_bar').removeClass('is-sticky').css('top', topBarTop);
            }
        }
    }
}
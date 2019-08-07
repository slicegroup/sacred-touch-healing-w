$(document).ready(function () {
  $(".single-item").slick({
    autoplay: true,
    autoplaySpeed: 3000,
    speed: 500,
    infinite: true,
    cssEase: 'linear',
    fade: true,
    arrows: true,
    dots: true,
    responsive: [{
      breakpoint: 600,
      settings: {
        slidesToShow: 1,
        slidesToScroll: 1,
        arrows: false

      }
    }]
  });
});


$('.slider-license').slick({
  infinite: true,
  autoplay: false,
  slidesToShow: 3,
  slidesToScroll: 1,
  dots: true,
  arrows: true,
  responsive: [{
      breakpoint: 1200,
      settings: {
        slidesToShow: 3,
        slidesToScroll: 1,
        infinite: true,
        dots: false
      }
    },
    {
      breakpoint: 900,
      settings: {
        slidesToShow: 2,
        slidesToScroll: 1
      }
    },
    {
      breakpoint: 600,
      settings: {
        slidesToShow: 1,
        slidesToScroll: 1,
        dots: false,
        autoplay: true,
        arrows: false,
        autoplaySpeed: 1000
      }
    }
  ]
});


$('.slider-services').slick({
  infinite: true,
  autoplay: true,
  slidesToShow: 3,
  slidesToScroll: 1,
  dots: false,
  arrows: true,
  responsive: [{
      breakpoint: 1200,
      settings: {
        slidesToShow: 3,
        slidesToScroll: 1,
        infinite: true,
        dots: false
      }
    },
    {
      breakpoint: 900,
      settings: {
        slidesToShow: 2,
        slidesToScroll: 1
      }
    },
    {
      breakpoint: 600,
      settings: {
        slidesToShow: 1,
        slidesToScroll: 1,
        dots: false,
        autoplay: true,
        arrows: false,
        autoplaySpeed: 1000
      }
    }
  ]
});
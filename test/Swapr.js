var swiper = new Swiper(".mySwiper", {
    slidesPerView: 1,
    spaceBetween: 8,
    slidesPerGroup: 1,
    loop: true,
    loopFillGroupWithBlank: true,
    pagination: {
      el: ".swiper-pagination",
      clickable: true,
    },
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    },
    breakpoints:{

      450: {
        slidesPerView: 2,
        spaceBetweenSlides: 8
    },
      680: {
        slidesPerView: 3,
        spaceBetweenSlides: 8
    },
    780: {
      slidesPerView: 4,
      spaceBetweenSlides: 8
    },

    },
    
  });





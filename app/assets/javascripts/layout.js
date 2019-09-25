$(document).ready(function(){

  let str = 'mentions_legales';
  let url = document.documentURI;

  // links:hover
  let home = document.querySelectorAll('.nav-item a')[0];
  let portfolio = document.querySelectorAll('.nav-item a')[1];
  if (url.includes(str)){
    portfolio.classList.add('on')
  } else {
    home.classList.add('on')
  };

  // scrolling for nav links
  if (!(url.includes(str))){
    let scrollLink = $('.nav-link');
    scrollLink.click(function (e) {
      e.preventDefault();
      $('body,html').animate({
          scrollTop: $(this.hash).offset().top
      })
  })
  };
  
});

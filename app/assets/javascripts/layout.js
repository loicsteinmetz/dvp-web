$(document).ready(function(){

  let str = 'portfolio';
  let url = document.documentURI;
  let home = document.querySelectorAll('.nav-item a')[0];
  let portfolio = document.querySelectorAll('.nav-item a')[1];
  if (url.includes(str)){
    portfolio.classList.add('on')
  } else {
    home.classList.add('on')
  };
  
});

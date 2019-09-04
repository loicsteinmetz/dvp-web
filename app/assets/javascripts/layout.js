$(document).ready(function(){

  let regex = RegExp('portfolio/$');
  let url = document.url;
  let home = document.querySelectorAll('.nav-item a')[0];
  let portfolio = document.querySelectorAll('.nav-item a')[1];
  if (regex.test(url)){
    portfolio.classList.add('on')
  } else {
    home.classList.add('on')
  };
  
});

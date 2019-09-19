function quitModalBtn(){
    $('#quit_modal').click(function(){
    $('.modal').remove();
    $('.modal-backdrop').remove();
    $('body').toggleClass('modal-open');
    $('body')[0].style.paddingRight = '';
  })
}
function quitModal(){
  $('.modal').remove();
  $('.modal-backdrop').remove();
  $('body').toggleClass('modal-open');
  $('body')[0].style.paddingRight = '';
}
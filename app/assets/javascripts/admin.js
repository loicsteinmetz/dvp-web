function quitModal(){
    $('#quit_modal').click(function(e){
    $('.modal').remove();
    $('.modal-backdrop').remove();
    $('body').toggleClass('modal-open');
    $('body')[0].style.paddingRight = '';
  })
}
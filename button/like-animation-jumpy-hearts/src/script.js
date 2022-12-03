$('a.like-button').on('click', function(e) {
  $(this).toggleClass('liked');
  
  setTimeout(() => {
    $(e.target).removeClass('liked')
  }, 1000)
});
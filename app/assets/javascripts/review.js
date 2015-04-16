$('#reviewForm').click(function(e) {
  e.preventDefault();

  if ($('.submit-review').is(':hidden')) {
    $('.submit-review').show();
    $('#text-area').focus();
  } else {
    $('.submit-review').slideUp('slow');
  }
});

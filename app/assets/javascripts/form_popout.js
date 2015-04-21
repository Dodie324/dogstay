$('#share-images').click(function(e) {
  e.preventDefault();

  if ($('#image-upload').is(':hidden')) {
    $('#image-upload').slideDown('slow');
  } else {
    $('#image-upload').slideUp('slow');
  }
});

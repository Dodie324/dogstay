$('#reviewForm').click(function(e) {
  e.preventDefault();

  if ($('.submit-review').is(':hidden')) {
    $('.submit-review').show();
    $('#text-area').focus();
  } else {
    $('.submit-review').slideUp('slow');
  }
});

$(".fi-pencil").click(function(e) {
  e.preventDefault();
  var review_id = this.id;
  var paw_count = $(".paws_" + review_id).length;
  var review_body = $("#review_body_" + review_id).text();

  $(".paws_" + review_id).remove();
  $("#review_body_" + review_id).remove();
  $("#timestamp_" + review_id).remove();

  $("#rating_section_" + review_id).append(selectBox(review_id, paw_count));
  $("#text_" + review_id).append(reviewBody(review_id, review_body));
  $("#text_" + review_id).append(submitButton(review_id));

  $(this).hide();
});

$(document.body).on('click', '.editButton' , function(e) {
  e.preventDefault();
  var ReviewId = this.id.split("_")[1];
  var SitterId = window.location.pathname.split("/")[2];
  var PawCount = $("#review_rating_" + ReviewId).val();
  var ReviewBody = $("#review_body_" + ReviewId).val();

  $.ajax({
    type: "PUT",
    url: "/sitters/" + SitterId + "/reviews/" + ReviewId,
    dataType: "json",
    data: { review: { rating: PawCount, body: ReviewBody } }
  })

  .done(function(review) {
    $("#review_rating_" + ReviewId).remove();
    $("#review_body_" + ReviewId).remove();
    $("#submitButton_" + ReviewId).remove();

    $("#rating_section_" + ReviewId).append(paws(ReviewId, PawCount));
    $("#text_" + ReviewId).append(bodyEdit(ReviewId, ReviewBody));
    $("#review_date_" + ReviewId).append(updatedAt(ReviewId, review.updated_at));

    $(".fi-pencil#" + ReviewId).show();
    $(".edit_errors_" + ReviewId).html("");
  })
  .fail(function(jqXHR, textStatus, errorThrown) {
    var errors = $.parseJSON(jqXHR.responseText).errors;
    $(".edit_errors_" + ReviewId).html("");
    for(var i = 1; i < errors.length; i++) {
      $(".edit_errors_" + ReviewId).append(errors[i]);
    }
  });

});

function selectBox(id, selectedValue) {
  var html = "<select name='review[rating]' id='review_rating_" + id + "'><option value=''>Please Rate</option>";
  for(var i = 1; i < 6; i++) {
    if(i === selectedValue) {
      html += "<option selected='selected' value='" + i + "'>" + i + "</option>";
    } else {
      html += "<option value='" + i + "'>" + i + "</option>";
    }
  }
  html += "</select>";
  return html;
};

function reviewBody(id, text) {
  var html = "<textarea name='review[body]' id='review_body_" + id + "'>" + text + "</textarea>";
  return html;
};

function submitButton(id) {
  var html = "<input type='submit' name='commit' value='Edit Review' class='button postfix editButton' id='submitButton_" + id + "'>"
  return html;
};

function paws(id, paw_count) {
  var html = "";
  for(var i = 0; i < paw_count; i++) {
    html += "<li class='paws_" + id + "'><i class='fa fa-paw'></i></li>";
  }
  return html;
};

function bodyEdit(id, reviewBody) {
  var html = "<p id='review_body_" + id + "'>" + reviewBody + "</p>";
  return html;
}

function updatedAt(id, timestamp) {
  var d = new Date(timestamp);
  var modified_timestamp = d.toLocaleDateString();
  var html = "<p id='timestamp_" + id + "'>" + modified_timestamp + "</p>";
  return html;
}

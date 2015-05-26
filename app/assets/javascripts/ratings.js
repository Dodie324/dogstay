function buildPawIcon(index){
  var $icon = $("<i>").addClass("fa fa-paw");

  return $("<a>")
  .attr("href", "#")
  .attr("data-rating", index + 1)
  .attr("id", "star-" + (index + 1))
  .html($icon);
}

function buildPawList(pawNum){
  var pawList = [];

  for(var i = 0; i < pawNum; i++){
    pawList.push(buildPawIcon(i));
  }
  return pawList;
}

function handlePawClick(event) {
  event.preventDefault();

  var $pawClicked = $(event.currentTarget);
  var rating = $pawClicked.attr("data-rating");

  $pawClicked.prevAll("a").andSelf().find("i")
    .removeClass("fa fa-paw-o")
    .addClass("fa fa-paw");

  $pawClicked.nextAll("a").find("i")
    .removeClass("fa fa-paw")
    .addClass("fa fa-paw-o");

  var $hidden = $("#review_rating");
  $hidden.val(rating);
}

$(function(){
  $("#paw-ratings").append(buildPawList(5));
  $("#paw-ratings a").on("click", handlePawClick);
});

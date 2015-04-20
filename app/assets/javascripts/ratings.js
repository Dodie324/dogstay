function buildStarIcon(index){
  var $icon = $("<i>").addClass("fa fa-paw");

  return $("<a>")
  .attr("href", "#")
  .attr("data-rating", index + 1)
  .attr("id", "star-" + (index + 1))
  .html($icon);
}

function buildStarList(starNum){
  var starList = [];

  for(var i = 0; i < starNum; i++){
    starList.push(buildStarIcon(i));
  }
  return starList;
}

function handleStarClick(event) {
  event.preventDefault();

  var $starClicked = $(event.currentTarget);
  var rating = $starClicked.attr("data-rating");

  $starClicked.prevAll("a").andSelf().find("i")
    .removeClass("fa fa-paw-o")
    .addClass("fa fa-paw");

  $starClicked.nextAll("a").find("i")
    .removeClass("fa fa-paw")
    .addClass("fa fa-paw-o");

  var $hidden = $("#review_rating");
  $hidden.val(rating);
}


$(function(){
  $("#star-ratings").append(buildStarList(5));
  $("#star-ratings a").on("click", handleStarClick);
});

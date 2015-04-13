$(document).ready(function () {
    toggleFields();
    $("#user_sitter").change(function () {
        toggleFields();
    });
});
function toggleFields() {
    if ($("#user_sitter").val() == "true") {
      $("#sitter_profile").show();
    } else {
      $("#sitter_profile").hide();
    }
}

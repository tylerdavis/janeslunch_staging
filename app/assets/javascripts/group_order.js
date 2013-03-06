$(function() {
  var item;
  var check = $("<div class=\"selected\"><i class=\"icon-ok icon-white\"></i></div>");
  $(".choice").click(function(event) {
    $(".selected").remove();
    $(this).prepend(check);
    item = this.id;
  });
  $('#submit-order').click(function(event) {
    $.post('/' + window.group + '/order', {
      item : item,
      groupOrder : window.groupOrder
    });
  });
});
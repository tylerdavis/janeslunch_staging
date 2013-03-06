$(function() {

  var item;
  
  var check = $("<div class=\"selected\"><i class=\"icon-ok icon-white\"></i></div>");
  
  // Check mark for selection
  $(".choice").click(function(event) {
    $(".selected").remove();
    $(this).prepend(check);
    item = this.id;
    $('#pop-modal').fadeIn();
  });

  $('#pop-modal').click(function(event) {
    // $.getJSON('/items/'+ item + '.json', function(data) {
    $.getJSON('/items/88.json', function(data) {
      $('#myModalLabel').html(data.name);

      for (var i = 0; i < data.options.length; i++) {
        console.log(data.options[i].name);
      }
    })
    .success(function() { console.log("Item request success"); })
    .error(function() { console.log("error"); })
    .complete(function() { console.log("complete"); });
  });
  
  // Post order
  $('#submit-order').click(function(event) {
    $.post('/' + window.group + '/order', {
      item : item,
      groupOrder : window.groupOrder
    });
  });
});
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
    $.getJSON('/items/'+ item + '.json', function(data) {
    // $.getJSON('/items/88.json', function(data) {
      $('#myModalLabel').html(data.name);

      var container = $('#option-column');
      container.html('');

      for (var i = 0; i < data.options.length; i++) {

        var option = $('<div class="option"></div>');
        var optionLabel = $('<legend>' + data.options[i].name + '</legend>');
        option.append(optionLabel);
        for (var j = 0; j < data.options[i].suboptions.length; j++) {
          var price = data.options[i].suboptions[j].price === 0 ? '' : ' - <em>+$' + data.options[i].suboptions[j].price + '</em>';
          var suboption = $('<div class="suboption"><label class="checkbox"><input type="checkbox">' + data.options[i].suboptions[j].name + price + '</label></div>');
          option.append(suboption);
        }
        container.append(option);
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
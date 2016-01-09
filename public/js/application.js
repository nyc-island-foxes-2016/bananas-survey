$(document).ready(function() {

  $('#create-survey').on("submit", function(event){
    event.preventDefault();
    $.ajax({
      type: "POST",
      url: "/surveys",
      data: $(this).serialize()
    }).done(function(response){
      $('.container').append(response);
    });
  });

  $('.container').on("submit", '#create-question', function(event){
    event.preventDefault();
    $.ajax({
      type: "POST",
      url: "/questions",
      data: $(this).serialize()
    }).done(function(response){
      $('.container').append(response);
    });
  });

});

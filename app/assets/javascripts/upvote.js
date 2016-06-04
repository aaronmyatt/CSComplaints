$(function() {
  $('#upvote_arrow').click(function() {
    $.ajax({
        type: "POST",
        url:"/upvote",
        data:{
            id: $('#upvote_arrow').data('complaint-id')
        },
        dataType: 'JSON',
        success: function(data, status){

        }
      });
  });
});

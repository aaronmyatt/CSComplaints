$(function() {
  $('.upvote_arrow').click(function() {
    $.ajax({
        type: "POST",
        url:"/upvote",
        data:{
            id: $(this).data('complaint-id')
        },
        dataType: 'JSON',
        success: function(data, status){

        }
      });
  });
});

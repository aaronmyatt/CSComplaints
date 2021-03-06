$(function() {
  $('.upvote_arrow').click(function() {
    var id = $(this).data('complaint-id')
    $.ajax({
        type: "POST",
        url:"/upvote",
        data:{
            id: id
        },
        dataType: 'JSON',
        success: function(data, status){
          vote_count = '#vote_count_'+id
          $(vote_count).text(data["upvotes"]).fadeOut(300).fadeIn(300)
        }
      });
  });
});

$(function() {
  $('.downvote_arrow').click(function() {
    var id = $(this).data('complaint-id')
    $.ajax({
        type: "POST",
        url:"/downvote",
        data:{
            id: id
        },
        dataType: 'JSON',
        success: function(data, status){
          vote_count = '#vote_count_'+id
          $(vote_count).text(data["upvotes"]).fadeOut(300).fadeIn(300)
        }
      });
  });
});

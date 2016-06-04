function getLocations( search ){
  $.ajax({
    url: "/locations/search",
    dataType: "JSON",
    method: "POST",
    data: { search: search }
  })
  .done(function(data){
    console.log('asdasd');
    $("#search_results").html(data);
  });
}

$(document).on('keyup', '#search', function(){
  var search = $(this).val();

  if(search.length < 4){
    return false;
  }

  if(typeof window.search_delay != "undefined"){
    window.clearTimeout(window.search_delay);
    window.search_delay = undefined;
  }

  window.search_delay = window.setTimeout(1000, getLocations(search));
});
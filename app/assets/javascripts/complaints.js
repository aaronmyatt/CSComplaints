var delay_search = function(ms, func){
  window.search_delay = window.setTimeout(func, ms);
}

function getLocations(){
  $.ajax({
    url: "/locations/search",
    dataType: "JSON",
    method: "post",
    data: { search: search }
  })
  .done(function(data){
    console.log(data);
  });
}

$(document).on('keyup', '#search', function(){
  var search = $(this).val();

  if(search.length < 3){
    return false;
  }

  if(typeof window.search_delay != "undefined"){
    window.clearTimeout(window.search_delay);
  }

  delay_search(1000, getLocations());
});
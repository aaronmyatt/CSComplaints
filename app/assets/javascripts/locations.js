var delay;
delay = function(ms, func) {
  return window.delay_id = setTimeout(func, ms);
};

function getLocations( search ){
  $.get("/locations/search?search="+encodeURIComponent(search), function(data){
    $("#search_results").html(data);
  });
}

$(function() {
  return $(document).on("keyup", "#search", function() {
    var search = $(this).val();

    if (typeof delay_id !== "undefined" && delay_id !== null) {
      clearTimeout(window.delay_id);
    } else {
      $("#search_results").html("Loading...");
    }

    return delay(1000, function() {
      return getLocations(search);
    });
  });
});
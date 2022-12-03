$(".btn-circle-download").click(function() {
  $(this).addClass("load");
  setTimeout(function() {
    $(".btn-circle-download").addClass("done");
  }, 1000);
  setTimeout(function() {
    $(".btn-circle-download").removeClass("load done");
  }, 5000);
});
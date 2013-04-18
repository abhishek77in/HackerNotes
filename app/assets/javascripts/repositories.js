$(document).ready(function() {
  // $(".fancySelectBox").selectBox();
  slider();
});

function slider () {
  $('nav ul li a').click(function() {
    $('nav ul li').removeClass('active');
    $(this).parent().addClass('active');
  });
}

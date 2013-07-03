$(document).ready(function() {
  // $(".fancySelectBox").selectBox();
  slider();
  showSelectBox();
});

function showSelectBox() {
  $('input#url').focus(function() {
    $('select#resource').removeClass('hidden');
  });
}

function slider () {
  $('nav ul li a').click(function() {
    $('nav ul li').removeClass('active');
    $(this).parent().addClass('active');
  });
}

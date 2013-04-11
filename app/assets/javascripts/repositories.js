$(document).ready(function() {
  $(".fancySelectBox").selectBox();

  slider();
});

function slider () {
  $('nav ul li a').click(function() {
    console.log('1');
    console.log(this);
    $('nav ul li').removeClass('active');
    console.log('2');
    $(this).parent().addClass('active');
    console.log('3');
  });
}

$(document).ready(function () {
  function vote(that, data) {
    $.ajax({
      type: 'PUT',
      url: '/vote',
      data: data,
      success: function (result) {
        $(that).parent().find('span').text(result);
      }
    });
  }

  function getData(that, direction) {
    var resource_type = $(that).data('resource_type');
    var id = $(that).data('id');
    pathname = window.location.pathname.split('/');
    var owner = pathname[1];
    var name = pathname[2];

    return { 'owner' : owner,
      'name' : name,
      'resource_type' : resource_type,
      'direction' : direction,
      'id' : id }
  }

  $('.voteUp').click(function(e) {
    e.preventDefault();
    data = getData(this, 'up');
    vote(this, data);
  });

  $('.voteDown').click(function(e) {
    e.preventDefault();
    data = getData(this, 'down');
    vote(this, data);
  });

  $('section .resource').hover(function() {
    $(this).find('.voteContainer').toggleClass('hidden');
  });

});

$(document).ready(function () {
  function vote(data) {
    $.ajax({
      type: 'POST',
      url: '/vote',
      data: data,
      success: function (result) {
       $('this element').html(result);
      }
    });
  }

  function getData(that, direction) {
    var resource = $(that).data('resource');
    var id = $(that).data('id');
    pathname = window.location.pathname.split('/');
    var owner = pathname[1];
    var name = pathname[2];

    return { 'owner' : owner,
      'name' : name,
      'resource' : resource,
      'direction' : direction,
      'id' : id }
  }

  $('.voteUp').click(function() {
    data = getData(this, 'up');
    vote(data);
  });

  $('.voteDown').click(function() {
    data = getData(this, 'down');
    vote(data);
  });

});

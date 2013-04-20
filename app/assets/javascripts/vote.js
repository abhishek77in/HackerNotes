$(document).ready(function () {
  function vote(data) {
    $.ajax({
      type: 'PUT',
      url: '/vote',
      data: data,
      success: function (result) {
        console.log(result);
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
    console.log(data)
    vote(data);
  });

  $('.voteDown').click(function(e) {
    e.preventDefault();
    data = getData(this, 'down');
    console.log(data)
    vote(data);
  });

});

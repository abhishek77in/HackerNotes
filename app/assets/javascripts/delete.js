$(document).ready(function () {
  function remove(that, data) {
    $.ajax({
      type: 'DELETE',
      url: '/remove',
      data: data,
      success: function (result) {
        $(that).closest('.resource').remove();
      }
    });
  }

  function getData(that) {
    var resource_type = $(that).data('resource_type');
    var id = $(that).data('id');
    pathname = window.location.pathname.split('/');
    var owner = pathname[1];
    var name = pathname[2];

    return { 'owner' : owner,
      'name' : name,
      'resource_type' : resource_type,
      'id' : id }
  }

  $('.remove').click(function(e) {
    e.preventDefault();
    data = getData(this);
    remove(this, data);
  });

});

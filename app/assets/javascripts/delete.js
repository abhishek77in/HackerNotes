$(document).ready(function () {
  function remove(that, data) {
    $.ajax({
      type: 'DELETE',
      url: '/remove',
      data: data,
      success: function (result) {
        $(that).parent().find('span').text(result);
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
    if ($('#status').val() === 'true'){
      data = getData(this);
      console.log('data:');
      console.log(data);
      remove(this, data);
    } else {
      alert('Please login with Github to vote');
    }
  });

});

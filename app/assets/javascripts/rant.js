var postRant = function () {
  $('.create-rant-button').click(function (e) {
    e.preventDefault();

    var url = $(this).parents('form').attr('action');

    $.post(url, JSONdata(), function (rantData) {
        eraseInputFields();
        setFlash();
        updateMyRants(rantData);
    }).fail(function(){
        displayErrors();
    })

  })
};

var displayErrors = function() {
  $('.profile').prepend('<div class="errors"><li>There was an error. ' +
    'Rant was not created successfully</li></div>')
};

var updateMyRants = function(rantData) {

  $.getJSON("/users/"+rantData.user_id, function(user){
    $('#my_rants').after('<div class="rants"><div id="profile">' +
      '<a href="/users/' + rantData.user_id + '">' + user.first_name + '</a>' +
      '<img src="' + user.url + '"></div>' + '<div id="rant_body">' +
      '<a href = "/users/' + rantData.user_id + '/rants/' + rantData.id +
      '" id="rant">' + rantData.rant + '</a></div>' +
      '<a data-method="delete" href="/users/' + rantData.user_id +
      '/rants/' + rantData.id + '" id="delete" rel="nofollow">Delete</a></div>')
  })
};

var setFlash = function() {
  $('.profile').prepend('<div class="notice">Rant has been successfully created</div>')
};

var eraseInputFields = function() {
  $('#rant_rant').val("");
  $('#rant_category').val("");
};

var JSONdata = function () {
  return {rant: {
    rant: $('#rant_rant').val(),
    category: $('#rant_category').val()
  }}
};

$(document).ready(function () {

  postRant()
});


var followLink = function (element) {
  $(element).click( function(e) {
    e.preventDefault();
    e.stopPropagation();
    postFollow(this)
  });
};

var postFollow = function(link) {
  url = $(link).attr('href');
  $.post(url).success(changeFollowLink(url))
};

var changeFollowLink = function(url) {
  $("a[href='" + url + "']").each(function () {
    $(this).text('Unfollow');
    $(this).removeClass('follow');
    $(this).addClass('unfollow');
    unfollowLink(this)
  })
};

var unfollowLink = function (element) {
  $(element).click( function(e) {
    e.preventDefault();
    e.stopPropagation();
    deleteFollow(this)
  });
};

var deleteFollow = function(link) {
  url = $(link).attr('href');
  $.ajax( {
    url: url,
    method: 'DELETE',
    success: changeUnFollowLink(url)
  })
};

var changeUnFollowLink = function(url) {
  $("a[href='" + url + "']").each(function () {
    $(this).text('Follow');
    $(this).removeClass('unfollow');
    $(this).addClass('follow');
    followLink(this)
  })
};

$(document).ready(function() {
    var follows = $('.follow');

    followLink(follows);

    var unfollows = $('.unfollow');

    unfollowLink(unfollows);
}

);

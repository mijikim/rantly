$(document).ready(function () {
  $("a[class^='favorite']").on('click', function (event) {
    event.preventDefault();
    event.stopPropagation();
    var div = $(this);
    var user_id = $(this).data('user');
    var rant_id = $(this).data('rant');
    var url = "/users/" + user_id + "/rants/" + rant_id + "/favorites";
    $.post(
      url,
      {
        rant_id: rant_id
      },
      function (rantData) {
        if(rantData.msg == "Success")
        {
          div.removeClass("favorite-"+rant_id);
          div.addClass("unfavorite-"+rant_id);
          div.html('Unfavorite');
          favorite_count = $("#favorite-count-"+rant_id).html();
          $("#favorite-count-"+rant_id).html(parseInt(favorite_count)+1);
        }else{
          alert("There was an issue");
        }

      });
  });

  $("a[class^='unfavorite']").on('click', function (event) {
    event.preventDefault();
    event.stopPropagation();
    var div = $(this);
    var user_id = $(this).data('user');
    var rant_id = $(this).data('rant');
    var url = "/users/" + user_id + "/rants/" + rant_id + "/favorite";
    $.ajax({
        url: url,
        type: "DELETE",
        success: function(rantData){
          if(rantData.msg == "Success")
          {
            div.addClass("favorite-"+rant_id);
            div.removeClass("unfavorite-"+rant_id);
            div.html('Favorite');
            favorite_count = $("#favorite-count-"+rant_id).html();
            $("#favorite-count-"+rant_id).html(parseInt(favorite_count)-1);

          }else{
            alert("There was an issue");
          }
        }

      });
  });
});

//
//$(document).ready(function () {
//
//  $('body').on('click', '.follow-button', function (event) {
//    event.preventDefault();
//    var button = this;
//    var toggleFollowButton = function () {
//      $(button).removeClass('follow-button').addClass('unfollow-button').empty()
//        .append('Unfollow');
//    };
//    var id = $(this).data('id');
//    var promiseOfResultFollow = $.post("/users/" + id + "/follows", {follow_id: id});
//    promiseOfResultFollow.success(toggleFollowButton($(this)));
//  });
//
//  $('body').on('click', '.unfollow-button', function (event) {
//    event.preventDefault();
//    console.log(event);
//
//    var id = $(this).data('id');
//    var url = "/users/" + id + "/follows/" + id;
//    console.log(url);
//    var promiseOfResultUnfollow = $.ajax({
//      url: url,
//      type: "DELETE"});
//    promiseOfResultUnfollow.success(toggleUnfollowButton($(this)));
//  });
//
//  var toggleUnfollowButton = function (button) {
//    console.log(button);
//    button.empty().append('Follow').removeClass('unfollow-button')
//      .addClass('follow-button');
//  };
//});
//
//
//var favorite = function(button) {
//  $(button).on('click', function (e) {
//    e.preventDefault();
//    var rant_id = $(this).data("rant-id");
//    var rant = $(this);
//    $.ajax({type: "POST", url: ("/rants/" + rant_id + "/favorites"), data: {rant_id: rant_id}})
//      .success(function (data) {
//        var intCount = parseInt(rant.parentsUntil('.favorite-wrap').children('.fav-count').text());
//        intCount += 1;
//        var fav_wrap = rant.parentsUntil('.favorite-wrap');
//        fav_wrap.children('.fav-count').text(intCount);
//        fav_wrap.children('form').replaceWith(data);
//        var unfavoriteButton = $(".unfavorite");
//        unfavorite(unfavoriteButton);
//      });
//  });
//};
//
//var unfavorite = function(button) {
//  $(button).on('click', function (e) {
//    e.preventDefault();
//    var rant_id = $(this).data("rant-id");
//    var fav_id = $(this).data("id");
//    var rant = $(this);
//    $.ajax({type: "DELETE", url: ("/rants/" + rant_id + "/favorites/" + fav_id), data: {rant_id: rant_id}})
//      .success(function (data) {
//        var intCount = parseInt(rant.parentsUntil('.favorite-wrap').children('.fav-count').text());
//        intCount -= 1;
//        var fav_wrap = rant.parentsUntil('.favorite-wrap');
//        fav_wrap.children('.fav-count').text(intCount);
//        fav_wrap.children('form').replaceWith(data);
//        var favoriteButton = $(".favorite");
//        favorite(favoriteButton);
//      });
//  });
//};
//
////  make another function for unfavorite button on favorites page
//// to remove rant from page on success of unfav
//
//var favoriteButton = $(".favorite");
//var unfavoriteButton = $(".unfavorite");
//
//favorite(favoriteButton);
//unfavorite(unfavoriteButton);
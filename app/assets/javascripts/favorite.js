$(document).ready(function () {
  var favorite = function(elements) {
    elements.one('click', function (event) {
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
          if (rantData.msg == "Success") {
            div.removeClass("favorite-" + rant_id);
            div.addClass("unfavorite-" + rant_id);
            div.html('Unfavorite');
            favorite_count = $("#favorite-count-" + rant_id).html();
            $("#favorite-count-" + rant_id).html(parseInt(favorite_count) + 1);
            unfavorite(div);
          } else {
            alert("There was an issue");
          }

        });
    });
  }

  var unfavorite = function(elements) {
    elements.one('click', function (event) {
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
            favorite(div);
          }else{
            alert("There was an issue");
          }
        }

      });
    });
  }

  favorite($("a[class^='favorite']"));
  unfavorite($("a[class^='unfavorite']"));
});


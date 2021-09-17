$(function() {
  let stars = $(".rating-stars").children();
  let hidden_rate = $("#review_star");
  $.each(stars, function (index, element) { 
    $(element).mouseover(function () { 
      for(i = 0; i < stars.length; i++) {
        $(stars[i]).removeClass("fas fa-star");
        $(stars[i]).addClass("far fa-star");
      }

      for(i = 0; i <= index; i++) {
        $(stars[i]).removeClass("far fa-star");
        $(stars[i]).addClass("fas fa-star");
      }
    });
  });

  $.each(stars, function (index, element) { 
    $(element).click(function () { 
      for(i = 0; i < stars.length; i++) {
        $(stars[i]).removeClass("fas fa-star");
        $(stars[i]).addClass("far fa-star");
      }

      for(i = 0; i <= index; i++) {
        $(stars[i]).removeClass("far fa-star");
        $(stars[i]).addClass("fas fa-star");
      }

      hidden_rate.val(index + 1);
    });
  });

  $.each(stars, function (index, element) { 
    $(element).mouseout(function () { 
      for(i = 0; i < stars.length; i++) {
        $(stars[i]).removeClass("fas fa-star");
        $(stars[i]).addClass("far fa-star");
      }

      for(i = 0; i < hidden_rate.val(); i++) {
        $(stars[i]).removeClass("far fa-star");
        $(stars[i]).addClass("fas fa-star");
      }
    });
  });
});
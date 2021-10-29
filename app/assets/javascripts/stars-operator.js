$(function() {
  var TOTAL_STARS = 5;
  var stars = $(".rating-star");
  var hidden_field = $("#evaluation_star");

  function changeStarsCSSClass (star_num, rm_class, add_class) {
    for(var i = 0; i < star_num; i++) {
      $(`#star_${i}`).removeClass(rm_class);
      $(`#star_${i}`).addClass(add_class);
    };
  };

  function changeStarsColor (rate) {
    changeStarsCSSClass(TOTAL_STARS, "fas fa-star", "far fa-star");
    changeStarsCSSClass(rate, "far fa-star", "fas fa-star");
  };

  stars.mouseover(function () { 
    var rate = Number($(this).attr('id').match(/\d/i)[0]) + 1;

    changeStarsColor(rate);
  });

  stars.click(function () { 
    var rate = Number($(this).attr('id').match(/\d/i)[0]) + 1;

    changeStarsColor(rate);
    hidden_field.val(rate);
  });

  stars.mouseout(function () { 
    changeStarsColor(hidden_field.val());
  });
});
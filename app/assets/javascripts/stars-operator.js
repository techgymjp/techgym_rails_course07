$(function() {
  const TOTAL_STARS = 5;
  const stars = $(".rating-stars");
  const hidden_field = $("#review_star");

  function changeStarsCSSClass (star_num, rm_class, add_class) {
    for(i = 0; i < star_num; i++) {
      $(`#star_${i}`).removeClass(rm_class);
      $(`#star_${i}`).addClass(add_class);
    };
  };

  function paintStars (rate_num) {
    changeStarsCSSClass(TOTAL_STARS, "fas fa-star", "far fa-star");
    changeStarsCSSClass(rate_num, "far fa-star", "fas fa-star");
  };

  stars.mouseover(function () { 
    const rate_num = Number($(this).attr('id').match(/\d/i)[0]) + 1;

    paintStars(rate_num);
  });

  stars.click(function () { 
    const rate_num = Number($(this).attr('id').match(/\d/i)[0]) + 1;

    paintStars(rate_num);
    hidden_field.val(rate_num);
  });

  stars.mouseout(function () { 
    paintStars(hidden_field.val());
  });
});
$(function() {
  const total_stars = 5;
  let hidden_rate = $("#review_star");
  for(i = 0; i < total_stars; i++) {
    $(`#star_${i}`).mouseover(function () { 
      const id_num = Number($(this).attr('id').match(/\d/i)[0]);
      for(j = 0; j < total_stars; j++) {
        $(`#star_${j}`).removeClass("fas fa-star");
        $(`#star_${j}`).addClass("far fa-star");
      }

      for(j = 0; j <= id_num; j++) {
        $(`#star_${j}`).removeClass("far fa-star");
        $(`#star_${j}`).addClass("fas fa-star");
      }
    });

    $(`#star_${i}`).click(function () { 
      const id_num = Number($(this).attr('id').match(/\d/i)[0]);
      for(j = 0; j < total_stars; j++) {
        $(`#star_${j}`).removeClass("fas fa-star");
        $(`#star_${j}`).addClass("far fa-star");
      }

      for(j = 0; j <= id_num; j++) {
        $(`#star_${j}`).removeClass("far fa-star");
        $(`#star_${j}`).addClass("fas fa-star");
      }

      hidden_rate.val(id_num + 1);
    });

    $(`#star_${i}`).mouseout(function () { 
      for(j = 0; j < total_stars; j++) {
        $(`#star_${j}`).removeClass("fas fa-star");
        $(`#star_${j}`).addClass("far fa-star");
      }

      for(j = 0; j < hidden_rate.val(); j++) {
        $(`#star_${j}`).removeClass("far fa-star");
        $(`#star_${j}`).addClass("fas fa-star");
      }
    });
  };
});
"use strict";

$(function () {

  //导航固定
  $(document).scroll(function() {
      var toppos = $(this).scrollTop();

      if(toppos>100){
        $(".navbg").addClass("topnavbox");
      }else{
        $(".navbg").removeClass("topnavbox");
      }
    });

  $('#showSearchInputBtn').click(function () {
    $("#headerNav").addClass('showSearch');
    $('#headerSearchInput').find('input').focus();

  });

  $('#headerSearchInput input')
    .blur(function () {
      $("#headerNav").removeClass('showSearch');

    });
});

$(function () {
  //侧边栏菜单
  $("#nav").children("li").click(function () {
    $(this).siblings().collapse('hide');

    // 图标切换
    $(this).find("span").toggleClass("glyphicon-chevron-down");
    $(this).find("span").toggleClass("glyphicon-chevron-right");
  });

});

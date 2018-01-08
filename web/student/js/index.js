$(function () {
  sT();
});

var ksTime; //定义考试时间以分钟计算
ksTime = 120;//设置时间 这里设置为0.1代表是6秒,测试用
if (readCookie("ss") == "") {
  setCookie("ss", new Date(), ksTime / 60);
}

function sT() {
  var tti = new Date();
  var lt = parseInt((tti - new Date(readCookie("ss"))) / 1000)
  if ((ksTime * 60 - lt) < 0) {
    setCookie("ss", new Date(), 0);
    alert("考试时间到!\n即将提交试卷!");
    document.forms[0].submit();
  } else {
    lm = Math.floor(lt / 60);
    ls = lt % 60;
    allY = ksTime * 60 - lt;
    ym = Math.floor(allY / 60);
    ys = allY % 60;
    document.getElementById("tTime").innerHTML = "考试已经开始了" + lm + "分" + ls + "秒" + ",剩余" + ym + "分" + ys + "秒";
    var ttt = setTimeout("sT()", 1000);
  }
}

function readCookie(name) {
  var cookieValue = "";
  var search = name + "=";
  if (document.cookie.length > 0) {
    offset = document.cookie.indexOf(search);
    if (offset != -1) {
      offset += search.length;
      end = document.cookie.indexOf(";", offset);
      if (end == -1)
        end = document.cookie.length;
      cookieValue = document.cookie.substring(offset, end)
    }
  }
  return cookieValue;
}

function setCookie(name, value, hours) {
  var expire = "";
  if (hours != null) {
    expire = new Date((new Date()).getTime() + hours * 3600000);
    expire = "; expires=" + expire.toGMTString();
  }
  document.cookie = name + "=" + value + expire;
}

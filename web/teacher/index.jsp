<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ include file="/global.jsp" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>考试系统管理中心</title>
  <!-- Bootstrap -->
  <link href="${ctxStatic}/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!--你自己的样式文件 -->
  <!--<link href="css/your-style.css" rel="stylesheet">-->
</head>

<body>

<div class="container">
  <div class="top">

    <jsp:include page="top.jsp"/>
  </div>

  <div class="main">
    <div class="row">
      <%--
            <div class="menu col-md-2" >
              <ul class="nav nav-pills nav-stacked" id="nav1">
                <li><a data-toggle="collapse" href="#menuSubject">试题管理<span class="glyphicon glyphicon-chevron-down pull-right"></span></a></li>
                <ul class="nav nav-list collapse" id="menuSubject">
                  <li><a href="subjectAdd.jsp" target="main">录入试题</a></li>
                  <li><a href="${ctx}/SubjectServlet?method=load" target="main">管理试题</a></li>
                  <li><a href="subjectQuery.jsp" target="main">查询试题</a></li>
                </ul>

                <li><a data-toggle="collapse" href="#menuStudent">学生成绩<span class="glyphicon glyphicon-chevron-down pull-right"></span></a></li>
                <ul class="nav nav-list collapse" id="menuStudent">
                  <li><a href="studentQueryByName.jsp" target="main">按姓名查找</a></li>
                  <li><a href="studentQueryByClass.jsp" target="main">按班级查找</a></li>
                </ul>
              </ul>
            </div>
      --%>
      <jsp:include page="menu.jsp"/>
      <div class="col-md-10">
        <h5>欢迎使用在线考试管理系统</h5>
        <p>
          各位老师您好：<br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;您现在使用的是XXX公司开发的在线考试系统，通过该系统，您可以在线录入考试题目，更新考试系统以及查询考试题目；同时还可以对学生信息和学生成绩信息进行维护。<br>
        </p>
      </div>
      <%--
            <div class="mycontent col-md-10">
              <!--onload事件，根据内容高度自动调整自身的高度-->
              <iframe src="right.jsp" name="main" marginwidth="0" marginheight="0" frameborder="0" scrolling="no" width="100%" height="100%" onload="this.height=document.documentElement.clientHeight;"></iframe>
            </div>
      --%>

    </div>
  </div>

</div>
<!-- 如果要使用Bootstrap的js插件，必须先调入jQuery -->
<script src="${ctxStatic}/js/jquery/jquery-1.12.4.min.js"></script>
<!-- 包括所有bootstrap的js插件或者可以根据需要使用的js插件调用　-->
<script src="${ctxStatic}/bootstrap/js/bootstrap.min.js"></script>
<script src="${ctxStatic}/js/menu.js"></script>
<%--
<script>
  $(function () {
    //侧边栏菜单
    $("#nav1").children("li").click(function () {
      $(this).siblings().collapse('hide');

      // 图标切换
      $(this).find("span").toggleClass("glyphicon-chevron-down");
      $(this).find("span").toggleClass("glyphicon-chevron-right");
    });

  });
</script>
--%>
</body>
</html>

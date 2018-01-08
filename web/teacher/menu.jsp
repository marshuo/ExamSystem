<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ include file="/global.jsp"%>

<%--
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
--%>

<div class="col-md-2" >
  <ul class="nav nav-pills nav-stacked" id="nav">
    <li><a data-toggle="collapse" href="#menuSubject">试题管理<span class="glyphicon glyphicon-chevron-down pull-right"></span></a></li>
    <ul class="nav nav-list nav-pills collapse" id="menuSubject">
      <li><a href="${ctx}/teacher/subjectAdd.jsp" target="_self">录入试题</a></li>
      <li><a href="${ctx}/SubjectServlet?method=load" target="_self">管理试题</a></li>
      <li><a href="${ctx}/teacher/subjectQuery.jsp" target="_self">查询试题</a></li>
    </ul>

    <li><a data-toggle="collapse" href="#menuStudent">学生成绩<span class="glyphicon glyphicon-chevron-down pull-right"></span></a></li>
    <ul class="nav nav-list nav-pills collapse" id="menuStudent">
      <li><a href="${ctx}/teacher/studentQueryByName.jsp" target="_self">按姓名查找</a></li>
      <li><a href="${ctx}/teacher/studentQueryByClass.jsp" target="_self">按班级查找</a></li>
    </ul>
  </ul>
</div>

<%--<!-- 如果要使用Bootstrap的js插件，必须先调入jQuery -->
<script src="${ctxStatic}/js/jquery/jquery-1.12.4.min.js"></script>
<!-- 包括所有bootstrap的js插件或者可以根据需要使用的js插件调用　-->
<script src="${ctxStatic}/bootstrap/js/bootstrap.min.js"></script>
<script>
  $(function () {
    //侧边栏菜单
    $("#nav1").children("li").on('click', function () {
      $(this).siblings().collapse('hide');

      // 图标切换
      $(this).find("span").toggleClass("glyphicon-chevron-down");
      $(this).find("span").toggleClass("glyphicon-chevron-right");
    });

/*
    $("#nav1").children("li").click(function () {
      $(this).siblings().collapse('hide');

      // 图标切换
      $(this).find("span").toggleClass("glyphicon-chevron-down");
      $(this).find("span").toggleClass("glyphicon-chevron-right");
    });
*/

  });
</script>--%>


<%--
</body>
</html>
--%>

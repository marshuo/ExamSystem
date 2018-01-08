<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="/global.jsp" %>

<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>考试系统管理中心</title>
  <!-- Bootstrap -->
  <link href="${ctxStatic}/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!--你自己的样式文件 -->
</head>

<body>

<div class="container">
  <div class="top">
    <jsp:include page="top.jsp"/>
  </div>

  <div class="main">
    <div class="row">
      <div class="menu">
        <jsp:include page="menu.jsp"/>
      </div>
      <div class="contents col-md-10">

        <!--模糊查询试题-->
        <form class="form-horizontal" action="${ctx}/SubjectServlet?method=findByTitle" method="post">
          <div class="form-group">
            <label class="control-label col-md-2">试题题目:</label>
            <div class=" col-md-3">
              <input class="form-control" type="text" name="title">
            </div>

          </div>
          <div class="form-group">
            <div class="col-md-2 col-md-offset-2">
              <button class="btn btn-primary" type="submit">查询</button>
              <button class="btn btn-primary" type="reset">重置</button>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>

</div>
<!-- 如果要使用Bootstrap的js插件，必须先调入jQuery -->
<script src="${ctxStatic}/js/jquery/jquery-1.12.4.min.js"></script>
<!-- 包括所有bootstrap的js插件或者可以根据需要使用的js插件调用　-->
<script src="${ctxStatic}/bootstrap/js/bootstrap.min.js"></script>
<script src="${ctxStatic}/js/menu.js"></script>

<script>
  $("#menuSubject").collapse('show');
  $("#menuSubject>li:last").addClass("active");
</script>
</body>
</html>

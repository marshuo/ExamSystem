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
        <!--录入试题表单-->
        <form class="form-horizontal" action="${ctx}/SubjectServlet?method=add" method="post">
          <div class="form-group">
            <label class="control-label col-md-2">试题题目:</label>
            <div class="col-md-3">
              <input class="form-control" type="text" name="title">
            </div>
          </div>
          <div class="form-group">
            <label class="control-label col-md-2">选项A:</label>
            <div class="col-md-3">
              <input class="form-control" type="text" name="optionA">
            </div>
          </div>
          <div class="form-group">
            <label class="control-label col-md-2">选项B:</label>
            <div class="col-md-3">
              <input class="form-control" type="text" name="optionB">
            </div>
          </div>
          <div class="form-group">
            <label class="control-label col-md-2">选项C:</label>
            <div class="col-md-3">
              <input class="form-control" type="text" name="optionC">
            </div>
          </div>
          <div class="form-group">
            <label class="control-label col-md-2">选项D:</label>
            <div class="col-md-3">
              <input class="form-control" type="text" name="optionD">
            </div>
          </div>
          <div class="form-group">
            <label class="control-label col-md-2">答案:</label>
            <div class="col-md-3">
              <input class="radio-inline" name="answer" type="radio" value="A">A
              <input class="radio-inline" name="answer" type="radio" value="B">B
              <input class="radio-inline" name="answer" type="radio" value="C">C
              <input  class="radio-inline"name="answer" type="radio" value="D">D
            </div>
          </div>
          <div class="form-group">
            <label class="control-label col-md-2">试题解析:</label>
            <div class="col-md-8">
              <%--<textarea class="form-control" name="parse" cols="76" rows="10"/>--%>
              <textarea name="parse" class="form-control" rows="10"></textarea>
            </div>
          </div>

          <div class="form-group">
            <div class="col-md-2 col-md-offset-2">
              <button class="btn btn-primary" type="submit">录入</button>
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
  $("#menuSubject>li:first").addClass("active");
</script>
</body>
</html>

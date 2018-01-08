<%@ page contentType="text/html; UTF-8" language="java" pageEncoding="utf-8" %>
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
  <style>
    table{
      text-align: center;
    }
  </style>
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
        <%--显示试题--%>
        <div id="showSubject" align="center">
          <table class="table table-bordered table-striped">
            <tr align="center">
              <td>试题编号:</td>
              <td>${subject.id}</td>
            </tr>
            <tr>
              <td>试题题目:</td>
              <td>${subject.title}</td>
            </tr>
            <tr>
              <td>选项A:</td>
              <td>${subject.optionA}</td>
            </tr>
            <tr>
              <td>选项B:</td>
              <td>${subject.optionB}</td>
            </tr>
            <tr>
              <td>选项C:</td>
              <td>${subject.optionC}</td>
            </tr>
            <tr>
              <td>选项D:</td>
              <td>${subject.optionD}</td>
            </tr>
            <tr>
              <td>答案:</td>
              <td>${subject.answer}</td>
            </tr>
            <tr>
              <td valign="top">答案解析:</td>
              <td valign="top">${subject.parse}</td>
            </tr>
          </table>
        </div>
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
</script>
</body>
</html>

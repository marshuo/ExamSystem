<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ include file="global.jsp" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>登录页面</title>

  <!-- Bootstrap -->
  <link href="${ctxStatic}/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!--你自己的样式文件 -->
  <%--<link href="css/your-style.css" rel="stylesheet">--%>

  <style>
    .main {
      width: 400px;
      margin-top: 100px;
    }
  </style>
</head>
<body>

<div class="container">

  <div class="main center-block">
    <fieldset>
      <legend>教师（学生）登录</legend>
      <form name="loginForm" action="LoginServlet?method=login" method="post" class="form-horizontal">
        <div class="form-group">
          <label for="inputId" class="control-label col-md-3">编号：</label>
          <div class="col-md-9">
            <input type="text" class="form-control" id="inputId" name="id">
          </div>
        </div>
        <div class="form-group">
          <label for="inputPassword" class="control-label col-md-3">密码：</label>
          <div class="col-md-9">
            <input type="password" class="form-control" id="inputPassword" name="password">
          </div>
        </div>
        <div class="form-group">

        </div>
        <div class="form-group">
          <label class="control-label col-md-3">登录角色：</label>
          <div class="col-md-9">
            <label class="radio-inline">
              <input type="radio" name="role" checked="checked" value="teacher">教师
            </label>
            <label class="radio-inline">
              <input type="radio" name="role" value="student">学生
            </label>
          </div>
        </div>
        <div class="col-md-9 col-md-offset-3">
          <input name="Submit" type="submit" class="button btn btn-primary" id="Submit" value="登 录">
          <input name="reset" type="reset" class="button btn btn-primary" id="reset" value="重 置">

        </div>
        <div class="col-md-9 col-md-offset-3">
          <hr>
          <p>1- 教师录入考试题目以及答案信息</p>
          <p>2- 学生参加考试并自动评分和查看正确答案</p>
          <p>3- 教师查看学生考试成绩</p>

        </div>

      </form>
    </fieldset>

  </div>

</div>


<!-- 如果要使用Bootstrap的js插件，必须先调入jQuery -->
<script src="${ctxStatic}/js/jquery/jquery-1.12.4.min.js"></script>
<!-- 包括所有bootstrap的js插件或者可以根据需要使用的js插件调用　-->
<script src="${ctxStatic}/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>

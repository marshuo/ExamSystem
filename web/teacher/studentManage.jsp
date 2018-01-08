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
        <!--管理学生-->
        <div id="manageStudent" align="center">
          <table class="table table-bordered table-striped">
            <tr align="center">
              <td>学生编号</td>
              <td>所属班级</td>
              <td>学生姓名</td>
              <td>成绩</td>
            </tr>
            <c:forEach var="student" items="${pb.dataList}">
              <tr align="center">
                <td>${student.id}</td>
                <td>${student.sclass}</td>
                <td>${student.name}</td>
                <td>${student.result}</td>
              </tr>
            </c:forEach>
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
  $("#menuStudent").collapse('show');
  // $("#menuStudent>li:last").addClass("active");
</script>
</body>
</html>

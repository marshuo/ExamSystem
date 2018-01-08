<%@ page contentType="text/html; UTF-8" language="java" pageEncoding="utf-8" %>
<%@ include file="/global.jsp" %>

<html lang="zh-CN">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <base href="${ctx}/student">
  <title>考试结果</title>
  <!-- Bootstrap -->
  <link href="${ctxStatic}/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!--你自己的样式文件 -->
  <!--<link href="css/your-style.css" rel="stylesheet">-->
  <%--<link href="${ctx}/student/images/css2.css" rel="stylesheet" type="text/css"/>--%>
</head>
<body>

<div class="container">
  <div class="row">
    <div class="col-md-4 col-md-offset-4">
      <table class="table table-bordered" align="center">
        <tr>
          <td colspan="2">
            <div align="center">
              <span class="STYLE4">考试情况表</span>
            </div>
          </td>
        </tr>
        <tr>
          <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
          <td>
            <div align="center">考试姓名:${student.name}</div>
          </td>
          <td>
            <div align="center">考生得分:${student.result}分</div>
          </td>
        </tr>
        <tr>
          <td colspan="2">
            <div align="center"><a class="btn btn-primary" href="${ctx}/StudentServlet?method=showAnswer">查看答案</a></div>
          </td>
        </tr>
      </table>

    </div>
  </div>
</div>

</body>
</html>

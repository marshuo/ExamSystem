<%@ page contentType="text/html; UTF-8" language="java" pageEncoding="utf-8" %>
<%@ include file="/global.jsp" %>

<html lang="zh-CN">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>开始考试</title>
  <!-- Bootstrap -->
  <link href="${ctxStatic}/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!--你自己的样式文件 -->
  <!--<link href="css/your-style.css" rel="stylesheet">-->
  <%--<link href="${ctx}/student/images/css2.css" rel="stylesheet" type="text/css"/>--%>
</head>

<body>

<div class="container">
  <table class="table table-bordered" align="center">
    <tr>
      <form action="${ctx}/StudentServlet?method=showPoint" method="post">
        <table class="table table-bordered" align="center">
          <tr>
            <td>
              <div align="center" class="STYLE3">考试时间：120 分钟</div>
            </td>
            <td>
              <div align="center" class="STYLE3">考生：${sessionScope.studentInfo.name}</div>
            </td>
            <td>
              <div align="center" class="STYLE3">总分 ：100 分</div>
            </td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>
              <%--事件倒计时，粗体显示--%>
              <div class="lead" align="center" id="tTime"></div>
            </td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td colspan="3" bgcolor="#999999" class="STYLE4">选择题(每小题5分，共20个)</td>
          </tr>

          <!--题目开始-->
          <c:forEach var="subject" items="${subjectList}" varStatus="status">
            <tr>
              <input type="hidden" name="id${status.index}" value="${subject.id}"/>
              <td colspan="3">
                <strong>第<span class="STYLE5">${status.index + 1}</span>题&nbsp;${subject.title}</strong>
              </td>
            </tr>
            <tr>
              <td colspan="3"><strong>A．</strong>${subject.optionA}</td>
            </tr>
            <tr>
              <td colspan="3"><strong>B．</strong>${subject.optionB}</td>
            </tr>
            <tr>
              <td colspan="3"><strong>C．</strong>${subject.optionC}</td>
            </tr>
            <tr>
              <td colspan="3"><strong>D．</strong>${subject.optionD}</td>
            </tr>
            <tr>
              <td height="32" colspan="3" bgcolor="#CCCCCC">选择答案：
                <input type="radio" name="answer${status.index}" value="A"/>
                A
                <input type="radio" name="answer${status.index}" value="B"/>
                B
                <input type="radio" name="answer${status.index}" value="C"/>
                C
                <input type="radio" name="answer${status.index}" value="D"/>
                D
              </td>
            </tr>
          </c:forEach>

          <!--题目结束-->
          <tr>
            <td colspan="3">
              <div align="center">
                <input type="submit" value=" 提交答卷 " name="Submit"/>
              </div>
            </td>
          </tr>
        </table>
      </form>
      </td>
    </tr>
  </table>
</div>


<!-- 如果要使用Bootstrap的js插件，必须先调入jQuery -->
<script src="${ctxStatic}/js/jquery/jquery-1.12.4.min.js"></script>
<!-- 包括所有bootstrap的js插件或者可以根据需要使用的js插件调用　-->
<script src="${ctxStatic}/bootstrap/js/bootstrap.min.js"></script>

<script src="${ctx}/student/js/index.js"></script>

</body>
</html>

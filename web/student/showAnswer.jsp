<%@ page contentType="text/html; UTF-8" language="java" pageEncoding="utf-8" %>
<%@ include file="/global.jsp" %>

<html lang="zh-CN">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <base href="${ctx}/student">
  <title>显示试题答案</title>
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
        <table class="table table-bordered" align="center">
          <tr>
            <td>
              <div align="center" class="STYLE3">考试时间：120 分钟</div>
            </td>
            <td>
              <div align="center" class="STYLE3">考生：${sessionScope.studentInfo.name}</div>
            </td>
            <td>
              <div align="center" class="STYLE3">得分 ：${sessionScope.studentInfo.result} 分</div>
            </td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td colspan="3" bgcolor="#999999" class="STYLE4">选择题(每小题5分，共20个)</td>
          </tr>
          <!--题目开始-->
          <c:forEach var="subject" items="${subjectList}" varStatus="sta">
            <tr>
              <td colspan="3"><strong>第<span class="STYLE5">${sta.index + 1}</span>题&nbsp;${subject.title}</strong>
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
              <td height="32" colspan="3" bgcolor="#CCCCCC">
                【答案】：${sessionScope.answerList[sta.index]}<br>
                <strong>【正确答案】：${subject.answer}</strong><br/>
                <strong>【参考解析】：${subject.parse}</strong>
            </tr>

          </c:forEach>
          <!--题目结束-->
        </table>
      </td>
    </tr>
  </table>

</div>

</body>
</html>

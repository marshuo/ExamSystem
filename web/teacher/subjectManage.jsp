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
  <style>
    table {
      font-size: 14px;
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

        <!--管理试题-->
        <div id="manageSubject" align="center">
          <table class="table table-bordered table-striped table-condensed">
            <tr align="center">
              <td>试题编号</td>
              <td>试题标题</td>
              <td>正确答案</td>
              <td>查看试题</td>
              <td>更新试题</td>
              <td>删除试题</td>
            </tr>
            <c:forEach items="${pb.dataList}" var="subject">
              <tr align="center">
                <td>${subject.id}</td>
                <td align="left">${subject.title}</td>
                <td>${subject.answer}</td>
                <td><a href="${ctx}/SubjectServlet?method=show&id=${subject.id}">查看</a></td>
                <td><a href="${ctx}/SubjectServlet?method=updatePre&id=${subject.id}">更新</a></td>
                <td><a href="${ctx}/SubjectServlet?method=delete&id=${subject.id}"
                       onclick="return confirm('您是否真要删除该题目？')">删除</a></td>
              </tr>
            </c:forEach>
            <tr>
              <td colspan="6" align="center">
                共${pb.totalRecords}条纪录，当前第${pb.currentPage}/${pb.totalPages}页，每页${pb.pageRecords}条纪录
                <c:choose>
                  <c:when test="${pb.currentPage > 1}">
                    <a href="${ctx}/SubjectServlet?method=load&currentPage=1">首页</a> |
                    <a href="${ctx}/SubjectServlet?method=load&currentPage=${pb.currentPage - 1}">上一页</a> |
                  </c:when>
                  <c:otherwise>
                    首页 | 上一页 |
                  </c:otherwise>

                </c:choose>
                <c:choose>
                  <c:when test="${pb.currentPage < pb.totalPages}">
                    <a href="${ctx}/SubjectServlet?method=load&currentPage=${pb.currentPage + 1}">下一页</a> |
                    <a href="${ctx}/SubjectServlet?method=load&currentPage=${pb.totalPages}">尾页</a>
                  </c:when>
                  <c:otherwise>
                    下一页 | 尾页
                  </c:otherwise>
                </c:choose>
              </td>
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
  $("#menuSubject>li:nth-child(2)").addClass("active");
</script>
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ include file="/global.jsp"%>

<div class="row">
  <div class="col-md-12">
    <!--加入导航条标题-->
    <div class="navbar navbar-default" role="navigation">
      　
      <div class="navbar-header">
        　 <a href="##" class="navbar-brand">在线考试管理系统(教师)</a>
        　
      </div>
      <form action="##" class="navbar-form navbar-right" rol="search">
        <div class="dropdown">
          <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown"
                  style="margin-right: 20px; ">
            <%--登录用户名--%>
            <span class="glyphicon glyphicon-user">${sessionScope.id}</span>
            <span class="caret"></span>
          </button>
          <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
            <li role="presentation">
              <a role="menuitem" tabindex="-1" href="#">
                <span class="glyphicon glyphicon-cog pull-right"></span>
                修改个人信息
              </a>
            </li>
            <!-分割线--->
            <li role="presentation" class="divider"></li>
            <li role="presentation">
              <a role="menuitem" tabindex="-1" href="${ctx}/LoginServlet?method=logout">
                <span class="glyphicon glyphicon-off pull-right"></span>
                注销
              </a>
            </li>
          </ul>
        </div>

      </form>
    </div>
  </div>
</div>
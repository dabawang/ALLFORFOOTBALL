<%--
  Created by IntelliJ IDEA.
  User: zhuxiaolei
  Date: 2018/2/27
  Time: 15:57
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--导航栏-->
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.jsp">
                <img src="${pageContext.request.contextPath}/img/logo-2.png" class="img-fluid"/>懂球儿
            </a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li>
                    <a href="${pageContext.request.contextPath}/">首页</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/articles">文章</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/matches">比赛</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/data">数据统计</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/compare">球员对比</a>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <img src="${pageContext.request.contextPath}/img/head-img-icon.png" style="width:25px;height: 25px">
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="/user/center"><img class="tou-img" src="${pageContext.request.contextPath}/img/head-userinfo.png">我的主页</a></li>
                        <%--<li><a href="#"><img class="tou-img" src="img/head-notification.png">通知</a></li>--%>
                        <li><a href=""><img class="tou-img" src="${pageContext.request.contextPath}/img/head-setting.png">设置</a></li>
                        <li class="divider"></li>
                        <li><a href=""><img class="tou-img" src="${pageContext.request.contextPath}/img/nav-head-out.png">退出</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <!--/.nav-collapse -->
    </div>
</nav>

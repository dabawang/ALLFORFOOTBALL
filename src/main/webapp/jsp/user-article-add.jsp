<%--
  Created by IntelliJ IDEA.
  User: zhuxiaolei
  Date: 2018/2/27
  Time: 15:56
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <link href="${pageContext.request.contextPath}/img/logo-2.png" rel="shortcut icon"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/navbar-default.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/user-info.css"/>
    <%--多选框插件--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/chosen.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/user-article-add.css"/>


    <script src="${pageContext.request.contextPath}/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="https://cdn.bootcss.com/jquery-validate/1.17.0/jquery.validate.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/user-article.js" type="text/javascript" charset="utf-8"></script>
    <%--多选框js--%>
    <script src="${pageContext.request.contextPath}/js/chosen.jquery.js" type="text/javascript" charset="utf-8"></script>


    <meta charset="utf-8"/>
    <title>懂球儿</title>
</head>
<style>
    .navbar-brand img {
        display: inline-block;
    }

    .modal input {
        width: 200px;
    }

    /*侧边导航栏颜色*/
    .nav-tabs > li.active > a, .nav-tabs > li.active > a:focus, .nav-tabs > li.active > a:hover {
        background-color: #8bfdff;
    }

</style>
<script>
    $(function () {
        $(".chosen-select").chosen()
        $(".chosen-select").chosen({
            max_selected_options: 3
        })
//        $(".chosen-select").bind("chosen:maxselected", function () {
//            console.log('123')
//        })
        var ue = UE.getEditor('ueditor')
    })

</script>
<body>
<%@include file="head2.jsp" %>
<!--主体-->
<div class="container userinfo">
    <div class="row">
        <div class="col-md-2">
            <ul class="nav nav-tabs nav-stacked" data-spy="affix" data-offset-top="125"
                style="border: 1px solid #8bfdff">
                <li><a href="user-center.jsp">个人信息</a></li>
                <li><a href="user-comment.jsp">评论</a></li>
                <li class="active" style="cursor: pointer"><a href="user-article.jsp">我发表的文章</a></li>
                <li><a href="setting-profile.jsp">账号设置</a></li>
            </ul>
        </div>
        <div class="col-md-10">
            <div class="row article-add-head">
                <h3>添加新文章</h3>
                <table class="table table-bordered">
                    <tr>
                        <td><strong>文章标题：</strong></td>
                        <td><input id="head" type="text"></td>
                    </tr>
                    <tr>
                        <td><strong>文章副标题</strong></td>
                        <td><input id="subhead" type="text"></td>
                    </tr>
                    <tr>
                        <td><strong>文章展示图片</strong></td>
                        <td><input type="file"><span style="color: red">****仅限上传.jpg/png图片****</span></td>
                    </tr>
                    <tr>
                        <td><strong>标签</strong></td>
                        <td>
                            <select multiple class="chosen-select chzn-search chosen-rtl" tabindex="14"
                                    data-placeholder="请为文章添加至多六个标签">
                                <option value=""></option>
                                <option selected value="0">American Black Bear</option>
                                <option value="1">Asiatic Black Bear</option>
                                <option>Brown Bear</option>
                                <option>Giant Panda</option>
                                <option>Sloth Bear</option>
                                <option>Polar Bear</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><strong>文章类型</strong></td>
                        <td>
                            <select name="" id="" class="chosen-select">
                                <option value="0">全部</option>
                                <option value="1">头条</option>
                                <option value="2">转会</option>
                                <option value="3">中超</option>
                                <option value="4">西甲</option>
                                <option value="5">英超</option>
                            </select>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div id="ueditor" class="row article-add-body">

            </div>
            <div class="row article-add-bottom">
                <button class="btn btn-success">提交</button>
                <button class="btn btn-success">提交</button>
            </div>

        </div>
    </div>
</div>

<%@include file="bottom.jsp" %>
</body>
</html>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/head.js"></script>
<%--编辑框--%>
<script src="${pageContext.request.contextPath}/ueditor/ueditor.config.js" type="text/javascript"
        charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/ueditor/ueditor.all.min.js" type="text/javascript"
        charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/ueditor/lang/zh-cn/zh-cn.js" type="text/javascript"
        charset="utf-8"></script>
<script type="text/javascript" charset="UTF-8" src="${pageContext.request.contextPath}/ueditor/ueditor.parse.min.js"></script>
<script>
    $(function () {
//        var lis = $("ul[class='chzn-choices'] span")
        var lis = $("ul[class='chzn-choices']")
        console.log(lis)
    })
</script>
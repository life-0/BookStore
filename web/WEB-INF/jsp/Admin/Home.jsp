<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>书籍展示</title>
    <%--使用Bootstrap美化界面--%>
    <link href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/JQuery/jquery-3.3.1.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $('.search').bind('keypress', function (event) {
                if (event.keyCode == "13") {
                    Redirect();
                }
            });
        })

        function Redirect() {
            let searching = document.getElementById('search');
            if (searching.value !== "") {
                window.open("${pageContext.request.contextPath}/QueryBook?name=" + searching.value + "&flag=admin", '_self')
                //http://localhost:8080/QueryBook?name=%E8%B5%84%E6%9C%AC%E8%AE%BA?flag=admin
            } else {
                window.alert("请输入有效值")
            }
        }
    </script>

</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="page-header">
            <h1>
                <small>书籍列表-----显示所有书籍</small>
            </h1>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 column">
            <%--ToAddBook--%>
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/ToAddBook">新增书籍</a>
        </div>
        <div class="form-inline" style="float: right">
            <%--Querybook--%>
            <input id="search" class="form-control search" type="text" name="name"
                   placeholder="只支持搜索书名" style="float:left;">
            <input class="form-control" type="button" value="搜索"
                   onclick="Redirect()"
                   style="background-color: #1dbb8e;float:left;">
        </div>
    </div>

    <div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th>书名</th>
                    <th>作者</th>
                    <th>出版社</th>
                    <th>内容简介</th>
                    <th>单本定价</th>
                    <th>书籍状态</th>
                    <th>书籍类别</th>
                    <th>书籍数量</th>
                    <th>操作</th>
                </tr>
                </thead>
                <%--书籍丛数据库查询出来,在book遍历: foreach--%>
                <tbody id="show">
                <c:forEach var="book" items="${books}">
                    <tr>
                        <td>${book.name}</td>
                        <td>${book.author}</td>
                        <td>${book.press}</td>
                        <td>${book.introduction}</td>
                        <td>${book.price}</td>
                        <td>${book.status}</td>
                        <td>${book.classification}</td>
                        <td>${book.count}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/ToUpdateBook?ISBN=${book.ISBN}">
                                修改</a>
                            &nbsp;| &nbsp;
                            <a href="${pageContext.request.contextPath}/DeleteBook/${book.ISBN}">
                                删除</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
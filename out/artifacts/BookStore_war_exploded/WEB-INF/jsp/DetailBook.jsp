<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: life-0
  Date: 2020/6/26
  Time: 16:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>书籍详情</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <script type="text/javascript" src="${pageContext.request.contextPath}/static/JQuery/jquery-3.3.1.min.js"></script>
    <%--使用Bootstrap美化界面--%>
    <link href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

    <script type="text/javascript">
        window.onload = function () {
            //验证用户登录成功才会启用借书还书功能

            if (getCookie("username") !== "" && getCookie("value") !== "") {
                document.getElementById("userID_1").value = getCookie("username");
                document.getElementById("userID_2").value = getCookie("username");
                $(".UID").val(getCookie("username"))

            } else {
                window.alert("请登录!")

            }

        }

        //获得cookie值
        function getCookie(name) {
            let strcookie = document.cookie;//获取cookie字符串
            let arrcookie = strcookie.split("; ");//分割
            //遍历匹配
            for (let i = 0; i < arrcookie.length; i++) {
                let arr = arrcookie[i].split("=");
                if (arr[0] === name) {
                    return arr[1];
                }
            }
            return "";
        }
    </script>
    <style>
        .FormSize {
            width: 51px;
            float: left;
        }
    </style>
</head>

<body>
<div class="container">
    <div class="row clearfix">
        <div class="page-header">
            <h1>
                <small>书籍列表-----类别查询书籍</small>
            </h1>
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
                    <th>书籍状态</th>
                    <th>书籍类别</th>
                    <th>书籍数量</th>
                    <th>书籍操作</th>
                </tr>
                </thead>
                <%--书籍丛数据库查询出来,在book遍历: foreach--%>
                <tbody>
                <c:forEach var="book" items="${books}">
                    <tr>
                        <td>${book.name}</td>
                        <td>${book.author}</td>
                        <td>${book.press}</td>
                        <td>${book.introduction}</td>
                        <td>${book.status}</td>
                        <td>${book.classification}</td>
                        <td>${book.count}</td>
                        <td>
                            <form class="FormSize" action="${pageContext.request.contextPath}/borrowBook" method="post">
                                <input type="hidden" name="ISBN" value="${book.ISBN}">
                                <input type="hidden" name="userID" id="userID_1" class="UID">
                                <input type="hidden" name="bookName" value="${book.name}">
                                <input type="hidden" name="amount" value="1">
                                <input type="submit" value="借书" class="btn btn-default" style="color:#0594a1">
                            </form>
                            <form class="FormSize" action="${pageContext.request.contextPath}/returnBook" method="post">
                                <input type="hidden" name="ISBN" value="${book.ISBN}">
                                <input type="hidden" name="UserID" id="userID_2" value="0"  class="UID">
                                <input type="hidden" name="BookName" value="${book.name}">
                                <input type="hidden" name="Amount" value="1">
                                <input type="submit" value="还书" class="btn btn-default" style="color: #0594a1">
                            </form>
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
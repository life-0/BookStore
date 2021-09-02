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
                $(".UID").val(getCookie("username"));
            } else {
                window.alert("请登录!")
            }

            //初始化图片框: 如果没从数据库中查找到图片路径,则初始化为默认的预设图片
            $('.image').on('load', function () {
                let image = $('.image');
                console.log(image.attr('src') + ":");
                if (image.attr('src') === '') {
                    image.attr('src', '/img/十万个为什么.jpg');
                }
            });

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
        }
    </script>
    <style>
        .FormSize {
            width: 51px;
            float: left;
        }

        .tr-spacing {
            height: 60px;
            /*text-align: center;*/
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
        <table class="table  table-striped">
            <%--书籍丛数据库查询出来,在book遍历: foreach--%>
            <thead>
            <tr>
                <th style="text-align: center;">信息</th>
                <th style="text-align: center;">封面展示</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="book" items="${books}">
                <tr class="tr-spacing">
                        <%--                        <th>书名:</th>--%>
                    <td>${book.name}</td>
                        <%--                        <th>作者:</th>--%>
                    <td>${book.author}</td>
                        <%--                        <th>出版社:</th>--%>
                    <td>${book.press}</td>
                        <%--                        <th>内容简介:</th>--%>
                    <td>${book.introduction}</td>
                        <%--                        <th>书籍状态:</th>--%>
                    <td>${book.status}</td>
                        <%--                        <th>书籍类别:</th>--%>
                    <td>${book.classification}</td>
                        <%--                        <th>书籍数量:</th>--%>
                    <td>${book.count}</td>
                    <td>
                        <form class="FormSize" action="${pageContext.request.contextPath}/borrowBook"
                              method="post">
                            <input type="hidden" name="ISBN" value="${book.ISBN}">
                            <input type="hidden" name="userID" id="userID_1" class="UID">
                            <input type="hidden" name="bookName" value="${book.name}">
                            <input type="hidden" name="amount" value="1">
                            <input type="submit" value="借书" class="btn btn-default" style="color:#0594a1">
                        </form>
                        <form class="FormSize" action="${pageContext.request.contextPath}/returnBook"
                              method="post">
                            <input type="hidden" name="ISBN" value="${book.ISBN}">
                            <input type="hidden" name="UserID" id="userID_2" value="0" class="UID">
                            <input type="hidden" name="BookName" value="${book.name}">
                            <input type="hidden" name="Amount" value="1">
                            <input type="submit" value="还书" class="btn btn-default" style="color: #0594a1">
                        </form>
                    </td>
                </tr>
                <tr class="tr-spacing">
                    <td colspan="2">3333</td>
                </tr>
             <%--   <tr class="tr-spacing">
                    <th>书籍操作:</th>

                </tr>--%>
                <%-- <div class="col-md-4">
                     <div class="book-image">
                         <label style="padding-top: 0">
                             <!-- 保存用户自定义的背景图片 -->
                             <img id="imag" class="image-size image"
                                  src='${book.imagePath}' title="自定义背景" alt=".."/>
                         </label>
                     </div>
                 </div>--%>
            </c:forEach>
            </tbody>

        </table>

    </div>
</div>
</body>
</html>
<%@ page import="com.life.Utils.TimeConvert" %>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: life-0
  Date: 2020/7/7
  Time: 10:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false"%>
<html>
<head>
    <title>用户主页</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <script type="text/javascript" src="${pageContext.request.contextPath}/static/JQuery/jquery-3.3.1.min.js"></script>
    <%--使用Bootstrap美化界面--%>
    <link href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script type="text/javascript">
      window.onload=function () {
          if ('${BookDeadLine}'!=null){
              <c:forEach var="book" items="${BookDeadLine}">
                   window.alert('${book.key}'+'${book.value}')
              </c:forEach>
          }
      }

    </script>
</head>

<body>
<div class="container">
    <div class="row clearfix">
        <div class="page-header">
            <h1>
                <small>个人主页-----书籍列表</small>
            </h1>
        </div>
    </div>

    <div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th>借书者的ID</th>
                    <th>书名</th>
                    <th>借出的时间</th>
                    <th>借书的本数</th>
                    <th>书籍操作</th>
                </tr>
                </thead>
                <%--书籍丛数据库查询出来,在book遍历: foreach--%>
                <tbody id="show">
                <c:forEach var="relationship" items="${Relationships}">
                    <tr>
                        <td>${relationship.userID}</td>
                        <td>${relationship.bookName}</td>
                        <td>${relationship.lend}</td>
                        <td>${relationship.amount}</td>
                        <td>
                            <form action="${pageContext.request.contextPath}/returnBook" method="post" >
                                <input type="hidden" name="ISBN" value="${relationship.ISBN}">
                                <input type="hidden" name="userID" value="${relationship.userID}">
                                <input type="hidden" name="bookName" value="${relationship.bookName}">
                                <input type="hidden" name="lend" value="${relationship.lend}">
                                <input type="hidden" name="amount" value="${relationship.amount}">
                                <input type="hidden" name="back" value="${relationship.lend}">
                                <input type="submit" value="还书" class="btn btn-default" style="color: #0fd6cc">
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
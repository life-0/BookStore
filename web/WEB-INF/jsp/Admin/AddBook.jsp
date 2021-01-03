<%@ page import="com.life.Utils.IDUtils" %><%--
  Created by IntelliJ IDEA.
  User: life-0
  Date: 2020/6/24
  Time: 20:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加书籍页面</title>
    <%--使用Bootstrap美化界面--%>
    <link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>增加书籍</small>
                </h1>
            </div>
        </div>
    </div>
    <form action="${pageContext.request.contextPath}/AddBook" method="post" >
        <%
            IDUtils idUtils = new IDUtils ();
            String ISBN=idUtils.getRandomID ();
        %>
        <input type="hidden" name="ISBN"
               value=<%=ISBN%>
        />

        <div class="form-group">
            <label >书名:</label>
            <input type="text" class="form-control" name="name" value="${Book.name}" required>
        </div>
        <div class="form-group">
            <label>作者:</label>
            <input type="text" class="form-control" name="author" value="${Book.author}" required>
        </div>
        <div class="form-group">
            <label>出版社:</label>
            <input type="text" class="form-control" name="press" value="${Book.press}" required>
        </div>
        <div class="form-group">
            <label>单本定价:</label>
            <input type="text" class="form-control" name="price" value="${Book.price}" required>
        </div>
        <div class="form-group">
            <label>内容简介:</label>
            <input type="text" class="form-control" name="introduction" value="${Book.introduction}" required>
        </div>
        <div class="form-group">
            <label>书籍状态:</label>
            <input type="text" class="form-control" name="status" value="${Book.status}" required>
        </div>
        <div class="form-group">
            <label>书籍类别:</label>
            <input type="text" class="form-control" name="classification" value="${Book.classification}" required>
        </div>
        <div class="form-group">
            <label>书籍数量:</label>
            <input type="text" class="form-control" name="count" value="${Book.count}" required>
        </div>
        <button type="submit" class="btn btn-default">添加</button>
    </form>

</div>

</body>
</html>

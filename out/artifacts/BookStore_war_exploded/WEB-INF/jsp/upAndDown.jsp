<%--
  Created by IntelliJ IDEA.
  User: life-0
  Date: 2021/7/4
  Time: 9:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
</head>
<body>
<div>
    <div align="center">
        <form action="${pageContext.request.contextPath}/upload" enctype="multipart/form-data" method="post">
            <input type="file" name="file">
            <input type="submit" value="upload">
        </form>

    </div>
    <div align="center">
        <p>123</p>
        <form action="${pageContext.request.contextPath}/download" enctype="multipart/form-data" method="post">
            <input type="submit" value="download">
        </form>
    </div>
</div>
</body>
</html>
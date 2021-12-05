<%--
  Created by IntelliJ IDEA.
  User: life-0
  Date: 2020/6/19
  Time: 11:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理页面</title>
    <%--使用Bootstrap美化界面--%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/JQuery/jquery-3.3.1.min.js"></script>
    <link href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/image-frame.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/image-style.css"/>
</head>

<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>修改书籍</small>
                </h1>
            </div>
        </div>
    </div>
    <form action="${pageContext.request.contextPath}/UpdateBook" enctype="multipart/form-data" method="post">
        <%--出现的问题: 提交了修改的sql请求,但是修改失败, 先考虑事务问题--%>
        <%--其次 考虑SQL语句问题, 是否执行成功: SQl执行失败 修改为完成--%>
        <%--前端传递隐藏域--%>
        <input type="hidden" name="ISBN" value="${Book.ISBN}">
        <div class="col-lg-6 col-md-6 col-sm-6 ">
            <div class="form-group">
                <label>书名:</label>
                <input type="text" class="form-control " name="name" value="${Book.name}" required>
            </div>
            <div class="form-group">
                <label>作者:</label>
                <input type="text" class="form-control " name="author" value="${Book.author}" required>
            </div>
            <div class="form-group">
                <label>出版社:</label>
                <input type="text" class="form-control " name="press" value="${Book.press}" required>
            </div>
            <div class="form-group">
                <label>单本定价:</label>
                <input type="text" class="form-control " name="price" value="${Book.price}" required>
            </div>
            <div class="form-group">
                <label>内容简介:</label>
                <input type="text" class="form-control" name="introduction" size="6"
                       value="${Book.introduction}" required>
            </div>
            <div class="form-group">
                <label>书籍状态:</label>
                <input type="text" class="form-control" name="status" value="${Book.status}" required>
            </div>
            <div class="form-group">
                <label>书籍类别:</label>
                <input type="text" class="form-control " name="classification" value="${Book.classification}"
                       required>
            </div>
            <div class="form-group">
                <label>书籍数量:</label>
                <input type="text" class="form-control " name="count" value="${Book.count}" required>
            </div>
            <button type="submit" class="btn btn-default" style="float: right">修改</button>
        </div>
        <div class="col-lg-4 col-md-4 col-sm-4">
            <div class="book-image">
                <label for="imag-upload" style="padding-top: 0">
                    <!-- 保存用户自定义的背景图片 -->
                    <img id="imag" class="image-size  image"
                         src="${Book.imagePath}" title="自定义背景" alt=".."/>
                    <span style="color: red">提示: 只能接受.png .jpg .jpeg且大小不能超过3MB</span>
                    <input type="file" id="imag-upload" class="switchImage switch-input" value="切换" name="file">
                </label>
            </div>
        </div>
    </form>
</div>

</body>
</html>

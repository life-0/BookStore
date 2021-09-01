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
    <%--文件上传使用的插件--%>
    <script src="${pageContext.request.contextPath}/static/js/fileinput.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/locales/zh.js"></script>
    <link href="${pageContext.request.contextPath}/static/css/fileinput.min.css" rel="stylesheet"/>
    <script type="text/javascript">
        $(document).ready(function () {
            $('.switchImage').on('change', function () {
                let filePath = $(this).val(); //获取到input的value，里面是文件的路径
                let fileSize = (3*1024)/this.files[0].size; //获取文件大小

                let fileFormat = filePath.substring(filePath.lastIndexOf(".")).toLowerCase();
                // 检查是否是图片
                if (!fileFormat.match(/.png|.jpg|.jpeg/)) {
                    window.alert('上传错误,文件格式必须为：png/jpg/jpeg ');
                    return;
                }
                if (fileSize>1){
                    window.alert("图片大小必须小于3MB")
                    return;
                }
                var src = window.URL.createObjectURL(this.files[0]); //转成可以在本地预览的格式
                $('#imag').attr('src', src);
            });
        });
    </script>

    <style>
        .book-image {
            margin-top: 20px;
            border: #c0bebe solid 1px;
            border-radius: 5px;
            text-align: center;
        }

        .image-size {
            width: 97%;
            height: 60%;
            margin: 10px 5px 10px 5px;
        }

        .switch-input {
            /*opacity: 0;*/
            visibility: hidden;
        }
    </style>
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
                    <img id="imag" class="image-size"
                         src="${pageContext.request.contextPath}/img/十万个为什么.jpg" title="自定义背景" alt=".."/>
                    <span style="color: red">提示: 只能接受.png .jpg .jpeg且大小不能超过3MB</span>
                    <input type="file" id="imag-upload" class="switchImage switch-input" value="切换" name="file">
                </label>
            </div>
        </div>
    </form>

</div>

</body>
</html>

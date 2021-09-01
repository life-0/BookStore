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
    <%-- <script type="text/javascript">
         $(function () {
             //0.初始化fileinput
             var oFileInput = new FileInput();
             oFileInput.Init("txt_file", "/api/OrderApi/ImportOrder");
         });
         //初始化fileinput
         var FileInput = function () {
             var oFile = new Object();

             //初始化fileinput控件（第一次初始化）
             oFile.Init = function (ctrlName, uploadUrl) {
                 var control = $('#' + ctrlName);

                 //初始化上传控件的样式
                 control.fileinput({
                     language: 'zh', //设置语言
                     uploadUrl: uploadUrl, //上传的地址
                     allowedFileExtensions: ['jpg', 'gif', 'png'],//接收的文件后缀
                     showUpload: true, //是否显示上传按钮
                     showCaption: false,//是否显示标题
                     browseClass: "btn btn-primary", //按钮样式
                     dropZoneEnabled: true,//是否显示拖拽区域
                     //minImageWidth: 50, //图片的最小宽度
                     //minImageHeight: 50,//图片的最小高度
                     //maxImageWidth: 1000,//图片的最大宽度
                     //maxImageHeight: 1000,//图片的最大高度
                     //maxFileSize: 0,//单位为kb，如果为0表示不限制文件大小
                     //minFileCount: 0,
                     maxFileCount: 10, //表示允许同时上传的最大文件个数
                     enctype: 'multipart/form-data',
                     validateInitialCount: true,
                     previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",
                     msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
                 });

                 //导入文件上传完成之后的事件
                 $("#txt_file").on("fileuploaded", function (event, data, previewId, index) {
                     $("#myModal").modal("hide");
                     var data = data.response.lstOrderImport;
                     if (data == undefined) {
                         toastr.error('文件格式类型不正确');
                         return;
                     }
                     //1.初始化表格
                     var oTable = new TableInit();
                     oTable.Init(data);
                     $("#div_startimport").show();
                 });
             }
             return oFile;
         };
     </script>--%>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#input-b1').fileinput({
                language: 'zh',
                browseLabel: '浏览',
                initialPreviewAsData: true,
                dropZoneEnabled: false,
                showUpload: false,
                showRemove: false,
                showClose: false,
                showBrowse:false,
                showCaption: false,//是否显示标题
                allowedFileExtensions: ['jpg', 'png', 'gif', 'bmp', 'svg', 'jpeg'],
                //默认限制10M
                maxFileSize: 10240,
                layoutTemplates: {
                    footer:'',//隐藏全部小图标；
                    actionUpload:'',//去除上传预览缩略图中的上传图片；
                    indicator:'', //去除上传状态图标(左侧➕)
                    actionDrag: '',//去除拖动图标(通常编辑的时候会显示这个图标)
                    actionDelete: '',//去除删除图标

                    //其他 参考fileinput.js/fileinput.min.js中 搜索 layoutTemplates，可以看到模板内所有元素  需要改哪个，直接在这里赋空字符串就行了
                },
                previewSettings: {//限制预览区域的宽高
                    image: {width: "100px", height: "100px"},
                }

            });
        });
    </script>

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
            <div class="book-image" style="margin-top: 20px">
                <input id="input-b1" name="input-b1" type="file" class="file"
                       placeholder="请选择jpge,jpg,png">
            </div>
        </div>


    </form>

</div>

</body>
</html>

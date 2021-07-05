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
    <title>用户登录页面</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <script type="text/javascript" src="${pageContext.request.contextPath}/static/JQuery/jquery-3.3.1.min.js"></script>
    <%--使用Bootstrap美化界面--%>
    <link href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script type="application/javascript">
        window.onload = function () {
            let result=getCookie("file")
            if (result!==""){
                window.alert(result);
                delCookie("file");
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

        //删除cookie
        function delCookie(name) {//删除cookie
            let exp = new Date();
            exp.setTime(exp.getTime() - 1);
            let cval = getCookie(name);
            if (cval != null) {
                document.cookie = name + "=" + cval + ";expires=" + exp.toGMTString();
            }
        }
    </script>
</head>
<body>
<div align="center">
    <h1>UploadAndDownLoad</h1>
</div>


<div class="col-md-12">
    <div style="text-align: center">
        <form class="form-horizontal" action="${pageContext.request.contextPath}/upload"
              enctype="multipart/form-data" method="post" >
            <div class="form-group" >
                <div class="col-sm-offset-2 col-sm-8 " style="display: inline">
                    <input type="file" name="file" style="display: inline">
                    <input type="submit"  value="upload">
                </div>
            </div>
        </form>
        <form action="${pageContext.request.contextPath}/download" enctype="multipart/form-data" method="post">
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-8">
                    <input type="submit" value="download">
                </div>
            </div>
        </form>
    </div>

</div>
</body>

<%--<div>
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
</body>--%>
</html>
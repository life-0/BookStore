<%--
  Created by IntelliJ IDEA.
  User: life-0
  Date: 2020/7/6
  Time: 8:26
  To change this template use File | Settings | File Templates.
        用户登录页面
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

</head>
<body>
<div align="center">
    <h1>Login</h1>
</div>


<div class="col-md-12">
        <div align="center">
            <form class="form-horizontal" action="${pageContext.request.contextPath}/UserLogin" method="post">
                <div class="form-group ">
                    <label for="inputEmail3" class="col-sm-4 control-label">ID</label>
                    <div class="col-sm-4">
                        <input type="text" name="ID" class="form-control" id="inputEmail3" placeholder="ID">
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword3" class="col-sm-4 control-label">Password</label>
                    <div class="col-sm-4">
                        <input type="password" name="pwd" class="form-control" id="inputPassword3"
                               placeholder="Password">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-8">
                       <input type="submit" value="Sign in">
                    </div>
                </div>
            </form>
        </div>

</div>
</body>
</html>

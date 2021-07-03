<%--
  Created by IntelliJ IDEA.
  User: life-0
  Date: 2020/6/18
  Time: 21:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>首页</title>
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
            start();
            stop();
            //鼠标停留在用户图片上显示账号密码
            let image = $(".img-circle");
            image.on('mouseover', function () {
                let ID = $(".user_ID");
                let pwd = $(".user_pwd");
                ID.show()
                pwd.show()
                ID.text('ID: ' + getCookie("username"))
                pwd.text('姓名: ' + getCookie("value"))
            });
            image.on('mouseout', function () {
                $(".user_ID").hide()
                $(".user_pwd").hide()
            });
            $(".out").on("click", function () {
                delCookie("username");
                delCookie("value");
            });

        }

        //每隔1秒来调用displayTime函数
        function start() {
            //从这行代码执行结束开始,则不间断的,每个1000毫秒调用一次displayTime()函数
            end = window.setInterval("getCookie('LendBook')", 1000);

        }

        function stop() {
            window.clearInterval(end);
        }

        if (getCookie("LendBook") === "false") {
            window.alert("借书失败! 请先还书再借书");
        }


        function UserHome() {
            //验证用户登录成功才会启用借书还书功能
            if (getCookie("username") !== "" && getCookie("value") !== "") {
                window.open("${pageContext.request.contextPath}/User", "_blank")
            } else {
                window.alert("请先登录")
                window.open("${pageContext.request.contextPath}/Login","_self");
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

    <style>
        #searchBtn {
            height: 34px;
            width: 50px;
        }

        .head-right-frame {
            height: 50px !important;
            margin-top: 10px;
            margin-left: 120px;
            position: relative;
        }

        #userImage {
            height: 30px;
            width: 30px;
            float: left;
        }

        .dvideLine {
            padding: 5px;
            border-bottom: #0fd6cc solid 4.3px;
            font-size: 21px;
        }


        .toppad {
            margin-top: 10px;
        }

    </style>
</head>

<body>

<!--1.页眉-->
<header>
    <div class="container-fluid">
        <div class="row col-md-12">
            <div class="col-md-6">
                <img src="${pageContext.request.contextPath}/img/Logo.jpg" class="img-responsive logo"
                     style="width: 40px;height: 40px"
                >
            </div>

            <div class="col-md-offset-4">
                <%--Querybook--%>
                <form action="${pageContext.request.contextPath}/QueryBook" method="get" class="navbar-form navbar-left"
                      role="search">
                    <div class="input-group">
                        <div class="form-group">
                            <input class="form-control" type="text" name="name" placeholder="只支持搜索书名">
                            <input type="hidden" name="flag" value="user">
                        </div>
                        <button type="submit" id="searchBtn">搜索</button>
                    </div>
                </form>
            </div>

            <div class="col-md-3 ">
                <div class="head-right-frame">
                    <img id="userImage" class="img-circle userID"
                         src="${pageContext.request.contextPath }/img/header.jpg"
                         alt="啥都没有" onclick="UserHome()">
                    <span class="user_ID" style="margin-left: 10px;font-size: 12px; color:  #232222;width: 30px;"
                          disabled></span><br/>
                    <span class="user_pwd" style="margin-left: 10px;font-size: 12px; color: #232222;width: 30px;"
                          disabled></span>
                    <button style="float: right;margin-top: -15px" class="out">退出</button>
                </div>
            </div>
        </div>
    </div>

    <!--导航条-->
    <div class="row col-md-12">
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <!--定义了一个汉堡按钮-->
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                            data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <!--按钮中显示的三条线样式-->
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="${pageContext.request.contextPath}/AllBooks">首页</a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li><a href="${pageContext.request.contextPath}/QueryBookByClassification/科普类">科普类</a></li>
                        <li><a href="${pageContext.request.contextPath}/QueryBookByClassification/人文类">人文类</a></li>
                        <li><a href="${pageContext.request.contextPath}/QueryBookByClassification/搞笑类">搞笑类</a></li>
                        <li><a href="${pageContext.request.contextPath}/QueryBookByClassification/编程类">编程类</a></li>
                    </ul>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>
    </div>

    <%--轮播图--%>
    <div class="row col-md-12">
        <div id="carousel-example-generic" class="carousel slide " data-ride="carousel" data-interval="3100">
            <!-- Indicators -->
            <ol class="carousel-indicators ">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                <li data-target="#carousel-example-generic" data-slide-to="2"></li>

            </ol>

            <!-- 轮播图片 -->
            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <img id="#image_1" src="${pageContext.request.contextPath}/img/Python入门.jpg"
                         style="width: 1500px;height: 350px"
                         onclick="window.open('${pageContext.request.contextPath}/QueryBook?name=Python入门&flag=user','_blank');"
                         alt="...">
                </div>
                <div class="item">
                    <img id="#image_2" src="${pageContext.request.contextPath}/img/十万个为什么.jpg"
                         style="width: 1500px;height: 350px"
                         onclick="window.open('${pageContext.request.contextPath}/QueryBook?name=十万个为什么&flag=user','_blank');"
                         alt="...">
                </div>
                <div class="item">

                    <img id="#image_3" src="${pageContext.request.contextPath}/img/资本论.jpg"
                         style="width: 1500px;height: 350px"
                         onclick="window.open('${pageContext.request.contextPath}/QueryBook?name=资本论&flag=user','_blank');"
                         alt="...">

                    <div class="carousel-caption">
                        ...
                    </div>
                </div>
            </div>

            <!-- 左右切换按钮 -->
            <!-- Controls -->
            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>
</header>

<%--主体--%>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-12 dvideLine">
            <img src="${pageContext.request.contextPath}/img/书本图标.jpg"
                 style="width: 27px;height: 27px"
            >
            <span>精选</span>
        </div>
        <div class="row toppad">
            <div class="col-md-3 toppad thumbnail "
                 onclick="window.open('${pageContext.request.contextPath}/QueryBook?name=一拳超&flag=user','_blank')"
            >
                <img src="${pageContext.request.contextPath}/img/cartoon_1.jpg" class="img-responsive"
                     style="width: 290px;height: 435px">
                <p class="P_Value" align="center">一拳超人</p>
            </div>

            <div class="col-md-3 toppad thumbnail "
                 onclick="window.open('${pageContext.request.contextPath}/QueryBook?name=柯南&flag=user','_blank')"
            >
                <img src="${pageContext.request.contextPath}/img/cartoon_5.jpg" class="img-responsive"
                     style="width: 290px;height: 435px">
                <p class="P_Value" align="center">柯南</p>

            </div>

            <div class="col-md-3 toppad thumbnail "
                 onclick="window.open('${pageContext.request.contextPath}/QueryBook?name=海贼王&flag=user','_blank')"
            >
                <img src="${pageContext.request.contextPath}/img/cartoon_3.jpg" class="img-responsive"
                     style="width: 290px;height: 435px">
                <p class="P_Value" align="center">海贼王</p>

            </div>

            <div class="col-md-3 toppad thumbnail "
                 onclick="window.open('${pageContext.request.contextPath}/QueryBook?name=哆啦A梦&flag=user','_blank')"
            >

                <img src="${pageContext.request.contextPath}/img/cartoon_4.jpg" class="img-responsive"
                     style="width: 290px;height: 435px">
                <p class="P_Value" align="center">哆啦A梦</p>

            </div>
        </div>
    </div>
</div>

</body>


</body>
</html>

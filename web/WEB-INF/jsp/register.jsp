<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <script type="text/javascript" src="${pageContext.request.contextPath}/static/JQuery/jquery-3.3.1.min.js"></script>
    <%--使用Bootstrap美化界面--%>
    <link href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            function SetCookie(name, value) {//两个参数，一个是cookie的名子，一个是值
                const Days = 30; //此 cookie 将被保存 30 天
                const exp = new Date();    //new Date("December 31, 9998");
                exp.setTime(exp.getTime() + Days * 24 * 60 * 60 * 1000);
                document.cookie = name + "=" + escape(value) + ";expires=" + exp.toGMTString();
            }

            function getCookie(name) {//取cookies函数
                const arr = document.cookie.match(new RegExp("(^| )" + name + "=([^;]*)(;|$)"));
                if (arr != null) return unescape(arr[2]);
                return null;
            }

            function delCookie(name) {//删除cookie
                const exp = new Date();
                exp.setTime(exp.getTime() - 1);
                const cval = getCookie(name);
                if (cval != null) document.cookie = name + "=" + cval + ";expires=" + exp.toGMTString();
            }

            let check_2;
            let check_1;
            let temp;
            $(".username").bind('blur', function () {
                if ($(".username").val() === "") {
                    $(".tip_1").text("不能为空!")
                } else {
                    $(".tip_1").text("")
                }
            });


            $(".pwd").bind('blur', function () {
                temp = $(".pwd").val();
                let Reg = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{4,8}$/;
                check_2 = Reg.test(temp);
                // console.log(check_2)
                if (temp === "") {
                    $("#pwdSpan").text("不能为空!")
                }
                if (!check_2) {
                    $("#pwdSpan").text("密码由数字和字母组成，并且要同时含有数字和字母，且长度要在4-8位之间")
                } else {
                    $("#pwdSpan").text("");
                }
            });

            $(".def_pwd").bind('input propertychange', function () {
                if ($(".def_pwd").val() !== temp) {
                    $("#def_pwdSpan").text("密码不一致,请重新输出")
                } else {
                    $("#def_pwdSpan").text("")
                }
            });
            //重置
            $(".reset-btn").bind("click", function () {
                $(".username").val("");
                $(".account").val("");
                $(".university").val("");
                $("#AccSpan").text("");
                $(".pwd").val("");
                $("#pwdSpan").text("");
                $(".def_pwd").val("");
                $("#def_pwdSpan").text("")
            });

            //整体验证
            /* function verification() {
                 let x1 = $(".tip_1").text()
                 let x2 = $("#def_pwdSpan").text()
                 let x3 = $("#pwdSpan").text()
                 let x4 = $("#AccSpan").text()
                 let x5 = $(".university").text()
                 if (x1 === "" && x2 === "" && x3 === "" && x5 === "") {
                     if (x4 === "") {
                         //存数据
                         let value = [$(".username").val(), $(".pwd").val()];
                         SetCookie($(".account").val(), value);
                         window.open("", '_self')
                     }
                 } else {
                     alert("请完整输入");
                 }
             }*/

            //登录
            $(".Sign").bind('click', function () {
                //verification();
                let formObject = {};
                let name = $(".username");
                let ID = $(".account");
                let university = $(".unit");
                let role = $(".form-check-input");
                let pwd = $(".pwd")

                formObject[name.attr("name")] = name.val();
                formObject[ID.attr("name")] = ID.val();
                formObject[university.attr("name")] = university.val();
                formObject[role.attr("name")] = $(".form-check-input:input:radio:checked").val();
                $.each(formObject, function (i, item) {
                    console.log(formObject[item.name] + ": " + item.value);
                });
                /*  console.log(name.attr("name"))
                  console.log(name.val())
                  console.log(ID.attr("name"))
                  console.log(ID.val())
                  console.log(university.attr("name"))
                  console.log(university.val())
                  console.log(role.attr("name"))
                  console.log($(".form-check-input:input:radio:checked").val())
                  console.log(pwd.attr("name"))
                  console.log(pwd.val())*/
                $.ajax({
                    type: "POST", //提交方式
                    // dataType: "json",    //指定返回的数据类型
                    url: "${pageContext.request.contextPath}/UserRegister",//路径
                    data: {
                        "data": JSON.stringify(formObject),
                    },//数据，这里使用的是Json格式进行传输
                    async: false,

                    success: function (result) {//返回数据根据结果进行相应的处理
                        if (result === 'ok') {
                            window.location.href = "${pageContext.request.contextPath}/index.jsp"
                        } else {
                            window.alert(result);
                        }
                    },
                    error: function (result) {
                        window.alert("参数不符合规格!请重试..." + result);
                    }
                });

            });
            /* document.onkeydown = function (event) {
                 var e = event || window.event || arguments.callee.caller.arguments[0];
                 if (e && e.keyCode == 13) {
                     verification();
                 }
             };*/
        });
    </script>

</head>
<body>
<div class="col-md-12 " align="center">
    <h1>Register</h1>
</div>
<div class="col-md-12 ">
    <form class="form-horizontal commit" action="${pageContext.request.contextPath}/UserRegister" method="post">
        <div align="center">
            <div class="form-group">
                <label for="Name" class="col-sm-5 control-label">用户姓名</label>
                <div class="col-sm-2">
                    <input type="text" name="name" class="form-control username "
                           style="width:300px;"
                           id="Name" placeholder="Name">
                    <span class="tip_1" style="font-size: 12px; color: red;" disabled></span>
                </div>
            </div>
            <div class="form-group">
                <label for="university-name" class="col-sm-5 control-label">大学</label>
                <div class="col-sm-2">
                    <input type="text" name="University" class="form-control  unit"
                           style="width:300px;"
                           id="university-name" placeholder="university">
                    <span class="tip_1" style="font-size: 12px; color: red;" disabled></span>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-5 control-label">角色</label>
                <div class="col-sm-3 ">
                    <div style="display: inline;float: left;margin-right: 30px">
                        <label>
                            <input class="form-check-input" checked="checked"
                                   type="radio" name="occupation" value="学生">
                            学生
                        </label>
                    </div>
                    <div style="display: inline;float: left;margin-right: 30px">
                        <label>
                            <input class="form-check-input" type="radio" name="occupation" value="教师">
                            教师
                        </label>
                    </div>
                    <div style="display: inline;float: left;margin-right: 30px">
                        <label>
                            <input class="form-check-input" type="radio" name="occupation" value="其他">
                            其他
                        </label>
                    </div>
                    <!--<input type="text" name="role" class="form-control" placeholder="学生">-->
                </div>
            </div>
            <div class="form-group">
                <label for="inputPassword3" class="col-sm-5 control-label">密码</label>
                <div class="col-sm-2">
                    <input type="password" name="pwd" class="form-control pwd"
                           style="width:300px;"
                           id="inputPassword3" placeholder="Password">
                    <span style="font-size: 12px; color: red;" id="pwdSpan" disabled></span>
                </div>
            </div>
            <div class="form-group">
                <label for="inputPassword4" class="col-sm-5 control-label">确认密码</label>
                <div class="col-sm-2">
                    <input type="password" name="pwd" class="form-control def_pwd"
                           style="width:300px;"
                           id="inputPassword4" placeholder="Definite Password">
                    <span style="font-size: 12px; color: red;" id="def_pwdSpan" disabled></span>
                </div>
            </div>
        </div>
        <div align="center">
            <div class="col-sm-offset-2 col-sm-8">
                <button class="btn btn-default Sign ">
                    <input type="submit" value="Sign in" style="border:none;background:none;cursor:pointer;"></button>
                <button class="btn btn-default reset-btn">Reset</button>
            </div>
        </div>
    </form>

</div>
</body>
</html>
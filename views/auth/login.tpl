<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="renderer" content="webkit">
    <title>{{.admin.title}} | {{.admin.name}}</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    {{assets_css "/static/admin/plugins/bootstrap/css/bootstrap.min.css"}}
    {{assets_css "/static/admin/plugins/font-awesome/css/font-awesome.min.css"}}
    {{assets_css "/static/admin/css/AdminLTE.min.css"}}
    {{assets_css "/static/admin/css/admin.css"}}

    <!-- 如果有登录背景 -->
    {{if ne .login_config.Background ""}}
    <style>
        .login-page{
            background-color: #ececec;
            background-image: url({{.login_config.Background}});
            background-repeat: no-repeat;
            background-size: cover;
            background-attachment: fixed;
            background-position: 50% 50%;
        }
    </style>
    {{end}}

    <script>
        var adminDebug = {{.debug}};
    </script>

    {{assets_js "/static/admin/plugins/jquery/jquery.min.js"}}
    {{assets_js "/static/admin/plugins/bootstrap/js/bootstrap.min.js"}}
    {{assets_js "/static/admin/plugins/jquery-validation/jquery.validate.min.js"}}
    {{assets_js "/static/admin/plugins/jquery-validation/localization/messages_zh.min.js"}}
    {{assets_js "/static/admin/plugins/layer/layer.js"}}
    {{assets_js "/static/admin/js/admin.js"}}

    <!--[if lt IE 9]>
    {{assets_js "https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"}}
    {{assets_js "https://oss.maxcdn.com/respond/1.4.2/respond.min.js"}}
    <![endif]-->

</head>
<body class="hold-transition login-page">
<div class="login-box">
    <div class="login-logo">
        <a>{{.admin.name}}</a>
    </div>
    <div class="login-box-body">
        <p class="login-box-msg">登录</p>
        <form class="dataForm" id="dataForm" action="{{urlfor "AuthController.CheckLogin"}}" method="post">
            <div class="form-group has-feedback">
                <input name="username" id="username" autocomplete="off" type="text" class="form-control" placeholder="用户名">
                <span class="glyphicon glyphicon-user form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input name="password" id="password" autocomplete="off" type="password" class="form-control" placeholder="密码">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>

            {{if eq .login_config.Captcha "1"}}
                {{template "auth/captcha.tpl" .}}
            {{end}}

            <div class="row">
                <div class="col-xs-8">
                    <div class="checkbox">
                        <label>
                            <input id="remember" name="remember" value="1" type="checkbox"> 记住我
                        </label>
                    </div>
                </div>
                <div class="col-xs-4">
                    <button type="submit" id="loginButton" class="btn btn-primary btn-block btn-flat">登录</button>
                </div>
            </div>
        </form>
    </div>
</div>
<div id="browser_warning" style="display: none">
    <div class=" margin text-center">
        <p class="text-red ">请使用现代浏览器(谷歌浏览器、360极速或其他国产浏览器极速模式)操作本后台！</p>
        <a class="btn btn-success" target="_blank" href="https://www.google.cn/chrome/" data-toggle="tooltip"
           title="点击去下载谷歌浏览器">谷歌浏览器</a>
        <a class="btn btn-success" target="_blank" href="https://browser.360.cn/ee/index.html" data-toggle="tooltip"
           title="点击去下载360极速浏览器">360极速浏览器</a>
        <a class="btn btn-success" target="_blank" href="https://browser.qq.com/" title="点击去下载QQ浏览器"
           data-toggle="tooltip">QQ浏览器</a>
    </div>
</div>

<script>

    $(document).ready(function () {
        $("#dataForm").validate({
            rules: {
                username: {
                    required: true,
                    minlength: 2
                },
                password: {
                    required: true,
                    minlength: 6
                },
            },
            messages: {
                username: {
                    required: "请输入用户名",
                    minlength: "用户名长度不能小于2"
                },
                password: {
                    required: "请输入密码",
                    minlength: "密码长度不能小于6"
                },
            }
        });
        $('#username').focus();
    });


    checkBrowser();

    /*检查浏览器*/
    function checkBrowser() {
        if (isIE()) {
            if(adminDebug){
                console.log('古代浏览器');
            }
            layer.open({
                type: 1,
                content: $('#browser_warning').html(),
                icon: 5,
                title: '警告',
                area: ['500px', '300px'],
                closeBtn: 0,
                moveType: 1,
                resize: false
            });
        } else {
            if(adminDebug){
                console.log('现代浏览器');
            }
        }
    }

    function isIE() {
        return !!window.ActiveXObject || "ActiveXObject" in window;
    }

</script>
</body>
</html>

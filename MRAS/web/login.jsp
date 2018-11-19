<%--
  Created by IntelliJ IDEA.
  User: david
  Date: 2018/10/13
  Time: 13:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<html>
<head>
    <title>MRAS | 用户登录</title>
    <script type="text/javascript">
        function validate() {
            var form = document.forms[0];
            if (form.username.value == "" || form.password.value == "") {
                alert("账号或密码不能为空，请输入");
                return false;
            } else {
                return true;
            }
        }
    </script>
</head>
<body>
<h2>用户登录</h2>
<hr>
<div id="container">
    <div id="box">
        <form name="login" action="login_check.jsp" method="post" onSubmit="validate()">
            <p class="main">
                <label>账号：</label>
                <input name="username" value=""/><br><br>
                <label>密码：</label>
                <input type="password" name="password" value=""><br><br>
                <label>身份：</label>
                <input type="radio" name="identity" value="doctor" checked="checked">医生
                <input type="radio" name="identity" value="patient">患者
                <br><br><span style="color: red; ">注：账号和密码不能为空</span>
            </p>
            <p class="space">
                <input type="submit" value="登录" class="login" style="margin-left:5px;">
            </p>
        </form>
    </div>
    <div>
        <form action="regis.jsp" method="post">
            <input type="submit" value="注册" class="regis" style="margin-left:5px;">
        </form>
    </div>
</div>
</body>
</html>
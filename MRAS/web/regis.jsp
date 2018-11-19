<%--
  Created by IntelliJ IDEA.
  User: david
  Date: 2018/10/14
  Time: 10:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>MRAS | 用户注册</title>
    <script type="text/javascript">
        function validate() {
            var form = document.forms[0];
            if (form.username.value == "" || form.password.value =="" || form.confirm.value =="") {
                alert("账号或密码不能为空，请输入");
                return false;
            } else {
                if (form.password.value != form.confirm.value) {
                    alert("两次密码输入不一致");
                    return false;
                } else {
                    return true;
                }
            }
        }
    </script>
</head>
<body>
<h2>用户注册</h2>
<hr>
<div id="container">
    <div id="box">
        <form action="regis_check.jsp" method="post" onSubmit="validate()">
            <p class="main">
                <label>账号：</label>
                <input name="username" value=""/><br><br>
                <label>密码：</label>
                <input type="password" name="password" value=""><br><br>
                <label>确认：</label>
                <input type="password" name="confirm" value=""><br><br>
                <label>身份：</label>
                <input type="radio" name="identity" value="doctor" checked="checked">医生
                <input type="radio" name="identity" value="patient">患者
                <br><br><span style="color: red; ">注：账号和密码不能为空</span>
            </p>
            <p class="space">
                <input type="submit" value="注册" class="regis" style="margin-left:5px;">
            </p>
        </form>
        <a href="login.jsp">返回登录页面</a>
    </div>
</div>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: david
  Date: 2018/10/15
  Time: 14:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>MRAS | 输入病历</title>
    <script type="text/javascript">
        function validate() {
            var form = document.forms[0];
            if (form.Rno.value == "") {
                alert("编号不能为空，请输入");
                return false;
            } else {
                return true;
            }
        }
    </script>
</head>
<body>
<h2>病历信息输入</h2>
<hr>
<form action="insert_check.jsp" method="post" id="form" onSubmit="validate()">
    <h4> 编号：<input type="text" name="Rno" class="{required:true}"><span style="color: red; "> 注：编号不能为空</span></input>
        <br></h4>
    <h4> 姓名：<input type="text" name="account"></input><br></h4>
    <h4> 年龄：<input type="text" name="age"></input><br></h4>
    <h4> 性别：<input type="radio" name="sex" value="male" checked="checked">男
        <input type="radio" name="sex" value="female">女
        <br></h4>
    <h4> 电话：<input type="text" name="tel"></input><br></h4>
    <h4> 时间：<input type="text" name="date_yyyy" style="width:47px"></input>-<input type="text" name="date_mm" style="width:47px"></input>-<input type="text" name="date_dd" style="width:47px"></input><br></h4>
    <h4> 科室：<input type="text" name="department"></input><br></h4>
    <h4> 医生：<input type="text" name="doctor"></input><br></h4>
    <h4> 诊断：<input type="text" name="diagnosis"></input><br></h4>
    <h4> 详细：<input type="text" name="detail"></input><br></h4>
    <h4> 意见：<input type="text" name="opinion"></input><br></h4>
    <input type="submit" value="提交"/>
</form>
<a href=trans.jsp>查看已输入病例</a>
</body>
</html>
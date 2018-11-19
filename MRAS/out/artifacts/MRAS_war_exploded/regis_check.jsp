<%--
  Created by IntelliJ IDEA.
  User: david
  Date: 2018/10/14
  Time: 11:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>MRAS | 注册结果</title>
</head>
<body>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String confirm = request.getParameter("confirm");
    String identity = request.getParameter("identity");

    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/mras?useUnicode=true&characterEncoding=UTF8", "root", "123456");

    String sql1 = "select account from user where account='"+username+"' and identity='"+identity+"'";
    Statement stat1 = conn.createStatement();
    ResultSet rs = stat1.executeQuery(sql1);
    if(username.isEmpty() || password.isEmpty() || confirm.isEmpty()){
        %>
        <h2>注册失败</h2>
        <hr>
        <jsp:forward page="regis.jsp" />
        <%
        out.println("含有空项");
        %>
        <br><br><a href="regis.jsp">返回注册</a>
        <%
    } else {
        if (rs.next()) {
        %>
        <h2>注册失败</h2>
        <hr>
        <%
        out.println("该用户已存在");
        %>
        <br><br><a href="regis.jsp">返回注册</a>
        <%
        } else {
            if(password.equals(confirm)){
                String sql2 = "insert into user(account,passwd,identity) values('" + username + "','" + password + "','" + identity + "')";
                Statement stat2 = conn.createStatement();
                stat2.executeUpdate(sql2);
                %>
                <h2>注册成功</h2>
                <hr>
                <br><a href="login.jsp">返回登录</a>
                <%
            }else{
                %>
                <h2>注册失败</h2>
                <hr>
                <jsp:forward page="regis.jsp" />
                <%
                out.println("两次密码输入不一致");
                %>
                <br><br><a href="regis.jsp">返回注册</a>
                <%
            }
        }
    }
%>
</body>
</html>

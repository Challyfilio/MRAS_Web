<%--
  Created by IntelliJ IDEA.
  User: david
  Date: 2018/10/13
  Time: 18:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>MRAS | 登录失败</title>
</head>
<body>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String identity = request.getParameter("identity");

    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/mras?useUnicode=true&characterEncoding=UTF8", "Challyfilio", "123456");

    String sql = "select account,passwd from user where account = '" + username + "' and passwd = '" + password + "' and identity ='" + identity + "'";
    Statement stat = conn.createStatement();
    ResultSet rs = stat.executeQuery(sql);
    if(username.isEmpty() || password.isEmpty()){
        %>
        <jsp:forward page="login.jsp" />
        <%
    }else{
        if (rs.next()) {
            if (identity.equals("doctor")) {
                request.setAttribute("identity","doctor");
                request.setAttribute("name",username);
                %>
                <jsp:forward page="showlist.jsp" />
                <%
            } else {
                request.setAttribute("identity","patient");
                request.setAttribute("name",username);
                %>
                <jsp:forward page="showlist.jsp" />
                <%
            }
        } else {
            %>
            <h2>登录失败</h2>
            <hr>
            <%
            out.println("用户名或密码错误");
            %>
            <br><br><a href="regis.jsp">前往注册</a>
            <br><a href="login.jsp">返回登录</a>
            <%
        }
    }
%>
</body>
</html>
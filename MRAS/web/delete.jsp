<%--
  Created by IntelliJ IDEA.
  User: david
  Date: 2018/10/15
  Time: 19:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>MRAS | 删除病历</title>
</head>
<body>
<%
    response.setCharacterEncoding("UTF-8");
    request.setCharacterEncoding("UTF-8");
    String Rno = request.getParameter("Rno");
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/mras?useUnicode=true&characterEncoding=UTF8", "root", "123456");
    Statement stat = conn.createStatement();
    ResultSet rs = stat.executeQuery("select * from info where Rno = '" + Rno + "'");
%>
<h2>病历信息</h2>
<hr>
<h3>删除的病历信息如下：</h3>
<table width="1260" border="100" cellSpacing=1 style="font-size:15pt;border:dashed 1pt;float: contour">
    <tr>
        <th>编号</th>
        <th>姓名</th>
        <th>年龄</th>
        <th>性别</th>
        <th>电话</th>
        <th>日期</th>
        <th>科室</th>
        <th>医生</th>
        <th>诊断</th>
        <th>详细</th>
        <th>意见</th>
    </tr>
    <%
        while (rs.next()) {
            out.print("<tr>");
            out.print("<td width=\"50\" align=\"center\">" + rs.getString("Rno") + "</td>");
            out.print("<td width=\"50\" align=\"center\">" + rs.getString("account") + "</td>");
            out.print("<td width=\"50\" align=\"center\">" + rs.getInt("age") + "</td>");
            out.print("<td width=\"50\" align=\"center\">" + rs.getString("sex") + "</td>");
            out.print("<td width=\"50\" align=\"center\">" + rs.getString("tel") + "</td>");
            out.print("<td width=\"100\" align=\"center\">" + rs.getDate("date") + "</td>");
            out.print("<td width=\"100\" align=\"center\">" + rs.getString("department") + "</td>");
            out.print("<td width=\"50\" align=\"center\">" + rs.getString("doctor") + "</td>");
            out.print("<td width=\"100\" align=\"center\">" + rs.getString("diagnosis") + "</td>");
            out.print("<td width=\"100\" align=\"center\">" + rs.getString("detail") + "</td>");
            out.print("<td width=\"100\" align=\"center\">" + rs.getString("opinion") + "</td>");
            out.print("</tr>");
        }
        stat.executeUpdate("delete from info where Rno='" + Rno + "'");
    %>
</table>
<h3>删除成功</h3>
<%
    if (rs != null) {
        rs.close();
    }
    if (stat != null) {
        stat.close();
    }
    if (conn != null) {
        conn.close();
    }
%>
<h3><a href=insert.jsp>返回病历输入页面</a></h3>
<h3><a href=trans.jsp>返回病历查看页面</a></h3>
</body>
</html>
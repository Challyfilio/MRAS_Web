<%--
  Created by IntelliJ IDEA.
  User: david
  Date: 2018/10/15
  Time: 19:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>MRAS | 更改结果</title>
</head>
<body>
<%
    response.setCharacterEncoding("UTF-8");
    request.setCharacterEncoding("UTF-8");
    String Rno1 = request.getParameter("Rno");
    String account1 = request.getParameter("account");
    String age1 = request.getParameter("age");
    String sex1 = request.getParameter("sex");
    String tel1 = request.getParameter("tel");
    String date_yyyy1 = request.getParameter("date_yyyy");
    String date_mm1 = request.getParameter("date_mm");
    String date_dd1 = request.getParameter("date_dd");
    String department1 = request.getParameter("department");
    String doctor1 = request.getParameter("doctor");
    String diagnosis1 = request.getParameter("diagnosis");
    String detail1 = request.getParameter("detail");
    String opinion1 = request.getParameter("opinion");

    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/mras?useUnicode=true&characterEncoding=UTF8", "root", "123456");
    Statement stat = conn.createStatement();
    stat.executeUpdate("update info set account='" + account1 + "',age=" + age1 + ",sex='" + sex1 + "',tel='" + tel1 + "',date='" + date_yyyy1 + "-" + date_mm1 + "-" + date_dd1 + "',department='" + department1 + "',doctor='" + doctor1 + "',diagnosis='" + diagnosis1 + "',detail='" + detail1 + "',opinion='" + opinion1 + "'where Rno='" + Rno1 + "'");
    ResultSet rs = stat.executeQuery("select * from info where Rno='" + Rno1 + "'");
%>
<h3>修改后的信息为：</h3>
<hr>
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
    %>
</table>
<h3>修改成功</h3>
<h3><a href=insert.jsp>返回病历输入页面</a></h3>
<h3><a href=trans.jsp>返回病历查看页面</a></h3>
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
</body>
</html>
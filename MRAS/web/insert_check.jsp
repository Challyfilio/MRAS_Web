<%--
  Created by IntelliJ IDEA.
  User: david
  Date: 2018/10/15
  Time: 16:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>MRAS | 输入结果</title>
</head>
<body>
<%
    response.setCharacterEncoding("UTF-8");
    request.setCharacterEncoding("UTF-8");
    String Rno = request.getParameter("Rno");
    String account = request.getParameter("account");
    String age = request.getParameter("age");
    String sex = request.getParameter("sex");
    String tel = request.getParameter("tel");
    String date_yyyy = request.getParameter("date_yyyy");
    String date_mm = request.getParameter("date_mm");
    String date_dd = request.getParameter("date_dd");
    String department = request.getParameter("department");
    String doctor = request.getParameter("doctor");
    String diagnosis = request.getParameter("diagnosis");
    String detail = request.getParameter("detail");
    String opinion = request.getParameter("opinion");

    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/mras?useUnicode=true&characterEncoding=UTF8", "root", "123456");
    Statement stat = conn.createStatement();
    ResultSet rs = stat.executeQuery("select * from info");
    if (Rno.isEmpty()) {
        %>
        <h2>病历输入失败</h2>
        <hr>
        <jsp:forward page="insert.jsp" />
        <%
        out.println("编号不能为空");
        %>
        <br><br><a href="insert.jsp">返回输入</a>
        <%
    } else {
        boolean flag = false;//编号重复标记
        while (rs.next()) {
            if (Rno.equals(rs.getString("Rno"))) {
                flag = true;
                %>
                <h2>病历输入失败</h2>
                <hr>
                <%
                out.println("该编号已存在");
                %>
                <br><br><a href="insert.jsp">返回输入</a>
                <%
            }
        }
        if (!flag) {
            Statement stat2 = conn.createStatement();
            stat2.executeUpdate("insert into info(Rno,account,age,sex,tel,date,department,doctor,diagnosis,detail,opinion)" +
                "values('" + Rno + "','" + account + "'," + age + ",'" + sex + "','" + tel + "','" + date_yyyy + "-" + date_mm + "-" + date_dd + "'," +
                "'" + department + "','" + doctor + "','" + diagnosis + "','" + detail + "','" + opinion + "')");
            Statement stat3 = conn.createStatement();
            ResultSet rs1 = stat3.executeQuery("select * from info where Rno='" + Rno + "'");
            %>
            <h2>病历信息</h2>
            <hr>
            <h3>输入的病历信息如下：</h3>
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
            while (rs1.next()) {
                out.print("<tr>");
                out.print("<td width=\"50\" align=\"center\">" + rs1.getString("Rno") + "</td>");
                out.print("<td width=\"50\" align=\"center\">" + rs1.getString("account") + "</td>");
                out.print("<td width=\"50\" align=\"center\">" + rs1.getInt("age") + "</td>");
                out.print("<td width=\"50\" align=\"center\">" + rs1.getString("sex") + "</td>");
                out.print("<td width=\"50\" align=\"center\">" + rs1.getString("tel") + "</td>");
                out.print("<td width=\"100\" align=\"center\">" + rs1.getDate("date") + "</td>");
                out.print("<td width=\"100\" align=\"center\">" + rs1.getString("department") + "</td>");
                out.print("<td width=\"50\" align=\"center\">" + rs1.getString("doctor") + "</td>");
                out.print("<td width=\"100\" align=\"center\">" + rs1.getString("diagnosis") + "</td>");
                out.print("<td width=\"100\" align=\"center\">" + rs1.getString("detail") + "</td>");
                out.print("<td width=\"100\" align=\"center\">" + rs1.getString("opinion") + "</td>");
                out.print("</tr>");
            }
            %>
</table>
    <h3>输入成功</h3>
    <h3><a href=insert.jsp>返回病历输入页面</a></h3>
    <h3><a href=trans.jsp>进入病历查看页面</a></h3>
    <%
        }
    }
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
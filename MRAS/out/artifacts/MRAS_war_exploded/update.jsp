<%--
  Created by IntelliJ IDEA.
  User: david
  Date: 2018/10/15
  Time: 19:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
    <title>MRAS | 更改病历</title>
</head>
<body>
<%
    response.setCharacterEncoding("UTF-8");
    request.setCharacterEncoding("UTF-8");
    String Rno = request.getParameter("Rno");
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/mras?useUnicode=true&characterEncoding=UTF8", "root", "123456");
    Statement stat = conn.createStatement();
    ResultSet rs = stat.executeQuery("select * from info where Rno = '"+Rno+"'");
%>
<h2>病历信息</h2>  <hr>
<h3>更改的病历信息如下：</h3>
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
        while(rs.next()) {
            out.print("<tr>");
            out.print("<td width=\"50\" align=\"center\">"+rs.getString("Rno")+"</td>");
            out.print("<td width=\"50\" align=\"center\">"+rs.getString("account")+"</td>");
            out.print("<td width=\"50\" align=\"center\">"+rs.getInt("age")+"</td>");
            out.print("<td width=\"50\" align=\"center\">"+rs.getString("sex")+"</td>");
            out.print("<td width=\"50\" align=\"center\">"+rs.getString("tel")+"</td>");
            out.print("<td width=\"100\" align=\"center\">"+rs.getDate("date") + "</td>");
            out.print("<td width=\"100\" align=\"center\">"+rs.getString("department") + "</td>");
            out.print("<td width=\"50\" align=\"center\">"+rs.getString("doctor") + "</td>");
            out.print("<td width=\"100\" align=\"center\">"+rs.getString("diagnosis") + "</td>");
            out.print("<td width=\"100\" align=\"center\">"+rs.getString("detail") + "</td>");
            out.print("<td width=\"100\" align=\"center\">"+rs.getString("opinion") + "</td>");
            out.print("</tr>");
    %>
</table>
<h3>将病历信息更改为：</h3>
<form action="update_check.jsp" method="post" id="form" onSubmit= "validate()" >
    <h4>  编号：<input type="text" name="Rno" value=<%=rs.getString("Rno")%> readonly="true"></input></h4>
    <h4>  姓名：<input type="text" name="account"></input><br></h4>
    <h4>  年龄：<input type="text" name="age"></input><br></h4>
    <h4>  性别：<input type="radio" name="sex" value="male" checked="checked">男
                <input type="radio" name="sex" value="female">女
                <br></h4>
    <h4>  电话：<input type="text" name="tel"></input><br></h4>
    <h4>  时间：<input type="text" name="date_yyyy" style="width:47px"></input>-<input type="text" name="date_mm" style="width:47px"></input>-<input type="text" name="date_dd" style="width:47px"></input><br></h4>
    <h4>  科室：<input type="text" name="department"></input><br></h4>
    <h4>  医生：<input type="text" name="doctor"></input><br></h4>
    <h4>  诊断：<input type="text" name="diagnosis"></input><br></h4>
    <h4>  详细：<input type="text" name="detail"></input><br></h4>
    <h4>  意见：<input type="text" name="opinion"></input><br></h4>
    <input type="submit" value="提交"/>
</form>
<h3><a href=insert.jsp>返回病历输入页面</a></h3>
<h3><a href=trans.jsp>返回病历查看页面</a></h3>
<%
    }
    if(rs!=null) {
        rs.close();
    }
    if(stat!=null) {
        stat.close();
    }
    if(conn!=null) {
        conn.close();
    }
%>
</body>
</html>

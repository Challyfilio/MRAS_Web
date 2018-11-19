<%--
  Created by IntelliJ IDEA.
  User: david
  Date: 2018/10/15
  Time: 15:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
    request.setAttribute("identity","doctor");
    %>
    <jsp:forward page="showlist.jsp" />
</body>
</html>

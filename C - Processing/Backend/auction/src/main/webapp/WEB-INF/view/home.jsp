<%-- 
    Document   : home
    Created on : Dec 27, 2019, 6:21:51 PM
    Author     : datura
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Auction Service home!</h1>
        <hr/>
        <a href="${pageContext.request.contextPath}/user/list">users</a>
        <br/>
        <a href="${pageContext.request.contextPath}/item/list">items</a>
        <br/>
    </body>
</html>

<%-- 
    Document   : listUsers
    Created on : Dec 27, 2019, 6:31:17 PM
    Author     : datura
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Users</title>
    </head>
    <body>
        <h1>This is a user list!</h1>
        <table border="1" >
            <c:forEach items="${listOfUsers}" var="u">
                <tr>
                    <td>${u.fname}</td>
                    <td>${u.lname}</td>
                    <td>${u.email}</td>
                    <td>${u.credit}</td>
                </tr>
            </c:forEach>
            
        </table>
    </body>
</html>

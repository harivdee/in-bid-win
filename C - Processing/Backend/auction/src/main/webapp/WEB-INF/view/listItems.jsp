
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form"  %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Item List</title>
    </head>
    <body>
        <h1>This is ${user.username} item list!</h1>

        <table border="1">
            <tr>
                <td><strong>Title</strong></td>
                <td><strong>Price</strong></td>
                <td><strong>tatus</strong></td>
                

            </tr>
            <c:forEach items="${listOfItems}" var="i">
                <tr>
                    <td>${i.ititle}</td>
                    <td>${i.iprice}</td>
                    <td>${i.istatus}</td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>


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
        <a href="${pageContext.request.contextPath}/item/create">Create Item</a>

        <table border="1">
            <tr>
                <td><strong>Title</strong></td>
                <td><strong>Price</strong></td>
                <td><strong>Status</strong></td>
                <td><strong>Adress</strong></td>
                <td><strong>Size in m<sup>2</sup></strong></td>
                <td><strong>Rooms</strong></td>
                <td><strong>Bathrooms</strong></td>
                <td><strong>Heating</strong></td>
                <td><strong>Furnished</strong></td>
                <td><strong>Description</strong></td>
                <td><strong>Thumbnail</strong></td>


            </tr>
            <c:forEach items="${listOfItems}" var="i">
                <tr>
                    <td>${i.ititle}</td>
                    <td>${i.iprice}</td>
                    <td>${i.istatus}</td>
                    <td>${i.house.hlocation}</td>
                    <td>${i.house.hsize}</td>
                    <td>${i.house.hroom}</td>
                    <td>${i.house.hbathroom}</td>
                    <td>${i.house.hheating}</td>
                    <td>${i.house.hfurnished}</td>
                    <td>${i.house.hdescr}</td>
                    <td><img width="100" height="100" src="${pageContext.request.contextPath}/image/thumbnail?id=${i.itemid}"></td>
                </tr>
            </c:forEach>


        </table>
    </body>
</html>

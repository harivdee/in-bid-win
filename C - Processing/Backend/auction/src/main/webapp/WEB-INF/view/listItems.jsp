
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
        <c:url value="/item/create" var="createLink" >
            <c:param name="userId" value="${user.userid}" />
        </c:url>
        <a href="${createLink}">Create Item</a>

        <table border="1">
            <tr>
                <td><strong>Title</strong></td>
                <td><strong>Price</strong></td>
                <td><strong>Status</strong></td>
                <td><strong>Address</strong></td>
                <td><strong>Floor</strong></td>
                <td><strong>Size in m<sup>2</sup></strong></td>
                <td><strong>Rooms</strong></td>
                <td><strong>Bathrooms</strong></td>
                <td><strong>Heating</strong></td>
                <td><strong>Furnished</strong></td>
                <td><strong>Description</strong></td>
                <td><strong>Images</strong></td>


            </tr>
            <c:forEach items="${listOfItems}" var="i">
                <c:url var="updateLink" value="/item/update">
                    <c:param name="itemId" value="${i.itemid}" />
                </c:url>
                <c:url var="deleteLink" value="/item/delete">
                    <c:param name="itemId" value="${i.itemid}" />
                    <c:param name="userId" value="${user.userid}" />
                </c:url>
                <c:url var="listImagesLink" value="/image/list">
                    <c:param name="houseId" value="${i.house.hid}" />
                </c:url>
                <tr>
                    <td>${i.ititle}</td>
                    <td>${i.iprice}</td>
                    <td>${i.istatus}</td>
                    <td>${i.house.hlocation}</td>
                    <td>${i.house.hfloor}</td>
                    <td>${i.house.hsize}</td>
                    <td>${i.house.hroom}</td>
                    <td>${i.house.hbathroom}</td>
                    <td>${i.house.hheating}</td>
                    <td>${i.house.hfurnished}</td>
                    <td>${i.house.hdescr}</td>
                    <td><a href="${listImagesLink}">Images</a></td>
                    <td colspan="2">
                        <a href="${updateLink}">Update</a>
                        <a href="${deleteLink}"
                           onclick="if (!(confirm('Are you sure you want to delete item with title ${i.ititle}?')))
                                       return false"
                           >Delete</a>
                    </td>



                </tr>
            </c:forEach>


        </table>
    </body>
</html>

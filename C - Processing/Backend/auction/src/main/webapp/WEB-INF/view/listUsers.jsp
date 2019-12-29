<%-- 
    Document   : listUsers
    Created on : Dec 27, 2019, 6:31:17 PM
    Author     : datura
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form"  %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Users</title>
    </head>
    <body>
        <h1>This is a user list!</h1>
        <a href="${pageContext.request.contextPath}/user/create">Create User</a>
        <f:form action="${pageContext.request.contextPath}/user/search" method="GET">
            Search Name: <input type="text" name="searchName" size="10">
            <input type="submit" value="Search">
        </f:form>

        <table border="1" >
            <tr>
                <td><strong>Name</strong></td>
                <td><strong>Surname</strong></td>
                <td><strong>Username</strong></td>
                <td><strong>Email</strong></td>
                <td><strong>Credit</strong></td>

            </tr>
            <c:forEach items="${listOfUsers}" var="u">
                <c:url value="/user/delete" var="deleteLink" >
                    <c:param name="userId" value="${u.userid}" />
                </c:url>
                <c:url var="updateLink" value="/user/update">
                    <c:param name="userId" value="${u.userid}" />
                </c:url>
                <c:url var="listItemsLink" value="/item/list">
                    <c:param name="userId" value="${u.userid}" />
                </c:url>
                <tr>
                    <td>${u.fname}</td>
                    <td>${u.lname}</td>
                    <td>${u.username}</td>
                    <td>${u.email}</td>
                    <td>${u.credit}</td>
                    <td colspan="2">
                        <a href="${updateLink}">Update</a>
                        <a href="${deleteLink}"
                           onclick="if (!(confirm('Are you sure you want to delete user with username: ${u.username}?')))
                                       return false"
                           >Delete</a>
                    </td>
                    <td>
                        <a href="${listItemsLink}">Items</a>
                    </td>
                </tr>
            </c:forEach>

        </table>
    </body>
</html>

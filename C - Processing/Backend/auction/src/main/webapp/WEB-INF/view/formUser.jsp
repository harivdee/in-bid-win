<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Form</title>
    </head>
    <body>
        <h1>This is Create User Form!</h1>
        <f:form id="formUser" 
                action="${pageContext.request.contextPath}/user/create"
                method="POST"
                modelAttribute="user">
            <f:hidden path="userid"/>
            Name: <f:input path="fname"/>
            <f:errors path="fname"/><br/>
            Surname: <f:input path="lname"/>
            <f:errors path="lname"/><br/>
            Username: <f:input path="username"/>
            <f:errors path="username"/><br/>
            Password <f:input path="password"/>
            <f:errors path="password"/><br/>
            Email <f:input path="email"/>
            <f:errors path="email"/><br/>
            Credit <f:input path="credit"/><br/>
            

            <input type="submit" value="Submit">
        </f:form><br/>
        <a href="${pageContext.request.contextPath}/user/list">Back to user list</a>

    </body>
</html>

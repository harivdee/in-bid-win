<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>


<!DOCTYPE html>
<html>
    <head>
        <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
              integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"
              integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="/css/index.css">
        <link rel="icon" type="image/png" sizes="16x16" href="https://i.ibb.co/kXB6NYF/favicon.png">
        <title>Add Listing</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <h1>This is an auction form for item ${itemId}</h1>
        <c:url value="/auction/create" var="createAuction" >
            <c:param name="itemId" value="${itemId}"/>
        </c:url>
        <f:form id="formAuction"
                action="${createAuction}"
                method="POST"
                modelAttribute="auction">
            <f:hidden path="auctionid"/>
            Increment: <f:input type="number" path="aincrement"/>
            <f:errors path="aincrement"/><br/>
            Reserve <f:input type="number" path="areserve"/>
            <f:errors path="areserve"/><br/>
            <input type="submit" value="Submit">

        </f:form>
            <jsp:include page="footer.jsp"/>
    </body>
</html>

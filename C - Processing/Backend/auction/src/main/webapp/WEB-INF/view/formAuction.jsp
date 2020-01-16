<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Auction form</title>
    </head>
    <body>
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
    </body>
</html>

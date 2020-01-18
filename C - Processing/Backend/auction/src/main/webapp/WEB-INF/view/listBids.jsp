<%-- 
    Document   : removeThis
    Created on : Jan 18, 2020, 10:38:41 AM
    Author     : datura
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>This is the bid list for auction with id = ${auctionId} </h1>
        <table border="1">
            <tr>
                <td><strong>Bid ID</strong></td>
                <td><strong>Bid price</strong></td>
                <td><strong>Bid Time</strong></td>
                <td><strong>Bidder username</strong></td>


            </tr>
            <c:forEach items="${bidList}" var="b">
                <c:url var="deleteLink" value="/bid/delete">
                    <c:param name="bidId" value="${b.bidid}" />
                </c:url>
            
            <tr>
                <td>${b.bidid}</td>
                <td>${b.bprice}</td>
                <td>${b.btime}</td>
                <td>${b.user.username}</td>
                <td>
                    <a href="${deleteLink}"
                           onclick="if (!(confirm('Are you sure you want to delete bid for auction ${auctionId}?')))
                                       return false"
                           >Delete</a>  
                </td>
            </tr>
            </c:forEach>
        </table>
    </body>
</html>

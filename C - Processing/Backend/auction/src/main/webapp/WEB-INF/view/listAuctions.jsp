
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Auction</title>
    </head>
    <body>
        <h1>This is an auction list</h1>

        <table border="1" >
            <tr>
                <td><strong>Title</strong></td>
                <td><strong>Address</strong></td>
                <td><strong>End Time</strong></td>


            </tr>
            <c:forEach items="${listOfAuctions}" var="a">
                <c:url var="updateLink" value="/auction/update">
                    <c:param name="auctionId" value="${a.auctionid}" />
                </c:url>
                <c:url var="deleteLink" value="/auction/delete">
                    <c:param name="auctionId" value="${a.auctionid}" />
                </c:url>
                <tr>
                    <td>${a.item.ititle}</td>
                    <td>${a.item.house.hlocation}</td>
                    <td>${a.etime}</td>
                    <td colspan="2">
                        <a href="${updateLink}">Update</a>
                        <a href="${deleteLink}"
                           onclick="if (!(confirm('Are you sure you want to delete auction for item ${a.item.ititle}?')))
                                       return false"
                           >Delete</a>  
                    </td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>

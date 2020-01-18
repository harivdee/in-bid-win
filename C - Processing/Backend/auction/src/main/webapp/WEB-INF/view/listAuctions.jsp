
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
              integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"
              integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="/css/index.css">
        <link rel="icon" type="image/png" sizes="16x16" href="https://i.ibb.co/kXB6NYF/favicon.png">
        <title>Auction Listings</title>
    </head>
    <body>
        <jsp:include page="header.jsp" />
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
        <jsp:include page="footer.jsp" />
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
            integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
    crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
            integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
    crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
            integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
    crossorigin="anonymous"></script>
    </body>
</html>

<%-- 
    Document   : removeThis
    Created on : Jan 18, 2020, 10:38:41 AM
    Author     : datura
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
              integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"
              integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="/css/index.css">
        <link rel="icon" type="image/png" sizes="16x16" href="https://i.ibb.co/kXB6NYF/favicon.png">
        <title>List Bids</title>
    </head>
    <body>
        <jsp:include page="header.jsp" />

        <sec:authorize access="hasRole('USER') and isAuthenticated()">
            <sec:authentication var="user" property="principal" />

            <h1 class="ml-1">${user.username} bids</h1>
        </sec:authorize>

            <div class="card deck d-flex flex-row flex-wrap">
             <c:forEach items="${bidList}" var="b">
                <security:authorize access="hasRole('ADMIN')">
                    <c:url var="deleteLink" value="/bid/delete">
                        <c:param name="bidId" value="${b.bidid}" />
                    </c:url>
                </security:authorize>
                <div class="col-sm-4 m-2">
                    <div class="card border-info mb-3" style="max-width: 18rem;">
                        <div class="card-header bg-transparent border-info">${b.auction.item.ititle} info</div>
                        <div class="card-body text-dark">
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item">Bid Price: $${b.bprice}</li>
                                <li class="list-group-item">Bid Time: ${b.btime}</li>
                                <li class="list-group-item">Auction End Time: ${b.auction.etime}</li>
                            </ul>
                        </div>
                        <div class="card-footer bg-transparent border-info d-flex justify-content-center">
                            <sec:authorize access="hasRole('ADMIN') and isAuthenticated()">
                            <button class="btn btn-danger text-white"><a href="${deleteLink}"
                               onclick="if (!(confirm('Are you sure you want to delete bid for auction ${auctionId}?')))
                                           return false"
                                                   >Delete</a></button>  
                    </sec:authorize>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

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

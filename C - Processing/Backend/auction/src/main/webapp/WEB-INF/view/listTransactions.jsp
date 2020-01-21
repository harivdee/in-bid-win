<%-- 
    Document   : listTransactions
    Created on : Jan 21, 2020, 1:28:52 PM
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
        <title>List Transaction</title>
    </head>
    <body>
        <jsp:include page="header.jsp" />
        <sec:authorize access="hasRole('USER') and isAuthenticated()">
            <sec:authentication var="user" property="principal" />
            <h1>${user.username} transactions</h1>
        </sec:authorize>
        <h3>Won Auctions. Congratulations!</h3>
        <table border="1">
            <tr>
                <td><strong>Auction Title</strong></td>
                <td><strong>Price</strong></td>
                <td><strong>Auction Owner</strong></td>

            </tr>  
            <c:forEach items="${winnerTransactions}" var="wt">
                <tr>
                    <td>${wt.item.ititle}</td>
                    <td>${wt.tprice}</td>
                    <td>${wt.owner.username}</td>
                </tr>
            </c:forEach>
        </table>

        <h3>Your finished auctions</h3>
        <table border="1">
            <tr>
                <td><strong>Auction Title</strong></td>
                <td><strong>Price</strong></td>
                <td><strong>Auction Winner</strong></td>

            </tr>  
            <c:forEach items="${ownerTransactions}" var="ot">
                <tr>
                    <td>${ot.item.ititle}</td>
                    <td>${ot.tprice}</td>
                    <td>${ot.winner.username}</td>
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

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
        <h3>Congratulations! You've won the Auction!</h3>
        
            <div class="card deck d-flex flex-row flex-wrap">
                <c:forEach items="${winnerTransactions}" var="wt">
                    <div class="col-sm-4 m-2">
                        <div class="card border-info mb-3" style="max-width: 18rem;">
                            <div class="card-header bg-transparent border-info">info</div>
                            <div class="card-body text-dark">
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item">Title: ${wt.item.ititle}</li>
                                    <li class="list-group-item">Winning Price: $${wt.tprice}</li>
                                    <li class="list-group-item">Sold by: ${wt.owner.username}</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <h3 class='mb-1'>Your sold items</h3>
             <div class="card deck d-flex flex-row flex-wrap">
                <c:forEach items="${ownerTransactions}" var="ot">
                    <div class="col-sm-4 m-2">
                        <div class="card border-info mb-3" style="max-width: 18rem;">
                            <div class="card-header bg-transparent border-info">info</div>
                            <div class="card-body text-dark">
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item">Title: ${ot.item.ititle}</li>
                                    <li class="list-group-item">Price Sold: $${ot.tprice}</li>
                                    <li class="list-group-item">Sold by: ${ot.winner.username}</li>
                                </ul>
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

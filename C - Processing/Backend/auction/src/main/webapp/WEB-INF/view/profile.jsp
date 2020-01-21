<%-- 
    Document   : userDashboard
    Created on : 17-Jan-2020, 15:30:58
    Author     : georg
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


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
        <title>Profile Page</title>
    </head>
    <body>
        <jsp:include page="header.jsp" />


        <div class="col-sm-4 m-2">
            <div class="card border-info mb-3" style="max-width: 18rem;">
                <div class="card-header bg-transparent border-info"><strong>${user.username}</strong> profile</div>
                <div class="card-body text-dark">
                    <h5 class="card-title">${user.fname} ${user.lname}</h5>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">Username: ${user.username}</li>
                        <li class="list-group-item">email: ${user.email}</li>
                        <li class="list-group-item">Credit: $${user.credit}
                        </li>
                    </ul>
                </div>
                <div class="card-footer bg-transparent border-info d-flex justify-content-around">
                    <c:url var="listItemsLink" value="/item/list">
                        <c:param name="userId" value="${user.userid}" />
                    </c:url>
                    <c:url var="listTransactions" value="/transaction/list">
                        <c:param name="userId" value="${user.userid}" />
                    </c:url>
                    <div class="d-flex flex-wrap justify-content-around align-items-center ">
                    <button class="btn btn-info mr-1 mb-1"><a class="text-white"href="${listItemsLink}">Items</a></button>
                    <button class="btn btn-warning mr-1 mb-1"><a class="text-white"href="${listTransactions}">Transactions</a></button>
                    <button class="btn btn-dark">
                        <a class="text-white nav-link" href="${pageContext.request.contextPath}/addCredits">
                            <i id="cart_n" class="fa fa-cc-paypal" aria-hidden="true"></i>Paypal
                        </a>
                    </button>
                            </div>
                </div>
            </div>
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

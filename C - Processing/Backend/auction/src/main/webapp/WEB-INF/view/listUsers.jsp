<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form"  %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>


<!DOCTYPE html>
<html>
    <head><meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
              integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"
              integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="/css/index.css">
        <link rel="icon" type="image/png" sizes="16x16" href="https://i.ibb.co/kXB6NYF/favicon.png">
        <title>User List</title>
    </head>
    <body p-5>
        <header>
            <div class="jumbotron">
                <form class="form-inline pull-xs-right my-0 ml-auto"action="${pageContext.request.contextPath}/user/search" method="GET" >

                    <input class="form-control mr-sm-2" type="text" placeholder="Search" name="searchName">
                    <button class="btn btn-success my-0 " type="submit">Search</button>
                </form>
            </div>
            <nav class="navbar navbar-expand-md navbar-dark bg-dark">
                <a class="text-white navbar-brand" href="#"><i class="fa fa-building-o"></i>in bid win</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse"
                        aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <ul class="navbar-nav mr-auto menu">
                        <li class="navbar-item active">
                            <a class="nav-link" href="/">Home</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" data-toggle="dropdown" data-target="#dropdown_target"
                               href="#listings">Listings</a><span class="caret"></span>
                            <div class="dropdown-menu" aria-labelledby="dropdown_target">
                                <a class="dropdown-item" href="#">Add Listing</a>
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/auction/list">Search Listings</a>
                            </div>
                        </li>
                        <li class="navbar-item">
                            <a class="nav-link" href="#account">Account</a>
                        </li>
                        <li class="navbar-item">
                            <a class="nav-link" href="#about">About</a>
                        </li>
                    </ul>
                    <form class="form-inline mt-2 mt-md-0">
                        <sec:authorize access="isAuthenticated()">
                            <small class="text-muted"> Logged in as <sec:authentication property="principal.username" /> </small>
                        </sec:authorize>
                        <sec:authorize access="hasRole('ADMIN')">
                            <a class="nav-link text-white" href="${pageContext.request.contextPath}/user/list">
                                <i class="fa fa-user-secret"></i>Administrator
                            </a>
                        </sec:authorize>
                        <sec:authorize access="hasRole('USER')">
                            <a class="nav-link text-white" href="${pageContext.request.contextPath}/logout">
                                <i class="fa fa-user-times"></i>Logout
                            </a>
                        </sec:authorize>
                        <sec:authorize access="!isAuthenticated()">
                            <a class="nav-link text-white" href="${pageContext.request.contextPath}/login">
                                <i class="fa fa-user-plus"></i>Sign in
                            </a>
                        </sec:authorize>
                        <a class="text-white nav-link" href="cart.html">
                            <i class="text-warning fa fa-opencart"></i>Bids <i style="color:yellow;" id="cart_n"></i>
                        </a>
                    </form>
                </div>
            </nav>
        </header>

        <button class="btn btn-info m-5"><a class="text-white" href="${pageContext.request.contextPath}/user/create">Create User</a>
        </button>
        <div class="card deck d-flex flex-row flex-wrap">
            <c:forEach items="${listOfUsers}" var="u">
                <c:url value="/user/delete" var="deleteLink" >
                    <c:param name="userId" value="${u.userid}" />
                </c:url>
                <c:url var="updateLink" value="/user/update">
                    <c:param name="userId" value="${u.userid}" />
                </c:url>
                <c:url var="listItemsLink" value="/item/list">
                    <c:param name="userId" value="${u.userid}" />
                </c:url>
                <div class="col-sm-4 m-2">
                    <div class="card border-info mb-3" style="max-width: 18rem;">
                        <div class="card-header bg-transparent border-info">${u.username} info</div>
                        <div class="card-body text-dark">
                            <h5 class="card-title">${u.fname} ${u.lname}</h5>
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item">Username: ${u.username}</li>
                                <li class="list-group-item">email: ${u.email}</li>
                                <li class="list-group-item">Credit: $${u.credit}</li>
                            </ul>
                        </div>
                        <div class="card-footer bg-transparent border-info d-flex justify-content-around">
                            <button class="btn btn-success"><a class="text-white"href="${listItemsLink}">Items</a></button>
                            <button class="btn btn-warning"><a class="text-white"href="${updateLink}">Update</a></button>
                            <button class="btn btn-danger text-white"><a class="text-white" href="${deleteLink}" onclick="if (!(confirm('Are you sure you want to delete user with username: ${u.username}?')))
                                        return false">Delete</a></button>
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

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

    <header>
        <div class="jumbotron">
            <form class="form-inline pull-xs-right my-0 ml-auto">
                <input class="form-control mr-sm-2" type="text" placeholder="Search">
                <button class="btn btn-success my-0 " type="submit">Search</button>
            </form>
        </div>
        <nav class="navbar navbar-expand-md navbar-dark bg-dark">
            <a class="text-white navbar-brand" href="/"><i class="fa fa-building-o"></i>in bid win</a>
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
                           href="#">Listings</a><span class="caret"></span>
                        <div class="dropdown-menu" aria-labelledby="dropdown_target">
                            
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/auction/list">Search Auction</a>
                        </div>
                    </li>
                    <li class="navbar-item dropdown">
                        <a class="nav-link dropdown-toggle" data-toggle="dropdown" data-target="#accountdrop_t" href="#">Account</a><span class="caret"></span>
                        <div class="dropdown-menu" aria-labelledby="accountdrop_t">
                            <sec:authorize access="hasRole('ROLE_USER') and isAuthenticated()">
                                <sec:authentication var="user" property="principal" />
                                <c:url value="/item/listByUsername" var="myItemsLink" >
                                    <c:param name="username" value='${user.username}' /> 
                                </c:url>
                                <c:url value="/user/profile" var="profileLink" >
                                    <c:param name="username" value='${user.username}' /> 
                                </c:url>
                                <c:url value="/bid/listByUser" var="myBidsLink" >
                                    <c:param name="username" value='${user.username}' /> 
                                </c:url>
                            </sec:authorize>
                            <a class="dropdown-item" href="${profileLink}">My Account</a>
                            <a class="dropdown-item" href="${myItemsLink}">My items</a>
                            <a class="dropdown-item" href="${myBidsLink}">My Bids</a>
                        </div>
                    </li>
                    <li class="navbar-item">
                        <a class="nav-link" href="#about">About</a>
                    </li>
                </ul>
                <form class="form-inline mt-2 mt-md-0">
                    <sec:authorize access="isAuthenticated()">
                        <small class="text-muted"> Logged in as <sec:authentication property="principal.username"/> </small>
                    </sec:authorize>
                    <sec:authorize access="hasRole('ADMIN')">
                        <a class="nav-link text-white" href="${pageContext.request.contextPath}/user/list">
                            <i class="fa fa-user-secret"></i>Administrator
                        </a>
                        <a class="nav-link text-white" href="${pageContext.request.contextPath}/logout">
                            <i class="fa fa-user-times"></i>Logout
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
<!--                    <a class="text-white nav-link" href="{myBidsLink}">
                        <i class="text-warning fa fa-opencart"></i>My Bids <i style="color:yellow;" id="cart_n"></i>
                    </a>-->
                </form>
            </div>
        </nav>
    </header>
</html>
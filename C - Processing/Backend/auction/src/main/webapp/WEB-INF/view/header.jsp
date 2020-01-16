<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<header>
    <div class="jumbotron">
        <form class="form-inline pull-xs-right my-0 ml-auto">
            <input class="form-control mr-sm-2" type="text" placeholder="Search">
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
                    <a class="nav-link" href="#">Home</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" data-target="#dropdown_target"
                       href="#listings">Listings</a><span class="caret"></span>
                    <div class="dropdown-menu" aria-labelledby="dropdown_target">
                        <a class="dropdown-item" href="#">Add Listing</a>
                        <a class="dropdown-item" href="#">Search Listings</a>
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
                <a class="text-white nav-link" href="cart.html">
                    <i class="text-warning fa fa-opencart"></i>Bids <i style="color:yellow;" id="cart_n"></i>
                </a>
                <c:choose>
                    <c:when test = "${username != 'admin'}">
                        <a class="nav-link disabled text-muted" href="#">
                            <i class="fa fa-user-secret"></i>Administrator
                        </a>
                    </c:when>
                    <c:otherwise>
                        <a class="nav-link disabled text-white" href="${pageContext.request.contextPath}/user/list">
                            <i class="fa fa-user-secret"></i>Administrator
                        </a>
                    </c:otherwise>
                </c:choose>
            </form>
        </div>
    </nav>
</header>
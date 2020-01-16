<%-- 
    Document   : home
    Created on : Dec 27, 2019, 6:21:51 PM
    Author     : datura
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <link rel="stylesheet" type="text/css" href="/css/carousel.css">
        <link rel="stylesheet" type="text/css" href="/css/index.css">
        <link rel="icon" type="image/png" sizes="16x16" href="https://i.ibb.co/kXB6NYF/favicon.png">
        <title>in bid win</title>

    </head>
    <body>
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
                    <a class="nav-link disabled text-white" href="admin/login.html">
                        <i class="fa fa-user-secret"></i>Administrator
                    </a>
                </form>
            </div>
        </nav>
    </header>
        <h1>Auction Service home!</h1>
        <hr/>
        <a href="${pageContext.request.contextPath}/user/list">users</a>
        <br/>
    </body>
</html>

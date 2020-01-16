<%-- 
    Document   : home
    Created on : Dec 27, 2019, 6:21:51 PM
    Author     : datura
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
<<<<<<< HEAD
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="/static/css/home.css"/>
    </head>
    <body>
        
        <h1>Auction Service home!</h1>
        <hr/>
        <a href="${pageContext.request.contextPath}/user/list">users</a>
        <br/>
        <a href="${pageContext.request.contextPath}/auction/list">auctions</a>
        <br/>
=======
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
        <jsp:include page="header.jsp" />
        <main role="main">
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li style="z-index:102;" data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li style="z-index:102;" data-target="#myCarousel" data-slide-to="1"></li>
                <li style="z-index:102;" data-target="#myCarousel" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="imgFilter first-slide" src="https://i.ibb.co/fX2zFrP/stairs-1229149-1920.jpg"
                        alt="first slide">
                    <div class="container">
                        <div class="carousel-caption">
                            <h1>In</h1>
                            <p>
                                Lorem ipsum dolor sit amet consectetur adipisicing elit. Excepturi esse odit nemo ex
                                nulla adipisci quia, nobis fuga similique perspiciatis iste sunt placeat consequuntur
                                quisquam incidunt nihil? Suscipit, eaque harum?
                            </p>
                            <p><a role="button" class="btn btn-lg btn-info" href="#">Register</a></p>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="imgFilter second-slide" src="https://i.ibb.co/MfMgfmW/norway-4420668-1920.jpg"
                        alt="second slide">
                    <div class="container">
                        <div class="carousel-caption text-left">
                            <h1>Bid</h1>
                            <p>
                                Lorem ipsum dolor sit amet consectetur adipisicing elit. Excepturi esse odit nemo ex
                                nulla adipisci quia, nobis fuga similique perspiciatis iste sunt placeat consequuntur
                                quisquam incidunt nihil? Suscipit, eaque harum?
                            </p>
                            <p><a role="button" class="btn btn-lg btn-info" href="#">Place a Bid</a></p>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="imgFilter third-slide" src="https://i.ibb.co/bQ8bLLs/new-york-918682-1920.jpg"
                        alt="third slide">
                    <div class="container">
                        <div class="carousel-caption text-right">
                            <h1>Win</h1>
                            <p>
                                Lorem ipsum dolor sit amet consectetur adipisicing elit. Excepturi esse odit nemo ex
                                nulla adipisci quia, nobis fuga similique perspiciatis iste sunt placeat consequuntur
                                quisquam incidunt nihil? Suscipit, eaque harum?
                            </p>
                            <p><a role="button" class="btn btn-lg btn-info" href="#">Create an Auction</a></p>
                        </div>
                    </div>
                </div>
            </div>

            <a style="z-index:101;" class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a style="z-index:101;" class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
        <div class="container marketing">
            <br>
            <h2 id="listings">Listings</h2>
            <hr>
            <div class="row" id="listingDiv"></div>
            <h2 id="account">Account</h2>
            <hr>
            <div class="row" id="accountDiv"></div>
            <h2 id="about">About</h2>
            <hr>
            <div class="row" id="aboutDiv"></div>
            <hr class="featurette-divider">
        </div>
    </main>
        <jsp:include page="footer.jsp" />
>>>>>>> 2ff95f99244b3fda9f67fc4363b91c1a45e51ed2
    </body>
</html>

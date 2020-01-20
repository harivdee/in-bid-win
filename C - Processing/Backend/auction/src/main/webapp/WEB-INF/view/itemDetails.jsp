<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
              integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"
              integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="/css/index.css">
        <link rel="icon" type="image/png" sizes="16x16" href="https://i.ibb.co/kXB6NYF/favicon.png">
        <title>Item Details</title>
    </head>
    <body>
        <jsp:include page="header.jsp" />
        <h1>This is item detailed view</h1>


        <c:url var="listImagesLink" value="/image/list">
            <c:param name="houseId" value="${houseId}" />
        </c:url>
        <c:url var="bidLink" value="/bid/place">
            <c:param name="auctionId" value="${auction.auctionid}" />
            <c:param name="userId" value="2" /> <!--  enter id from session here (current bidded is emergon-->
        </c:url>

        <div class="card bg-light mb-3" style="max-width: 36rem; font-size: 14px;">
            <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                    <c:forEach items="${imgList}" var="src">
                        <div class="carousel-item">
                            <img src="${src.iphoto}"  width="36rem" height="auto" class="card-img-top d-block " alt="apartment img">
                        </div>
                    </c:forEach>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>

            <img src="${i.iphoto}"
                 class="card-img-top" width="36rem" height="auto" alt="image of an apartment">
            <div class="card-body">
                <h5 class="card-title">${item.ititle}</h5>
                <ul class="list-group list-group-flush d-flex flex-row flex-wrap justify-content-around">
                    <li class="list-group-item">
                        <div class="font-weight-bold">Price: </div>$${item.iprice}
                    </li>
                    <li class="list-group-item">
                        <div class="font-weight-bold">Status: </div> ${item.istatus} <!--item/list?userId=1-->
                    </li>
                    <li class="list-group-item">
                        <div class="font-weight-bold">Address: </div>${item.house.hlocation}
                    </li>
                    <li class="list-group-item">
                        <div class="font-weight-bold">Floors: </div>${item.house.hfloor}
                    </li>
                    <li class="list-group-item">
                        <div class="font-weight-bold">Size: </div>${item.house.hsize}m<sup>2</sup>
                    </li>
                    <li class="list-group-item">
                        <div class="font-weight-bold">Bedrooms: </div>${item.house.hroom}
                    </li>
                    <li class="list-group-item">
                        <div class="font-weight-bold">Bathrooms: </div>${item.house.hbathroom}
                    </li>
                    <li class="list-group-item">
                        <div class="font-weight-bold">Heating: </div>${item.house.hheating}
                    </li>
                    <li class="list-group-item w-100">
                        <div class="font-weight-bold">Description: </div>${item.house.hdescr}
                    </li>
                </ul>
            </div>
            <div class="card-footer bg-transparent border-info d-flex justify-content-around">
                <f:form id="bidForm"
                        action="${bidLink}"
                        method="POST"
                        modelAttribute="bid" >
                    <f:input type="number" path="bprice"/> 
                    <f:errors path="bprice"/>
                    <input type="submit" value="Place Bid">
                </f:form>
                <button class="btn btn-success" type="submit" value="Place Bid"></button>
            </div>
        </div>
    </body>

</html>
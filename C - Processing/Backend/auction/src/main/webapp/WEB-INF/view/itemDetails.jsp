<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

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



        <c:url var="listImagesLink" value="/image/list">
            <c:param name="houseId" value="${houseId}" />
        </c:url>
        <c:url var="bidLink" value="/bid/place">
            <c:param name="auctionId" value="${auction.auctionid}" />
            <c:param name="username" value="${loggedInUser.username}" /> 
        </c:url>

        <h1>Auction by user: <strong>${loggedInUser.username}</strong></h1>
        <div class="card bg-light m-5" style="max-width: 36rem; font-size: 14px;">
            <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                    <c:forEach items="${imageList}" var="img">
                        <div class="carousel-item d-block w-100">
                            <img src="${img.iphoto}"  width="36rem" height="auto" class="card-img-top img-fluid" alt="apartment img">
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
                    <button class="btn btn-success" type="submit" value="Place Bid">Place Bid</button>
                </f:form>
                <sec:authorize access="hasRole('ADMIN')">
                    <c:url var="terminateLink" value="/auction/terminate">
                        <c:param name="auctionId" value="${auction.auctionid}" />
                    </c:url>
                    <a class="btn btn-danger" href="${terminateLink}" >Terminate</a>
                </sec:authorize>
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

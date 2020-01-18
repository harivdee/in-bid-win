<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form"  %>
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
        <title>Item List</title>
    </head>
    <body p-5>
        <jsp:include page="header.jsp" />
        <h1>This is ${user.username} item list!</h1>
        <c:url value="/item/create" var="createLink" >
            <c:param name="userId" value="${user.userid}" />
        </c:url>
        <button class="btn btn-warning m-5"><a class="text-white" href="${createLink}/item/create">Add Item</a>
        </button>

        <c:forEach items="${listOfItems}" var="i">
            <c:url var="updateLink" value="/item/update">
                <c:param name="itemId" value="${i.itemid}" />
            </c:url>
            <c:url var="deleteLink" value="/item/delete">
                <c:param name="itemId" value="${i.itemid}" />
                <c:param name="userId" value="${user.userid}" />
            </c:url>
            <c:url var="listImagesLink" value="/image/list">
                <c:param name="houseId" value="${i.house.hid}" />
            </c:url>
            <c:url var="createAuction" value="/auction/create">
                <c:param name="itemId" value="${i.itemid}" />
            </c:url>
            <div class="card bg-light mb-3" style="max-width: 36rem; font-size: 14px;">
                <img src="http://st2.depositphotos.com/1007373/5523/i/950/depositphotos_55232293-stock-photo-apartment-interior.jpg"
                     class="card-img-top" width="36rem" height="auto" alt="image of an apartment">
                <div class="card-body">
                    <h5 class="card-title">${i.ititle}</h5>
                    <ul class="list-group list-group-flush d-flex flex-row flex-wrap justify-content-around">
                        <li class="list-group-item">
                            <div class="font-weight-bold">Price: </div>$${i.iprice}
                        </li>
                        <li class="list-group-item">
                            <div class="font-weight-bold">Status: </div> ${i.istatus}
                        </li>
                        <li class="list-group-item">
                            <div class="font-weight-bold">Address: </div>${i.house.hlocation}
                        </li>
                        <li class="list-group-item">
                            <div class="font-weight-bold">Floors: </div>${i.house.hfloor}
                        </li>
                        <li class="list-group-item">
                            <div class="font-weight-bold">Size: </div>${i.house.hsize}m<sup>2</sup>
                        </li>
                        <li class="list-group-item">
                            <div class="font-weight-bold">Bedrooms: </div>${i.house.hroom}
                        </li>
                        <li class="list-group-item">
                            <div class="font-weight-bold">Bathrooms: </div>${i.house.hbathroom}
                        </li>
                        <li class="list-group-item">
                            <div class="font-weight-bold">Heating: </div>${i.house.hheating}
                        </li>
                        <li class="list-group-item w-100">
                            <div class="font-weight-bold">Description: </div>${i.house.hdescr}
                        </li>
                    </ul>
                </div>
                <div class="card-footer bg-transparent border-info d-flex justify-content-around">
                    <button class="btn btn-warning"><a class="text-white" href="${updateLink}">Update</a></button>
                    <button class="btn btn-danger"><a class="text-white" href="${deleteLink}" onclick="if (!(confirm('Are you sure you want to delete item with title ${i.ititle}?')))
                        return false">Delete</a>
                    </button>
                    <button class="btn btn-success"><a class="text-white" href="${createAuction}">Auctionize</a></button>
                </div>
            </div>
        </c:forEach>

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

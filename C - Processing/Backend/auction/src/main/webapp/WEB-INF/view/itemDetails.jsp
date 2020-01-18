

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Item Details</title>
    </head>
    <body>
        <h1>This is item detailed view</h1>
        <table border="1">
            <tr>
                <td><strong>Title</strong></td>
                <td><strong>Price</strong></td>
                <td><strong>Status</strong></td>
                <td><strong>Address</strong></td>
                <td><strong>Floor</strong></td>
                <td><strong>Size in m<sup>2</sup></strong></td>
                <td><strong>Rooms</strong></td>
                <td><strong>Bathrooms</strong></td>
                <td><strong>Heating</strong></td>
                <td><strong>Furnished</strong></td>
                <td><strong>Description</strong></td>
                <td><strong>Images</strong></td>


            </tr>

            <c:url var="listImagesLink" value="/image/list">
                <c:param name="houseId" value="${houseId}" />
            </c:url>
            <c:url var="bidLink" value="/bid/place">
                <c:param name="auctionId" value="${auction.auctionid}" />
              <c:param name="userId" value="2" /> <!--  enter id from session here (current bidded is emergon-->
            </c:url>

            <tr>
                <td>${item.ititle}</td>
                <td>${item.iprice}</td>
                <td>${item.istatus}</td>item/list?userId=1
                <td>${item.house.hlocation}</td>
                <td>${item.house.hfloor}</td>
                <td>${item.house.hsize}</td>
                <td>${item.house.hroom}</td>
                <td>${item.house.hbathroom}</td>
                <td>${item.house.hheating}</td>
                <td>${item.house.hfurnished}</td>
                <td>${item.house.hdescr}</td>
                <td><a href="${listImagesLink}">Images</a></td>
                <td colspan="3">
                    <f:form id="bidForm"
                            action="${bidLink}"
                            method="POST"
                            modelAttribute="bid" >
                        <f:input type="number" path="bprice"/> 
                        <f:errors path="bprice"/>
                        <input type="submit" value="Place Bid">
                    </f:form>
                </td>

                </body>
                </html>

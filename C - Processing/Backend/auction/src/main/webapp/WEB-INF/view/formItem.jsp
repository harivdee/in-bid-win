<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


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
        <link rel="stylesheet" type="text/css" href="/css/index.css">
        <link rel="icon" type="image/png" sizes="16x16" href="https://i.ibb.co/kXB6NYF/favicon.png">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Item Form</title>
    </head>
    <body>
        <jsp:include page="header.jsp" />
        <h1 class ="mt-2 ml-1">Please enter the following info ${user.username}</h1>
        <c:url value="/item/create" var="createLink" >
            <c:param name="userId" value="${user.userid}"/>
        </c:url>
        <f:form cssClass="form-group ml-5 mt-5" id="formItem"
                action="${createLink}"
                method="POST"
                modelAttribute="itemForm">
            <f:hidden path="item.itemid"/>
            <div class="form-group col-md-4 mb-3">
                <label for="validationServer01">Title</label>
                <f:input cssClass="form-control" id="validationServer01" path="item.ititle"/>
                <f:errors cssClass="invalid-feedback" path="item.ititle"/>
                <div class="valid-feedback">
                    Looks good!
                </div>
            </div>
            <div class="form-group col-md-4 mb-3">
                <label for="validationServer02">Price</label>
                <f:input cssClass="form-control" type="number" id="validationServer02" path="item.iprice"/>
                <f:errors cssClass="invalid-feedback" path="item.iprice"/>
                <div class="valid-feedback">
                    Looks good!
                </div>
            </div>
            <f:hidden path="house.hid"/>
            <div class="form-group col-md-4 mb-3">
                <label for="validationServer03">Address</label>
                <f:input cssClass="form-control" id="validationServer03" path="house.hlocation"/>
                <f:errors cssClass="invalid-feedback" path="house.hlocation"/>
                <div class="valid-feedback">
                    Looks good!
                </div>
            </div>
            <div class="form-group col-md-4 mb-3">
                <label for="validationServer04">Floor</label>
                <f:input type="number" cssClass="form-control" id="validationServer04" path="house.hfloor"/>
                <f:errors cssClass="invalid-feedback" path="house.hfloor"/>
                <div class="valid-feedback">
                    Looks good!
                </div>
            </div>
            <div class="form-group col-md-4 mb-3">
                <label for="validationServer05">Size</label>
                <f:input type="number" cssClass="form-control" id="validationServer05" path="house.hsize"/>
                <small class="form-text text-muted">
                    Enter the square footage of your property
                </small>
                <f:errors cssClass="invalid-feedback" path="house.hsize"/>
                <div class="valid-feedback">
                    Looks good!
                </div>
            </div>
            <div class="form-group col-md-4 mb-3">
                <label for="validationServer06">Bedrooms</label>
                <f:input type="number" cssClass="form-control" id="validationServer06" path="house.hroom"/>
                <f:errors cssClass="invalid-feedback" path="house.hroom"/>
                <div class="valid-feedback">
                    Looks good!
                </div>
            </div>
            <div class="form-group col-md-4 mb-3">
                <label for="validationServer07">Bathrooms</label>
                <f:input type="number" cssClass="form-control" id="validationServer07" path="house.hbathroom"/>
                <f:errors cssClass="invalid-feedback" path="house.hbathroom"/>
                <div class="valid-feedback">
                    Looks good!
                </div>
            </div>
            <div class="form-group col-md-4 mb-3">
                <label for="validationServer08">Heating</label>
                <f:input cssClass="form-control" id="validationServer08" path="house.hheating"/>
                <f:errors cssClass="invalid-feedback" path="house.hheating"/>
                <div class="valid-feedback">
                    Looks good!
                </div>
            </div>
            <div class="form-group col-md-4 mb-3">
                <label for="validationServer09">Furnished</label>
                <f:input cssClass="form-control" id="validationServer09" path="house.hfurnished"/>
                <f:errors cssClass="invalid-feedback" path="house.hfurnished"/>
                <div class="valid-feedback">
                    Looks good!
                </div>
            </div>
            <div class="form-group col-md-4 mb-3">
                <label for="validationServer10">Description</label>
                <f:textarea cssClass="form-control" id="validationServer10" path="house.hdescr"/>
            </div>
            <button class="btn btn-primary ml-3" type="submit">Submit form</button>
        </f:form>
        <br/>
        <a class="text-right d-block mr-5 mb-3" href="${pageContext.request.contextPath}/item/list">Back to item list</a>
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
        <!--<script src="/js/itemform.js"></script>-->
    </body>
</html>

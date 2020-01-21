<%-- 
    Document   : formImage
    Created on : Jan 12, 2020, 2:07:04 PM
    Author     : datura
--%>

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
        <title>Upload Image</title>
    </head>
    <body>
        <jsp:include page="header.jsp" />
        <div class="d-flex flex-column justify-content-center m-3">
            <h1 class="text-center">Image Upload for house ${house.hlocation}</h1>
            <p class="text-center">Please upload the image in a hosting service ( like <a href="https://postimages.org/" target="_blank">https://postimages.org/</a> ) and paste provided the direct link</p>
            <c:url value="/image/upload" var="uploadLink" >
                <c:param name="houseId" value="${house.hid}"/>
            </c:url>
                <div class="row mt-5">
                    <div class="col-sm-auto m-auto">
                        <div class="card card-body">
                            <h1 class="text-center mb-3"><i class="fas fa-sign-in-alt"></i>Upload</h1>
                            <f:form id="formItem"
                                    action="${uploadLink}"
                                    method="POST"
                                    modelAttribute="image">
                                <div class="form-group">
                                    <div class="input-group">
                                        <div>
                                            <f:input type="text" cssClass="" path="iphoto"/>
                                            <!--<input type="text" class="custom-file-input" id="inputGroupFile02">-->
                                        </div>
                                    </div>
                                </div>
                                <input type="submit" value="Submit" class="btn btn-info btn-block">  
                            </f:form>
                        </div>
                    </div>
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

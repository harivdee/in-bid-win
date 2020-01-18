<%-- 
    Document   : formImage
    Created on : Jan 12, 2020, 2:07:04 PM
    Author     : datura
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

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
        <h1>Image Upload for house ${house.hlocation}</h1>
        <p>Please upload the image in a hosting service ( like <a href="https://postimages.org/">https://postimages.org/</a> ) and paste provided the direct link</p>
        <c:url value="/image/upload" var="uploadLink" >
            <c:param name="houseId" value="${house.hid}"/>
        </c:url>
        <f:form id="formItem"
                action="${uploadLink}"
                method="POST"
                modelAttribute="image">
            Photos:<f:input  path="iphoto"/>


            <input type="submit" value="Submit">

        </f:form>
        <jsp:include page="footer.jsp" />
    </body>
</html>

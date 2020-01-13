<%-- 
    Document   : formImage
    Created on : Jan 12, 2020, 2:07:04 PM
    Author     : datura
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Image Upload for house ${house.hlocation}</title>
    </head>
    <body>
        <h1>Image Upload Form</h1>
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
    </body>
</html>

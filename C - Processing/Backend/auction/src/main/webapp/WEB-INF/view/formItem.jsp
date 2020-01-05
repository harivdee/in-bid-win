<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Item Form</title>
    </head>
    <body>
        <h1>This is create Item Form!</h1>
        <f:form id="formItem"
                action="${pageContext.request.contextPath}/item/create"
                method="POST"
                modelAttribute="item">
            <f:hidden path="itemid"/>
            Title: <f:input path="ititle"/>
            <f:errors path="ititle"/><br/>
            Price: <f:input path="iprice"/>
            <f:errors path="iprice"/><br/>
            Address <f:input path="house.hlocation"/>
            <f:errors path="house.hlocation"/><br/>
            Size: <f:input path="house.hsize"/>
            <f:errors path="house.hsize"/><br/>
            Rooms <f:input path="house.hroom"/>
            <f:errors path="house.hroom"/><br/>
            Bathrooms <f:input path="house.hbathroom"/>
            <f:errors path="house.hbathroom"/><br/>
            Heating <f:input path="house.hheating"/>
            <f:errors path="house.hheating"/><br/>
            Furnished <f:input path="house.hfurnished"/>
            <f:errors path="house.hfurnished"/><br/>
            Description <f:textarea path="house.hdescr"/>
            <f:errors path="house.hdescr"/><br/>

            <input type="submit" value="Submit">
        </f:form>
        <br/>
        <a href="${pageContext.request.contextPath}/item/list">Back to item list</a>

    </body>
</html>

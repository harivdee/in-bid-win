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
        <h1>This is create Item Form for ${user.username}</h1>
        <c:url value="/item/create" var="createLink" >
            <c:param name="userId" value="${user.userid}"/>
        </c:url>
        <f:form id="formItem"
                action="${createLink}"
                method="POST"
                modelAttribute="itemForm">



            <f:hidden path="item.itemid"/>
            Title: <f:input path="item.ititle"/>
            <f:errors path="item.ititle"/><br/>
            Price: <f:input type="number" path="item.iprice"/>
            <f:errors path="item.iprice"/><br/>

            <f:hidden path="house.hid"/>
            Address <f:input path="house.hlocation"/>
            <f:errors path="house.hlocation"/><br/>
            Floor: <f:input type="number" path="house.hfloor"/>
            <f:errors path="house.hfloor"/><br/>
            Size: <f:input type="number" path="house.hsize"/>
            <f:errors path="house.hsize"/><br/>
            Rooms <f:input type="number" path="house.hroom"/>
            <f:errors path="house.hroom"/><br/>
            Bathrooms <f:input type="number" path="house.hbathroom"/>
            <f:errors type="number" path="house.hbathroom"/><br/>
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

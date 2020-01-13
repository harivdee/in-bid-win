<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form"  %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Images</title>
    </head>
    <body>
        <h1>This is an image list</h1>
        <c:forEach items="${listOfImages}" var="i">
            <table border="1">
                <tr>
                    <td><img src="${i.iphoto}"/></td>
                </tr>
                
            </table>
        </c:forEach>
    </body>
</html>

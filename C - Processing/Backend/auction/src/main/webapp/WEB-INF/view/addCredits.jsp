<%-- 
    Document   : addCredits
    Created on : Jan 21, 2020, 1:28:12 PM
    Author     : chris
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Credits</title>
    </head>
    <body>
        <h1>Choose your Products</h1>
        <f:form cssClass="form-group ml-5 mt-5" id="formUser" 
                action="${pageContext.request.contextPath}/authorize_payment"
                method="POST">
            
            <div class="form-group col-md-4 mb-3">
                <label for="validationServer01">Credit:</label>
                <input cssClass="form-control" type="text" id="addCredit" name="credit">
                
                <div class="valid-feedback">
                    Looks good!
                </div>
                <input type="submit" value="submit">
        </f:form>
    </body>
</html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

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
        <title>User Form</title>
    </head>
    <body>
        <jsp:include page="header.jsp" />
        <h1 class="mt-2 ml-1">Please enter the following info</h1>

        <f:form cssClass="form-group ml-5 mt-5" id="formUser" 
                action="${pageContext.request.contextPath}/user/create"
                method="POST"
                modelAttribute="user">
            <f:hidden path="userid"/>
            <div class="form-group col-md-4 mb-3">
                <label for="validationServer01">First name</label>
                <f:input cssClass="form-control" id="validationServer01" path="fname"/>
                <f:errors cssClass="invalid-feedback" path="fname"/>
                <div class="valid-feedback">
                    Looks good!
                </div>
            </div>
            <div class="form-group col-md-4 mb-3">
                <label for="validationServer02">Last name</label>
                <f:input path="lname" cssClass="form-control" id="validationServer02"/>
                <f:errors cssClass="invalid-feedback" path="lname"/>
                <div class="valid-feedback">
                    Looks good!
                </div>
            </div>
            <div class="form-group col-md-4 mb-3">
                <div class="form-group">
                    <label for="inputEmail">Email</label>
                    <f:input cssClass="form-control" id="inputEmail" path="email"/>
                    <f:errors cssClass="invalid-feedback" path="email"/><br/>
                    <div class="valid-feedback">Good! Your email address looks valid.</div>
                </div>
            </div>
            <div class="form-group col-md-4 mb-3">
                <label for="validationServerUsername">Username</label>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="inputGroupPrepend3">@</span>
                    </div>
                    <f:input cssClass="form-control" id="validationServerUsername" path="username"/>
                    <f:errors cssClass="invalid-feedback" path="username"/>
                    <div class="invalid-feedback">
                        Please choose a username.
                    </div>
                </div>
            </div>
            <div class="form-group col-md-4 mb-3">
            <label for="inputPassword5">Password</label>
            <f:input cssClass="form-control" id="inputPassword5" path="password"/>
            <small id="passwordHelpBlock" class="form-text text-muted">
                Your password must be 8-20 characters long, contain letters and numbers, and must not contain spaces,
                special
                characters, or emoji.
            </small>
            <f:errors cssClass="invalid-feedback" path="password"/>
        </div>
        <div class="form-group col-md-4 mb-3">
            <label for="inputCredits">Credits</label>
            <f:input class="form-control" disabled="true" path="credit"/>
        </div>
        <div class="form-group">
            <div class="form-check">
                <input class="form-check-input" type="checkbox" value="" id="invalidCheck3" required>
                <label class="form-check-label" for="invalidCheck3">
                    Agree to terms and conditions
                </label>
                <div class="invalid-feedback">
                    You must agree before submitting.
                </div>
            </div>
        </div>
        <button class="btn btn-primary" type="submit">Submit form</button>    
    </f:form>

    <a class="text-right d-block mr-5 mb-3" href="${pageContext.request.contextPath}/user/list">Back to user list</a>
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
    <script src="/js/userform.js"></script>
</body>
</html>

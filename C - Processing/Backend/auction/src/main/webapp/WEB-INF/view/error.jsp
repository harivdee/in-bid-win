<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <title>IT go home</title>
    </head>
    <body>
        <jsp:include page="header.jsp" />
        <div class="d-flex justify-content-center flex-column align-items-center my-5">
            <img src="https://i.ibb.co/3C3YDPV/it-go-home.png" alt="it-go-home" border="0">
            <h1 class="text-danger text-center">Something went wrong! </h1>
            <h2 class="text-center">Our Engineers are on it</h2>
            <button class="btn btn-warning"><a class="text-decoration-none text-dark" href="/">Go Home</a></button>
        </div>
        <jsp:include page="footer.jsp" />
    </body>
</html>

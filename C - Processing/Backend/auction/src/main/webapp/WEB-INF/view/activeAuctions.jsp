<%-- 
    Document   : newjsp
    Created on : Jan 19, 2020, 9:38:59 PM
    Author     : datura
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function initialize() {
                const eventSource = new EventSource('http://localhost:8080/notification');
                eventSource.onmessage = e => {
                    const msg = e.data;
                    document.getElementById("greet").innerHTML = msg;
                };
                
               
            }
            window.onload = initialize;
        </script>
    </head>
    <body>
        <h1>Hello World!</h1>
        <div id="greet"></div>
    </body>
</html>

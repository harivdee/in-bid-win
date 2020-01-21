<%-- 
    Document   : receipt
    Created on : Jan 21, 2020, 4:17:52 PM
    Author     : chris
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Payment Receipt</title>
        <style type="text/css">
            table { border: 0; }
            table td { padding: 5px; }
        </style>
    </head>
    <body>
        <div align="center">
            <h1>Credits Successfully added</h1>
            <br/>
            <h2>Receipt Details:</h2>
            <table>
                <tr>
                    <td>In Bid Win</td>
                </tr>
                <tr>
                    <td><b>Payer:</b></td>
                    <td>${payer.firstName} ${payer.lastName}</td>      
                </tr>
                <tr>
                    <td><b>Total:</b></td>
                    <td>${transaction.amount.total} USD</td>
                </tr>                    
            </table>
            <div>
                <a href="${pageContext.request.contextPath}/">Home</a>
            </div>
        </div>
    </body>
</html>

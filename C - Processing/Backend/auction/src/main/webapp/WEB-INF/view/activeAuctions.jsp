<%-- 
    Document   : newjsp
    Created on : Jan 19, 2020, 9:38:59 PM
    Author     : datura
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <title>Document</title>
</head>

<body>
    <div class="container-fluid bg-dark text-white">
        <div class="row justify-content-between align-items-center bd-highlight mb-3">
            <div id="price" class="right-border pr-2 w-25 ml-2">
                <div class="d-flex justify-content-between">
                    <label for="priceRange">Price</label>
                    <p id="pselected"></p>
                </div>
                <input id="priceRange" type="range" class="custom-range" min="0" max="2000">
            </div>

            <div class="mr-2">
                <span class="">Sort by</span>
                <div id="sortby" class="btn-group rightborder pl-2 bg-light mr-2">
                    <button type="button" class="btn btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
                        aria-expanded="false">
                        Our recommendations
                    </button>
                    <!-- SORTTTTTTT -->
                    <div class="dropdown-menu dropdown-menu-right">
                        <button class="dropdown-item" type="button" id="sizeA">Size Desc</button>
                        <button class="dropdown-item" type="button" id="sizeB">Size Asc</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="auctions" class="d-flex flex-row">

    </div>

    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
        integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
        integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>
        <script src="/js/activeAuctions.js"></script>
    </body>
</html>

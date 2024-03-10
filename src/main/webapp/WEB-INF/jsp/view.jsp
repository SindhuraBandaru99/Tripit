<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>
<html>
<head>
    <title>View</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
        }

        h1 {
            color: #333;
            text-align: center;
            margin-top: 50px;
        }

        ul {
            list-style-type: none;
            margin: 0 auto;
            padding: 0;
            width: 500px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #fff;
        }

        img {
            display: block;
            margin: 0 auto;
            border: 1px solid #ddd;
            border-radius: 5px;
            max-width: 100%;
            height: auto;
            margin-top: 20px;
            margin-bottom: 20px;
        }

        li {
            padding: 10px;
            border-top: 1px solid #ddd;
            font-size: 16px;
            color: #333;
            text-align: left;
        }

        li:first-child {
            border-top: none;
        }

        li:last-child {
            border-bottom: none;
        }
    </style>
</head>
<body>
    <h1>Details of the Product:</h1>
    <ul>  
        <img src="${sessionScope.viewItem.image}" alt="x" width="500" height="350">
        <li>${sessionScope.viewItem.packageId}</li>
        <li>${sessionScope.viewItem.packageName}</li>
        <li>${sessionScope.viewItem.packagePrice}</li>
        <li>${sessionScope.viewItem.packageDescription}</li>
        
    </ul>
    <form method="get" action="back.htm">
       <input type="submit" value="Back">
    </form>
     
</body>
</html>
    
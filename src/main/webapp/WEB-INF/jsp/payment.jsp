<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
    <h1>Payment Successful</h1>
    <form method="post" action="products.htm">
        <input type="submit" value="viewOrders" name="userSelectedOption">
    </form>
    <form method="post" action="email.htm">
        <input type="submit" value="Email Orders" name="userSelectedOption">
    </form>
</body>
</html> 

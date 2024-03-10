<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>Accept a payment</title>
    <meta name="description" content="A demo of a payment on Stripe" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="referrer" content="Access-Control-Allow-Origin">
    <link rel="stylesheet" href="checkout.css" />
    <script src="https://js.stripe.com/v3/"></script>
    <script src="checkout.js" defer></script>
</head>
<body>
<!-- Display a payment form -->
<h1> The total amount is: <c:out value="${sessionScope.aTotalCost}" /></h1>
<form id="payment-form">
    <div id="link-authentication-element">
        <!--Stripe.js injects the Link Authentication Element-->
    </div>
    <div id="payment-element">
        <!--Stripe.js injects the Payment Element-->
    </div>
    <button id="submit">
        <div class="spinner hidden" id="spinner"></div>
        <span id="button-text">Pay now</span>
    </button>
    <div id="payment-message" class="hidden"></div>
</form>
</body>
</html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



    <!DOCTYPE html>
    <html>
    <head>
        <title>Loop Example</title>
    </head>
    <body>
        <h1>Loop Example</h1>
        <ul>
            <c:forEach var="attribute" items="${sessionScope.viewItem}">
              <img src="${attribute.image}" alt="x" width="300" height="250">
              <li>${attribute.packageId}</li>
              <li>${attribute.packageName}</li>
              <li>${attribute.packagePrice}</li>
              <li>${attribute.packageDescription}</li>
            </c:forEach>
          </ul>
    </body>
    </html>
    
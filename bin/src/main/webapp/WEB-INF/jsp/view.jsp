<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



    <!DOCTYPE html>
    <html>
    <head>
        <title>View</title>
    </head>
    <body>
        <h1>Loop Example</h1>
        <ul>  
              <img src="${sessionScope.viewItem.image}" alt="x" width="300" height="250">
              <li>${sessionScope.viewItem.packageId}</li>
              <li>${sessionScope.viewItem.packageName}</li>
              <li>${sessionScope.viewItem.packagePrice}</li>
              <li>${sessionScope.viewItem.packageDescription}</li>
            
          </ul>
    </body>
    </html>
    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f0f0f0;
            }
            
            h1 {
                text-align: center;
                color: #333;
                margin-top: 50px;
            }
            
            table {
                margin: 0 auto;
                background-color: #fff;
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0 0 10px #ccc;
            }
            
            td {
                padding: 10px;
            }
            
            input[type="text"], input[type="password"] {
                width: 100%;
                padding: 5px;
                border-radius: 5px;
                border: 1px solid #ccc;
            }
            
            input[type="submit"], button {
                display: block;
                margin: 20px auto;
                padding: 10px;
                border-radius: 5px;
                border: none;
                color: #fff;
                background-color: #58b0ca;
                cursor: pointer;
            }
            
            input[type="submit"]:hover, button:hover {
                background-color: #58b0ca;
            }
            
            font[color="red"] {
                color: red;
            }
        </style>
    
    </head>
    <script>
        function showAlert(message) {
            alert(message);
        }
    </script>
    <body>
        <h1> Login Page</h1>
        <form:form modelAttribute="user" method="post" action = "home.htm">
        <table>
        <tr>
		    <td>User Name</td>
		    <td><form:input path="name" size="30" /> <font color="red"><form:errors path="name"/></font></td>
		</tr>
		<tr>
		    <td>Password</td>
		    <td><form:input type="password" path="password" size="30" /> <font color="red"><form:errors path="password"/></font></td>
		</tr>
		
    	<tr>
		    <td colspan="2"><input type="submit" value="Login" /></td>
		</tr>
        </table>
        </form:form>
        <form method="get" action="forgotPassword.htm">
           <button type = "submit">Forgot Password?.</button>
        </form>
        <form method="get" action="signup.htm">
           <button type = "submit">Don't have an account?. Click Here</button>
        </form>
        <form method="get" action="adminLogin.htm">
            <button type = "submit">Login as Admin</button>
         </form>

         <c:if test="${not empty requestScope.passwordAlertMessage}">
            <script>
                showAlert("${requestScope.passwordAlertMessage}"); // Call JavaScript function to display the alert
            </script>
        </c:if>
        <c:if test="${not empty requestScope.userNameAlertMessage}">
            <script>
                showAlert("${requestScope.userNameAlertMessage}"); // Call JavaScript function to display the alert
            </script>
        </c:if>
    </body>
</html>

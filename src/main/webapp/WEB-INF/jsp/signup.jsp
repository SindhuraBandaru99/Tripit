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
                background-color: #f5f5f5;
            }

            h1 {
                color: #333;
                text-align: center;
                margin-top: 50px;
            }

            p {
                color: #666;
                text-align: center;
            }

            table {
                margin: 0 auto;
                border-collapse: collapse;
                border: 1px solid #ddd;
                border-radius: 5px;
                background-color: #fff;
            }

            td {
                padding: 10px;
                font-size: 16px;
                color: #333;
                text-align: left;
            }

            input[type="text"], input[type="password"] {
                width: 100%;
                padding: 8px;
                border: 1px solid #ddd;
                border-radius: 5px;
                box-sizing: border-box;
                margin-top: 10px;
                margin-bottom: 10px;
                font-size: 16px;
                color: #333;
            }

            input[type="submit"], button[type="submit"] {
                background-color: #58b0ca;
                color: #fff;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
            }

            input[type="submit"]:hover, button[type="submit"]:hover {
                background-color: #58b0ca;
            }

            font {
                color: red;
            }
            .button-click{
                margin-left: 39%;
                margin-top: 2%;
            }
            .button-signup{
                margin-left: 35%;
            }
        </style>
    </head>
    <script>
        function showAlert(message) {
            alert(message);
        }
    </script>

    <body>
        <h1> SignUp Page</h1>
        <p>Welcome</p>
        <form:form modelAttribute="user" method="post" action = "signUpLogin.htm">
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
		    <td>Email Id:</td>
		    <td><form:input path="email" size="30" /> <font color="red"><form:errors path="email"/></font></td>
		</tr>
    	<tr>
            
                <td colspan="2">
                    <div class="button-signup">
                        <input type="submit" value="Signup" /></td>
                    </div>
                    
		</tr>
        </table>
        </form:form>
        <form method="get" action="login.htm">
            <div class="button-click">
                <button type = "submit">Already have an account?. Click Here</button>
            </div>
           
        </form>

        <c:if test="${not empty requestScope.emailAlertMessage}">
            <script>
                showAlert("${requestScope.emailAlertMessage}"); // Call JavaScript function to display the alert
            </script>
        </c:if>
        <c:if test="${not empty requestScope.userNameAlertMessage}">
            <script>
                showAlert("${requestScope.userNameAlertMessage}"); // Call JavaScript function to display the alert
            </script>
        </c:if>
    </body>
</html>

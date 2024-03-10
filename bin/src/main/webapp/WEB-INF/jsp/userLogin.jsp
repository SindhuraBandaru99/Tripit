<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1> Login Page</h1>
        <p>Welcome</p>
        <form:form modelAttribute="user" method="post" action = "home.htm">
        <table>
        <tr>
		    <td>User Name</td>
		    <td><form:input path="name" size="30" /> <font color="red"><form:errors path="name"/></font></td>
		</tr>
		<tr>
		    <td>Password</td>
		    <td><form:input path="password" size="30" /> <font color="red"><form:errors path="password"/></font></td>
		</tr>
		
    	<tr>
		    <td colspan="2"><input type="submit" value="Login" /></td>
		</tr>
        </table>
        </form:form>
        <form method="get" action="forgotPassword.htm">
           <button type = "submit">Forgot Password.</button>
        </form>
        <form method="get" action="signup.htm">
           <button type = "submit">New have an account?. Click Here</button>
        </form>
        <form method="get" action="adminLogin.htm">
            <button type = "submit">Login as Admin</button>
         </form>
    </body>
</html>

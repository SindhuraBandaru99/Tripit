<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
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
		    <td><form:input path="password" size="30" /> <font color="red"><form:errors path="password"/></font></td>
		</tr>
		<tr>
		    <td>Email Id:</td>
		    <td><form:input path="email" size="30" /> <font color="red"><form:errors path="email"/></font></td>
		</tr>
        <tr>
		    <td>Street Name:</td>
		    <td><form:input path="streetName" size="30" /> <font color="red"><form:errors path="email"/></font></td>
            <td>Street Num:</td>
            <td><form:input path="streetNum" size="30" /> <font color="red"><form:errors path="email"/></font></td>
            <td>City:</td>
            <td><form:input path="city" size="30" /> <font color="red"><form:errors path="email"/></font></td>
            <td>State:</td>
            <td><form:input path="state" size="30" /> <font color="red"><form:errors path="email"/></font></td>
            <td>ZipCode:</td>
            <td><form:input path="zipcode" size="30" /> <font color="red"><form:errors path="email"/></font></td>
		</tr>
    	<tr>
		    <td colspan="2"><input type="submit" value="Signup" /></td>
		</tr>
        </table>
        </form:form>
        <form method="get" action="login.htm">
           <button type = "submit">Already have an account?. Click Here</button>
        </form>
    </body>
</html>

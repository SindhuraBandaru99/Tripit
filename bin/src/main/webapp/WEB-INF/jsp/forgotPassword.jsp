<!DOCTYPE html>
<html>
<head>
    <title>Change Password</title>
    <script type="text/javascript">
        function validateForm() {
            var name = document.forms["myForm"]["name"].value;
            var newPassword = document.forms["myForm"]["newPassword"].value;
            var confirmPassword = document.forms["myForm"]["confirmPassword"].value;
			
			if (name == "") {
                alert("Name must be filled out");
                return false;
            }
			
            if (newPassword == "") {
                alert("New Password must be filled out");
                return false;
            }

            if (confirmPassword == "") {
                alert("Confirm Password must be filled out");
                return false;
            }
        }
    </script>
</head>
<body>
    <h1>Registration Form</h1>
    <form name="myForm" action="forgotPasswordSuccess.htm" onsubmit="return validateForm()" method="post">
        <label for="name">UserName</label>
        <input type="text" id="name" name="name"><br>
        
        <label for="newPassword">New Password</label>
        <input type="text" id="newPassword" name="password"><br>

        <label for="confirmPassword">Confirm Password:</label>
        <input type="text" id="confirmPassword" name="cfpassword"><br>

        <input type="submit" value="Change Password">
    </form>
</body>
</html>

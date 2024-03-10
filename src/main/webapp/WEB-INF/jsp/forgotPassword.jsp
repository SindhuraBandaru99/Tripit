<!DOCTYPE html>
<html>
<head>
    <title>Change Password</title>
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
        
        form {
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px #ccc;
            width: 400px;
        }
        
        label {
            display: block;
            margin-bottom: 5px;
            color: #555;
        }
        
        input[type="text"] {
            width: 100%;
            padding: 5px;
            border-radius: 5px;
            border: 1px solid #ccc;
            margin-bottom: 10px;
        }
        
        input[type="submit"] {
            display: block;
            margin: 20px auto;
            padding: 10px;
            border-radius: 5px;
            border: none;
            color: #fff;
            background-color: #58b0ca;
            cursor: pointer;
        }
        
        input[type="submit"]:hover {
            background-color: #58b0ca;
        }
    </style>
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
    <h1>Forgot Password Page</h1>
    <form name="myForm" action="forgotPasswordSuccess.htm" onsubmit="return validateForm()" method="post">
        <label for="name">UserName</label>
        <input type="text" id="name" name="name"><br>
        
        <label for="newPassword">New Password</label>
        <input type="password" id="newPassword" name="password"><br>

        <label for="confirmPassword">Confirm Password:</label>
        <input type="password" id="confirmPassword" name="cfpassword"><br>

        <input type="submit" value="Change Password">
    </form>
</body>
</html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <title>Admin Dashboard</title>
        <style>
            body {
                overflow: hidden;
            }
            .container{
                height: 900px;
                width: 50%;
            }
            .create-container{
                margin: 70%;
                height: 900px;
                
            }
            .update-container{
                margin: 70%;
                height: 900px;
            }
            .delete-container{
                margin: 70%;
                height: 900px;
            }
            .show-container{
                margin: 70%;
                height: 900px;
            }
            .div-left{
                float:left;
                padding :45px;
                 position: fixed;
                 height: 900px;
                 border-right: 2px solid black;

            }
            .div-right{
                float:right;
                padding-right:10px;
                height: 900px;
            }
            .getalldetails{
                width:100%;
                height: 900px;
            }
            
        </style>
    </head>

    <body>
        <div class="container">
            <div class="div-left">
                <ul>
                    <li><a href="#create"> Create </a></li>                        
                    <li><a href="#update">Update </a></li>
                    <li><a href="#delete">Delete </a></li>
                    <li><a href="#show">Get All Products </a></li>
                
                </ul>
            </div>

        
                <!-- <input type = "submit" value = "Create a New Package" name = "userSelectedOption" id="create"/>  -->
            <div class="div-right">
                <div id="create" class="create-container">
                    <form method = "post" action =  "manageDashboard.htm">
                        <label>Package Description:</label>
                        <input type = "text" name = "packageDescription"/> <br/>
                        <label>Package Name:</label> 
                        <input type = "text" name = "packageName"/> <br/>
                        <label>Package Price:</label> 
                        <input type = "text" name = "packagePrice"/> <br/>
                        <label>Image URL:</label> 
                        <input type = "text" name = "imageURL"/> <br/>
                        <input type = "submit" value = "Create Package" name = "userSelectedOption"/>
                    </form>
                </div>

                <div id="update" class="update-container">
                    <form method = "post" action =  "manageDashboard.htm"> 
                        <div id="get" class="get-container">
                            <form method = "post" action =  "manageDashboard.htm"> 
                                <label>Enter Package ID:</label>
                                <input type = "text" name = "pacakageId"/> <br/>
                                <input type = "submit" value = "Get Details" name = "userSelectedOption" id ="get" />
                                
                                    <div class="Card">
                                        <label>Package ID:</label>
                                        <input type = "text" value = "${sessionScope.tid}" name = "packId"/> <br/>
                                        <label>Package Description:</label>
                                        <input type = "text" value = "${sessionScope.selectedProduct.packageDescription}" name = "packageDescription"/> <br/>
                                        <label>Package Name:</label>
                                        <input type = "text" value = "${sessionScope.selectedProduct.packageName}" name = "packageName"/> <br/>
                                        <label>Package Price:</label>
                                        <input type = "text" value = "${sessionScope.selectedProduct.packagePrice}" name = "packagePrice"/> <br/>
                                        <label>Image URL:</label>
                                        <input type = "text" value = "${sessionScope.selectedProduct.image}" name = "image"/> <br/>
                                    </div>
                                <input type = "submit" value = "Update Package" name = "userSelectedOption" id="update"/>
                            </form>
                        </div>
                        
                    </form>  
                </div>

                <div id="delete" class="delete-container">
                    <form method = "post" action =  "manageDashboard.htm"> 
                        <label>Enter Package ID:</label>
                        <input type = "text" name = "pacakageId"/>

                        <input type = "submit" value = "Delete Package" name = "userSelectedOption" id="delete"/>
                    
                    </form>
                </div>

                <div id="show" class="show-container">
                    <form method = "post" action =  "manageDashboard.htm"> 
                        <div class="getalldetails">
                        <input type = "submit" value = "Show All Products" name = "userSelectedOption"/>
                        <table>
                            <tr>
                                <th>Package ID</th>
                                <th>Package Name</th>
                                <th>Package Description</th>
                                <th>Package Price</th>
                                <th>Image URL</th>
                            </tr>
                            <c:forEach var="attribute" items="${sessionScope.allPackages}">
                                <tr>
                                    <td>${attribute.packageId}</td>
                                    <td>${attribute.packageName}</td>
                                    <td>${attribute.packageDescription}</td>
                                    <td>${attribute.packagePrice}</td>
                                    <td>${attribute.image}</td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                    </form>
                </div>

            </div>
        </div>
    </body>
</html>
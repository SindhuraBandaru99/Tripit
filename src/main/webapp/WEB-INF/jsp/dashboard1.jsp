<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Tripit</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
   
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css" rel="stylesheet">
<style>
* {box-sizing: border-box}
body {font-family: "Lato", sans-serif;}

/* Style the tab */
.tab {
  float: left;
  border: 1px solid #ccc;
  background-color: #f1f1f1;
  width: 20%;
  height: 1300px;
}

/* Style the buttons inside the tab */
.tab button {
  display: block;
  background-color: inherit;
  color: black;
  padding: 22px 16px;
  width: 100%;
  border: none;
  outline: none;
  text-align: left;
  cursor: pointer;
  transition: 0.3s;
  font-size: 17px;
}

/* Change background color of buttons on hover */
.tab button:hover {
  background-color: #ddd;
}

/* Create an active/current "tab button" class */
.tab button.active {
  background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
  float: left;
  padding: 0px 12px;
  border: 1px solid #ccc;
  width: 80%;
  border-left: none;
  height: 1300px;
  /* overflow: hidden; */
}
.Card-Parent{
    display: flex;
    flex-wrap: wrap;
    margin: 1.5%;
    /* flex-direction: row; */
    width: 100%;
    padding: 25px;
    justify-content: space-between;
}
.Card-Parent > div {
     flex: 33%; 
    margin: 0.1%;
    margin-left: 0.2%;
    padding: 20px;
}

.Card {
    width: 175%;
    /* flex-basis : 50% */
    margin: 2%;
    box-shadow: 0 0 25px #0000004d;
    /* border-radius: 15px; */
    list-style: none;
}
.in{
        border-top-style: hidden;
        border-right-style: hidden;
        border-left-style: hidden;
        border-bottom-style: hidden;
        background-color: #ffffff;
        color: #ffffff;
      
}
.in:focus {
    outline: none;
  }

 
  .cart {
    padding: 5px;
    display: inline-block;
    padding: 1rem 1rem;
    width: 5%;
  }
</style>
</head>
<script>
    function showAlert(message) {
        alert(message);
    }
</script>
<body>
        <div class="tab">
          <button class="tablinks" onclick="openPanel(event, 'Home')" >Home</button>
          <button class="tablinks" onclick="openPanel(event, 'Products')" id="defaultOpen">Products</button>
          <button class="tablinks" onclick="openPanel(event, 'Cart')">Cart</button>
          <button class="tablinks" onclick="openPanel(event, 'Wishlist')">Wishlist</button>
          <button class="tablinks" onclick="openPanel(event, 'Orders')">Orders</button>
          <button class="tablinks" onclick="openPanel(event, 'Profile')">Profile</button>
        </div>
        
        <div id="Home" class="tabcontent">
            <h2>Hi
                <c:out value="${sessionScope.currentUser.name}" />
            </h2>
            <h4>Welcome to TRIPIT !</h4>
        </div>

        
    <div id="Products" class="tabcontent">
        <p>Products Page</p>
        <form method="post" name="products" action="products.htm">
            <div class="container py-5">
                <div class="row">
                    <div>
                        <form method = "post" action = "products.htm">
                            <label>Search by Package Name: </label>
                            <input type = "text" name = "textEntered"/>
                            <input type = "submit" class="btn btn-warning search" value = "Search" name = "userSelectedOption"/>
                            <input type = "submit" class="btn btn-warning sort" value = "Sort" name = "userSelectedOption"/>
                            <!-- <input type = "submit" value = "1" name = "userSelectedOption"/>
                            <input type = "submit" value = "2" name = "userSelectedOption"/>
                            <input type = "submit" value = "3" name = "userSelectedOption"/> -->
                            <div class = "Card-Parent searchedItems">
                                <!-- <h3>Hi</h3>
                                <c:out value="${sessionScope.optionSelected}" /> -->
                                <c:set var="optionSelected" scope="session" value="${sessionScope.optionSelected}"/>  
                                <c:if test="${optionSelected == '1'}"> 
                                    <c:forEach var="attribute" items="${sessionScope.searchedItems}">
                                        <div class="Card">

                                            <img src="${attribute.image}" alt="x" width="250" height="175">
                                            <li>${attribute.packageId}</li>
                                            <li>${attribute.packageName}</li>
                                            <li>${attribute.packagePrice}</li>
                                            <li>${attribute.packageDescription}</li>
                                            <!-- <input  type="submit" value="${attribute.packageId}" name="userSelectedOption" /> -->
                                            
                                            <input  type="hidden" value="${attribute.packageId}" name="pId" />
                                            <!-- <input  type="submit" value="View Cart" name="userSelectedOption" /> -->
                                            <div class="buttons">
                                                <div class="cart" >
                                                    <input class="in" type="submit" id="seaddToCart_${attribute.packageId}" value="" name="userSelectedOption" />
                                                    <span class="icon"><i class="fa fa-shopping-cart"></i></span>
                                                </div>
                                                <div class="cart" >
                                                    <input class="in" type="submit" id="seaddToWishlist_${attribute.packageId}" value="" name="userSelectedOption" />
                                                    <span class="icon"><i class="fa fa-heart"></i></span>
                                                </div>
                                                <form method="get" action="view.htm">
                                                    <div class="cart">
                                                    <input class="in" type="submit" id="seview_${attribute.packageId}" value="" name="userSelectedOption" />
                                                    <span class="icon"><i class="fa fa-eye"></i></span>
                                                    </div>
                                                </form>
                                            </div>
                                            <script>
                                                function concatenateStrings(text1, text2, inputId) {
                                                    let result = text1 + ' ' + text2; // Concatenate with a space in between
                                                    document.getElementById(inputId).setAttribute("value", result);
                                                }
                                                
                                                //concatenateStrings(`<i class='fa fa-shopping-cart'></i> Add To Cart", "${attribute.packageId}", "addToCart_${attribute.packageId}");

                                                concatenateStrings("Add To Cart", "${attribute.packageId}", "seaddToCart_${attribute.packageId}");
                                                concatenateStrings("Add To Wishlist", "${attribute.packageId}", "seaddToWishlist_${attribute.packageId}");
                                                concatenateStrings("View", "${attribute.packageId}", "seview_${attribute.packageId}");

                                            </script>
                                        </div>
                                        
                                    </c:forEach>
                                </c:if>
                                
                            </div>
                        </form>
                    </div>
                    <div>
                        <form method = "post" action = "products.htm">
                            <!-- <input type = "submit" class="btn btn-warning sort" value = "Sort" name = "userSelectedOption"/> -->
                            <div class = "Card-Parent sortedItems">
                                <c:set var="optionSelected" scope="session" value="${sessionScope.optionSelected}"/>  
                                <c:if test="${optionSelected == '2'}"> 
                                    <c:forEach var="attribute" items="${sessionScope.sortedItems}">
                                     <div class="Card">
                                        <img src="${attribute.image}" alt="x" width="300" height="250">
                                        <li>${attribute.packageId}</li>
                                        <li>${attribute.packageName}</li>
                                        <li>${attribute.packagePrice}</li>
                                        <li>${attribute.packageDescription}</li>
                                       
                                        
                                        <input  type="hidden" value="${attribute.packageId}" name="pId" />
                                       
                                        <div class="buttons">
                                            <div class="cart" >
                                                <input class="in" type="submit" id="soaddToCart_${attribute.packageId}" value="" name="userSelectedOption" />
                                                <span class="icon"><i class="fa fa-shopping-cart"></i></span>
                                            </div>
                                            <div class="cart" >
                                                <input class="in" type="submit" id="soaddToWishlist_${attribute.packageId}" value="" name="userSelectedOption" />
                                                <span class="icon"><i class="fa fa-heart"></i></span>
                                            </div>
                                            
                                            <div class="cart">
                                                <form method="get" action="view.htm">
                                                    <input class="in" type="submit" id="soview_${attribute.packageId}" value="" name="userSelectedOption" />
                                                    <span class="icon"><i class="fa fa-eye"></i></span>
                                                </form>
                                            </div>
                                            
                                        </div>
                                        <script>
                                            function concatenateStrings(text1, text2, inputId) {
                                                let result = text1 + ' ' + text2; // Concatenate with a space in between
                                                document.getElementById(inputId).setAttribute("value", result);
                                            }
                                            
                                            //concatenateStrings(`<i class='fa fa-shopping-cart'></i> Add To Cart", "${attribute.packageId}", "addToCart_${attribute.packageId}");

                                            concatenateStrings("Add To Cart", "${attribute.packageId}", "soaddToCart_${attribute.packageId}");
                                            concatenateStrings("Add To Wishlist", "${attribute.packageId}", "soaddToWishlist_${attribute.packageId}");
                                            concatenateStrings("View", "${attribute.packageId}", "soview_${attribute.packageId}");

                                        </script>
                                    </div>
                                    
                                </c:forEach>
                                </c:if>
                                
                            </div>
                        </form>
                    </div>
                    <div>
                        <form method = "post" action = "products.htm">
                            <label>Page Numbers</label>
                            <input type = "submit" value = "1" name = "userSelectedOption"/>
                            <input type = "submit" value = "2" name = "userSelectedOption"/>
                            <input type = "submit" value = "3" name = "userSelectedOption"/>
                        </form>
                    </div>
                        <!-- <thead>
                            <tr>
                                <th>User Name : </th>
                                <th>Assessment Name</th>
                                <th>Actions</th>
                            </tr>
                        </thead> -->
                    <div class="Card-Parent products">
                        
                            <!-- <ul> -->
                                <!-- <c:set target="${sessionScope}" property="searchedItems" value='${ "${sessionScope.optionSelected}" == "1" ? searchedItems : products}' /> -->
                                <c:set var="optionSelected" scope="session" value="${sessionScope.optionSelected}"/>  
                                <c:if test="${optionSelected == '0' }"> 
                                    <c:forEach var="attribute" items="${sessionScope.initialProducts}">
                                    <div class="Card">
                                        <img src="${attribute.image}" alt="x" width="300" height="250">
                                        <li>${attribute.packageId}</li>
                                        <li>${attribute.packageName}</li>
                                        <li>${attribute.packagePrice}</li>
                                        <li>${attribute.packageDescription}</li>
                                        <!-- <input  type="submit" value="${attribute.packageId}" name="userSelectedOption" /> -->
                                        
                                        <input  type="hidden" value="${attribute.packageId}" name="pId" />
                                        <!-- <input  type="submit" value="View Cart" name="userSelectedOption" /> -->
                                        <div class="buttons">
                                            <div class="cart" >
                                                <input class="in" type="submit" id="addToCart_${attribute.packageId}" value="" name="userSelectedOption" />
                                                <span class="icon"><i class="fa fa-shopping-cart"></i></span>
                                            </div>
                                            <div class="cart" >
                                                <input class="in" type="submit" id="addToWishlist_${attribute.packageId}" value="" name="userSelectedOption" />
                                                <span class="icon"><i class="fa fa-heart"></i></span>
                                            </div>
                                            <div class="cart">
                                                    <form method="get" action="view.htm">
                                                        <input class="in" type="submit" id="view_${attribute.packageId}" value="" name="userSelectedOption" />
                                                        <span class="icon"><i class="fa fa-eye"></i></span>
                                                    </form>
                                            </div>
                                            
                                            
                                        </div>
                                        <script>
                                            function concatenateStrings(text1, text2, inputId) {
                                                let result = text1 + ' ' + text2; // Concatenate with a space in between
                                                document.getElementById(inputId).setAttribute("value", result);
                                            }
                                            
                                            //concatenateStrings(`<i class='fa fa-shopping-cart'></i> Add To Cart", "${attribute.packageId}", "addToCart_${attribute.packageId}");

                                            concatenateStrings("Add To Cart", "${attribute.packageId}", "addToCart_${attribute.packageId}");
                                            concatenateStrings("Add To Wishlist", "${attribute.packageId}", "addToWishlist_${attribute.packageId}");
                                            concatenateStrings("View", "${attribute.packageId}", "view_${attribute.packageId}");

                                        </script>
                                    </div>
                                    
                                </c:forEach>
                                </c:if>
                                <c:if test="${optionSelected == '3' }"> 
                                    <c:forEach var="attribute" items="${sessionScope.paginationResults}">
                                    <div class="Card">
                                        <img src="${attribute.image}" alt="x" width="300" height="250">
                                        <li>${attribute.packageId}</li>
                                        <li>${attribute.packageName}</li>
                                        <li>${attribute.packagePrice}</li>
                                        <li>${attribute.packageDescription}</li>
                                        <!-- <input  type="submit" value="${attribute.packageId}" name="userSelectedOption" /> -->
                                        
                                        <input  type="hidden" value="${attribute.packageId}" name="pId" />
                                        <!-- <input  type="submit" value="View Cart" name="userSelectedOption" /> -->
                                        <div class="buttons">
                                            <div class="cart" >
                                                <input class="in" type="submit" id="addToCart_${attribute.packageId}" value="" name="userSelectedOption" />
                                                <span class="icon"><i class="fa fa-shopping-cart"></i></span>
                                            </div>
                                            <div class="cart" >
                                                <input class="in" type="submit" id="addToWishlist_${attribute.packageId}" value="" name="userSelectedOption" />
                                                <span class="icon"><i class="fa fa-heart"></i></span>
                                            </div>
                                           
                                            <div class="cart">
                                            <form method="get" action="view.htm">
                                                <input class="in" type="submit" id="view_${attribute.packageId}" value="" name="userSelectedOption" />
                                                <span class="icon"><i class="fa fa-eye"></i></span>
                                            </form>
                                            </div>
                                            
                                        </div>
                                        <script>
                                            function concatenateStrings1(text1, text2, inputId) {
                                                let result = text1 + ' ' + text2; // Concatenate with a space in between
                                                document.getElementById(inputId).setAttribute("value", result);
                                            }
                                            
                                            //concatenateStrings(`<i class='fa fa-shopping-cart'></i> Add To Cart", "${attribute.packageId}", "addToCart_${attribute.packageId}");

                                            concatenateStrings1("Add To Cart", "${attribute.packageId}", "addToCart_${attribute.packageId}");
                                            concatenateStrings1("Add To Wishlist", "${attribute.packageId}", "addToWishlist_${attribute.packageId}");
                                            concatenateStrings1("View", "${attribute.packageId}", "view_${attribute.packageId}");

                                        </script>
                                    </div>
                                    
                                </c:forEach>
                                </c:if>
                                <!-- </ul> -->
                    </div>  
                </div>
            </div>
        </form>
    </div>
    <div id="Cart" class="tabcontent">
       
        <form method="post" name="products" action="products.htm">
            <div class="container py-5">
                <div class="Card-Parent">
                    <c:forEach var="attribute" items="${sessionScope.travelPackagesCart}">

                        <div class="Card" onload="myFunction()">
                            <img src="${attribute.image}" alt="x" width="300" height="250">
                            <li>${attribute.packageId}</li>
                            <li>${attribute.packageName}</li>
                            <li>${attribute.packagePrice}</li>
                            <li>${attribute.packageDescription}</li>

                            <label for="qty">Quantity</label><span id="myText"></span>
                            <select name="qty" id="qty">
                                <option name="qtySelected" value="1">1</option>
                                <option name="qtySelected" value="2">2</option>
                                <option name="qtySelected" value="3">3</option>
                                <option name="qtySelected" value="4">4</option>
                            </select>

                            <input  type="hidden" value="${attribute.packageId}" name="pId" />
                            <div class="buttons">
                                <div class="cart" >
                                    <input class="in" type="submit" id="caddToWishlist_${attribute.packageId}" value="" name="userSelectedOption" />
                                    <span class="icon"><i class="fa fa-heart"></i></span>
                                </div>
                                
                                <div class="cart">
                                    <form method="get" action="view.htm">
                                        <input class="in" type="submit" id="cview_${attribute.packageId}" value="" name="userSelectedOption" />
                                        <span class="icon"><i class="fa fa-eye"></i></span>
                                    </form>
                                </div>
                            
                                <div class="cart">
                                    <input class="in" type="submit" id="cdelete_${attribute.packageId}" value="" name="userSelectedOption" />
                                    <span class="icon"><i class="fas fa-trash-alt"></i></span>
                                </div>
                                
                            </div>
                           
                            <script>
                                function concatenateStrings2(text1, text2, cartInput) {
                                    let result = text1 + ' ' + text2; // Concatenate with a space in between
                                    document.getElementById(cartInput).setAttribute("value", result);
                                }
                               
                                //concatenateStrings(`<i class='fa fa-shopping-cart'></i> Add To Cart", "${attribute.packageId}", "addToCart_${attribute.packageId}");

                                concatenateStrings2("Add To Wishlist", "${attribute.packageId}", "caddToWishlist_${attribute.packageId}");
                                concatenateStrings2("View", "${attribute.packageId}", "cview_${attribute.packageId}");
                                concatenateStrings2("DeleteC", "${attribute.packageId}", "cdelete_${attribute.packageId}");
                            </script>
                        </div>

                    </c:forEach>
                </div>

                <input type="submit" id="updateQuantity" value="Total Price" name="userSelectedOption" />
                Cost : <c:out value="${sessionScope.aTotalCost}"/> <br/>

                <!-- <input type="submit" id="processOrder" value="Pay" name="userSelectedOption" /> -->
                <c:if test="${not empty requestScope.cartMessage}">
            <script>
                showAlert("${requestScope.cartMessage}"); // Call JavaScript function to display the alert
            </script>
        </c:if>
        <c:if test="${not empty requestScope.cartError}">
            <script>
                showAlert("${requestScope.cartError}"); // Call JavaScript function to display the alert
            </script>
        </c:if>
            </div>
        </form>
        <c:set var="totalSelected" scope="session" value="${sessionScope.totalSelected}"/>  
        <c:if test="${totalSelected == '1' }"> 
            <form method = "get" name="payments" action = "payment">
                <input type="submit" id="processOrder" value="Checkout" name="userSelectedOption" />
            </form>  
        </c:if>
    </div>
    <div id="Wishlist" class="tabcontent">
        <p>Wishlist Tab----</p>
        <form method="post" name="viewedAssessmentsForm" action="products.htm">
            <div class="container py-5">
                <div class = "Card-Parent searchedItems">
                    <c:forEach var="attribute" items="${sessionScope.travelPackagesWishlist}">
                        <div class="Card">
                            <img src="${attribute.image}" alt="x" width="300" height="250">
                            <li>${attribute.packageId}</li>
                            <li>${attribute.packageName}</li>
                            <li>${attribute.packagePrice}</li>
                            <li>${attribute.packageDescription}</li>

                           
                            <input  type="hidden" value="${attribute.packageId}" name="pId" />
                            <div class="buttons">
                                <div class="cart" >
                                    <input class="in" type="submit" id="waddToCart_${attribute.packageId}" value="" name="userSelectedOption" />
                                    <span class="icon"><i class="fa fa-shopping-cart"></i></span>
                                </div>
                                
                                <div class="cart">
                                    <form method="get" action="view.htm">
                                        <input class="in" type="submit" id="wview_${attribute.packageId}" value="" name="userSelectedOption" />
                                        <span class="icon"><i class="fa fa-eye"></i></span>
                                    </form>
                                </div>
                            
                                <div class="cart">
                                    <input class="in" type="submit" id="wdelete_${attribute.packageId}" value="" name="userSelectedOption" />
                                    <span class="icon"><i class="fas fa-trash-alt"></i></span>
                                </div>
                                
                            </div>
                           
                            <script>
                                function concatenateStrings2(text1, text2, wishInput) {
                                    let result = text1 + ' ' + text2; // Concatenate with a space in between
                                    document.getElementById(wishInput).setAttribute("value", result);
                                }
                               
                                //concatenateStrings(`<i class='fa fa-shopping-cart'></i> Add To Cart", "${attribute.packageId}", "addToCart_${attribute.packageId}");

                                concatenateStrings2("Add To Cart", "${attribute.packageId}", "waddToCart_${attribute.packageId}");
                                concatenateStrings2("View", "${attribute.packageId}", "wview_${attribute.packageId}");
                                concatenateStrings2("DeleteW", "${attribute.packageId}", "wdelete_${attribute.packageId}");
                            </script>
                        </div>
                        
                    </c:forEach>
                </div>
                <c:if test="${not empty requestScope.wishlistSuccess}">
            <script>
                showAlert("${requestScope.wishlistSuccess}"); // Call JavaScript function to display the alert
            </script>
        </c:if>
        <c:if test="${not empty requestScope.wishlistError}">
            <script>
                showAlert("${requestScope.wishlistError}"); // Call JavaScript function to display the alert
            </script>
        </c:if>
            </div>
        </form>
    </div>
    <div id="Orders" class="tabcontent">
        <div class="Card-Parent">
            <c:forEach var="attribute" items="${sessionScope.travelPackagesOrders}">

                <div class="Card">
                    <img src="${attribute.image}" alt="x" width="300" height="250">
                    <li>${attribute.packageId}</li>
                    <li>${attribute.packageName}</li>
                    <li>${attribute.packagePrice}</li>
                    <li>${attribute.packageDescription}</li>
                    
                </div>
            </c:forEach>
        </div>
    </div>
    <div id="Profile" class="tabcontent">
        <form  method = "post" name = "report" action = "products.htm">
                      
                   
            <h1>User Details</h1>
            <div id="userdetails">
                UserName : "${sessionScope.currentUser.name}"  <br/>
                UserEmail : ${sessionScope.currentUser.email}"   <br/> <br/> 
            </div>
        
           <p>Please make the changes! </p> 
           <hr>
                <div id="edit">
                    <input type="text" value="${sessionScope.currentUser.name}" name="username"/>
                    <input type="text" value="${sessionScope.currentUser.email}" name ="email"/>
                </div>
                <input type = "submit" class="btn btn-warning" value ="Update" name = "userSelectedOption"/>
        
    </form>

        
    </div>
        <script>
        function openPanel(evt, cityName) {
          var i, tabcontent, tablinks;
          tabcontent = document.getElementsByClassName("tabcontent");
          for (i = 0; i < tabcontent.length; i++) {
            tabcontent[i].style.display = "none";
          }
          tablinks = document.getElementsByClassName("tablinks");
          for (i = 0; i < tablinks.length; i++) {
            tablinks[i].className = tablinks[i].className.replace(" active", "");
          }
          document.getElementById(cityName).style.display = "block";
          evt.currentTarget.className += " active";
        }
        
        // Get the element with id="defaultOpen" and click on it
        document.getElementById("defaultOpen").click();
        </script>


   
</body>
</html> 
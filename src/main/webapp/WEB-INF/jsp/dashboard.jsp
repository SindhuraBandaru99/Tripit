<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <!-- </script>
    <link href="https://cdn.datatables.net/1.13.1/css/dataTables.bootstrap4.min.css" rel="stylesheet">
    
    </script> -->
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
    
    <style>
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
        .Card:hover {
           /* transform: scale(1.05); */
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

<body>
    <div class="container" style="padding: 25px">
        <h1>Welcome to NuMart!</h1>
        <div style="padding-block: 25px">
        <ul class="nav nav-tabs">
            <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" href="#home">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                        class="bi bi-house-fill" viewBox="0 0 16 16">
                        <path
                            d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L8 2.207l6.646 6.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.707 1.5Z" />
                        <path d="m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293l6-6Z" />
                    </svg> Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" data-bs-toggle="tab" href="#products">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                        class="bi bi-pen-fill" viewBox="0 0 16 16">
                        <path
                            d="m13.498.795.149-.149a1.207 1.207 0 1 1 1.707 1.708l-.149.148a1.5 1.5 0 0 1-.059 2.059L4.854 14.854a.5.5 0 0 1-.233.131l-4 1a.5.5 0 0 1-.606-.606l1-4a.5.5 0 0 1 .131-.232l9.642-9.642a.5.5 0 0 0-.642.056L6.854 4.854a.5.5 0 1 1-.708-.708L9.44.854A1.5 1.5 0 0 1 11.5.796a1.5 1.5 0 0 1 1.998-.001z" />
                    </svg> Products </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" href="#cart">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye-fill"
                        viewBox="0 0 16 16">
                        <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z" />
                        <path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8zm8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7z" />
                    </svg> Cart </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" href="#wishlist">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye-fill"
                        viewBox="0 0 16 16">
                        <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z" />
                        <path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8zm8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7z" />
                    </svg> Wishlist </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" href="#orders">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-bounding-box"
                        viewBox="0 0 16 16">
                        <path
                            d="M1.5 1a.5.5 0 0 0-.5.5v3a.5.5 0 0 1-1 0v-3A1.5 1.5 0 0 1 1.5 0h3a.5.5 0 0 1 0 1h-3zM11 .5a.5.5 0 0 1 .5-.5h3A1.5 1.5 0 0 1 16 1.5v3a.5.5 0 0 1-1 0v-3a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 1-.5-.5zM.5 11a.5.5 0 0 1 .5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 1 0 1h-3A1.5 1.5 0 0 1 0 14.5v-3a.5.5 0 0 1 .5-.5zm15 0a.5.5 0 0 1 .5.5v3a1.5 1.5 0 0 1-1.5 1.5h-3a.5.5 0 0 1 0-1h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 1 .5-.5z" />
                        <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm8-9a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
                    </svg>Orders</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" href="#profile">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-bounding-box"
                        viewBox="0 0 16 16">
                        <path
                            d="M1.5 1a.5.5 0 0 0-.5.5v3a.5.5 0 0 1-1 0v-3A1.5 1.5 0 0 1 1.5 0h3a.5.5 0 0 1 0 1h-3zM11 .5a.5.5 0 0 1 .5-.5h3A1.5 1.5 0 0 1 16 1.5v3a.5.5 0 0 1-1 0v-3a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 1-.5-.5zM.5 11a.5.5 0 0 1 .5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 1 0 1h-3A1.5 1.5 0 0 1 0 14.5v-3a.5.5 0 0 1 .5-.5zm15 0a.5.5 0 0 1 .5.5v3a1.5 1.5 0 0 1-1.5 1.5h-3a.5.5 0 0 1 0-1h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 1 .5-.5z" />
                        <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm8-9a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
                    </svg>Profile</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" href="#contact">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-bounding-box"
                        viewBox="0 0 16 16">
                        <path
                            d="M1.5 1a.5.5 0 0 0-.5.5v3a.5.5 0 0 1-1 0v-3A1.5 1.5 0 0 1 1.5 0h3a.5.5 0 0 1 0 1h-3zM11 .5a.5.5 0 0 1 .5-.5h3A1.5 1.5 0 0 1 16 1.5v3a.5.5 0 0 1-1 0v-3a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 1-.5-.5zM.5 11a.5.5 0 0 1 .5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 1 0 1h-3A1.5 1.5 0 0 1 0 14.5v-3a.5.5 0 0 1 .5-.5zm15 0a.5.5 0 0 1 .5.5v3a1.5 1.5 0 0 1-1.5 1.5h-3a.5.5 0 0 1 0-1h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 1 .5-.5z" />
                        <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm8-9a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
                    </svg>Contact</a>
            </li>
            <!-- <li class="nav-item">
                <a class="nav-link" data-bs-toggle="tab" href="#payment">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-bounding-box"
                        viewBox="0 0 16 16">
                        <path
                            d="M1.5 1a.5.5 0 0 0-.5.5v3a.5.5 0 0 1-1 0v-3A1.5 1.5 0 0 1 1.5 0h3a.5.5 0 0 1 0 1h-3zM11 .5a.5.5 0 0 1 .5-.5h3A1.5 1.5 0 0 1 16 1.5v3a.5.5 0 0 1-1 0v-3a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 1-.5-.5zM.5 11a.5.5 0 0 1 .5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 1 0 1h-3A1.5 1.5 0 0 1 0 14.5v-3a.5.5 0 0 1 .5-.5zm15 0a.5.5 0 0 1 .5.5v3a1.5 1.5 0 0 1-1.5 1.5h-3a.5.5 0 0 1 0-1h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 1 .5-.5z" />
                        <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm8-9a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
                    </svg>Payment</a>
            </li> -->
        </ul>

        <div class="tab-content">
            <div class="tab-pane active" id="home">
                <h2>Hi
                    <c:out value="${sessionScope.currentUser.name}" />
                </h2>
                <h4>Welcome to Nuemart!----</h4>
            </div>
            <div class="tab-pane active" id="products">
                <p>Products Page</p>
                <form method="post" name="products" action="products.htm">
                    <div class="container py-5">
                        <div class="row">
                            <div>
                                <form method = "post" action = "products.htm">
                                    <label>Search by Package Name: </label>
                                    <input type = "text" name = "textEntered"/>
                                    <input type = "submit" class="btn btn-warning search" value = "Search" name = "userSelectedOption"/>
                                    <div class = "Card-Parent searchedItems">
                                        <!-- <h3>Hi</h3>
                                        <c:out value="${sessionScope.optionSelected}" /> -->
                                        <c:set var="optionSelected" scope="session" value="${sessionScope.optionSelected}"/>  
                                        <c:if test="${optionSelected == '1'}"> 
                                            <c:forEach var="attribute" items="${sessionScope.searchedItems}">
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
                                                            <input class="in" type="submit" id="view_${attribute.packageId}" value="" name="userSelectedOption" />
                                                            <span class="icon"><i class="fa fa-eye"></i></span>
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
                                        
                                    </div>
                                </form>
                            </div>
                            <div>
                                <form method = "post" action = "products.htm">
                                    <label>Sort by Package Name: </label>
                                    <input type = "submit" class="btn btn-warning sort" value = "Sort" name = "userSelectedOption"/>
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
                                                        <input class="in" type="submit" id="view_${attribute.packageId}" value="" name="userSelectedOption" />
                                                        <span class="icon"><i class="fa fa-eye"></i></span>
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
                                                        <input class="in" type="submit" id="view_${attribute.packageId}" value="" name="userSelectedOption" />
                                                        <span class="icon"><i class="fa fa-eye"></i></span>
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
                                                        <input class="in" type="submit" id="view_${attribute.packageId}" value="" name="userSelectedOption" />
                                                        <span class="icon"><i class="fa fa-eye"></i></span>
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
                                      <!-- </ul> -->
                            </div>  
                        </div>
                    </div>
                </form>
            </div>
            <div class="tab-pane" id="cart">
                <p>Cart Tab----</p>
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
                                </div>
                                <script>
                                    function myFunction(){
                                    const qty = document.querySelector('#qty');
                                    let selectedValue = qty.value;
                                    
                                    qty.addEventListener('change', () => {
                                      selectedValue = qty.value;
                                      document.getElementById("myText").innerHTML = selectedValue;
                                      console.log('Selected value:', selectedValue);
                                    });}
                                  </script>
                            </c:forEach>
                        </div>
                        Cost : <c:out value="${sessionScope.aTotalCost}"/> <br/>
                        Payment : 
                        <input type="submit" id="updateQuantity" value="Quantity" name="userSelectedOption" />
                        
                            <input type="submit" id="processOrder" value="Pay" name="userSelectedOption" />
                       
                    </div>
                </form>
                <form method = "get" name="payments" action = "payment">
                    <input type="submit" id="processOrder" value="Payment" name="userSelectedOption" />
                </form>  
            </div>
            <div class="tab-pane" id="wishlist">
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
                                    <!-- <input  type="submit" value="${attribute.packageId}" name="userSelectedOption" /> -->
                                   
                                    <input  type="hidden" value="${attribute.packageId}" name="pId" />
                                    <!-- <input  type="submit" value="View Cart" name="userSelectedOption" /> -->
                                    <div class="buttons">
                                        <div class="cart" >
                                            <input class="in" type="submit" id="addToCart_${attribute.packageId}" value="" name="userSelectedOption" />
                                            <span class="icon"><i class="fa fa-shopping-cart"></i></span>
                                        </div>
                                        <div class="cart">
                                            <input class="in" type="submit" id="view_${attribute.packageId}" value="" name="userSelectedOption" />
                                            <span class="icon"><i class="fa fa-eye"></i></span>
                                        </div>
                                        <div class="cart">
                                            <input class="in" type="submit" id="delete_${attribute.packageId}" value="" name="userSelectedOption" />
                                            <span class="icon"><i class="fas fa-trash-alt"></i></span>
                                        </div>
                                    </div>
                                   
                                    <script>
                                        function concatenateStrings(text1, text2, inputId) {
                                            let result = text1 + ' ' + text2; // Concatenate with a space in between
                                            document.getElementById(inputId).setAttribute("value", result);
                                        }
                                       
                                        //concatenateStrings(`<i class='fa fa-shopping-cart'></i> Add To Cart", "${attribute.packageId}", "addToCart_${attribute.packageId}");

                                        concatenateStrings("Add To Cart", "${attribute.packageId}", "addToCart_${attribute.packageId}");
                                        concatenateStrings("View", "${attribute.packageId}", "view_${attribute.packageId}");
                                        concatenateStrings("Delete", "${attribute.packageId}", "delete_${attribute.packageId}");
                                    </script>
                                </div>
                                
                            </c:forEach>
                        </div>
                    </div>
                </form>
            </div>
            <div class="tab-pane" id="orders">
                <p>Orders</p>
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
            <div class="tab-pane" id="profile">
                <form  method = "post" name = "report" action = "products.htm">
                      
                   
                        <h1>User Details</h1>
                        <div id="userdetails">
                            UserName : "${sessionScope.currentUser.name}"  <br/>
                            UserEmail : ${sessionScope.currentUser.email}"   <br/> <br/> 
                        </div>
                    
                       <p>Please make the changes! </p> 
                       
                            <div id="edit">
                                <input type="text" value="${sessionScope.currentUser.name}" name="username"/>
                                <input type="text" value="${sessionScope.currentUser.email}" name ="email"/>
                            </div>
                            <input type = "submit" class="btn btn-warning" value ="Update" name = "userSelectedOption"/>
                    
                </form>
       
                    <form method = "post" name = "report" action = "email.htm">
                                     <input type = "submit" value ="Email" name = "email"/>
                                    <input type = "submit" value ="Report" name = "report"/>    
                    </form>
                    <form method = "post" name = "report" action = "logout.htm">
                        <button type="submit" class="btn btn-warning">Logout</button>
                    </form>
            </div>

            <div class="tab-pane" id="contact">
                <p>Contact Support</p>
                <form method="post" name="viewedAssessmentsForm" action="viewAssessment">
                    <h1>Please email any querries to numarts@gmail.com</h1>
                </form>
            </div>
            <!-- <div class="tab-pane" id="payment">
                <p>Viewed Assessments Tab</p>
                <form method="post" name="viewedAssessmentsForm" action="viewAssessment">
                    <div class="container py-5">
                        <div class="row">
                            <table id="example2" class="table table-striped table-bordered" style="width:100%">
                                <thead>
                                    <tr>
                                        <th>User Name</th>
                                        <th> Assessment Name</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                
                            </table>
                        </div>
                    </div>
                </form>
            </div> -->
            <!-- <div class="tab-pane" id="doctorDetails">
                <form method="post" action="logout.htm">
                    <h3>Name : <c:out value="${sessionScope.user.getName()}" /></h3>
                    <h3>Email : <c:out value="${sessionScope.user.getEmail()}" /></h3>
                    <button type="submit" class="btn btn-warning">Logout</button>
                </form>
            </div> -->
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.1/js/dataTables.bootstrap4.min.js"></script>
    <script>
        var condition = true;
        if ("${sessionScope.optionSelected}" == 1) {
          document.getElementById("myDiv").classList.remove("hidden");
        } else {
          document.getElementById("myDiv").classList.add("hidden");
        }
      </script>
    
</body>

</html>
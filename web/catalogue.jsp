<%-- 
    Document   : catalogue
    Created on : 25 Aug, 2021, 4:55:23 PM
    Author     : Sanam
--%>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<%--<%@page import="org.apache.commons.fileupload.servlet.ServletFIleUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.*"%>--%>


<%@page import="newpackage.User" import="java.io.*" import="java.util.*"%>

<% User user = (User) session.getAttribute("logUser");
    if(user==null){
        response.sendRedirect("loginnew.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome Page</title>
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css'>
        <link href="css/menuChange.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="./css/loader.css">
        <link rel="stylesheet" href="./css/catalogueCard.css">
        <link rel="stylesheet" href="./css/catalogue.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

        <link
            href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap"
            rel="stylesheet"
            />
    </head>
    <body>
        <% 



       Blob image = null;
       byte[] imgData = null;
       
       String productSql = "SELECT * FROM products";
       String cartSql = "SELECT * FROM cart";
       String bookingSql = "SELECT * FROM bookings";
       String userSql = "SELECT * FROM user WHERE id = " + Integer.toString(user.getId());

       
       try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection productConnection = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
            Connection cartConnection = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
            Connection bookingConnection = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");

            Statement productStatement  = productConnection.createStatement();
            Statement cartStatement  = productConnection.createStatement();
            Statement bookingStatement  = bookingConnection.createStatement();

             ResultSet productResultSet    = productStatement.executeQuery(productSql);     
             ResultSet cartResultSet    = cartStatement.executeQuery(cartSql);     
             ResultSet bookingResultSet    = bookingStatement.executeQuery(bookingSql);  

Statement userStatement = productConnection.createStatement();

             ResultSet userResultSet = userStatement.executeQuery(userSql); 
        
        %>
        <div class="app-container">
            <div style="  font-family: 'Poppins', sans-serif;" class="app-header">
                <div class="app-header-left">
                    <span class="app-icon"></span>

                    <img style="height: 70px; width: 175px; margin-top: -0.5rem;" src="img/logo2.png" alt="alt"/>
                    <div class="search-wrapper">

                    </div>

                    <div class="app-sidebar">
                        <!--                        <a href="" class="app-sidebar-link active"> 
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-home">
                                                    <path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z" />
                                                    <polyline points="9 22 9 12 15 12 15 22" />
                                                    </svg>
                                                    
                                                </a>
                                                <a href="" class="app-sidebar-link">
                                                    <svg class="link-icon" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="feather feather-pie-chart" viewBox="0 0 24 24">
                                                    <defs />
                                                    <path d="M21.21 15.89A10 10 0 118 2.83M22 12A10 10 0 0012 2v10z" />
                                                    </svg>
                                                </a>
                                                <a href="" class="app-sidebar-link">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-calendar">
                                                    <rect x="3" y="4" width="18" height="18" rx="2" ry="2" />
                                                    <line x1="16" y1="2" x2="16" y2="6" />
                                                    <line x1="8" y1="2" x2="8" y2="6" />
                                                    <line x1="3" y1="10" x2="21" y2="10" />
                                                    </svg>
                                                </a>
                                                <a href="" class="app-sidebar-link">
                                                    <svg class="link-icon" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="feather feather-settings" viewBox="0 0 24 24">
                                                    <defs />
                                                    <circle cx="12" cy="12" r="3" />
                                                    <path d="M19.4 15a1.65 1.65 0 00.33 1.82l.06.06a2 2 0 010 2.83 2 2 0 01-2.83 0l-.06-.06a1.65 1.65 0 00-1.82-.33 1.65 1.65 0 00-1 1.51V21a2 2 0 01-2 2 2 2 0 01-2-2v-.09A1.65 1.65 0 009 19.4a1.65 1.65 0 00-1.82.33l-.06.06a2 2 0 01-2.83 0 2 2 0 010-2.83l.06-.06a1.65 1.65 0 00.33-1.82 1.65 1.65 0 00-1.51-1H3a2 2 0 01-2-2 2 2 0 012-2h.09A1.65 1.65 0 004.6 9a1.65 1.65 0 00-.33-1.82l-.06-.06a2 2 0 010-2.83 2 2 0 012.83 0l.06.06a1.65 1.65 0 001.82.33H9a1.65 1.65 0 001-1.51V3a2 2 0 012-2 2 2 0 012 2v.09a1.65 1.65 0 001 1.51 1.65 1.65 0 001.82-.33l.06-.06a2 2 0 012.83 0 2 2 0 010 2.83l-.06.06a1.65 1.65 0 00-.33 1.82V9a1.65 1.65 0 001.51 1H21a2 2 0 012 2 2 2 0 01-2 2h-.09a1.65 1.65 0 00-1.51 1z" />
                                                    </svg>
                                                </a>-->

                        <div class="tabs">
                            <input type="radio" id="radio-1" name="tabs" onClick="functionCalled()" />

                            <label class="tab" for="radio-1">
                                <span class="notification">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-home">
                                    <path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z" />
                                    <polyline points="9 22 9 12 15 12 15 22" />
                                    </svg>
                                </span>
                                Home
                            </label>
                            <input type="radio" id="radio-2" name="tabs" checked/>
                            <label class="tab" for="radio-2">
                                <span class="notification">
                                    <svg class="link-icon" xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="feather feather-pie-chart" viewBox="0 0 24 24">
                                    <defs />
                                    <path d="M21.21 15.89A10 10 0 118 2.83M22 12A10 10 0 0012 2v10z" />
                                    </svg>
                                </span>
                                Catalogue

                            </label>
                            <input type="radio" id="radio-3" name="tabs" />
                            <label class="tab" for="radio-3">
                                <span class="notification">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-calendar">
                                    <rect x="3" y="4" width="18" height="18" rx="2" ry="2" />
                                    <line x1="16" y1="2" x2="16" y2="6" />
                                    <line x1="8" y1="2" x2="8" y2="6" />
                                    <line x1="3" y1="10" x2="21" y2="10" />
                                    </svg>
                                </span>
                                Contact Us</label>
                            <span class="glider"></span>
                        </div>
                    </div>
                </div>



                <div class="app-header-right">
                    <a href="cart.jsp">
                        <button class="notification-btn"> 
                            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Capa_1" x="0px" y="0px" width="24" height="24" viewBox="0 0 902.86 902.86" style="enable-background:new 0 0 902.86 902.86;" xml:space="preserve">


                            <path d="M671.504,577.829l110.485-432.609H902.86v-68H729.174L703.128,179.2L0,178.697l74.753,399.129h596.751V577.829z     M685.766,247.188l-67.077,262.64H131.199L81.928,246.756L685.766,247.188z"/>
                            <path d="M578.418,825.641c59.961,0,108.743-48.783,108.743-108.744s-48.782-108.742-108.743-108.742H168.717    c-59.961,0-108.744,48.781-108.744,108.742s48.782,108.744,108.744,108.744c59.962,0,108.743-48.783,108.743-108.744    c0-14.4-2.821-28.152-7.927-40.742h208.069c-5.107,12.59-7.928,26.342-7.928,40.742    C469.675,776.858,518.457,825.641,578.418,825.641z M209.46,716.897c0,22.467-18.277,40.744-40.743,40.744    c-22.466,0-40.744-18.277-40.744-40.744c0-22.465,18.277-40.742,40.744-40.742C191.183,676.155,209.46,694.432,209.46,716.897z     M619.162,716.897c0,22.467-18.277,40.744-40.743,40.744s-40.743-18.277-40.743-40.744c0-22.465,18.277-40.742,40.743-40.742    S619.162,694.432,619.162,716.897z"/>


                            </svg>                    
                        </button>
                    </a>
                    <a href="notification.jsp">

                        <button class="notification-btn">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-bell">
                            <path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9" />
                            <path d="M13.73 21a2 2 0 0 1-3.46 0" /></svg>
                        </button>
                    </a>

                    <button class="profile-btn profile-dropdown">
                        <%
                                               if (userResultSet.next()) {
                                                image = userResultSet.getBlob("image");
                                                imgData = image.getBytes(1, (int) image.length());
                                                String encodedImage = Base64.getEncoder().encodeToString(imgData);
                                                String pic = "data:image/png;base64," + encodedImage;
                        %> 
                        <button class="profile-btn profile-dropdown">
                            <% if (image.length() > 1000) {
                            
                        
                            %> 
                            <img src="<%=pic%>" />

                            <%  } else {
                            
                        
                            %> 
                            <img src="./img/defaultPro.jpg" />

                            <%  }
    } 
                            
                        
                            %>                        
                            <span><%= user.getName().substring(0, user.getName().indexOf(" "))  %></span>
                        </button>
                        <svg viewBox="0 0 24 24" class="dropdown-svg" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round">
                        <polyline points="6 9 12 15 18 9"></polyline>
                        </svg>
                        <div class="dropdown">
                            <ul class="dropdown-content">
                                <li onClick="functionProfile()" class="dropdown-item"><i class="fas fa-user-circle"></i> Profile</li>
                                <li class="divider"></li>
                                <li  class="dropdown-item"><i class="fas fa-phone-alt"></i> Contacts</li>
                                <li onClick="functionBookings()" class="dropdown-item"><i class="fas fa-sort"></i> Bookings</li>
                                <li onClick="functionSettings()" class="dropdown-item"><i class="fas fa-cog"></i> Settings</li>
                                <li class="divider"></li>
                                <li onClick="functionLogout()" class="dropdown-item logout"><i class="fas fa-sign-out-alt"></i> Logout</li>
                            </ul>
                        </div>



                </div>
                <button class="messages-btn">
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-message-circle">
                    <path d="M21 11.5a8.38 8.38 0 0 1-.9 3.8 8.5 8.5 0 0 1-7.6 4.7 8.38 8.38 0 0 1-3.8-.9L3 21l1.9-5.7a8.38 8.38 0 0 1-.9-3.8 8.5 8.5 0 0 1 4.7-7.6 8.38 8.38 0 0 1 3.8-.9h.5a8.48 8.48 0 0 1 8 8v.5z" /></svg>
                </button>
            </div>
            <div style="font-family: 'Poppins', sans-serif; color: #36353c; position: absolute; margin-left: 70px; margin-top: 160px; font-size: 2.5rem; font-weight: 800; z-index: 999">
                Car Catalogue 
            </div>
            <div class="filters">
                <button class="filterButton">
                    Price&nbsp;&nbsp;<i class="fas fa-chevron-down"></i>
                </button>
                <button class="filterButton">
                    Manufacture&nbsp;&nbsp;<i class="fas fa-chevron-down"></i>
                </button>
                <button class="filterButton">
                    Type&nbsp;&nbsp;<i class="fas fa-chevron-down"></i>
                </button>
                <button class="filterButton">
                    Rating&nbsp;&nbsp;<i class="fas fa-chevron-down"></i>
                </button>
            </div>

            <div style="font-family: 'Poppins', sans-serif; color: #36353c; position: absolute; margin-left: 78px; margin-top: 215px; font-size: 1rem; font-weight: 600; z-index: 999">
                Explore out cars you might like! 
            </div>




            <div class="row">
                <%
                            while (productResultSet.next()) {
                             image = productResultSet.getBlob("image");
                             imgData = image.getBytes(1, (int) image.length());
                             String encodedImage = Base64.getEncoder().encodeToString(imgData);
                             String pic = "data:image/png;base64," + encodedImage;
                 
                             if (productResultSet.getString("flag").equals("rented")) {
                %> 
                <div class="column">

                    <div class="card-group">

                        <div class="card">
                            <!--                                        <form action="ProductServlet" method="post" enctype="multipart/form-data">
                                                                        <input type="hidden" name="name" value="Honda Jazz Rs">
                                                                        <input type="hidden" name="price" value="3000">
                                                                        <input type="file" name="image">
                                                                        <div class="logoDrive"><img src="./logos/drive.png" ></div>
                                                                        <div class="logoSeat"><img src="./logos/seat.png" ></div>
                                                                        <div class="logoMileage"><img src="./logos/mileage.png"></div>
                                                                        <div class="carModel"><img src="./Car Models/1.png" ></div>
                                                                        <div class="name" name="name" contenteditable="true">Honda Jazz RS</div>
                                                                        <div class="price" name="price" contenteditable="true"><sup>₹</sup><span style="font-size: 2.1rem; font-weight: 700">3000</span><sub>/day</sub></div>
                                                
                                                                        <div class="drive">Manual</div>
                                                                        <div class="seats">4 Seats</div>
                                                                        <div class="mileage">30 MPG</div>
                                                                        <button class="add-to-cart" value="submit">
                                                                            <div class="default">Rent Now</div>
                                                                            <div class="success">Added</div>
                                                                            <div class="cart">
                                                                                <div>
                                                                                    <div></div>
                                                                                    <div></div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="dots"></div>
                                                
                                                                        </button>
                                                                    </form>-->

                            <form action="CartServlet" method="post">
                                <input type="hidden" name="owner" value="<%= user.getId()%>">
                                <input type="hidden" name="carId" value="<%= productResultSet.getString("id")%>">
                                <input type="hidden" name="name" value="<%= productResultSet.getString("name")%>">
                                <input type="hidden" name="price" value="<%= productResultSet.getString("price")%>">
                                <input type="hidden" name="drive" value="<%= productResultSet.getString("drive")%>">
                                <input type="hidden" name="seats" value="<%= productResultSet.getString("seats")%>">
                                <input type="hidden" name="mileage" value="<%= productResultSet.getString("mileage")%>">



                                <div style="visibility: visible" class="logoDrive"><img src="./logos/drive.png" ></div>
                                <div style="visibility: visible" class="logoSeat">
                                    <img src="./logos/seat.png" >
                                </div>
                                <div style="visibility: visible" class="logoMileage">
                                    <img src="./logos/mileage.png">
                                </div>
                                <div style="visibility: visible" class="carModel">
                                    <img src="<%=pic%>">
                                </div>
                                <div style="visibility: visible" class="name" name="name"><%= productResultSet.getString("name")%></div>
                                <div style="visibility: visible" class="price" name="price"><sup>₹</sup><span style="font-size: 2.1rem; font-weight: 700"><%=productResultSet.getString("price")%></span><sub>/day</sub></div>
                                        <% if (productResultSet.getString("drive").equalsIgnoreCase("Auto")) {
                                    
                                        %>

                                <div style="visibility: visible; margin-left: 10px;" class="drive"><%=productResultSet.getString("drive")%></div>
                                <% } else {
                                %>
                                <div style="visibility: visible" class="drive"><%=productResultSet.getString("drive")%></div>

                                <% }
                                %>
                                <div style="visibility: visible" class="seats"><%=productResultSet.getString("seats")%></div>
                                <div style="visibility: visible" class="mileage"><%=productResultSet.getString("mileage")%></div>

                                <div class="name" name="name"><%=productResultSet.getString("name")%></div>
                                <div class="price" name="price"><sup>₹</sup><span style="font-size: 2.1rem; font-weight: 700"><%=productResultSet.getString("price")%></span><sub>/day</sub></div>


                                <div class="rented">
                                    <span class="rented_image" style="font-weight: 700; font-size: 2rem; color: white">Rented</span>
                                </div>


                            </form>
                            <div style="z-index: -1" class="ring"></div>
                        </div>
                    </div>
                </div>
                <% } else { %>

                <div class="column">

                    <div class="card-group">

                        <div class="card">

                            <form action="CartServlet" method="post">
                                <input type="hidden" name="owner" value="<%= user.getId()%>">
                                <input type="hidden" name="carId" value="<%= productResultSet.getString("id")%>">
                                <input type="hidden" name="name" value="<%= productResultSet.getString("name")%>">
                                <input type="hidden" name="price" value="<%= productResultSet.getString("price")%>">
                                <input type="hidden" name="drive" value="<%= productResultSet.getString("drive")%>">
                                <input type="hidden" name="seats" value="<%= productResultSet.getString("seats")%>">
                                <input type="hidden" name="mileage" value="<%= productResultSet.getString("mileage")%>">


                                <div class="logoDrive"><img src="./logos/drive.png" ></div>
                                <div class="logoSeat">
                                    <img src="./logos/seat.png" >
                                </div>
                                <div class="logoMileage">
                                    <img src="./logos/mileage.png">
                                </div>
                                <div class="carModel">

                                    <img src="<%=pic%>">



                                </div>
                                <div class="name" name="name"><%= productResultSet.getString("name")%></div>
                                <div class="price" name="price"><sup>₹</sup><span style="font-size: 2.1rem; font-weight: 700"><%=productResultSet.getString("price")%></span><sub>/day</sub></div>
                                        <% if (productResultSet.getString("drive").equalsIgnoreCase("Auto")) {
                                    
                                        %>

                                <div style="margin-left: 10px;" class="drive"><%=productResultSet.getString("drive")%></div>
                                <% } else {
                                %>
                                <div class="drive"><%=productResultSet.getString("drive")%></div>

                                <% }
                                %>                                <div class="seats"><%=productResultSet.getString("seats")%></div>
                                <div class="mileage"><%=productResultSet.getString("mileage")%></div>
                                <button class="add-to-cart">
                                    <div class="default">Rent Now</div>
                                    <div class="success">Added</div>
                                    <div class="cart">
                                        <div>
                                            <div></div>
                                            <div></div>
                                        </div>
                                    </div>
                                    <div class="dots"></div>

                                </button>
                            </form>
                            <div style="z-index: -1" class="ring"></div>
                        </div>
                    </div>
                </div>

                <% }  } } catch (Exception e) {} %>


            </div>


        </div>
        <footer style="font-family: 'Poppins', sans-serif;" class="footer-distributed">

            <div class="footer-left">

                <h3><span><img style="height: 70px" src="./img/logo.png" ></span></h3>

                <p class="footer-links">
                    <a href="#">Home</a>
                    ·
                    <a href="#">Blog</a>
                    ·
                    <a href="#">Pricing</a>
                    ·
                    <a href="#">About</a>
                    ·
                    <a href="#">Faq</a>
                    ·
                    <a href="#">Contact</a>
                </p>

                <p class="footer-company-name">CarRental &copy; 2021</p>
            </div>

            <div class="footer-center">

                <div>
                    <i class="fa fa-map-marker"></i>
                    <p><span>21 Revolution Street</span> Delhi, India</p>
                </div>

                <div>
                    <i class="fa fa-phone"></i>
                    <p>+1 555 123456</p>
                </div>

                <div>
                    <i class="fa fa-envelope"></i>
                    <p><a href="mailto:support@company.com">contact@CarRental.com</a></p>
                </div>

            </div>

            <div class="footer-right">

                <p class="footer-company-about">
                    <span>About the company</span>
                    Enjoy your Holidays with out Wheels. Checkout huge variety of Cars.
                </p>

                <div class="footer-icons">

                    <i class="fab fa-facebook-square"></i>                    
                    <i class="fab fa-twitter-square"></i>                    
                    <i class="fab fa-instagram"></i>
                    <i class="fab fa-linkedin"></i>

                </div>

            </div>

        </footer>

        <!--        <div style="align-items: center; margin: 100px; justify-content: center">
                <h1> Welcome, <%= user.getName() %></h1>
                <h3>Your Account ID: <%= user.getId() %> </h3>
                <h3>Your Email: <%= user.getEmail() %> </h3>
                <h3>Your Password: <%= user.getPassword() %></h3>
                <h3>Your Phone: <%= user.getNumber() %></h3>
                
                <button><a href="LogoutServlet">Log Out</a></button>
                </div>-->
        <script  src="./js/welcome.js"></script>
        <script>
                                    document.querySelectorAll('.add-to-cart').forEach(button => {
                                        button.addEventListener('click', e => {
                                            button.classList.toggle('added');
                                        });
                                    });



                                    function functionCalled() {
                                        window.location.href = "welcome.jsp";
                                    }
                                    function functionLogout() {
                                        window.location.href = "LogoutServlet";
                                    }
                                    function functionProfile() {
                                        window.location.href = "profile.jsp";
                                    }
                                    function functionSettings() {
                                        window.location.href = "Settings.jsp";
                                    }
                                    function functionBookings() {
                                        window.location.href = "Booking.jsp";
                                    }
                                     function functionSettings() {
                                window.location.href = "Settings.jsp";
                            }
                                    if (window.File && window.FileReader && window.FileList && window.Blob) {
                                        // Great success! All the File APIs are supported.
                                    } else {
                                        alert('The File APIs are not fully supported in this browser.');
                                    }
        </script>

    </body>
</html>

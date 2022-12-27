<%-- 
    Document   : forgotPassword
    Created on : 14 Aug, 2021, 12:08:11 PM
    Author     : Sanam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forgot Password Page</title>
        <link rel="stylesheet" href="./css/login.css">
        <link rel="stylesheet" href="./css/loader.css">
        <link rel="stylesheet" href="./css/popup.css">
        <link rel="stylesheet" href="./css/dropdown.css">
        <link href="css/navigationBarLogin.css" rel="stylesheet" type="text/css"/>
                <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css'>

        <link
            href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap"
            rel="stylesheet"
            />
        <link href="https://fonts.googleapis.com/css?family=Ma+Shan+Zheng&display=swap" rel="stylesheet">

        <link href="https://fonts.googleapis.com/css2?family=WindSong&display=swap" rel="stylesheet"> 
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap');
        </style>

    </head>
    <body>
        <header style="font-family: Poppins" class="header">


            <nav style="font-family: Poppins"  class="nav-bar">
                <img style="height: 70px; width: 175px; margin-top: -1.2rem;" src="img/logo2.png" alt="alt"/>

                <ul style="font-family: Poppins; font-size: 25px">

                    <li><a class="nav-link" href="#oxygenos">Offers</a></li>
                    <li><a class="nav-link" href="#resistance">About Us</a></li>
                    <li><a class="nav-link" href="#headphones">Subscription</a></li>
                </ul>
                <button style="text-transform: none; font-family: Poppins; " class="custom-btn btn-7"><span><b>Continue</b> <i class="fas fa-chevron-right"></i></span></button>
            </nav>
        </header>
        <!-- partial:index.partial.html -->
        <h2>Please Fill Details to Continue</h2>
        <div class="container" id="container">
            <div class="form-container sign-up-container">

            </div>
            <div class="form-container sign-in-container">
                <form action="forgotPasswordAction.jsp" method="post">
                    <h1 style="margin-top: 1.5rem">Forgot Password</h1>
                    <div class="social-container">

                    </div>
                    <input type="email" placeholder="Email" name="email" required=""/>
                    <input type="number" placeholder="Phone" name="number" required=""/>
                    <div class="selectbox selectbox--unselect" data-option="">
                        <div class="selectbox__displayWord">
                            Select
                        </div>
                        <div class="option-container">
                            <div class="option-container__option">
                                <input type="radio" class="option__radio" id="1100" name="category">
                                <label class="option__label" for="1100" data-value="What was your first car?">What was your first car?</label>
                            </div>
                            <div class="option-container__option">
                                <input type="radio" class="option__radio" id="1200" name="category">
                                <label class="option__label" for="1200" data-value="What is the name of your first pet?">What is the name of your first pet?</label>
                            </div>
                            <div class="option-container__option">
                                <input type="radio" class="option__radio" id="1300" name="category">
                                <label class="option__label" for="1300" data-value="What elementary school did you attend?">What elementary school did you attend?</label>
                            </div>

                        </div>
                    </div>
                    <div style="margin-bottom: 2rem">
                        <input type="text" placeholder="Enter Answer" name="answer" required=""/>

                        <input type="password" placeholder="Password" name="newPassword" required=""/>

                    <button class="buttonForm" onClick="location.href = 'welcome.jsp'" value="Forgot"><div>Submit  <i class="fas fa-chevron-right"></i></div></button>
                    </div>
                </form>
            </div>
            <div class="overlay-container">
                <div class="overlay">
                    <div class="overlay-panel overlay-left">
                        <h1>Welcome Back!</h1>
                        <p>To keep connected with us please login with your personal info</p>
                        <button class="ghost" id="signIn">Sign In</button>
                    </div>
                    <div class="overlay-panel overlay-right">
                        <h1>Hello, Rider!</h1>
                        <p>Enter your personal details and start journey with us</p>
                        <button onClick="location.href = 'loginnew.jsp'" class="ghost buttonForm" id="">Log In</button>
                    </div>
                </div>


                <div class="popup center">
                    <div class="icon">
                        <i class="fa fa-check"></i>
                    </div>
                    <div class="title">
                        Success!!
                    </div>
                    <div class="description">
                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Alias nihil provident voluptatem nulla placeat
                    </div>
                    <div class="dismiss-btn">
                        <button id="dismiss-popup-btn">
                            Dismiss
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <footer>
            <p>
                Car Rental System <i class="fa fa-heart"></i> by
                <a target="_blank" href="#">Group 19</a>
                - ©2021
                <a target="_blank" href="#">All Rights Reserved.</a>.
            </p>
        </footer> 
        <!-- partial -->
        <script  src="./js/login.js"></script>
        <script  src="./js/popup.js"></script>
        <script  src="./js/dropdown.js"></script>

    </body>
</html>
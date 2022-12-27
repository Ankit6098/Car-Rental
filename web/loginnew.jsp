<%-- 
    Document   : loginnew
    Created on : 13 Aug, 2021, 12:37:13 PM
    Author     : Sanam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >
    <head>
        <meta charset="UTF-8">


        <title>Login Page</title>
        <script async src="https://www.googletagmanager.com/gtag/js?id=UA-186875127-1"></script>
        <script>
            window.dataLayer = window.dataLayer || [];
            function gtag() {
                dataLayer.push(arguments);
            }
            gtag('js', new Date());

            gtag('config', 'UA-186875127-1');
        </script>
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css'>
        <link rel="stylesheet" href="./css/login.css">
        <link rel="stylesheet" href="./css/loader.css">
        <link rel="stylesheet" href="./css/popup.css">
        <link href="css/navigationBarLogin.css" rel="stylesheet" type="text/css"/>
        <link
            href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap"
            rel="stylesheet"
            />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
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
        <h2>Please Fill Sign in/up Form to Continue</h2>
        <div class="container" id="container">
            <div class="form-container sign-up-container">
                <form action="RegisterServlet" method="post">
                    <h1>Create Account</h1>
                    <div class="social-container">
                        <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                        <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
                        <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
                    </div>

                    <div class="input-icons">
                        <i class="fas fa-user"></i>
                        <input type="text" placeholder="Name" name="name" required=""/>
                        <i class="far fa-envelope"></i>
                        <input type="email" placeholder="Email" name="email" required=""/>
                        <i class="fas fa-phone-alt"></i>
                        <input type="tel" placeholder="Phone" id="phone_number" name="number" required pattern="^\d{10}$" />
                        <i class="fas fa-lock"></i>
                        <input type="password" placeholder="Password" id="password" autocomplete="current-password" name="password1" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required="">
                                                                    <i class="far fa-eye" id="toggleRegister1" style="margin-left: 253px; margin-top: -30px; cursor: pointer;"></i>                      


                        <i class="fas fa-lock"></i>
                        <input type="password" placeholder="Confirm Password" name="password2" autocomplete="current-password" id="confirm_password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required="">
                        <i class="far fa-eye" id="toggleRegister2" style="margin-left: -30px; cursor: pointer;"></i>                      
                    </div>


                    <button class="buttonForm" ><div>Submit  <i class="fas fa-chevron-right"></i></div></button>

                </form>
            </div>

            <div class="form-container sign-in-container">
                <form action="LoginServlet" method="post">
                    <h1>Sign in</h1>
                    <div class="social-container">
                        <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                        <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
                        <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
                    </div>

                    <span >or use your account</span>
                    <div class="input-icons">
                        <i class="far fa-envelope"></i>
                        <input type="email" placeholder="Email" name="email" required=""/>
                        <i class="fas fa-lock"></i>
                        <input type="password" placeholder="Password" name="password" autocomplete="current-password" required="" id="id_password">
  <i class="far fa-eye" id="toggleLogin" style="margin-left: -30px; cursor: pointer;"></i>
                        
                    </div>

                    <a href="forgotPassword.jsp">Forgot your password?</a>

                    <button style="margin-bottom: 20px" class="buttonForm" value="Login"><div>SIGN IN  <i class="fas fa-chevron-right"></i></div></button>
                            <%
                            String login_msg = (String)request.getAttribute("error");  
                            if(login_msg != null)
                                out.println("<font color = red size = 3px margin-top = 4px>" + login_msg + "</font>");
                            %> 
                            <%
                            String passError = (String)request.getAttribute("password");  
                            if(passError != null)
                                out.println("<font color = red size = 3px margin-top = 4px>" + passError + "</font>");
                            %> 
                </form>


            </div>
            <div class="overlay-container">
                <div class="overlay">
                    <div class="overlay-panel overlay-left">
                        <h1>Welcome Back!</h1>
                        <p>To keep connected with us please login with your personal info</p>
                        <button class="ghost buttonForm" id="signIn">Sign In <i class="fas fa-chevron-right"></i></button>
                    </div>
                    <div class="overlay-panel overlay-right">
                        <h1>Hello, Rider!</h1>
                        <p>Enter your personal details and start journey with us</p>
                        <button class="ghost buttonForm" id="signUp">Sign Up <i class="fas fa-chevron-right"></i></button>
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
        <!--  <button id="buttonAnimation" class="buttonAnimation ready" onclick="clickButton();">
        
                                <div class="message submitMessage">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 13 12.2">
                                    <polyline stroke="currentColor" points="2,7.1 6.5,11.1 11,7.1 "/>
                                    <line stroke="currentColor" x1="6.5" y1="1.2" x2="6.5" y2="10.3"/>
                                    </svg> <span class="button-text">Submit</span>
                                </div>
        
                                <div class="message loadingMessage">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 19 17">
                                    <circle class="loadingCircle" cx="2.2" cy="10" r="1.6"/>
                                    <circle class="loadingCircle" cx="9.5" cy="10" r="1.6"/>
                                    <circle class="loadingCircle" cx="16.8" cy="10" r="1.6"/>
                                    </svg>
                                </div>
        
                                <div class="message successMessage">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 13 11">
                                    <polyline stroke="currentColor" points="1.4,5.8 5.1,9.5 11.6,2.1 "/>
                                    </svg> <span class="button-text">Success</span>
                                </div>
                            </button>
        
                            <canvas id="canvas"></canvas>
        -->
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
        <script  src="./js/submitButton.js"></script>
        <script>
              const toggleLogin = document.querySelector('#toggleLogin');
              const passwordLogin = document.querySelector('#id_password');
              
              const toggleRegister1 = document.querySelector('#toggleRegister1');
              const passwordConfirm1 = document.querySelector('#password');
              
              const toggleRegister2 = document.querySelector('#toggleRegister2');
              const passwordConfirm2 = document.querySelector('#confirm_password');
              
                          var password = document.getElementById("password"), 
                    confirm_password = document.getElementById("confirm_password");
 
  toggleLogin.addEventListener('click', function (e) {
    // toggle the type attribute
    const type1 = passwordLogin.getAttribute('type') === 'password' ? 'text' : 'password';
    passwordLogin.setAttribute('type', type1);
    // toggle the eye slash icon
    this.classList.toggle('fa-eye-slash');
});

  toggleRegister1.addEventListener('click', function (e) {
    // toggle the type attribute
    const type2 = passwordConfirm1.getAttribute('type') === 'password' ? 'text' : 'password';
    passwordConfirm1.setAttribute('type', type2);
    // toggle the eye slash icon
    this.classList.toggle('fa-eye-slash');
});

  toggleRegister2.addEventListener('click', function (e) {
    // toggle the type attribute
    const type3 = passwordConfirm2.getAttribute('type') === 'password' ? 'text' : 'password';
    passwordConfirm2.setAttribute('type', type3);
    // toggle the eye slash icon
    this.classList.toggle('fa-eye-slash');
});



            function validatePassword() {
                if (password.value == confirm_password.value) {
                    confirm_password.setCustomValidity('');
                } else {
                    confirm_password.setCustomValidity("Passwords Don't Match");
                }
            }

            password.onchange = validatePassword;
            confirm_password.onkeyup = validatePassword;

            const phoneInputField = document.querySelector("#phone_number");
            const phoneInput = window.intlTelInput(phoneInputField, {
                utilsScript:
                        "https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/utils.js",
            });

            const info = document.querySelector(".alert-info");
            const error = document.querySelector(".alert-error");

            function process(event) {
                event.preventDefault();

                const phoneNumber = phoneInput.getNumber();

                info.style.display = "";
                info.innerHTML = `Phone number in E.164 format: <strong>${phoneNumber}</strong>`;
            }
        </script>

    </body>
</html>

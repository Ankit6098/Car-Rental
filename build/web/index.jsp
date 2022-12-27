<%-- 
    Document   : intro
    Created on : 10 Aug, 2021, 8:03:14 PM
    Author     : Sanam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Intro Page</title>
        <link href="css/intro.css" rel="stylesheet" type="text/css"/>
        <link href="css/glass.css" rel="stylesheet" type="text/css"/>
        <link href="css/icons.css" rel="stylesheet" type="text/css"/>
        <link href="css/loader.css" rel="stylesheet" type="text/css"/>
        <link href="css/scrolldown.css" rel="stylesheet" type="text/css"/>
        <link href="css/navigationBarIntro.css" rel="stylesheet" type="text/css"/>
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css'>

        <link
            href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap"
            rel="stylesheet"
            />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">

        <link href="https://fonts.googleapis.com/css2?family=WindSong&display=swap" rel="stylesheet">   
    </head>
    <body>



        <div class="container">

            <section class="background">
                <div class="content-wrapper">
                    <p style="font-weight: 600; font-size: 10vh" class="content-title">The Best Solution for Vehicles</p>
                    <p class="content-subtitle">Scroll down for more</p>
                </div>
                <center>
                    <div class="box">
                        <span></span>
                        <span></span>
                        <span></span>
                    </div>
                </center>

            </section>
            <section class="background">
                <div class="content-wrapper">
                    <p style="font-weight: 600; font-size: 10vh" class="content-title">Get lowest rentals never seen before </p>
                    <p class="content-subtitle">Wheels that you want. Enjoy your holidays with our wheels</p>
                </div>
            </section>
            <section  class="background">
                <div class="content-wrapper">
                    <p style="font-weight: 600; font-size: 10vh" class="content-title">hire the best car with the best price </p>
                    <p class="content-subtitle">local best and personalized service. let’s hire your ride</p>
                </div>
            </section>




            <section style="margin-top: -3rem;"  class="background body">

                <img style="height: 70px; width: 175px; margin-top: 2rem; margin-left: 4rem" src="img/logo2.png" alt="alt"/>

                <center style="margin-top: 15rem;">
                    <button style="text-transform: none; font-family: Poppins; z-index: 5; " class="custom-btn btn-7"><span>Get Started  <i class="fas fa-chevron-right"></i></span></button>
         
                    <div style="z-index: 1" class="overlay__inner">
                        <!-- Title -->
                        <h1 style="z-index: 1" class="overlay__title">
                            Hey, would you like to Rent a Car
                            <span style="z-index: 1" class="text-gradient">Feel Free</span> to Sign In/Up,  <span style="z-index: 1" class="text-gradient">Thanks!</span>
                        </h1>
                        <!-- Description -->
                        <p style="z-index: 1" class="overlay__description">
                            Book Online Today With the World's Biggest Online Car Rental Service. We Speak Your Language. Unbeatable Prices. No Credit Card Fees. Types: Economy, Mini, Compact, People carrier, Intermediate, Premium, 4x4, Estate, SUV, Convertible.
                            <strong>We're gonna talk accessibility, too.</strong>
                        </p>
                        <!-- Buttons -->
                    </div>

                    <div style="z-index: 1" class="overlay__btns">
                        <button onClick="location.href = 'loginnew.jsp'" style="z-index: 1" type="button" class="overlay__btn overlay__btn--colors">
                            <span>Login or SignUp</span>

                            <span class="overlay__btn-emoji">🎨</span>

                        </button>
                    </div>
                </center>
                <!-- Canvas -->
                <canvas style="z-index: 1" class="orb-canvas"></canvas>
                <!-- Overlay -->
                <section style="z-index: 1; margin-top: 7rem; height: 200px" class="overlayBg"> 
                    <center style="margin:20px">
                        ©Proudly Developed By

                        <div style="z-index: 1" class="proudly">
                            <div>Ankit Vishwakarma, Manish Sable & Sanambir Singh</div>

                            <section id="lab_social_icon_footer">
                                <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">


                                <i id="social-fb" class="fa fa-facebook-square fa-3x social"></i>	 
                                <i id="social-tw" class="fa fa-twitter-square fa-3x social"></i>
                                <i id="social-fb" class="fa fa-facebook-square fa-3x social"></i>

                            </section>

                        </div>




                    </center>
                </section>


            </section>

        </div>  
        <script src='https://cdnjs.cloudflare.com/ajax/libs/lodash.js/3.10.1/lodash.min.js'></script>
        <script src='https://code.jquery.com/jquery-2.1.4.min.js'></script>
        <script  src="./js/script.js"></script>
        <script type="module" src="./js/glass.js"></script>
    </body>
</html>

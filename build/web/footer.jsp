<%-- 
    Document   : footer
    Created on : Sep 29, 2021, 4:56:32 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            <%@include file="CSS\footer.css" %>
        </style>
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    </head>
    <body>
        <button onclick="topFunction()" id="myBtn" title="Go to top"><i class="fas fa-arrow-up"></i></i></button>
        <div id="footer">

            <div class ="info">
                <ul>
                    <li>© 2021 belong to FPT University HCM</li>
                    <li>Address : FPT UNIVERSITY, Block E2a-7, D1, High-Tech,  Thu Duc City</li>
                    <li>(028) 7300 5588. daihoc.hcm@fpt.edu.vn</li>
                </ul>
                <p class ="contact">Contact us: </p>
                <div class="socialList">

                    <a href="https://www.facebook.com/FPTU.HCM" ><i class="fab fa-facebook"></i></a>
                    <a href="https://www.instagram.com/fpt_university/" ><i class="fab fa-instagram"></i></a>
                    <a href="https://twitter.com/fptu_hcm" ><i class="fab fa-twitter"></i></a>
                    <a href="https://www.youtube.com/channel/UCfNrlxNgcTZDJ3jZeSSSJxg" ><i class="fab fa-youtube"></i></a>
                </div>
            </div>

        </div>

        <script>
//Get the button
            var mybutton = document.getElementById("myBtn");

// When the user scrolls down 200px from the top of the document, show the button
            window.onscroll = function () {
                scrollFunction()
            };

            function scrollFunction() {
                if (document.body.scrollTop > 200 || document.documentElement.scrollTop > 200) {
                //    mybutton.style.display = "block";
                    mybutton.style.opacity = "1";
                    mybutton.style.visibility = "visible";
                } else {
               //     mybutton.style.display = "none";
                    mybutton.style.opacity = "0";
                }
            }

// When the user clicks on the button, scroll to the top of the document
            function topFunction() {
                document.body.scrollTop = 0;
                document.documentElement.scrollTop = 0;
            }
        </script>
    </body>

</html>

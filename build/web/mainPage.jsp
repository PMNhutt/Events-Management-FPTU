<%-- 
    Document   : mainPage
    Created on : Sep 19, 2021, 3:57:56 PM
    Author     : WilliamTrung
--%>


<!DOCTYPE html>
<html lang="en">
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title>Main Page</title>
        <%
            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);
        %>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Comfortaa:wght@300&display=swap" rel="stylesheet">

        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
        <style>
            <%@include file="CSS\mainPage.css" %>

        </style>
    </head>
    <body>
        
        <%@include file="header.jsp" %>



        <div id="slider">
            <div class="slider-content">
                <h3 class="sliderText">FPT Events</h3>
                <p>Life is an Event. Make it Memorable.</p>
                <a  href="#${view_event}" class="slider-btn">Follow Now</a>
            </div>
        </div>
        <div id = "content">


            <%
                if (session.getAttribute("CURRENT_USER") == null) {
                    response.sendRedirect("login.jsp");
                }

            %>
           
            


            <div class="showvent">
                <%-- <a href="viewEvent.jsp"><button class="btnShow"><span>More </span></button></a>--%>
                <%--@include file="viewEvent.jsp" --%>
                <%@include file="mainPageEventPost.jsp" %>

            </div>

        </div>

        <%@include file="footer.jsp" %>


        
    </body>
</html>

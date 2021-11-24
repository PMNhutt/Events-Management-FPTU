<%-- 
    Document   : header
    Created on : Sep 19, 2021, 4:00:06 PM
    Author     : WilliamTrung
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Header</title>    
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Comfortaa:wght@300&display=swap" rel="stylesheet">
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
        <style>
            <%@include file="CSS\header.css" %>
        </style>
    </head>
    <body>
        <c:url var="view_event" value="MainController">
            <c:param name="view_mode" value="normal"></c:param>   
            <c:param name="index" value="1"></c:param>   
            <c:param name="search" value=""></c:param>  
            <c:param name="action" value="LoadEvents"></c:param>           
        </c:url>
        <c:url var="view_mainpage" value="MainController">
            <c:param name="action" value="LoadMainPage"></c:param>           
        </c:url>
        <c:url var="view_location" value="MainController"> 
            <c:param name="search" value=""></c:param>    
            <c:param name="action" value="LoadLocations"></c:param>            
        </c:url>
        <c:url var="view_followed_event" value="MainController">
            <c:param name="view_mode" value="followed"></c:param>   
            <c:param name="index" value="1"></c:param>   
            <c:param name="search" value=""></c:param>  
            <c:param name="action" value="LoadFollowedEvents"></c:param>           
        </c:url>
        <c:url var="view_event_edit" value="MainController">
            <c:param name="index" value="1"></c:param>   
            <c:param name="search" value=""></c:param>  
            <c:param name="action" value="LoadEventsEditing"></c:param>           
        </c:url>
        <c:url var="view_user" value="MainController">
            <c:param name="search" value=""></c:param>    
            <c:param name="action" value="LoadUsers"></c:param>           
        </c:url>   
        <c:url var="view_post" value="MainController">
            <c:param name="index" value="1"></c:param>   
            <c:param name="search" value=""></c:param>  
            <c:param name="action" value="LoadPosts"></c:param>      
        </c:url>
         <c:url var="view_post_edit" value="MainController">
            <c:param name="index" value="1"></c:param>   
            <c:param name="search" value=""></c:param>  
            <c:param name="action" value="LoadPostsEditing"></c:param>           
        </c:url>
        <c:url var="logoutLink" value="MainController">
            <c:param name="action" value="Logout"/>
        </c:url>

        <div id="header">
            <ul class="nav">
                <c:if test="${not empty sessionScope.CURRENT_USER}">

                    <c:if test="${sessionScope.MODE ne 'ADMIN_MODE'}">
                        <li class="lm"> <a  class="l" href="${view_mainpage}"></i>Main Page</a> </li>
                        <li class="lm"> <a class="l" href="about.jsp"></i>About</a> </li>
                        <li class="lm"> <a class="l" href="${view_event}">Events</a>   </li>
                        <li class="lm"><a class="l"  href="${view_followed_event}">Following Events</a> </li>
                        <li class="lm"> <a class="l" href="${view_post}">Posts</a>   </li>
                        </c:if>

                    <li class="lm">
                        <c:if test="${sessionScope.MODE eq 'USER_MODE'}">
                            <a class="l" href="${view_user}">Switch to Admin mode</a>
                        </c:if>
                    </li>
                    <li class="lm">
                        <c:if test="${sessionScope.CURRENT_USER.role eq 'Event Manager'}">
                        <li class="lm"><a  class="l" href="createEvent.jsp">Create Event</a></li> 
                        <li class="lm"><a class="l" href="${view_event_edit}">Edit Event</a></li> 
                        </c:if>
                    </li>
                    <li class="lm">
                        <c:if test="${sessionScope.CURRENT_USER.role eq 'Mentor/Lecturer'}">
                            <li class="lm"><a class="l" href="createPost.jsp">Create Post</a></li> 
                            <li class="lm"><a class="l" href="${view_post_edit}">Edit Post</a></li> 
                        </c:if>
                    </li>
                    <li class="lm">
                        <c:if test="${sessionScope.MODE eq 'ADMIN_MODE'}">
                        <li class="lm"><a class="l" href="${view_event}">Switch to User mode</a></li> 
                        <li class="lm"><a class="l" href="${view_user}">User Management</a></li>
                        <li class="lm"><a class="l" href="${view_location}">Location Management</a></li>
                        </c:if>

                    <li class="last">
                        <div class="profile" >
                            <img  src="${sessionScope.CURRENT_USER.picture}">
                        </div>
                        <div id="menu" >
                            <p style="font-size: 14px;" >${sessionScope.CURRENT_USER.username}</p>
                            <ul>
                                <li class="last"> <a  href="viewSelf.jsp"><i class="fas fa-user"></i>Profile</a></li>
                                <!--                                <li class="last"> <a  href="#"><i class="fas fa-cog"></i>Settings</a></li>-->
                                <li class="last"> <a  href="${logoutLink}" class="button-logout"><i class="fas fa-sign-out-alt"></i>Logout</a></li>
                            </ul>                          
                        </div>                                           
                    </li>
                </c:if>
            </ul>

            <a data-tooltip="Go to main page" href="${view_mainpage}"><img  id="imgLogo" src ="img\Logo-FU-03.png"   alt="Go to main page"></a>

        </div>
        <script>

//
            /*
             function myFunction() {
             
             element.classList.toggle("active");
             
             }
             */

            //      document.querySelector(".profile").addEventListener('click', function (e) {
            //          var elems = document.querySelector("#menu.active");

            //            if (elems === null) {
            //            element.classList.add("active");
            //            }
            /*
             else{
             element.classList.remove("active");
             }
             */
            //           if (this.getAttribute("class") === "active"){
            //              this.setAttribute("class", "");
            //          }




            const element = document.getElementById("menu");

            document.querySelector(".profile").onclick = function () {
                var elems = document.querySelector("#menu.active");
                if (elems !== null) {
                    element.classList.remove("active");
                } else {
                    element.classList.add("active");
                }
            };



//close user dropdown menu when click outside


            window.addEventListener('mouseup', function (event) {

                var elems = document.querySelector("#menu.active");
                if (elems !== null) {
                    elems.classList.remove("active");
                }


            });

            /*
             document.addEventListener('click', function (e) {
             const clicked = e.target.closest("#menu");
             if (!clicked) {
             let ele = document.querySelector("#menu");
             ele.classList.remove("active");
             }
             });
             */


        </script>

    </body>
</html>

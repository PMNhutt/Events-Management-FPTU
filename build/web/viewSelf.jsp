<%-- 
    Document   : viewSelf
    Created on : Sep 25, 2021, 5:47:58 PM
    Author     : WilliamTrung
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Your information</title>
    </head>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Comfortaa:wght@300&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="font\themify-icons\themify-icons.css"/>
    <style>
        <%@include file="CSS\viewSeft.css" %>
    </style>
    <body>
        <%@include file="header.jsp" %>
        <%
            if (session.getAttribute("CURRENT_USER") == null) {
                response.sendRedirect("login.jsp");
            }
        %>
        <div class="content">
            <div class="wrapper">
                <div class="cover">
                    <img class="profileImg" src="${sessionScope.CURRENT_USER.picture}">
                </div>

                </br>


                <div class="user-name">
                    <form action="MainController">
                        <input id="textBruh"  class="text-basic" type="text" name="username" value="${sessionScope.CURRENT_USER.username}" readonly=""/>
                        <i id="pencil" class ="ti-pencil" title="Edit Name"></i>
                        <input type="hidden" name="action" value="UpdateUserName"/>
                    </form>
                </div>

                <div class="infoo">
                    <p title="Email" class="p-email"><i class ="ti-email"></i>Email: ${sessionScope.CURRENT_USER.email}</p>

                    </br> 

                    <p title="Role" class="p-role"><i class ="ti-user"></i>${sessionScope.CURRENT_USER.role}</p>

                    </br>
                </div>

            </div>

        </div>
        <%@include file="footer.jsp" %>
        <script>
            document.getElementById("pencil").onclick = function () {
                document.getElementById('textBruh').removeAttribute('readonly');
                document.getElementById('textBruh').classList.add("textactive");
            };
        </script>
    </body>
</html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title>Login</title>
        <link rel="stylesheet" href="font\themify-icons\themify-icons.css"/>
        
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Comfortaa:wght@300&display=swap" rel="stylesheet">
        <style>
            <%@include file="CSS/cssLogin.css" %>
        </style>
    </head>
    <body>
        <div id="loginSlider"></div>
              
        <div class="login-box">
            <h1 >Welcome to FPT Event</h1>
                
                <a href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8084/EventManagementFPT/login-google&response_type=code
                   &client_id=785766825994-im7r6h7c7j5cisi2n5kv4rvacscrg5a8.apps.googleusercontent.com&approval_prompt=force" class="button">
                    <img id="imggg" src="img\google.png" alt="" >Login with mail @fpt.edu.vn</a>	

            </br>
            ${requestScope.LOGIN_ERROR}
            </br>
            ${requestScope.SYSTEM_ERROR}
        </div>
        
        <div id ="footer">
            <div class ="info">
                <ul>
                    <li>FPT University HCM Campus</li>
                    <li>Contact: it.hcm@fpt.edu.vn</li>
                    <li>IT Support: 0914 291 596</li>
                </ul>
            </div>
        </div>

    </body>
</html>
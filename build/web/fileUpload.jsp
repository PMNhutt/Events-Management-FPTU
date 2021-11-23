<%-- 
    Document   : fileUpload
    Created on : Oct 5, 2021, 2:03:34 PM
    Author     : WilliamTrung
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://fonts.googleapis.com/css2?family=Comfortaa:wght@300&display=swap" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            body{
                overflow: hidden;
            }

            html{
                background-image: linear-gradient(to top, #f3e7e9 0%, #e3eeff 99%, #e3eeff 100%);
                font-family: 'Comfortaa', cursive;
            }
            .content{
                line-height: 34px;             
                width: 100%;
                height: 100vh;
                position: relative;
                display: flex;
                align-items: center;
                justify-content: center;
            }
            
            h1{
                text-align: center;
            }

            .btn:hover {opacity: 0.6}
        </style> 
        <title>Upload Picture</title>
    </head>
    <body>


        <div class="content">
            <div>
                <h1>Choose Picture To Upload</h1>
                 </br>
                <c:if test="${not empty requestScope.id}">
                    <img src="./images/${id}.png" onerror="this.src='./images/default.png'" width="600" height="450" />
                </c:if>  

                <form action="UploadController" method="POST" enctype = "multipart/form-data">
                    <c:if test="${not empty requestScope.id}">
                        <input type="hidden" name="id" value="${requestScope.id}"/>
                    </c:if>         
                    <input type="file" name="file" size="50" accept="image/*"/>
                    <input type="hidden" name="path" value="../images/"/>
                    </br>
                    <button type="submit" name="action" value="Upload File">Upload File</button>
                </form> 
                <p>${requestScope.ERROR_MESSAGE}</p>
                <c:if test="${sessionScope.CURRENT_USER.role eq 'Event Manager'}">
                    <button><a style="text-decoration: none" href="ViewOwnedEventController">Cancel</a></button>
                </c:if>
                <c:if test="${sessionScope.CURRENT_USER.role eq 'Mentor/Lecturer'}">
                    <button><a style="text-decoration: none" href="ViewOwnedPostController">Cancel</a></button>
                </c:if>
            </div>

        </div>

    </body>
</html>

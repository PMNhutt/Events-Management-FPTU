<%-- 
    Document   : createPost
    Created on : Oct 28, 2021, 4:01:11 PM
    Author     : SE151264
--%>

<%@page import="DAO.PostDAO"%>
<%@page import="DTO.PostDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            .create-post{
                line-height: 34px;             
                width: 100%;
                height: 87vh;
                position: relative;
                display: flex;
                align-items: center;
                justify-content: center;

            }
            body{
                background-image: url('img/filter-bg.png');
            }
            .btn{
                cursor: pointer;
                background-color: #7f8c8d;
                padding: 4px;
                font-weight: 600;
                color: #ecf0f1;
                margin-left: 5px;
            }

            .btn:hover {opacity: 0.6}
            .warning{
                background: #eb4d4b;
                max-width: fit-content;
                /*   padding: 2px; */
                color: #fff;
                font-size: 13px;
                border-radius: 5px;
                /*  transform: translateX(-1110%); */
                transition: transform 500ms ease;
            }

            .warning-active{

                transform: translateX(0);
            }

            .title{
                width: 91%;
                height: 24px;
            }
        </style>
        <script src="https://cdn.tiny.cloud/1/pyapdqq1dyb1bd234vpnlt6ssc4x4i0ii786ea6y1tz9wypw/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
        <script>tinymce.init({selector: 'textarea'});</script>
        <title>Create Post</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <form id="fr" class="create-post" action="MainController" method="GET">
            <section >
                Title: <input class="title" type="text" name="title" value="${title}"/> <p class="warning">${requestScope.ERROR_TITLE}</p>
                Content: <textarea class="textarea"  name="content" cols="50" rows="20" form="fr"></textarea><p class="warning">${requestScope.ERROR_DESCRIPTION}</p></br>

                <input class="btn" type="reset" value="Reset"/>
                <input class="btn" type="submit" name="action" value="Create Post"/>
            </section>         

        </form>
        <%@include file="footer.jsp" %> 
    </body>
</html>

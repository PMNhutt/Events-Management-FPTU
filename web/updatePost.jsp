<%-- 
    Document   : updatePost
    Created on : Nov 23, 2021, 2:42:38 PM
    Author     : SE151264
--%>

<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Post</title>
        <script src="https://cdn.tiny.cloud/1/pyapdqq1dyb1bd234vpnlt6ssc4x4i0ii786ea6y1tz9wypw/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
        <script>tinymce.init({selector: 'textarea'});</script>
        <style>
            .create-post{          
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
            .btn,.btn a{
                cursor: pointer;
                background-color: #7f8c8d;
                padding: 4px;
                font-weight: 600;
                color: #ecf0f1;
                margin-left: 5px;
                text-decoration: none;
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
            section{
                margin-top: 4%;
            }
        </style>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="">
            <c:url var="back" value="ViewOwnedPostController">    
                <c:param name="index" value="${requestScope.index}"></c:param>           
            </c:url>
            <c:if test="${sessionScope.SELECTED_POST!=null}">
                <button><a href="${back}">Back</a></button>

                <form id="fr"  class="create-post" action="MainController" method="POST">
                    <input type="hidden" name="postId" value="${sessionScope.SELECTED_POST.postId}"/>
                    <section>
                        Title: <input class="title" type="text" name="title" placeholder="${sessionScope.SELECTED_POST.title}" value="${sessionScope.SELECTED_POST.title}"/><p class="warning">${requestScope.ERROR_TITLE}</p></br>              
<!--                        <input type="text" name="content" value="${sessionScope.SELECTED_POST.content}"/> <p>${requestScope.ERROR_DESCRIPTION}</p></br>   -->
                        Content <textarea class="textarea"  name="content" cols="50" rows="30" form="fr" value="${sessionScope.SELECTED_POST.content}"></textarea><p class="warning">${requestScope.ERROR_DESCRIPTION}</p></br>   
                        <input class="btn" type="reset" value="Reset"/>
                        <input class="btn" type="submit" name="action" value="Update Post"/>
                        <input class="btn" type="submit" name="action" value="Remove Post"/>     
                        <button class="btn">
                            <a  href="${back}">Back</a>
                        </button>
                    </section>         

                </c:if>

        </div>
        <%@include file="footer.jsp" %> 
    </body>
</html>

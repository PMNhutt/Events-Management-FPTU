<%-- 
    Document   : viewPost
    Created on : Oct 11, 2021, 2:51:09 PM
    Author     : SE151264
--%>
<%@page import="DTO.PostDTO"%>
<%@page import="java.util.List"%>
<%@page import="Extension.AI"%>
<%@page import="Extension.AppDirectory"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            <%@include file="CSS\mainPage.css" %>

        </style>

        <title>Post in FPT University</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div id="content" style="background-image: url('img/filter-bg.png');">

            <h1 class = "contentH1" style="margin: 80px 0">Related Posts</h1>
            <p style="text-align: center;">${requestScope.POSTMESSAGE}</p>

            <div class="member-list">
                <c:if test="${not empty requestScope.LIST_POST}">
                    <c:forEach var="post" varStatus="counter" items="${requestScope.LIST_POST}">
                        <div class="member-item" style=" margin-bottom: 90px">
                            <div class="card">


                                <!-- -->
                                <div class="img-div"><img src="./images/${post.postId}.png" onerror="this.src='./images/default.png'" width="100" height="120" /></div>

                                <div class="member-content" style="bottom: 190px; padding-bottom: 35px;">
                                    <h3 class="member-title">
                                        <a  href="ViewPostDetailsController?postId=${post.postId}&index=${index}&search=${requestScope.Search}">${post.title}</a>
                                    </h3>
                                    <p title="Author" style="padding: 7px 0;"><i  title="Author" class="fas fa-user-tie"></i> ${post.user.username}</p>
                                    <%--      <a class="member-btn" href="ViewPostDetailsController?postId=${post.postId}&index=${index}&search=${requestScope.Search}">View Post</a> --%>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>  
            </c:if>
<%--
            <div class="switchpage">

                <c:forEach begin="1" end="${sessionScope.endPagePost}" var="i">
                    <a class="page-btn" href="ViewPostController?index=${i}&search=${Search}">${i}</a>
                </c:forEach>
            </div>
--%>

            <div class="test-paging">

                <div class="pagination">
                    
                        <ul><!--pages or li are comes from javascript -->  </ul>                       
                            
                    
                </div>

            </div>

        </div>        
        <%@include file="footer.jsp" %>
        <script>
            <%@include file="JS\paging.js" %>
        </script>
    </body>
</html>

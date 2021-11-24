<%-- 
    Document   : ViewOwnPost
    Created on : Nov 23, 2021, 3:10:17 PM
    Author     : SE151264
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Your Own Posts</title>
        <style>
            <%@include file="CSS\mainPage.css" %>

        </style>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div id="content" style="background-image: url('img/filter-bg.png');">
            <h1 class = "contentH1" style="margin-top: 80px; margin-bottom: 40px;">Edit Your Posts</h1>
<!--            <h2>${counter.count}</h2>-->
            <p style="text-align: center;">${requestScope.POST_MESSAGE}</p>
            <div class="member-list">
                <c:if test="${not empty requestScope.LIST_POST}">
                    <c:forEach var="post" varStatus="counter" items="${requestScope.LIST_POST}">
                        <div class="member-item" style=" margin-bottom: 90px">
                            <div class="card">
                                
                                <div class="img-div"><img src="./images/${post.postId}.png" onerror="this.src='./images/default.png'" width="100" height="120" /></div>
                                <div class="member-content" style="bottom: 190px; padding-bottom: 35px;">
                                    <h3 class="member-title">
                                        <a href="UpdatePostViewController?postId=${post.postId}&index=${index}">${post.title}</a>
                                    </h3>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:if>
<!--            <div class="switchpage">
                <c:forEach begin="1" end="${sessionScope.endPage}" var="i">
                    <a href="ViewOwnedPostController?index=${i}&search=${Search}">${i}</a>
                </c:forEach>
            </div>-->
            <div class="test-paging">

                <div class="pagination">
                    <ul><!--pages or li are comes from javascript -->  </ul>                                                                 
                </div>
            </div>
            
        </div>
        <%@include file="footer.jsp" %> 
        <script>
            <%@include file="JS\pagingOwnPost.js" %>
        </script>
    </body>
</html>

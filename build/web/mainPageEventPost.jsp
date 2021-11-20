<%-- 
    Document   : mainPageEventPost
    Created on : Oct 26, 2021, 11:45:11 PM
    Author     : WilliamTrung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MainPage</title>
    </head>
    <body>
        <!-- POST HERE -->
        <div>

            <h1 class = "contentH1-1" style="margin-bottom: 68px;">Related Posts</h1>
            <p style="text-align: center;">${requestScope.POSTMESSAGE}</p>

            <div class="member-list-post">
                <c:if test="${not empty requestScope.LIST_POST}">
                    <c:forEach var="post" varStatus="counter" items="${requestScope.LIST_POST}">
                        <div class="member-item-post" style=" margin-bottom: 90px">
                            <div class="card">
                                <!-- -->
                                <div class="img-div"><img src="./images/${post.postId}.png" onerror="this.src='./images/default.png'" width="100" height="120" /></div>

                                <div class="member-content" style="bottom: 190px; padding-bottom: 35px;">
                                    <h3 class="member-title-post" style="margin-bottom: 12%;">
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
        <div style="text-align: center; margin-bottom: 13px;">
            <a class="member-btn" href="ViewPostController?index=1">View More</a>
        </div>


    </div>

<!-- EVENT HERE -->
<div class="showEvent">
    <h1 id="${view_event}" class = "contentH1-Event" style="margin-bottom: 25px">Events</h1>

        <div class="member-list">


            <c:if test="${not empty requestScope.LIST_EVENT}">

                <c:forEach var="event" varStatus="counter" items="${requestScope.LIST_EVENT}">
                    <div class="member-item-event">
                        <div class="card">


                            <!-- -->
                            <div class="img-div"><img src="./images/${event.eventId}.png" onerror="this.src='./images/default.png'" width="100" height="120" /></div>

                            <div class="member-content">
                                <h3 class="member-title">
                                    <a  href="ViewEventDetailsController?eventId=${event.eventId}&index=${index}">${event.title}</a>

                                </h3>
                                <div class="member-foot">
                                    <p class="member-foot-status">${event.status}</p>
                                    <p><i class="far fa-calendar"></i> ${event.startDatetime}</p>
                                    <p><i class="far fa-clock"></i> ${event.startSlot.getStart()} - ${event.endSlot.getEnd()}</p>
                                </div>

                                <%--      <p>End: ${event.endSlot.getEnd()}</p> --%>
                                <%--       <a class="member-btn"  href="ViewEventDetailsController?eventId=${event.eventId}&index=${index}">Show More</a> --%>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:if>

    <div style="text-align: center; margin-bottom: 13px; padding-top: 50px">
        <a class="member-btn" href="ViewEventController?index=1">View More</a>
    </div>

</div>

</body>
</html>

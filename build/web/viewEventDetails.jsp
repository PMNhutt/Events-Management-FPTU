<%-- 
    Document   : viewEventDetails
    Created on : Oct 7, 2021, 2:52:43 PM
    Author     : SE151264
--%>

<%@page import="Extension.AI"%>
<%@page import="java.util.List"%>
<%@page import="DTO.EventDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            <%@include file="CSS\eventDetail.css" %>
        </style>

        <title>Event Details</title>
    </head>
    <body>
        <c:url var="back" value="ViewEventController">
            <c:param name="search" value="${requestScope.search}"></c:param>    
            <c:param name="index" value="${requestScope.index}"></c:param>           
        </c:url>

        <%@include file="header.jsp" %>

        <div class="content">
            <div class="content-member">

                <div class="member-1">


                    <c:if test="${SELECTED_EVENT!=null}">
                        <h2>${SELECTED_EVENT.title}</h2>
                        <p class="create-date">Created date: ${SELECTED_EVENT.createDatetime}</p>
                        <p class="">Description: ${SELECTED_EVENT.description}</p>
                        <%--     <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p> --%>
                        <img src="./images/${SELECTED_EVENT.eventId}.png" onerror="this.src='./images/default.png'" width="100" height="120" />
                        <%--   <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>--%>
                        <div class="content-bot">
                            <%--             <p>-Status: ${SELECTED_EVENT.status}</p> --%>


                            <p>   
                                <%
                                    //test iframe
                                    String description = "https://www.youtube.com/watch?v=b4fWaAibbIw  https://www.youtube.com/watch?v=-u875aiTbI0 ";
                                    List<String> list = AI.detectEmbededLinks(description);
                                    request.setAttribute("DESCRIPTION", list);
                                    //end test
%>
                                


                                <c:forEach var="desc" varStatus="counter" items="${DESCRIPTION}">
                                    <c:if test="${counter.count % 2 != 0}">
                                        ${desc}
                                    </c:if>
                                    <c:if test="${counter.count % 2 == 0}">
                                        <iframe width="560" height="315" src="${desc}" frameborder="0" allowfullscreen></iframe>
                                        </c:if>
                                    </c:forEach>
                            </p>
                            <p class="body-1-p" style="text-align: right; font-style: italic"> ${SELECTED_EVENT.user.username}</p>
                            <%--      <p><i class ="ti-calendar"></i> ${SELECTED_EVENT.startDatetime}</p> --%>

                        </div>
                    </div>
                    <div class="member-2">
                        <div class="member-2-body-1">
                            <p class="body-1-p"><i class="fas fa-clock"></i> Start Date: ${SELECTED_EVENT.startDatetime} </p>
                            <p class="body-1-p" > (${SELECTED_EVENT.startSlot.startTime} - ${SELECTED_EVENT.endSlot.endTime})</p>
                            <p class="body-1-p" style="margin-right: 6px;"><i class="fas fa-map-marker-alt"></i> FPT University HCM  </p>
                            <p  class="location">${SELECTED_EVENT.location.locationName}</p>
                            <div class="member-2-body-2">
                                <button class="btn" name="follow" title="Follow this event" value="${follow}"><i class="fas fa-heart"></i><a href="FollowEventController">${follow == 1?'Following':'Follow'}</a></button>
                                <button class="btn" name="join" title="Join in this event" value="${join}"><i class="fas fa-sign-in-alt"></i><a href="JoinEventController">${join == 1?'Joined':'Join'}</a></button>
                            </div>

                        </div>
                        <div id ="moreEvent" class="member-2-body-3">
                            <p class="body-3">More events waiting for you</p>
                            <button class="btn" style="margin-top: 12px">
                                <a  href="${back}">Let's Go</a>
                            </button>
                        </div>

                    </div>

                    <div class="comment-section">
                        <h3>Leave comment here</h3>
                        <form action="MainController" method="POST">
                            <input type="text" name="cmt">
                            <input class="addComment" type="submit" name="action" value="AddEventComment"/>
                        </form>

                        <c:if test="${not empty LIST_COMMENT}">
                            <c:forEach var="cmt" varStatus="count" items="${LIST_COMMENT}">

                                ${cmt.user.username}: ${cmt.content}<br>
                            </c:forEach>   
                        </c:if>
                        <c:if test="${sessionScope.END_OF_COMMENT}">
                            <button>
                                <a href="LoadMoreEventCommentController?countListCmt=${LIST_COMMENT.size()}">View more 10 comment</a>
                            </button>
                        </c:if>
                    </div>
                </c:if>

            </div>
        </div>




        <%@include file="footer.jsp" %> 
        <script>
//Get the button
            var ad = document.getElementById("moreEvent");
            var mybutton = document.getElementById("myBtn");

// When the user scrolls down 200px from the top of the document, show the button
            window.onscroll = function () {
                scrollFunction()
            };

            function scrollFunction() {
                if (document.body.scrollTop > 200 || document.documentElement.scrollTop > 200) {
                    //    mybutton.style.display = "block";
                    ad.style.opacity = "1";
                    ad.style.visibility = "visible";
                    ad.style.transform = "translateY(0)";
                    mybutton.style.opacity = "1";
                    mybutton.style.visibility = "visible";
                } else {
                    //     mybutton.style.display = "none";
                    mybutton.style.opacity = "0";
                }
            }

// When the user clicks on the button, scroll to the top of the document
            function topFunction() {
                document.body.scrollTop = 0;
                document.documentElement.scrollTop = 0;
            }
        </script>
    </body>
</html>

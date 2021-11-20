<%-- 
    Document   : viewOwnEvent
    Created on : Oct 7, 2021, 5:48:58 PM
    Author     : WilliamTrung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Your Events Page</title>
        <style>
            <%@include file="CSS\mainPage.css" %>

        </style>
    </head>
    <body>
        <%@include file="header.jsp" %>

        <div id="content" style="background-image: url('img/filter-bg.png');">
            <h1 class = "contentH1" style="margin-top: 80px; margin-bottom: 27px">Edit Your Events</h1>
            <p style="text-align: center;" >${requestScope.EVENT_MESSAGE}</p>
            <div class="member-list">

                <c:if test="${not empty requestScope.LIST_EVENT}">
                    <c:forEach var="event" varStatus="counter" items="${requestScope.LIST_EVENT}">
                        <div class="member-item" style=" margin-bottom: 90px">
                            <div class="card">


                                <!-- -->
                                <div class="img-div"> <img src="./images/${event.eventId}.png" onerror="this.src='./images/default.png'" width="100" height="120" /></div>
                                <div class="member-content">
                                    <h3 class="member-title">
                                        <a href="UpdateEventViewController?eventId=${event.eventId}&index=${index}"> ${event.title}</a>
                                    </h3>

                                    <div class="member-foot">
                                        <p><i class="far fa-calendar"></i> ${event.startDatetime}</p>
                                        <p><i class="far fa-clock"></i>${event.startSlot.getStart()} - ${event.endSlot.getEnd()}</p>
                                    </div>
                                    <%--    
                                           <p>Date: ${event.startDatetime}</p>
                                           <p>Begin: ${event.startSlot.getStart()}</p>
                                           <p>End: ${event.endSlot.getEnd()}</p>

                                   <a class="member-btn" href="UpdateEventViewController?eventId=${event.eventId}&index=${index}">Edit</a> --%>

                                </div>
                            </div>     
                        </div>
                    </c:forEach>
                </div>           
            </c:if>


             <div class="test-paging">

            <div class="pagination">
                <ul><!--pages or li are comes from javascript -->  </ul>                                                                 
            </div>
        </div>
        </div>
        <%@include file="footer.jsp" %>
        <script>
            <%@include file="JS\pagingOwnEvent.js" %>
        </script>
    </body>
</html>

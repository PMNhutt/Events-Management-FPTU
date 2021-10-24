<%-- 
    Document   : updateEvent
    Created on : Oct 8, 2021, 1:49:52 PM
    Author     : WilliamTrung
--%>

<%@page import="java.sql.Date"%>
<%@page import="DTO.EventDTO"%>
<%@page import="DAO.EventDAO"%>
<%@page import="DAO.LocationDAO"%>
<%@page import="DTO.LocationDTO"%>
<%@page import="Extension.Calendar"%>
<%@page import="DAO.SlotDAO"%>
<%@page import="java.util.List"%>
<%@page import="DTO.SlotDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            <%@include file="CSS\createEvent.css" %>
        </style>
        <title>Update Event Page</title>
        <script src="https://cdn.tiny.cloud/1/pyapdqq1dyb1bd234vpnlt6ssc4x4i0ii786ea6y1tz9wypw/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
        <script>tinymce.init({selector: 'textarea'});</script>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <c:url var="back" value="ViewOwnedEventController">
            <c:param name="search" value="${requestScope.search}"></c:param>    
            <c:param name="index" value="${requestScope.index}"></c:param>           
        </c:url>
        <c:url var="Upload picture" value="fileUpload.jsp">
            <c:param name="id" value="${requestScope.SELECTED_EVENT.eventId}"></c:param>
        </c:url>
        <%
            List<LocationDTO> locationList = new LocationDAO().getListLocations("");
            request.setAttribute("LIST_LOCATION", locationList);
            /*
            EventDTO event = new EventDAO().getEventById(0);
            
            if (event != null) {
                request.getSession().setAttribute("SELECTED_EVENT", event);
            }
             */
        %>
        <div class="content">


            <c:if test="${sessionScope.SELECTED_EVENT!=null}">
                <%--      <button><a href="${back}">Back</a></button> --%>

                <form  id="fr" class="form" action="MainController" method="POST">
                    <input type="hidden" name="eventId" value="${sessionScope.SELECTED_EVENT.eventId}"/>
                    <section  class="section1">
                        Title: <input class="textbox" style="margin-left: 60px; padding-right: 29px;" type="text" name="title" placeholder="${sessionScope.SELECTED_EVENT.title}" value="${sessionScope.SELECTED_EVENT.title}"/><p class="warning">${requestScope.ERROR_TITLE}</p></br>

                        Location: <p>${requestScope.ERROR_LOCATION}</p>
                        <input type="hidden" name="locationTemp" value="${location.locationId}"/>
                        <select class="textbox" name="locationId">            
                            <option disabled selected value="${sessionScope.SELECTED_EVENT.location.locationId}">${sessionScope.SELECTED_EVENT.location.locationName}</option>
                            <c:forEach var="location" items="${requestScope.LIST_LOCATION}">
                                <option value="${location.locationId}">
                                    ${location.locationName}
                                </option>
                            </c:forEach>
                        </select>
                        <input class="btn-reset" type="reset" value="Reset"/></br>  
                        Description: <textarea class="textarea"  name="description" cols="50" rows="10" form="fr" value="${sessionScope.SELECTED_EVENT.description}"></textarea> <p class="warning">${requestScope.ERROR_DESCRIPTION}</p>
                        <button class="btn">
                            <a style="text-decoration: none; color: #fff" href="${back}">Back</a>
                        </button> 
                    </section>         
                    <section class="section2">
                        <ul>
                            <li>Choose start slot</li>
                            <li>Choose end slot</li>
                            <li>Start slot and end slot must be on the same day</li>
                        </ul>
                        <p class="warning">${requestScope.ERROR_MESSAGE}</p>
                        <%
                            Integer week = (Integer) request.getAttribute("week");
                            if (week == null) {
                                week = 0;
                            }
                            List<SlotDTO> slotList = new SlotDAO().getListSlots();
                            List<String> temp = new Calendar().getWeek(week);
                            List<String> days = new Calendar().splitDay(temp);

                            List<Date> daysOfWeek = new Calendar().getListDate(week);
                            request.setAttribute("DATES", daysOfWeek);
                            request.setAttribute("LIST_DAY", days);
                            request.setAttribute("LIST_SLOT", slotList);
                            request.setAttribute("week", week);
                        %>

                        <table class="table" border="2">
                            <input type="hidden" name="where" value="updateEvent.jsp"/>
                            <input type="hidden" name="id" value="${SELECTED_EVENT.eventId}"/>
                            <input type="hidden" name="action" value="Change Week"/>
                            <input type="hidden" name="week" value="${requestScope.week}"/>
                            <button class="btn" name="weekChange" value="-">Previous Week</button>
                            <button class="btn" name="weekChange" value="+">Next Week</button>
                            <thead>
                                <tr>
                                    <th>N/A</th>
                                        <c:forEach var="day" items="${requestScope.LIST_DAY}">                    
                                        <th>
                                            ${day}
                                        </th>
                                    </c:forEach>

                                </tr>
                            </thead>
                            <tbody>

                                <c:forEach var="slot" items="${requestScope.LIST_SLOT}" >                       
                                    <tr>

                                        <td>Slot ${slot.slotId}<br>${slot.getStart()}-${slot.getEnd()}</td>


                                        <c:forEach var="date" items="${requestScope.DATES}">  
                                            <td>                                             
                                                <input class="textbox" type="checkbox" name="selectedTime" value="${slot.slotId}-${date}" ${((SELECTED_EVENT.endSlot.slotId == slot.slotId) or (SELECTED_EVENT.startSlot.slotId == slot.slotId)) and (SELECTED_EVENT.startDatetime == date)  ? "checked=''" : "unchecked=''"}/>
                                            </td>
                                        </c:forEach>  

                                    </tr>                

                                </c:forEach>

                            </tbody>
                        </table>
                        <input class="btn" type="submit" name="action" value="Update Event"/>  
                    </section>

                </form>        
            </c:if>

        </div>


        <%@include file="footer.jsp" %> 
    </body>
</html>

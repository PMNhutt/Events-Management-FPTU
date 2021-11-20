<%-- 
    Document   : createEvent
    Created on : Sep 29, 2021, 2:25:02 PM
    Author     : WilliamTrung
--%>

<%@page import="DAO.EventDAO"%>
<%@page import="DAO.SlotDAO"%>
<%@page import="DTO.SlotDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="DTO.LocationDTO"%>
<%@page import="DAO.LocationDAO"%>
<%@page import="java.util.List"%>
<%@page import="Extension.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            <%@include file="CSS\createEvent.css" %>
        </style>

        <title>Create Event</title>
        <script src="https://cdn.tiny.cloud/1/pyapdqq1dyb1bd234vpnlt6ssc4x4i0ii786ea6y1tz9wypw/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
        <script>tinymce.init({selector: 'textarea'});</script>
    </head>
    <body>
        <%
            int id = new EventDAO().getLastId();
            id++;
            request.setAttribute("id", id);
        %>
        <%@include file="header.jsp" %>
        <%
            List<LocationDTO> locationList = new LocationDAO().getListLocations("");
            request.setAttribute("LIST_LOCATION", locationList);
        %>

        <div class="content" style="background-image: url('img/filter-bg.png');">


            <form id="fr" class="form-event" action="MainController" method="GET">
                <section class="section1">
                    <div>
                        Title: <input class="textbox" style="margin-left: 60px; padding-right: 29px;" type="text" name="title"/> <p class="warning">${requestScope.ERROR_TITLE}</p></br>

                        Location: <p>${requestScope.ERROR_LOCATION}</p>
                        <select class="textbox" name="locationId">
                            <c:forEach var="location" items="${requestScope.LIST_LOCATION}">
                                <option value="${location.locationId}">
                                    ${location.locationName}
                                </option>
                            </c:forEach>
                        </select>
                        <input class="btn-reset" type="reset" value="Reset"/></br> 
                        <%--       <input class="textbox-des" type="text" name="description"/>  --%>
                        Description:   <textarea class="textarea"  name="description" cols="50" rows="10" form="fr" ></textarea> <p class="warning">${requestScope.ERROR_DESCRIPTION}</p>
                    </div>


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
                        List<String> daysOfWeek = new Calendar().getWeek(week);
                        request.setAttribute("LIST_DAY", daysOfWeek);
                        request.setAttribute("LIST_SLOT", slotList);
                        request.setAttribute("week", week);
                    %>
                    <table class="table" border="2">
                        <input type="hidden" name="where" value="createEvent.jsp"/>
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
                                        <c:forEach var="day" items="${requestScope.LIST_DAY}"> 
                                        <td>  
                                            <input class="textbox" type="checkbox" name="selectedTime" value="${slot.slotId}-${day}"/>
                                        </td>
                                    </c:forEach>
                                </tr>                
                            </c:forEach>
                        </tbody>
                    </table>

                    <input class="btn" type="submit" name="action" value="Create Event"/>
                </section>

            </form>
        </div>
        <%@include file="footer.jsp" %> 

        <script>
            function myFunction() {
                var myWindow = window.open("fileUpload.jsp?id=”${id},", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,top=500,left=500,width=400,height=400");
            }
        </script>
    </body>
</html>

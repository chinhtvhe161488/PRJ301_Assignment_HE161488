<%-- 
    Document   : takeatt
    Created on : Nov 2, 2022, 3:32:55 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Take Attendance</title>
    </head>
    <body>
        ${requestScope.ses.id}, class: ${requestScope.ses.group.name} 
        <br/>
        Subject: ${requestScope.ses.group.subject.name}
        Room: ${requestScope.ses.room.name}, Time: ${requestScope.ses.date} ${requestScope.ses.timeslot.description}
        <br/>
        Attended: ${requestScope.ses.attandated?"Yes":"No"}
        <form action="takeatt" method="POST">
            <input type="hidden" name="sesid" value="${param.id}"/>
            <table border="1px">
                <tr>
                    <td>Student Id</td>
                    <td>Student Name</td>
                    <td>Present</td>
                    <td>Absent</td>
                    <td>Description</td>
                </tr>
                <c:forEach items="${requestScope.atts}" var="a">
                  <tr>
                    <td>${a.student.id}
                        <input type="hidden" value="${a.student.id}" name="stdid"/>
                    </td>
                    <td>${a.student.name}</td>
                    <td><input type="radio" 
                               <c:if test="${a.present}">
                               checked="checked" 
                               </c:if>
                               name="present${a.student.id}" value="present" /></td>
                    <td><input type="radio"
                               <c:if test="${!a.present}">
                               checked="checked" 
                               </c:if>
                               name="present${a.student.id}" value="absent" /></td>
                    <td><input type="" value="${a.description}" name="description${a.student.id}"></td>
                </tr>  
                </c:forEach>
            </table>
            <input type="submit" value="Save"/>
        </form>
    </body>
</html>


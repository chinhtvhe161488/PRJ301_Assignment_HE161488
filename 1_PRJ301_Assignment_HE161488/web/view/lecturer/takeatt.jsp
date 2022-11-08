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
    <style>
        .header{
            margin: 20px 0 20px;
        }
        .title{
            background-color: #6b90da;
            color: #ffffff;
        }
        .tb tr:nth-child(2n)
        {
            background:#E7F6FD;
        }
    </style>
    <body>
        <div class="header">
            Take Attendance For Group: <u>${requestScope.ses.group.name}</u><br/>
            Subject: ${requestScope.ses.group.subject.name} <br>
            Room: ${requestScope.ses.room.name} <br>
            Time: ${requestScope.ses.date} | ${requestScope.ses.timeslot.description}
            <br/>
            Attended: <span style="color: red;"> ${requestScope.ses.attandated?"Yes":"No"} </span>
        </div>
        <form action="takeatt" method="POST">
            <input type="hidden" name="sesid" value="${param.id}"/>
            <table class="tb" border="1px">
                <tr class="title">
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
            <!--<span class="back"><button><a href="../lecturer/timetable"+}>Back</a></button></span>-->
            <span class="home"><button><a href="../home">Home</a></button></span>
        </form>
    </body>
</html>


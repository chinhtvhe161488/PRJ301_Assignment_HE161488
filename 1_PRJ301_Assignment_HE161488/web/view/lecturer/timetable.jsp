<%-- 
    Document   : timetable
    Created on : Oct 16, 2022, 3:54:03 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="helper" class="util.DateTimeHelper"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Time Table</title>
    </head>
    <style>
        body {
            overflow-x: hidden;
            box-sizing: border-box;
        }
        .header{
            margin: 30px 100px 20px;
        }
        .info{
            padding-left: 100px;
        }
        .home{
            padding-top: 10px;
            text-align: center;
        }
        .title{
            background-color: #6b90da;
            color: #ffffff;
        }
        .tb{
            margin-left: 100px;
        }
        .tb tr:nth-child(2n)
        {
            background:#E7F6FD;
        }
    </style>
    <body>
        <h1 style="text-align: center;">FPT University Academic Portal</h1>
        <div class="info">
            <h2>Activities for <i>${sessionScope.account.displayname}</i></h2>
            <span><b>Note :</b> These activities do not include extra-curriculum activities, such as club activities ...</span> <br>
            <span><b>Chú Thích :</b> Các hoạt động trong bảng dưới không bao gồm hoạt động ngoại khóa, ví dụ như hoạt động câu lạc bộ ...</span><br> <br>
            <span>Các phòng bắt đầu bằng AL thuộc tòa nhà Alpha. VD: AL...</span> <br>
            <span>Các phòng bắt đầu bằng BE thuộc tòa nhà Beta. VD: BE,..</span><br>
            <span>Các phòng bắt đầu bằng G thuộc tòa nhà Gamma. VD: G201,...</span><br>
            <span>Các phòng tập bằng đầu bằng R thuộc khu vực sân tập Vovinam.</span><br>
            <span>Các phòng bắt đầu bằng DE thuộc tòa nhà Delta. VD: DE,..</span><br>
            <span>Little UK (LUK) thuộc tầng 5 tòa nhà Delta</span><br>
        </div>
        <div class="header">
            Lecturer: <input type="text" readonly="readonly" value="${requestScope.lecturer.name}"/>
            <form action="timetable" method="GET">
                <input type="hidden" name="lid" value="${param.lid}"/>
                From: <input type="date" name="from" value="${requestScope.from}"/>
                To: <input type="date" name="to" value="${requestScope.to}"/>
                <input type="submit" value="View"/> 
            </form>
        </div>
        <table class="tb" border="1px">
            <tr class="title">
                <td> </td>
                <c:forEach items="${requestScope.dates}" var="d">
                    <td>${d}<br/>${helper.getDayNameofWeek(d)}</td>
                    </c:forEach>
            </tr>
            <c:forEach items="${requestScope.slots}" var="slot">
                <tr>
                    <td>${slot.description}</td>
                    <c:forEach items="${requestScope.dates}" var="d">
                        <td>
                            <c:forEach items="${requestScope.sessions}" var="ses">
                                <c:if test="${helper.compare(ses.date,d) eq 0 and (ses.timeslot.id eq slot.id)}">
                                    <a href="takeatt?id=${ses.id}">${ses.group.name}-${ses.group.subject.name}</a>
                                    <br/>
                                    ${ses.room.name}
                                    <c:if test="${ses.attandated}">
                                        <img style="width: 15px;" src="../img/png-transparent-green-area-pattern-green-tick-file-green-check-illustration-angle-text-hand-thumbnail.png" alt=""/>
                                    </c:if>
                                    <c:if test="${!ses.attandated}">
                                        <img style="width: 15px;" src="../img/red-x-red-x-11563060665ltfumg5kvi.png" alt=""/>
                                    </c:if>
                                </c:if>

                            </c:forEach>
                        </td>
                    </c:forEach>
                </tr>
            </c:forEach>
        </table><br>
                <div>
                    <span style="padding-left: 100px;"><b>More note / Chú thích thêm:</b></span> <br>
                    <span style="padding-left: 150px;">
                        <img style="width: 15px;" src="../img/png-transparent-green-area-pattern-green-tick-file-green-check-illustration-angle-text-hand-thumbnail.png" alt=""/>
                    ${sessionScope.account.displayname} had attended this activity, ${sessionScope.account.displayname} đã tham gia hoạt động này
                    </span> <br>
                    <span style="padding-left: 150px;">  
                        <img style="width: 15px;" src="../img/red-x-red-x-11563060665ltfumg5kvi.png" alt=""/>
                    ${sessionScope.account.displayname} had NOT attended this activity, ${sessionScope.account.displayname} đã vắng mặt buổi này
                    </span><br>
                    <span style="padding-left: 150px;">()   No data was given / chưa có dữ liệu</span>
                </div>
        <div class="home"><button><a href="../home">Home</a></button></div>
        <br> <br>    
        <div class="info"><b>Mọi góp ý, thắc mắc liên hệ :</b> Phòng dịch vụ sinh viên: Email: <a href="#">dichvusinhvien@fe.edu.vn</a>. Điện thoại : <b>(024)7308.13.13</b></div>
        <p style="text-align: center;">© Powered by <a href="https://fpt.edu.vn/">FPT University</a> | <a href="https://cmshn.fpt.edu.vn/">CMS</a> | <a href="http://libol.fpt.edu.vn/">library</a> | <a href="https://library.books24x7.com/login.asp?ic=0">books24x7</a></p>
    </body>
</html>

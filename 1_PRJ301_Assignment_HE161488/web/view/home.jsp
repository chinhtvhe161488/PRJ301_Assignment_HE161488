<%-- 
    Document   : home
    Created on : Oct 24, 2022, 2:42:18 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FAP</title>
    </head>
    <style>
        .left-header{
            width: 555px;
            border-color: #cccccc;
            border-style: solid;
            border-width: 1px;
            color: #333333;
            font-size: 13px;
            line-height: 18.5714px;
        }
        .lhd{
            background-color: #eb9316;
            color: #ffffff;
            width: 255px;
            border-radius: 5px;
            text-align: center;
            display: block;
        }
        .greet{
            width: 265px;
            background-color: #5cb85c;
            color: #ffffff;
            display: inline;
            /*text-align: center;*/
            margin: 200px;
            font-size: 25px;
        }
        .timetab{
            border: 1px #333333 solid;
            margin: 200px;
            font-size: 25px;
        }
        .footer{
            padding-top: 50px;
            text-align: center;
        }
    </style>
    <body>
        <h1 style="text-align: center;">FPT University Academic Portal</h1>
        <hr>
        <c:if test="${sessionScope.account ne null}">
            <span class="timetab"><a href="http://localhost:9999/1_PRJ301_Assignment_HE161488/lecturer/timetable?lid=1">Time Table</a></span><br>
            <div class="greet">
                <span> Hello ${sessionScope.account.displayname}, click 
                    <a id="myBtn" href="logout">here</a> to logout. </span>
            </div>
        </c:if>
        <div>

        </div>
        <c:if test="${sessionScope.account eq null}">
            <div class="left-header">
                <span class="lhd"> <b>PLEASE LOGIN BY FPT ACCOUNT</b></span> <br>
                <div class="login"><button><a href="login"> Login</a></button></div>
            </div>
            <!--            click 
                        <a href="login">here</a> to login. -->
        </c:if>
        <p class="footer">© Powered by <a href="https://fpt.edu.vn/">FPT University</a> | <a href="https://cmshn.fpt.edu.vn/">CMS</a> | <a href="http://libol.fpt.edu.vn/">library</a> | <a href="https://library.books24x7.com/login.asp?ic=0">books24x7</a></p>
    </div>
    <script>
        document.getElementById("myBtn").addEventListener("click", function () {
            alert("Are you sure you want log out?");
        });
    </script>
</body>
</html>
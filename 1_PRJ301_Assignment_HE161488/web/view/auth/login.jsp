<%-- 
    Document   : login
    Created on : Oct 24, 2022, 2:44:01 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            background: url("img/FPTHanoi02_Entrance_Facade_HoangLe.jpg");
        }

        input[type=text], input[type=password] {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        button {
            background-color: #eb9316;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 100%;
        }

        button:hover {
            opacity: 0.8;
        }

        .container {
            width: 40%;
            position: absolute;
            top: 25%;
            left: 50%;
            margin-right: -50%;
            transform: translate(-50%, -50%);
        }

        span.psw {
            float: right;
            padding-top: 16px;
        }

        @media screen and (max-width: 300px) {
            span.psw {
                display: block;
                float: none;
            }
        }
    </style>
    <body>
        <form action="login" method="POST">
            <!--            Username: <input type="text" name="username" /> <br/>
                        Password: <input type="password" name="password" /> <br/>
                        <input type="submit" value="Login"/>-->
            <div class="container">
                <label for="uname"><b style="color: #ffffff">Username</b></label>
                <input type="text" placeholder="Enter Username" name="username" required>

                <label for="psw"><b style="color: #ffffff">Password</b></label>
                <input type="password" placeholder="Enter Password" name="password" required>

                <button type="submit">Login</button>
            </div>
        </form>
    </body>
</html>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1" />
        <!-- icon -->
        <link rel="shortcut icon" href="resources/favicon.ico" type="image/x-icon">
        <!-- link Fonts -->
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet" />
        <!--BOOTSTRAP5-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
        <!--FONTAWESOME-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer"/>
        <!-- CSS -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/queries.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/homepage.css" />
        <!-- Sakura -->
        <link href="${pageContext.request.contextPath}/css/jquery-sakura.css" rel="stylesheet" type="text/css">
        <title>Login</title>
        <style>
            /* Add your custom styles here 
            author Namlv*/
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
            }

            .container1 {
                width: 50%;
                margin: auto;
                overflow: hidden;
            }

            #login-form1 {
                background-color: #fff;
                padding: 20px;
                margin-top: 50px;
                border-radius: 5px;
            }

            label {
                display: block;
                margin: 10px 0 5px;
            }

            input[type="text"],
            input[type="password"] {
                width: 100%;
                padding: 8px;
                margin-bottom: 10px;
            }

            input[type="submit"] {
                width: 100%;
                padding: 10px;
                background-color: #4caf50;
                border: none;
                color: #fff;
                border-radius: 3px;
                cursor: pointer;
            }

            input[type="submit"]:hover {
                background-color: #45a049;
            }

            a {
                text-decoration: none;
                color: #333;
                font-weight: bold;
                font-size: 14px;
            }

            .register-link {
                margin-top: 15px;
                display: block;
            }

            .forgot-password {
                margin-top: 10px;
                display: block;
            }
        </style>
    </head>
    <body>
        <%@include file="model/header.jsp" %>
        <div class="container1">
            <div id="login-form1">
                <h2>Login</h2>

                <form action="#" method="post">
                    <c:if test="${not empty mess}">
                        <div class="mess" style="color: red">${mess}</div>
                    </c:if>
                    <label for="username">Username:</label>
                    <input type="text" id="email" name="username" required="" value="${cookie.cuser.value}">

                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" required="" value="${cookie.cpass.value}">
                    <ul class="agileinfotickwthree">
                        <li>
                            Sign in as
                            <select class="roles" name="role">
                                <option  value="u" selected>User</option>
                                <option  value="a">Admin</option>
                            </select>
                        </li>
                        <li>
                            <input type="checkbox" ${(cookie.crem != null?'checked':'')} id="brand1" name="rem" value="ON" >
                            Remember me
                        </li>
                    </ul>

                    <input type="submit" value="Login">

                    <a href="register" class="register-link">Register</a>

                    <a href="forgotpass" class="forgot-password">Forgot Password?</a>
                </form>
            </div>
        </div>
        <%@include file="model/footer.jsp" %>
        <!-- BOOTSTRAP5-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <!-- SCRIPT -->
        <script src="${pageContext.request.contextPath}/js/script.js"></script>
        <!-- SAKURA -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery-sakura.js"></script>
        <script>
            $(window).load(function () {
                $('body').sakura();
            });
        </script>
    </body>
</html>

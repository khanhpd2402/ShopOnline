
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
        <title>Register</title>
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

            #register-form1 {
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

            .login-link {
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
        <div class="container1">
            <div id="register-form1">
                <h2>Register</h2>
                <form action="register" method="post">
                    <!-- Add your registration form fields here -->
                    <c:if test="${not empty errorusername}">
                        <div class="error-message"><p style=" color: red">${errorusername}</p></div>
                        </c:if>
                    <label for="username">Username:</label>
                    <input type="text" id="username" name="username" 
                           pattern="[A-Za-z0-9_.\-]{4,}" title="Các ký tự được chấp nhận bao gồm chữ cái viết hoa, chữ cái viết thường, chữ số, dấu gạch dưới (_), dấu chấm (.) và dấu gạch ngang (-) và tên đăng nhập phải nhiều hơn 4 kí tự."
                           required>
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" 
                           pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W).{8,}" 
                           oninvalid="this.setCustomValidity('Mật khẩu trên 8 kí tự và bao gồm chữ cái hoa, thường, chữ số, kí tự đặc biệt')" 
                           oninput="this.setCustomValidity('')"
                           required>
                    <label for="re-password">Confirm Password</label>
                    <input type="password" id="password2" name="password2" required>

                    <label for="firstname">First Name</label>
                    <input type="text" id="firstname" name="firstname" required>
                    <label for="lastname">Last Name</label>
                    <input type="text" id="lastname" name="lastname" required>
                    <label for="gender">Gender</label>
                    <select id="gender" name="gender">
                        <option value="male">Male</option>
                        <option value="female">Female</option>
                    </select>
                    <c:if test="${not empty erroremail}">
                        <div class="error-message"><p style=" color: red">${erroremail}</p></div>
                        </c:if>
                    <label for="email">Email:</label>
                    <input type="text" id="email" placeholder="mail@example.com" name="email">
                    <c:if test="${not empty errorphone}">
                        <div class="error-message"><p style=" color: red">${errorphone}</p></div>
                        </c:if>
                    <label for="phone">Phone</label>
                    <input type="text" id="phone" pattern="[0-9]{10}" title="Please enter a valid phone number." name="phone" required>
                    <label for="address">Address</label>
                    <input type="text" id="address" name="address" required>

                    <input type="submit" value="Register">
                    <input type="checkbox" id="policies" required=""><span style="color: black"> Accept we terms and policies. </span>

                    <!-- Provide a link to the login page -->
                    <p class="wthree w3l">Already have an account <span>→</span> <a style="color: #FF8C00;" href="login">Login Here</a></p>
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
        <script type="text/javascript">
            window.onload = function () {
                document.getElementById("password1").onchange = validatePassword;
                document.getElementById("password2").onchange = validatePassword;
            };
            function setCustomValidity(message) {
                var usernameInput = document.getElementById('username');
                usernameInput.setCustomValidity(message);
            }
            function validatePassword() {
                var pass2 = document.getElementById("password2").value;
                var pass1 = document.getElementById("password1").value;
                if (pass1 !== pass2)
                    document.getElementById("password2").setCustomValidity("Passwords Don't Match");
                else
                    document.getElementById("password2").setCustomValidity('');
                //empty string means no validation error
            }
        </script>
    </body>
</html>

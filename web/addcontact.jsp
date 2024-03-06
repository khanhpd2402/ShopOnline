<%-- 
    Document   : addcontact
    Created on : Mar 6, 2024, 1:35:39 AM
    Author     : khanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Add contact</title>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1" />
        <!-- icon -->
        <link rel="shortcut icon" href="resources/favicon1.png" type="image/png">
        <!-- link Fonts -->
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet" />
        <!--BOOTSTRAP5-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
        <!--FONTAWESOME-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer"/>
        <!-- CSS -->
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <link rel="stylesheet" type="text/css" href="css/queries.css" />
        <style>
            .form-container {
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            form {
                max-width: 400px;
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                margin-bottom: 20px;
            }

            input {
                width: 100%;
                padding: 10px;
                margin-bottom: 15px;
                box-sizing: border-box;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            .button-container {
                display: flex;
                justify-content: flex-end;
            }

            button {
                padding: 10px;
                color: #fff;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
                margin-left: 10px;
            }

            button:hover {
                opacity: 0.8;
            }

            i {
                margin-right: 5px;
            }

            /* Customize the appearance of each button */

            #confirmButton {
                background-color: #007bff; /* Xác nhận */
            }
            #cancelButton{
                background-color: #c7254e; /* Hủy */
            }
        </style>
    </head>
    <body>
        <%@include file="model/header.jsp" %>
        <a href="allcontacts" id="back"> <i class="fas fa-arrow-left"></i> Quay lại</a>

        <div class="form-container">
            <div>
                <form id="userForm" name="f" action="addcontact" method="post">
                    <!-- Hiển thị thông báo lỗi -->
                    <c:if test="${not empty erroremail}">
                        <div class="error-message" style="color: red">${erroremail}</div>
                    </c:if>
                    <input type="email" name="email" id="email"  placeholder="mail@example.com" required>
                    <!-- Hiển thị thông báo lỗi -->
                    <c:if test="${not empty errorphone}">
                        <div class="error-message" style="color: red">${errorphone}</div>
                    </c:if>
                    <input type="text" name="phone" id="phone"  pattern="[0-9]{10}" title="Please enter a valid phone number." placeholder="Phone" required>
                    <input type="text" name="address" id="address" placeholder="Address" required>
                    <div class="button-container">
                        <button type="submit" id="confirmButton"><i class="fas fa-check"></i> Xác nhận</button>
                        <button type="reset" id="cancelButton"><i class="fas fa-lock"></i> Hủy</button>
                    </div>
                </form>
            </div>
        </div>
        <%@include file="model/footer.jsp" %>
        <!-- BOOTSTRAP5-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <!-- SCRIPT -->
        <script src="js/script.js"></script>
    </body>
</html>

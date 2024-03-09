<%-- 
    Document   : allcontacts
    Created on : Mar 5, 2024, 6:33:37 AM
    Author     : khanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>All Contacts</title>
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
                margin-left: 8%
            }
            .form-space {
                display: flex;

            }
            form {
                max-width: 400px;
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                margin-bottom: 20px;
                margin-right: 10px;
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
            .button-container2 {
                display: flex;
                flex-direction: column;
            }

            .button-container2 button {
                margin-bottom: 5px; /* Optional: Add margin between buttons */
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
            .button-container2 button:nth-child(1) {
                background-color: #ffc107; /* Chỉnh sửa */
            }

            .button-container2 button:nth-child(2) {
                background-color: #28a745; /* Đặt liên hệ mặc định */
            }
            .button-container2  button:nth-child(3) {
                background-color: #c7254e; /* xóa */
            }
            .button-container  button:nth-child(1) {
                background-color: #007bff; /* Xác nhận */
                display: none;
            }
            .button-container  button:nth-child(2) {
                background-color: #c7254e; /* Hủy */
                display: none;
            }
            #addcontact{
                margin-left: 80%;
            }
            #back{
                margin-left: 2%;
            }

            /* Modal styles */
            .modal {
                display: none;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0,0,0,0.7);
            }

            .modal-content {
                background-color: #fefefe;
                margin: 15% auto;
                padding: 20px;
                border: 1px solid #888;
                width: 30%;
            }
            .close {
                color: #aaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
                width: 3px;
            }

            .close:hover,
            .close:focus {
                color: black;
                text-decoration: none;
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <%@include file="model/header.jsp" %>
        <a href="infouser" id="back"> <i class="fas fa-arrow-left"></i> Quay lại</a>
        <a href="addcontact" id="addcontact">Thêm liên hệ <i class="fas fa-arrow-right"></i> </a>
        <div class="form-container">
            <c:forEach var="o" items="${userContacts}">
                <div class="form-space">
                    <form id="userForm" name="f" action="allcontacts" method="post">
                        <span style="color: #28a745"> <c:if test="${o.userContactID == sessionScope.userinfo.userContactID_Favorite}">Liên hệ mặc định</c:if></span>
                        <input type="text" name="userContactID" id="userContactID" value="${o.userContactID}" hidden="" >
                        <input type="text" id="action" name="action" value="edit" hidden="" >
                        <!-- Hiển thị thông báo lỗi -->
                        <c:if test="${(not empty erroremail) && (errorid == o.userContactID)}">
                            <div class="error-message" style="color: red">${erroremail}</div>
                        </c:if>
                        <input type="email" name="email" id="email${o.userContactID}" value="${o.email}" placeholder="mail@example.com" required readonly="">
                        <!-- Hiển thị thông báo lỗi -->
                        <c:if test="${(not empty errorphone) && (errorid == o.userContactID)}">
                            <div class="error-message" style="color: red">${errorphone}</div>
                        </c:if>
                        <input type="text" name="phone" id="phone${o.userContactID}" value="${o.phone}" pattern="[0-9]{10}" title="Please enter a valid phone number." placeholder="Phone" required readonly="">
                        <input type="text" name="address" id="address${o.userContactID}" value="${o.address}" placeholder="Address" required readonly="">
                        <div class="button-container">
                            <button type="submit" id="confirmButton${o.userContactID}"><i class="fas fa-check"></i> Xác nhận</button>
                            <button type="reset" id="cancelButton${o.userContactID}" onclick="handleCancelButtonClick('${o.userContactID}')"><i class="fas fa-lock"></i> Hủy</button>
                        </div>
                    </form>
                    <c:if test="${o.userContactID != sessionScope.userinfo.userContactID_Favorite}">
                        <form name="fs" action="allcontacts" method="post">
                            <input type="text" name="userContactID" id="userContactID" value="${o.userContactID}" hidden="" >
                            <input type="text" id="action" name="action" value="setDefaul" hidden="" >
                            <div class="button-container2">
                                <button type="button" id="editButton${o.userContactID}" onclick="handleEditButtonClick('${o.userContactID}')"><i class="fas fa-edit"></i> Chỉnh sửa</button>
                                <button type="submit" id="setDefaultButton${o.userContactID}"><i class="fas fa-archway"></i> Đặt liên hệ mặc định</button>
                                <button type="button" id="openDeleteModalBtn" onclick="openDeleteModal('${o.userContactID}')"><i class="fas fa-trash"></i>Xóa liên hệ</button>
                            </div>
                        </form>
                    </c:if>
                </div>
            </c:forEach>
        </div>
        <!--modal thông báo Đổi liên hệ mặc định thành công--> 
        <span id="${existModal}"></span>
        <div id="myModal" class="modal">
            <div class="modal-content">
                <p>Đổi liên hệ mặc định thành công, vui lòng đăng nhập lại!</p>
                <a href="logout">Đăng nhập</a>
            </div>
        </div>
        <!--modal cảnh báo khi người dùng muốn xóa-->
        <div id="modalDelete" class="modal">
            <div class="modal-content">
                <span id="close" class="close">&times;</span>
                <form name="fd" action="allcontacts" method="post">
                            <input type="text" name="userContactID" id="userContactIDDelette" hidden="" >
                            <input type="text" id="action" name="action" value="Delete" hidden="" >
                            <p>Bạn có chắc chắn muốn xóa liên hệ này?</p>
                            <div class="button-container2">
                                <button type="submit" id="deleteButton" style="background-color: #ffc107; "><i class="fas fa-check"></i> Xác Nhận</button>
                            </div>
                        </form>
            </div>
        </div>
        <%@include file="model/footer.jsp" %>

        <script>
            function handleEditButtonClick(id) {
                // Ẩn nút "setDefaultButton" và editButton
                document.getElementById('setDefaultButton' + id).style.display = 'none';
                document.getElementById('editButton' + id).style.display = 'none';

                // Hiển thị nút "confirmButton" và cancelButton
                document.getElementById('confirmButton' + id).style.display = 'inline-block';
                document.getElementById('cancelButton' + id).style.display = 'inline-block';
                //xoa thuoc tinh readonly
                document.getElementById('email' + id).readOnly = false;
                document.getElementById('phone' + id).readOnly = false;
                document.getElementById('address' + id).readOnly = false;
            }

            function handleCancelButtonClick(id) {
                // hien thi nút "setDefaultButton" và editButton
                document.getElementById('setDefaultButton' + id).style.display = 'inline-block';
                document.getElementById('editButton' + id).style.display = 'inline-block';

                // an nút "confirmButton" và cancelButton
                document.getElementById('confirmButton' + id).style.display = 'none';
                document.getElementById('cancelButton' + id).style.display = 'none';
                //them thuoc tinh readonly
                document.getElementById('email' + id).readOnly = true;
                document.getElementById('phone' + id).readOnly = true;
                document.getElementById('address' + id).readOnly = true;
            }
            function openDeleteModal(id) {
                var modal = document.getElementById("modalDelete");
// Get the <span> element that closes the modal
                var span = document.getElementById("close");
                // When the user clicks the button, open the modal 
                modal.style.display = "block";
                // Gán giá trị userContactID cho thuộc tính value
                document.getElementById("userContactIDDelette").value = id;
                // When the user clicks on <span> (x), close the modal
                span.onclick = function () {
                    closeModal();
                };

// When the user clicks anywhere outside of the modal, close it
                window.onclick = function (event) {
                    if (event.target == modal) {
                        closeModal();
                    }
                };
                // Function to close the modal
                function closeModal() {
                    modal.style.display = "none";
                }
            }
        </script>
        <!--js modal-->
        <script>
            // Get the modal element
            var modal = document.getElementById("myModal");

// Get the <span> element
            var existModal = document.getElementById("existModal").id;

// Check if the id has a value
            if (existModal.trim() !== "") {
                // Show the modal
                modal.style.display = "block";
            }
        </script>
        <!-- BOOTSTRAP5-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <!-- SCRIPT -->
        <script src="js/script.js"></script>
    </body>
</html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html dir="ltr" lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <!-- Mobile Metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Site Icons -->
        <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
        <link rel="apple-touch-icon" href="images/apple-touch-icon.png">

        <!-- Custom CSS -->
        <link rel="stylesheet" href="css/csscart/custom.css">
        <link href="css/style.min.css" rel="stylesheet">
        <link href="css/theme.css" rel="stylesheet" media="all">

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
        <title>Modernize</title>
        <style>
            #cancelButton {
                display: none;
            }
            #confirmButton {
                display: none;
            }
            .hidden{
                display: none;
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
                width: 80%;
            }
        </style> 
    </head>

    <body>
        <%@include file="model/header.jsp" %>
        <!-- Page wrapper  -->
        <!-- ============================================================== -->
        <div class="page-wrapper">
            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->

            <div class="page-breadcrumb bg-white">
                <div class="row align-items-center">
                    <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                    </div>
                    <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                        <div class="d-md-flex">
                            <ol class="breadcrumb ms-auto">
                                <li><p class="page-title">Thông Tin Cá Nhân</p></li>
                            </ol>
                        </div>
                    </div>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- ============================================================== -->
            <!-- End Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
                <!-- Row -->
                <div class="row">
                    <!-- Column -->
                    <!-- Column -->
                    <div class="col-lg-8 col-xlg-9 col-md-12 mx-auto">
                        <div class="card">
                            <div class="notification-pass"><strong style="color: red">${requestScope.errorUpdatePass}</strong></div>
                            <div class="card-body">
                                <form class="form-horizontal form-material" name="fu" action="infouser" method="post">
                                    <!-- Hiển thị thông báo lỗi -->
                                    <c:if test="${not empty errorusername}">
                                        <div class="error-message" style="color: red">${errorusername}</div>
                                    </c:if>
                                    <div class="form-group mb-4">
                                        <label class="col-md-12 p-0">Tên Đăng Nhập</label>
                                        <div class="col-md-12 border-bottom p-0">
                                            <input type="text" value="${requestScope.anuser.username}" name="uname" id="uname"
                                                   pattern="[A-Za-z0-9_.\-]{4,}" title="Các ký tự được chấp nhận bao gồm chữ cái viết hoa, chữ cái viết thường, chữ số, dấu gạch dưới (_), dấu chấm (.) và dấu gạch ngang (-) và tên đăng nhập phải nhiều hơn 4 kí tự."
                                                   class="form-control p-0 border-0" required="" readonly> </div>
                                    </div>
                                    
                                    <div class="form-group mb-4">
                                        <label class="col-md-12 p-0">Họ</label>
                                        <div class="col-md-12 border-bottom p-0">
                                            <input type="text" value="${requestScope.anuser.firstName}" name="fname" id="fname"
                                                   class="form-control p-0 border-0" required readonly> </div>
                                    </div>
                                    <div class="form-group mb-4">
                                        <label class="col-md-12 p-0">Tên</label>
                                        <div class="col-md-12 border-bottom p-0">
                                            <input type="text" value="${requestScope.anuser.lastName}" name="lname" id="lname"
                                                   class="form-control p-0 border-0" required readonly> </div>
                                    </div>
                                    <div class="form-group mb-4">
                                        <label class="col-md-12 p-0">Giới tính</label>
                                        <div class="col-md-12 border-bottom p-0">
                                            <select id="gender" name="gender" required="">
                                                <option value="male"<c:if test="${requestScope.anuser.gender}">selected=""</c:if>>Male</option>
                                                <option value="female"<c:if test="${!requestScope.anuser.gender}">selected=""</c:if>>Female</option>
                                                </select></div>
                                        </div>
                                        <div class="form-group mb-4">
                                            <label for="example-email" class="col-md-12 p-0">Email</label>
                                            <div class="col-md-12 border-bottom p-0">
                                                <input type="email" value="${requestScope.anuser.email}" name="email"
                                                   class="form-control p-0 border-0"
                                                   id="email" required readonly> 
                                        </div>
                                    </div>
                                    <div class="form-group mb-4">
                                        <label class="col-md-12 p-0">Số Điện Thoại</label>
                                        <div class="col-md-12 border-bottom p-0">
                                            <input type="text" value="${requestScope.anuser.phone}" name="phone" id="phone"
                                                   class="form-control p-0 border-0" readonly required="">
                                        </div>
                                    </div>
                                    <div class="form-group mb-4">
                                        <label class="col-md-12 p-0">Địa Chỉ</label>
                                        <div class="col-md-12 border-bottom p-0">
                                            <input type="text" value="${requestScope.anuser.address}" name="address" id="address"
                                                   class="form-control p-0 border-0" required readonly> </div>
                                    </div>
                                    <div class="form-group mb-4">
                                        <div class="col-sm-12">
                                            <button type="button" class="btn btn-warning" id="editButton" onclick="handleEditButtonClick()"><i class="fas fa-edit"></i>Chỉnh sửa thông tin cá nhân</button>
                                            <button type="submit" id="confirmButton" class="btn btn-success"><i class="fas fa-check"></i>Xác nhận thay đổi</button>
                                            <button type="reset" id="cancelButton" class="btn btn-danger" onclick="handleCancelButtonClick()"><i class="fas fa-lock"></i> Hủy</button>
                                            <a href="allcontacts" id="allcontacts">Tất cả liên hệ <i class="fas fa-arrow-right"></i> </a>
                                        </div>
                                    </div>

                                </form>
                                <!--form doi mat khau-->
                                <form name="fcp" action="infouser" method="post">
                                    <div class="form-group mb-4 hidden" id="password-group">
                                        <input type="email" value="${requestScope.anuser.email}" name="email" hidden="">
                                        <input type="text" value="${requestScope.anuser.username}" name="uname" hidden>
                                        <input type="text" value="changepass" name="changepass" hidden>
                                        <label class="col-md-12 p-0">Mật Khẩu</label>
                                        <div class="col-md-12 border-bottom p-0">
                                            <input id="current-password" name="oldpass" type="password" placeholder="*********" class="form-control p-0 border-0"
                                                   pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W).{8,}" 
                                                   oninvalid="this.setCustomValidity('Mật khẩu trên 8 kí tự và bao gồm chữ cái hoa, thường, chữ số, kí tự đặc biệt')" 
                                                   oninput="this.setCustomValidity('')">
                                        </div>
                                    </div>

                                    <div class="form-group mb-4 hidden" id="new-password-group">
                                        <label class="col-md-12 p-0">Mật Khẩu Mới</label>
                                        <div class="col-md-12 border-bottom p-0">
                                            <input id="new-password" name="newpass"  pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W).{8,}" 
                                                   oninvalid="this.setCustomValidity('Mật khẩu trên 8 kí tự và bao gồm chữ cái hoa, thường, chữ số, kí tự đặc biệt')" 
                                                   oninput="this.setCustomValidity('')" type="password"  placeholder="*********" class="form-control p-0 border-0">
                                        </div>
                                    </div>

                                    <div class="form-group mb-4 hidden" id="confirm-password-group">
                                        <label class="col-md-12 p-0">Xác Nhận Mật Khẩu</label>
                                        <div class="col-md-12 border-bottom p-0">
                                            <input id="confirm-password" type="password"  placeholder="*********" class="form-control p-0 border-0">
                                        </div>
                                    </div>
                                    <div class="form-group mb-4 hidden" id="update-password-group">
                                        <button id="update-password-btn" type="submit" class="btn btn-success">Xác Nhận</button>
                                    </div>
                                </form>
                                <button id="change-password-btn" type="button" class="btn btn-primary">Đổi Mật Khẩu</button> 
                            </div>
                        </div>
                    </div>

                    <!-- Column -->
                </div>
                <!-- Row -->
                <!-- ============================================================== -->
            </div>
        </div>
        <span id="${existModal}"></span>
        <div id="myModal" class="modal">
            <div class="modal-content">
                <p>${mess}</p>
                <a href="logout">Đăng nhập</a>
            </div>
        </div>
        <a href="#" id="back-to-top" title="Back to top" style="display: none;">&uarr;</a>
        <%@include file="model/footer.jsp" %>

        <script src="js/custom_1.js"></script>
        <script src="js/script.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>


        <script type="text/javascript">
                                                window.onload = function () {
                                                    document.getElementById("new-password").onchange = validatePassword;
                                                    document.getElementById("confirm-password").onchange = validatePassword;
                                                };
                                                function validatePassword() {
                                                    var pass2 = document.getElementById("new-password").value;
                                                    var pass1 = document.getElementById("confirm-password").value;
                                                    if (pass1 !== pass2)
                                                        document.getElementById("confirm-password").setCustomValidity("Passwords Don't Match");
                                                    else
                                                        document.getElementById("confirm-password").setCustomValidity('');
                                                    //empty string means no validation error
                                                }
        </script>
        <script>
            function handleEditButtonClick() {
                // Ẩn nút  editButton và allcontacts
                document.getElementById('editButton').style.display = 'none';
                document.getElementById('allcontacts').style.display = 'none';

                // Hiển thị nút "confirmButton" và cancelButton
                document.getElementById('confirmButton').style.display = 'inline-block';
                document.getElementById('cancelButton').style.display = 'inline-block';
                //xoa thuoc tinh readonly
                document.getElementById('uname').readOnly = false;
                document.getElementById('fname').readOnly = false;
                document.getElementById('lname').readOnly = false;
            }
            function handleCancelButtonClick() {
                // hien thi nút  editButton và allcontacts
                document.getElementById('editButton').style.display = 'inline-block';
                document.getElementById('allcontacts').style.display = 'inline-block';

                // an thị nút "confirmButton" và cancelButton
                document.getElementById('confirmButton').style.display = 'none';
                document.getElementById('cancelButton').style.display = 'none';
                //them thuoc tinh readonly
                document.getElementById('uname').readOnly = true;
                document.getElementById('fname').readOnly = true;
                document.getElementById('lname').readOnly = true;
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
    </body>

</html>

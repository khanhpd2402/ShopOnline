
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html dir="ltr" lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!-- Tell the browser to be responsive to screen width -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Ample Admin Lite Template by WrapPixel</title>
        <link rel="canonical" href="https://www.wrappixel.com/templates/ample-admin-lite/" />
        <!-- Favicon icon -->
        <link rel="icon" type="image/png" sizes="16x16" href="plugins/images/favicon.png">
        <!-- Custom CSS -->
        <link href="css/style.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/csscart/custom.css">
        <link href="cssadmin/styles.css" rel="stylesheet">


        <!-- Fontfaces CSS-->
        <link href="vendor/fontawesome-all.min.css" rel="stylesheet" media="all">
        <!-- Main CSS-->
        <link href="css/theme.css" rel="stylesheet" media="all">
        <!--nav and sidebar-->
        <link href="cssadmin/bootstrap.min.css" rel="stylesheet">
        <link href="cssadmin/datepicker3.css" rel="stylesheet">


        <!-- Custom CSS -->
        <link href="css/styleinfo.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous"/>

        <style>
            .hidden {
                display: none;
            }
        </style> 
    </head>

    <body>
        <%@include file="component/sidebar.jsp" %>
        <%@include file="component/nav.jsp" %>

        <div class="page-wrapper">

            <div class="page-breadcrumb bg-white">
                <div class="row align-items-center">
                    <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                    </div>
                    <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                        <div class="d-md-flex">
                            <ol class="breadcrumb ms-auto">
                                <li><p class="page-title">Thông tin tài khoản</p></li>
                            </ol>
                        </div>
                    </div>
                </div>
                <!-- /.col-lg-12 -->
            </div>
           
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
                <!-- Row -->
                <div class="row">
                    <div class="col-lg-8 col-xlg-9 col-md-12 mx-auto">
                        <div class="card">
                            <div class="card-body">
                                <form class="form-horizontal form-material" name="fu" action="infouser" method="post">
                                    <div class="form-group mb-4">
                                        <label class="col-md-12 p-0">ID cá nhân</label>
                                        <div class="col-md-12 border-bottom p-0">
                                            <input type="text"  value="${sessionScope.employeeinfo.getEmployeename()}" class="form-control p-0 border-0" readonly=""> 
                                        </div>
                                    </div>
                                    <div class="form-group mb-4">
                                        <label class="col-md-12 p-0">Tên Đăng Nhập</label>
                                        <div class="col-md-12 border-bottom p-0">
                                            <input type="text" value="${requestScope.anEm.getEmployeename()}" name="uname"
                                                   pattern="[A-Za-z0-9_.\-]{4,}" title="Các ký tự được chấp nhận bao gồm chữ cái viết hoa, chữ cái viết thường, chữ số, dấu gạch dưới (_), dấu chấm (.) và dấu gạch ngang (-) và tên đăng nhập phải nhiều hơn 4 kí tự."
                                                   class="form-control p-0 border-0" required=""> </div>
                                    </div>
                                    <!-- Hiển thị thông báo lỗi -->
                                    <c:if test="${not empty errorusername}">
                                        <div class="error-message">${errorusername}</div>
                                    </c:if>
                                    <div class="form-group mb-4">
                                        <label class="col-md-12 p-0">Họ</label>
                                        <div class="col-md-12 border-bottom p-0">
                                            <input type="text" value="${requestScope.anEm.firstName}" name="fname"
                                                   class="form-control p-0 border-0" required> </div>
                                    </div>
                                    <div class="form-group mb-4">
                                        <label class="col-md-12 p-0">Tên</label>
                                        <div class="col-md-12 border-bottom p-0">
                                            <input type="text" value="${requestScope.anEm.lastName}" name="lname"
                                                   class="form-control p-0 border-0" required> </div>
                                    </div>
                                    <div class="form-group mb-4">
                                        <label for="example-email" class="col-md-12 p-0">Email</label>
                                        <div class="col-md-12 border-bottom p-0">
                                            <input type="email" value="${requestScope.anEm.email}" name="email"
                                                   class="form-control p-0 border-0" name="example-email"
                                                   id="example-email" required>
                                        </div>
                                    </div>
                                    <!-- Hiển thị thông báo lỗi -->
                                    <c:if test="${not empty erroremail}">
                                        <div class="error-message">${erroremail}</div>
                                    </c:if>
                                    <div class="form-group mb-4">
                                        <label class="col-md-12 p-0">Số Điện Thoại</label>
                                        <div class="col-md-12 border-bottom p-0">
                                            <input type="text" value="${requestScope.anEm.phoneNumber}" name="phone"
                                                   pattern="[0-9]{10}" title="Please enter a valid phone number."
                                                   class="form-control p-0 border-0">
                                        </div>
                                    </div>
                                    <!-- Hiển thị thông báo lỗi -->
                                    <c:if test="${not empty errorphone}">
                                        <div class="error-message">${errorphone}</div>
                                    </c:if>
                                    <div class="form-group mb-4">
                                        <label class="col-md-12 p-0">Địa Chỉ</label>
                                        <div class="col-md-12 border-bottom p-0">
                                            <input type="text" value="${requestScope.anEm.address}" name="address"
                                                   class="form-control p-0 border-0" required> </div>
                                    </div>
                                    <div class="form-group mb-4">
                                        <label class="col-md-12 p-0">Vai trò quản trị viên</label>
                                        <div class="col-md-12 border-bottom p-0">
                                            <input type="text"  value="${requestScope.anEm.role}" class="form-control p-0 border-0" readonly=""> 
                                        </div>
                                    </div>
                                    <div class="form-group mb-4">
                                        <div class="col-sm-12">
                                            <button class="btn btn-success">Thay đổi thông tin cá nhân</button>

                                        </div>
                                    </div>

                                </form>
                                <!--form doi mat khau-->
                                <form>
                                    <div class="form-group mb-4 hidden" id="password-group">
                                        <label class="col-md-12 p-0">Mật Khẩu</label>
                                        <div class="col-md-12 border-bottom p-0">
                                            <input id="current-password" type="password" placeholder="*********" class="form-control p-0 border-0"
                                                   pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W).{8,}" 
                                                   oninvalid="this.setCustomValidity('Mật khẩu trên 8 kí tự và bao gồm chữ cái hoa, thường, chữ số, kí tự đặc biệt')" 
                                                   oninput="this.setCustomValidity('')">
                                        </div>
                                    </div>

                                    <div class="form-group mb-4 hidden" id="new-password-group">
                                        <label class="col-md-12 p-0">Mật Khẩu Mới</label>
                                        <div class="col-md-12 border-bottom p-0">
                                            <input id="new-password"  pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W).{8,}" 
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
               
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
           
        </div>
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->

        <a href="#" id="back-to-top" title="Back to top" style="display: none;">&uarr;</a>

        <!-- ALL JS FILES -->
 
        <script src="js/custom_1.js"></script>

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
    </body>

</html>

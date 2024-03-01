<%-- 
    Document   : addadmin
    Created on : Jun 15, 2023, 9:01:55 AM
    Author     : duykh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <link href="css/cssdashboard/style.min.css" rel="stylesheet">
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        
    <![endif]-->
        <style>
            .error-message {
                color: red;
                background-color: #ffcc00; /* Màu vàng nhạt */
                font-size: 14px;
                padding: 10px;
                border-radius: 4px;
                font-weight: bold;
                text-align: center; /* Căn giữa chữ trong ô */
            }
        </style>
    </head>

    <body>


           
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
                                    <li><p class="page-title">Tuyển Dụng</p></li>
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
                        <!-- Column -->

                        <div class="col-lg-8 col-xlg-9 col-md-12 mx-auto">
                            <div class="btn-success">${requestScope.mess}</div>
                            <div class="card">
                                <div class="card-body">
                                    <form class="form-horizontal form-material" action="addadmin" method="post" name="fa">
                                        <div class="form-group mb-4">
                                            <label class="col-md-12 p-0">Tên Đăng Nhập</label>
                                            <div class="col-md-12 border-bottom p-0">
                                                <input type="text" placeholder="abc" id="employeeName" required="" 
                                                       pattern="[A-Za-z0-9_.\-]{4,}" title="Các ký tự được chấp nhận bao gồm chữ cái viết hoa, chữ cái viết thường, chữ số, dấu gạch dưới (_), dấu chấm (.) và dấu gạch ngang (-) và tên đăng nhập phải nhiều hơn 4 kí tự." 
                                                       name="employeeName"class="form-control p-0 border-0"> </div>
                                            <!-- Hiển thị thông báo lỗi -->
                                            <c:if test="${not empty erroremployeename}">
                                                <div class="error-message">${erroremployeename}</div>
                                            </c:if> 
                                        </div>
                                        <div class="form-group mb-4">
                                            <label class="col-md-12 p-0">Họ</label>
                                            <div class="col-md-12 border-bottom p-0">
                                                <input type="text" placeholder="abc" name="firstName"
                                                       class="form-control p-0 border-0" required=""> </div>
                                        </div>
                                        <div class="form-group mb-4">
                                            <label class="col-md-12 p-0">Tên</label>
                                            <div class="col-md-12 border-bottom p-0">
                                                <input type="text" placeholder="abc" name="lastName"
                                                       class="form-control p-0 border-0" required=""> </div>
                                        </div>
                                        <div class="form-group mb-4">
                                            <label class="col-md-12 p-0">Mật Khẩu</label>
                                            <div class="col-md-12 border-bottom p-0">
                                                <input type="password" id="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W).{8,}" 
                                                       oninvalid="this.setCustomValidity('Mật khẩu trên 8 kí tự và bao gồm chữ cái hoa, thường, chữ số, kí tự đặc biệt')" 
                                                       oninput="this.setCustomValidity('')" placeholder="*********" name="password" required="" class="form-control p-0 border-0">
                                            </div>
                                        </div>
                                        <div class="form-group mb-4">
                                            <label class="col-md-12 p-0">Nhập Lại Mật Khẩu</label>
                                            <div class="col-md-12 border-bottom p-0">
                                                <input type="password" id="password2" placeholder="*********" name="password2" required="" class="form-control p-0 border-0">
                                            </div>
                                        </div>
                                        <div class="form-group mb-4">
                                            <label for="example-email" class="col-md-12 p-0">Email</label>
                                            <div class="col-md-12 border-bottom p-0">
                                                <input type="email" placeholder="name@admin.com" 
                                                       class="form-control p-0 border-0" name="email"
                                                       id="example-email" required="">
                                            </div>
                                            <!-- Hiển thị thông báo lỗi -->
                                            <c:if test="${not empty erroremail}">
                                                <div class="error-message">${erroremail}</div>
                                            </c:if>
                                        </div>

                                        <div class="form-group mb-4">
                                            <label class="col-md-12 p-0">Số Điện Thoại</label>
                                            <div class="col-md-12 border-bottom p-0">
                                                <input type="text" placeholder="123 456 7890" name="phoneNumber"
                                                       pattern="[0-9]{10}" title="Please enter a valid phone number."
                                                       class="form-control p-0 border-0" required="">
                                            </div>
                                            <!-- Hiển thị thông báo lỗi -->
                                            <c:if test="${not empty errorphone}">
                                                <div class="error-message">${errorphone}</div>
                                            </c:if>
                                        </div>
                                        <div class="form-group mb-4">
                                            <label class="col-md-12 p-0">Địa Chỉ</label>
                                            <div class="col-md-12 border-bottom p-0">
                                                <input type="text" placeholder="--/--/--    " name="address"
                                                       class="form-control p-0 border-0" required=""> </div>
                                        </div>
                                        <div class="form-group mb-4">
                                            <label class="col-sm-12">Quyền Quản Trị Viên</label>

                                            <div class="col-sm-12 border-bottom">
                                                <select class="form-select shadow-none p-0 border-0 form-control-line" name="role" required="">
                                                    <option value="1">Quản Trị Viên Cấp 1</option>
                                                    <option value="2">Quản Trị Viên Quản Lý Khách Hàng,Tin Tức</option>
                                                    <option value="3">Quản Trị Viên Quản Lý Sản Phẩm,Doanh Số</option>
                                                    <option value="4">Quản Trị Viên Quản Lý Đơn Hàng,Bảo Hành</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group mb-4">
                                            <div class="col-sm-12">
                                                <button class="btn btn-success">Thêm Mới</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!-- Column -->
                    </div>
                    <!-- Row -->
                    <!-- ============================================================== -->
                    <!-- End PAge Content -->
                    <!-- ============================================================== -->
                    <!-- ============================================================== -->
                    <!-- Right sidebar -->
                    <!-- ============================================================== -->
                    <!-- .right-sidebar -->
                    <!-- ============================================================== -->
                    <!-- End Right sidebar -->
                    <!-- ============================================================== -->
                </div>
                <!-- ============================================================== -->
                <!-- End Container fluid  -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- footer -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- End footer -->
                <!-- ============================================================== -->
            </div>
            <!-- ============================================================== -->
            <!-- End Page wrapper  -->
            <!-- ============================================================== -->

        <!-- ============================================================== -->
        <!-- All Jquery -->
        <!-- ============================================================== -->
        <script src="js/jsdashboard/jquery.min.js"></script>
        <!-- Bootstrap tether Core JavaScript -->
        <script src="js/jsdashboard/bootstrap.bundle.min.js"></script>
        <script src="js/jsdashboard/app-style-switcher.js"></script>
        <!--Wave Effects -->
        <script src="js/jsdashboard/waves.js"></script>
        <!--Menu sidebar -->
        <script src="js/jsdashboard/sidebarmenu.js"></script>
        <!--Custom JavaScript -->
        <script src="js/jsdashboard/custom.js"></script>
        <script type="text/javascript">
            window.onload = function () {
                document.getElementById("password").onchange = validatePassword;
                document.getElementById("password2").onchange = validatePassword;
            };
            function setCustomValidity(message) {
                var usernameInput = document.getElementById('employeeName');
                usernameInput.setCustomValidity(message);
            }
            function validatePassword() {
                var pass2 = document.getElementById("password2").value;
                var pass1 = document.getElementById("password").value;
                if (pass1 !== pass2)
                    document.getElementById("password2").setCustomValidity("Passwords Don't Match");
                else
                    document.getElementById("password2").setCustomValidity('');
                //empty string means no validation error
            }
        </script> 
    </body>

</html>

<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Lumino - Dashboard</title>
        <link href="cssadmin/bootstrap.min.css" rel="stylesheet">
        <link href="cssadmin/font-awesome.min.css" rel="stylesheet">
        <link href="cssadmin/datepicker3.css" rel="stylesheet">
        <link href="cssadmin/styles.css" rel="stylesheet">
        <link href="cssadmin/listproducts.css" rel="stylesheet">
        <link href="cssadmin/dropdown.css" rel="stylesheet">
        <link href="cssadmin/newproduct.css" rel="stylesheet">
        <script src="jsadmin/ckeditor/ckeditor.js"></script>

        <!--Custom Font-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous"/>
    </head>

    <body>
        <%@include file="component/nav.jsp" %>
        <%@include file="component/sidebar.jsp" %>

        <div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
            <div class="row">
                <ol class="breadcrumb">
                    <li><a href="couponmanage">
                            <em class="fa fa-ticket-alt"></em>
                        </a></li>
                    <li class="active">Coupon Manage</li>
                </ol>
            </div><!--/.row-->

            <div class="row">

                <div class="col-lg-4">
                    <h2>Update Coupon</h2>
                </div>
                <div class="col-lg-4">

                </div>

            </div><!--/.row-->


            <!--/.main-->
            <div class="row">
                <div class="add_form">
                    <c:set var="p" value="${requestScope.dataCoupon}"/>
                    <form action="updatecoupon" method="post" enctype="multipart/form-data">
                        <div class="inp_ctn col-lg-6 "><h4> ID</h4>
                            <input type="text" name="id" value="${p.id}" readonly=""></div>
                        <div class="inp_ctn col-lg-6"><h4>Code</h4>
                            <input type="text" name="code" placeholder="MUAHE5" id="couponCode" value="${p.code}" oninput="formatCouponCode('couponCode')" required=""></div>
                        <div class="inp_ctn col-lg-6"><h4> Value</h4>
                            <input type="text" name="value" placeholder="0.05 hoac 20.000VND" id="valueInput" oninput="formatNumber('valueInput')"  value="${p.value}" required=""></div>
                        <div class="inp_ctn col-lg-6"><h4> Expiration Date</h4>
                            <input type="date" name="expirationDate" required  value="${p.expirationDate}"></div>
                        <div class="inp_ctn col-lg-6"><h4> Type</h4>
                            <select name="productStatus" id="ProductStatus" class="content_inf" style="height: 30px;width:170px;">
                                <option value="1" <c:if test="${p.type}">selected=""</c:if>>Giảm giá theo %</option>
                                <option value="0" <c:if test="${!p.type}">selected=""</c:if>>Giảm giá theo VND</option>
                            </select></div>

                        <script>
                            function formatNumber(id) {
                                var input = document.getElementById(id);
                                var value = input.value;
                                // Loại bỏ tất cả các ký tự không phải số và dấu chấm
                                value = value.replace(/[^\d.]/g, "");
                                // Chèn dấu phẩy giữa các cụm ba số liên tiếp
                                value = value.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                                // Gán giá trị đã định dạng vào ô input
                                input.value = value;
                            }
                            function formatCouponCode(id) {
                                var input = document.getElementById(id);
                                var value = input.value;
                                // Loại bỏ tất cả các ký tự không phải là chữ cái và số, sau đó chuyển đổi thành chữ hoa
                                value = value.replace(/[^a-zA-Z0-9]/g, '').toUpperCase();
                                input.value = value;
                            }
                        </script>
                        <div class="button">
                            <button class="button btn_cancel" type="reset"> Cancel</button>
                            <input type="submit" class="button btn_save" value="Update" > 
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script src="jsadmin/jquery-1.11.1.min.js"></script>
        <script src="jsadmin/bootstrap.min.js"></script>
        <script src="jsadmin/chart.min.js"></script>
        <script src="jsadmin/chart-data.js"></script>
        <script src="jsadmin/easypiechart.js"></script>
        <script src="jsadmin/easypiechart-data.js"></script>
        <script src="jsadmin/bootstrap-datepicker.js"></script>
        <script src="jsadmin/custom.js"></script>
    </body>

</html>

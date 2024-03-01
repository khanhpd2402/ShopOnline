<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value = "vi_VN"/>
<!DOCTYPE html>
<html lang="en">


    <head>
        <!-- Required meta tags-->


        <!-- Title Page-->
        <title>Tables</title>
        <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
        <link rel="apple-touch-icon" href="images/apple-touch-icon.png">
        <!-- Fontfaces CSS-->
        <link href="vendor/fontawesome-all.min.css" rel="stylesheet" media="all">
        <!-- Main CSS-->
        <link href="css/theme.css" rel="stylesheet" media="all">
        <!--nav and sidebar-->
        <link href="cssadmin/bootstrap.min.css" rel="stylesheet">
        <link href="cssadmin/font-awesome.min.css" rel="stylesheet">
        <link href="cssadmin/datepicker3.css" rel="stylesheet">
        <link href="cssadmin/styles.css" rel="stylesheet">

        <link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous"/>

        <style>
            .table-data__tool-left {
                display: flex;
                align-items: center;
            }

            .rs-select2--light.rs-select2--md {
                margin-right: 10px;
            }

            .js-select2 {
                width: 200px;
                padding: 6px 10px;
                border-radius: 20px;
                border: 1px solid #ccc;
                font-size: 14px;
                outline: none;
            }

            .au-btn-filter {
                background-color: #67c2ef;
                color: #fff;
                border: none;
                padding: 8px 20px;
                border-radius: 20px;
                cursor: pointer;
                font-size: 14px;
            }

            .au-btn-filter:hover {
                background-color: #4faee8;
            }
            /*css table*/
            table {
                border-collapse: collapse;
                width: 100%;
            }

            th, td {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: left;
            }

            .hidden-column {
                display: none;
            }
        </style>
    </head>

    <body class="animsition">
        <%@include file="component/nav.jsp" %>
        <%@include file="component/sidebar.jsp" %>
        <div class="page-wrapper">
            <!-- PAGE CONTAINER-->
            <div class="page-container">
                <!-- MAIN CONTENT-->
                <div class="main-content">
                    <div class="section__content section__content--p30">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-md-12">
                                    <!-- DATA TABLE -->
                                    <h3 class="title-5 m-b-35">Lịch Sử Mua Hàng</h3>
                                    <div class="table-data__tool">
                                        <div class="table-data__tool-left">
                                            <form name="ff" action="manageorder" method="get"> 
                                                <div class="rs-select2--light rs-select2--md">

                                                    <select class="js-select2" name="status">
                                                        <option <c:if test="${requestScope.listConfirmationWaiting != null}">selected="selected"</c:if> value="1">Đang Chờ Xác Nhận</option>
                                                        <option <c:if test="${requestScope.listPrepare != null}">selected="selected"</c:if> value="2">Đang Chuẩn Bị Hàng</option>
                                                        <option <c:if test="${requestScope.listShipping != null}">selected="selected"</c:if> value="3">Đang Giao</option>
                                                        <option <c:if test="${requestScope.listComplete != null}">selected="selected"</c:if> value="4">Hoàn Thành</option>
                                                        <option <c:if test="${requestScope.listCanceled != null}">selected="selected"</c:if> value="5">Đã Hủy</option>
                                                        </select>
                                                        <div class="dropDownSelect2"></div>
                                                    </div>
                                                    <button class="au-btn-filter" type="submit"><i class="zmdi zmdi-filter-list"></i>Lọc</button>
                                                </form>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div class="row m-t-30">
                                <div class="col-md-12">
                                    <!-- DATA TABLE-->
                                    <div class="table-responsive m-b-40">

                                        <label for="columnSelector">Select columns to display:</label>
                                        <select id="columnSelector" multiple>
                                            <option value="OrderID" selected>Mã đơn hàng</option>
                                            <option value="OrderDate" selected>Ngày đặt hàng</option>
                                            <option value="Address">Địa Chỉ Nhận Hàng</option>
                                            <option value="UserID" selected>Mã khách hàng</option>
                                            <option value="Phone">SDT khách hàng</option>
                                            <option value="amountCoupon" selected>Giảm giá Voucher</option>
                                            <option value="OrderNote">Ghi chú</option>
                                            <option value="TotalMoney" selected>Thành Tiền</option>
                                            <option value="Detail" selected>Chi Tiết Đơn Hàng</option>
                                            <option value="Action" selected>Thay đổi</option>
                                        </select>                                        
                                        <table class="table table-borderless table-data3" id="orderTable">
                                            <thead>
                                                <tr>
                                                    <th id="OrderID">Mã đơn hàng</th>
                                                    <th id="OrderDate">Ngày đặt hàng</th>
                                                    <th id="Address">Địa Chỉ Nhận Hàng</th>
                                                    <th id="UserID">Mã khách hàng</th>
                                                    <th id="Phone">SDT khách hàng</th>
                                                    <th id="amountCoupon">Giảm giá Voucher</th>
                                                    <th id="OrderNote">Ghi chú</th>
                                                    <th id="TotalMoney">Thành Tiền</th>
                                                    <th id="Detail">Chi Tiết Đơn Hàng</th>
                                                    <th id="Action">Thay đổi</th>
                                                    <th id="Action">Thay đổi</th>

                                                </tr>
                                            </thead>
                                            <tbody>
                                                <!--Đang Chờ Xác Nhận-->

                                            <c:forEach items="${requestScope.listConfirmationWaiting}" var="l">
                                                <tr>
                                                    <td id="OrderID">${l.orderID}</td>
                                                    <td id="OrderDate">${l.orderDate}</td>
                                                    <td id="Address">${l.address}</td>
                                                    <td id="UserID">${l.userID}</td>
                                                    <td id="Phone">${l.phone}</td>
                                                    <td id="amountCoupon">${l.amountCoupon}</td>
                                                    <td id="OrderNote">${l.orderNote}</td>
                                                    <td id="Detail"><fmt:formatNumber type = "currency" value="${(l.totalMoney)}"/></td>
                                                    <td id="Detail"><a href="orderdetailmanage?orderID=${l.orderID}">Xem Chi Tiết</a></td>
                                                    <td id="Action">
                                                        <a href="manageorder?action=accept&orderID=${l.orderID}&status=1" class="process">XácNhận</a>
                                                    </td>
                                                    <td id="Action">
                                                        <a href="manageorder?action=cancel&orderID=${l.orderID}&status=5" class="denied">Hủy</a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            <!--Đang Chuẩn Bị-->
                                            <c:forEach items="${requestScope.listPrepare}" var="l">
                                                <tr>
                                                    <td id="OrderID">${l.orderID}</td>
                                                    <td id="OrderDate">${l.orderDate}</td>
                                                    <td id="Address">${l.address}</td>
                                                    <td id="UserID">${l.userID}</td>
                                                    <td id="Phone">${l.phone}</td>
                                                    <td id="amountCoupon">${l.amountCoupon}</td>
                                                    <td id="OrderNote">${l.orderNote}</td>
                                                    <td id="Detail"><fmt:formatNumber type = "currency" value="${(l.totalMoney)}"/></td>
                                                    <td id="Detail"><a href="orderdetailmanage?orderID=${l.orderID}">Xem Chi Tiết</a></td>
                                                    <td id="Action">
                                                        <a href="manageorder?action=transport&orderID=${l.orderID}&status=2" class="process">Xác Nhận Đã Giao Cho Đơn Vị Vận Chuyển</a>
                                                    </td>
                                                    <td id="Action">
                                                        <a href="manageorder?action=cancel&orderID=${l.orderID}&status=5" class="denied">Hủy</a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            <!--Đang Giao-->
                                            <c:forEach items="${requestScope.listShipping}" var="l">
                                                <tr>
                                                    <td id="OrderID">${l.orderID}</td>
                                                    <td id="OrderDate">${l.orderDate}</td>
                                                    <td id="Address">${l.address}</td>
                                                    <td id="UserID">${l.userID}</td>
                                                    <td id="Phone">${l.phone}</td>
                                                    <td id="amountCoupon">${l.amountCoupon}</td>
                                                    <td id="OrderNote">${l.orderNote}</td>
                                                    <td id="Detail"><fmt:formatNumber type = "currency" value="${(l.totalMoney)}"/></td>
                                                    <td id="Detail"><a href="orderdetailmanage?orderID=${l.orderID}">Xem Chi Tiết</a></td>
                                                    <td id="Action">
                                                        <a href="manageorder?action=done&orderID=${l.orderID}&status=3" class="process">Xác Nhận Hoàn Thành</a>
                                                    </td>
                                                    <td id="Action">
                                                        <a href="manageorder?action=cancel&orderID=${l.orderID}&status=5" class="denied">Hủy</a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            <!--Hoàn Thành-->
                                            <c:forEach items="${requestScope.listComplete}" var="l">
                                                <tr>
                                                    <td id="OrderID">${l.orderID}</td>
                                                    <td id="OrderDate">${l.orderDate}</td>
                                                    <td id="Address">${l.address}</td>
                                                    <td id="UserID">${l.userID}</td>
                                                    <td id="Phone">${l.phone}</td>
                                                    <td id="amountCoupon">${l.amountCoupon}</td>
                                                    <td id="OrderNote">${l.orderNote}</td>
                                                    <td id="Detail"><fmt:formatNumber type = "currency" value="${(l.totalMoney)}"/></td>
                                                    <td id="Detail"><a href="orderdetailmanage?orderID=${l.orderID}">Xem Chi Tiết</a></td>
                                                    <td id="Action"></td>
                                                    <td id="Action"></td>
                                                </tr>
                                            </c:forEach>
                                            <!--Đã Hủy-->

                                            <c:forEach items="${requestScope.listCanceled}" var="l">
                                                <tr>
                                                    <td id="OrderID">${l.orderID}</td>
                                                    <td id="OrderDate">${l.orderDate}</td>
                                                    <td id="Address">${l.address}</td>
                                                    <td id="UserID">${l.userID}</td>
                                                    <td id="Phone">${l.phone}</td>
                                                    <td id="amountCoupon">${l.amountCoupon}</td>
                                                    <td id="OrderNote">${l.orderNote}</td>
                                                    <td id="Detail"><fmt:formatNumber type = "currency" value="${(l.totalMoney)}"/></td>
                                                    <td id="Detail"><a href="orderdetailmanage?orderID=${l.orderID}">Xem Chi Tiết</a></td>
                                                    <td id="Action"></td>
                                                    <td id="Action"></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- END DATA TABLE-->
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <!-- Jquery JS-->
        <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
        <!-- Main JS-->
        <script src="js/jsordermanage/main.js"></script>

        <!--js nav and sidebar-->
        <script src="jsadmin/jquery-1.11.1.min.js"></script>
        <script src="jsadmin/bootstrap.min.js"></script>
        <script src="jsadmin/chart.min.js"></script>
        <script src="jsadmin/chart-data.js"></script>
        <script src="jsadmin/easypiechart.js"></script>
        <script src="jsadmin/easypiechart-data.js"></script>
        <script src="jsadmin/bootstrap-datepicker.js"></script>
        <script src="jsadmin/custom.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <script type="text/javascript">
            !(function (e, t, a) {
                function r() {
                    for (var e = 0; e < o.length; e++)
                        o[e].alpha <= 0
                                ? (t.body.removeChild(o[e].el), o.splice(e, 1))
                                : (o[e].y--,
                                        (o[e].scale += 0.004),
                                        (o[e].alpha -= 0.013),
                                        (o[e].el.style.cssText =
                                                "left:" +
                                                o[e].x +
                                                "px;top:" +
                                                o[e].y +
                                                "px;opacity:" +
                                                o[e].alpha +
                                                ";transform:scale(" +
                                                o[e].scale +
                                                "," +
                                                o[e].scale +
                                                ") rotate(45deg);background:" +
                                                o[e].color +
                                                ";z-index:99999"));
                    requestAnimationFrame(r);
                }
                function n(e) {
                    var a = t.createElement("div");
                    (a.className = "heart"),
                            o.push({el: a, x: e.clientX - 5, y: e.clientY - 5, scale: 1, alpha: 1, color: "rgb(" + ~~(255 * Math.random()) + "," + ~~(255 * Math.random()) + "," + ~~(255 * Math.random()) + ")"}),
                            t.body.appendChild(a);
                }
                var o = [];
                (e.requestAnimationFrame =
                        e.requestAnimationFrame ||
                        e.webkitRequestAnimationFrame ||
                        e.mozRequestAnimationFrame ||
                        e.oRequestAnimationFrame ||
                        e.msRequestAnimationFrame ||
                        function (e) {
                            setTimeout(e, 1e3 / 60);
                        }),
                        (function (e) {
                            var a = t.createElement("style");
                            a.type = "text/css";
                            try {
                                a.appendChild(t.createTextNode(e));
                            } catch (t) {
                                a.styleSheet.cssText = e;
                            }
                            t.getElementsByTagName("head")[0].appendChild(a);
                        })(
                        ".heart{width: 10px;height: 10px;position: fixed;background: #f00;transform: rotate(45deg);-webkit-transform: rotate(45deg);-moz-transform: rotate(45deg);}.heart:after,.heart:before{content: '';width: inherit;height: inherit;background: inherit;border-radius: 50%;-webkit-border-radius: 50%;-moz-border-radius: 50%;position: fixed;}.heart:after{top: -5px;}.heart:before{left: -5px;}",
                        ),
                        (function () {
                            var t = "function" == typeof e.onclick && e.onclick;
                            e.onclick = function (e) {
                                t && t(), n(e);
                            };
                        })(),
                        r();
            })(window, document);
        </script>
        <script>
            $(document).ready(function () {
                // Handle column selection change
                $('#columnSelector').change(function () {
                    var selectedColumns = $(this).val();

                    // Show/hide columns based on selection
                    $('#orderTable th, #orderTable td').each(function () {
                        var columnId = $(this).attr('id');
                        if (selectedColumns.includes(columnId)) {
                            $(this).removeClass('hidden-column');
                        } else {
                            $(this).addClass('hidden-column');
                        }
                    });
                });
            });
        </script>
    </body>
</html>
<!-- end document-->

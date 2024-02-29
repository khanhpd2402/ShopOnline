<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value = "vi_VN"/>
<html lang="en">
    <!-- Basic -->

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <!-- Mobile Metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Site Metas -->
        <title>Modernize</title>

        <!-- Site Icons -->
        <link rel="shortcut icon" href="resources/favicon1.png" type="image/png">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="css/csscart/bootstrap.min.css">
        <!-- Site CSS -->
        <link rel="stylesheet" href="css/csscart/style.css">
        <!-- Responsive CSS -->
        <link rel="stylesheet" href="css/csscart/responsive.css">
        <!-- Custom CSS -->
        <link rel="stylesheet" href="css/csscart/custom.css">
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
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
        <%--<%@include file="component/Analysis.jsp" %>--%>
    </head>

    <body>
        <%@include file="model/header.jsp" %>

        <!-- Start All Title Box -->
        <div class="all-title-box">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <h2>Checkout</h2>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="home">Home</a></li>
                            <li class="breadcrumb-item"><a href="cart">Cart</a></li>
                            <li class="breadcrumb-item active">Checkout</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- End All Title Box -->

        <!-- Start Cart  -->
        <div class="cart-box-main">
            <div class="container">
                <form class="needs-validation" name="fc" action="checkout" method="post" novalidate>
                    <div class="row">

                        <div class="col-sm-6 col-lg-6 mb-3">
                            <div class="checkout-address">
                                <div class="title-left">
                                    <h3>Hóa Đơn</h3>
                                </div>
                                <div class="row">
                                    <div class="row">
                                        <div class="col-md-6 mb-3">
                                            <label for="firstName">Họ</label>
                                            <input type="text" class="form-control" id="firstName" placeholder="" value="${requestScope.user.firstName}" readonly="">
                                            <div class="invalid-feedback"> Valid first name is required. </div>
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <label for="lastName">Tên</label>
                                            <input type="text" class="form-control" id="lastName" placeholder="" value="${requestScope.user.lastName}" readonly="">
                                            <div class="invalid-feedback"> Valid last name is required. </div>
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="lastName">Email</label>
                                        <input type="text" class="form-control" id="address" placeholder="" value="${requestScope.fullInfoUser.email}" readonly="">
                                        <div class="invalid-feedback"> Valid email is required. </div>
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label for="address">Số Điện Thoại</label>
                                    <input type="text" class="form-control" id="phone" name="phone" pattern="[0-9]{10}" title="Please enter a valid phone number." value="${requestScope.fullInfoUser.phone}" required="">
                                    <div class="invalid-feedback"> Please enter your shipping address. </div>
                                </div>
                                <div class="mb-3">
                                    <label for="address2">Địa Chỉ Nhận Hàng</label>
                                    <input type="text" class="form-control" id="address2" name="address" placeholder="" value="${requestScope.fullInfoUser.address}" required=""> </div>
                                <hr class="mb-4">
                                <div class="d-block my-3">
                                    <span>Phương Thức Thanh Toán</span> 
                                    <div class="custom-control custom-radio">
                                        <input id="credit" name="paymentMethod" value="2" type="radio" class="custom-control-input" checked="" required>
                                        <label class="custom-control-label" for="credit">Thanh Toán Trực Tuyến</label>
                                    </div>
                                    <div class="custom-control custom-radio">
                                        <input id="debit" name="paymentMethod" value="1" type="radio" class="custom-control-input" required>
                                        <label class="custom-control-label" for="debit">Thanh Toán Khi Nhận Hàng</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <div class="payment-icon">
                                            <ul>
                                                <li><img class="img-fluid" src="images/payment-icon/1.png" alt=""></li>
                                                <li><img class="img-fluid" src="images/payment-icon/2.png" alt=""></li>
                                                <li><img class="img-fluid" src="images/payment-icon/3.png" alt=""></li>
                                                <li><img class="img-fluid" src="images/payment-icon/5.png" alt=""></li>
                                                <li><img class="img-fluid" src="images/payment-icon/7.png" alt=""></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <hr class="mb-1"> 
                            </div>
                        </div>
                        <div class="col-sm-6 col-lg-6 mb-3">
                            <div class="row">
                                <div class="col-md-12 col-lg-12">
                                    <div class="odr-box">
                                        <div class="title-left">
                                            <h3>Sản Phẩm</h3>
                                        </div>
                                        <div class="rounded p-2 bg-light">
                                            <c:set var="o" value="${requestScope.cart}"/>
                                            <c:set var="total" value="0"/>
                                            <c:forEach items="${o.items}" var="i">
                                                <div class="media mb-2 border-bottom">
                                                    <div class="media-body"> 
                                                        <a href="productdetail?productID=${i.product.productID}">
                                                            ${i.product.productName}
                                                        </a>
                                                        <div class="small text-muted">Giá <fmt:formatNumber type="currency" value="${(i.product.salePrice) - (i.product.salePrice)*(i.product.discount)}"/> <span class="mx-2">|
                                                            </span> SL: ${i.quantity} <span class="mx-2">|
                                                            </span> Tổng: <fmt:formatNumber type="currency" value="${((i.product.salePrice) - (i.product.salePrice)*(i.product.discount))*i.quantity}"/></div>
                                                    </div>
                                                </div>
                                                <c:set var="total" value="${total + (((i.product.salePrice) - (i.product.salePrice)*(i.product.discount))*i.quantity)}"/>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12 col-lg-12">
                                    <div class="order-box">
                                        <div class="title-left">
                                            <h3>Chi Tiết Thanh Toán</h3>
                                        </div>

                                        <div class="d-flex">
                                            <h4>Tổng Tiền Hàng</h4>
                                            <div class="ml-auto font-weight-bold"> <fmt:formatNumber type="currency" value="${total}"/> </div>
                                        </div>
                                        <hr class="my-1"
                                            ><div class="d-flex align-items-center">
                                            <c:set var="cou" value="${requestScope.coupon}"/>
                                            <h4>Mã Ưu đãi</h4>
                                            <div class="ml-auto font-weight-bold"><h4><c:if test="${o.getTotalMoney() > 0}">${cou.code}</c:if>&nbsp;</h4></div>
                                                <h4>|</h4>
                                                <h4>Ưu đãi</h4>
                                            <c:if test="${not cou.type && o.getTotalMoney() > 0}">
                                                <input name="amountCoupon" value="${cou.value}" type="text" hidden="">
                                                <div class="ml-auto font-weight-bold">- <fmt:formatNumber type="currency" value="${cou.value}"/></div>
                                            </c:if>

                                            <c:if test="${cou.type && o.getTotalMoney() > 0}">
                                                <input name="amountCoupon" value="${o.getTotalMoney() * cou.value}" type="text" hidden="">
                                                <div class="ml-auto font-weight-bold">- <fmt:formatNumber type="currency" value="${total * cou.value}"/></div>
                                            </c:if>
                                        </div>

                                        <hr>
                                        <div id="totalPayment" class="d-flex gr-total">
                                            <h5>Tổng Thanh Toán</h5>
                                            <c:if test="${not cou.type && o.getTotalMoney() > 0 }">
                                                <div class="ml-auto h5"><input name="totalMoney" value="${o.getTotalMoney() - cou.value}" type="text" hidden=""><fmt:formatNumber type="currency" value="${total - cou.value}"/></div>
                                                </c:if>
                                                <c:if test="${cou.type && o.getTotalMoney() > 0}">
                                                <div class="ml-auto h5"> <input name="totalMoney" value="${o.getTotalMoney() - o.getTotalMoney() * cou.value}" type="text" hidden=""><fmt:formatNumber type="currency" value="${total - total * cou.value}"/></div>
                                                </c:if>
                                        </div>
                                        <hr> </div>
                                </div>
                                <div class="col-lg-6 col-sm-6">
                                    <div class="update-box">
                                        <input value="Đặt Hàng" type="submit">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
                <form name="f" action="checkout" method="post">
                    <c:if test="${requestScope.notiCoupon!=null}">
                        <h5 style="color: red">${requestScope.notiCoupon}</h5>
                    </c:if>
                    <div class="coupon-box">
                        <div class="input-group input-group-sm">
                            <div class="col-4">
                                <input name="code" class="form-control" placeholder="Nhập Mã Giảm Giá Của Bạn" aria-label="Coupon code" type="text">
                            </div>
                            <div class="col-4 input-group-append">
                                <input class="btn btn-theme" type="submit" value="Nhập">
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <hr>
        </div>
        <!-- End Cart -->
    </div>
    <%@include file="model/footer.jsp" %>

    <a href="#" id="back-to-top" title="Back to top" style="display: none;">&uarr;</a>

    <!-- ALL JS FILES -->
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- ALL PLUGINS -->
    <script src="js/jquery.superslides.min.js"></script>
    <script src="js/bootstrap-select.js"></script>
    <script src="js/inewsticker.js"></script>
    <script src="js/bootsnav.js."></script>
    <script src="js/images-loded.min.js"></script>
    <script src="js/isotope.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/baguetteBox.min.js"></script>
    <script src="js/form-validator.min.js"></script>
    <script src="js/contact-form-script.js"></script>
    <script src="js/custom.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</body>
</html>
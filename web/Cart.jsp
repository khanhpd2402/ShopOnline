
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
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <link rel="stylesheet" type="text/css" href="css/queries.css" />
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
                        <h2>Cart</h2>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="home">Home</a></li>
                            <li class="breadcrumb-item active">Cart</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- End All Title Box -->

        <!-- Start Cart  -->
        <div class="cart-box-main">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="table-main table-responsive">
                            <form name="f" action="" method="post"></form>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Images</th>
                                        <th>Product Name</th>
                                        <th>Discount</th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                        <th>Sub Total</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <c:set var="o" value="${requestScope.cart}"/>

                                    <c:forEach items="${o.items}" var="i">
                                        <tr>
                                            <td class="thumbnail-img">
                                                <a href="productdetail?productID=${i.product.productID}">
                                                    <img class="img-fluid" src="${i.product.productImg}" alt="" />
                                                </a>
                                            </td>
                                            <td class="name-pr">
                                                <a href="productdetail?productID=${i.product.productID}">
                                                    ${i.product.productName}
                                                </a>
                                            </td>
                                            <td class="remove-pr">
                                                <h6><fmt:formatNumber type="percent" value="${(i.product.discount)}"/></h6>
                                            </td>
                                            <td class="price-pr">
                                                <h6 style="color: red"><b><del class="text-muted"><fmt:formatNumber type="currency" value="${(i.product.salePrice)}"/></del></b></h6>
                                                <h6><fmt:formatNumber type="currency" value="${(i.product.salePrice) - (i.product.salePrice)*(i.product.discount)}"/></h6>
                                            </td>
                                            <td class="quantity-box"><input type="number" size="4" value="${i.quantity}" min="1" max="${i.product.quantity}" step="1" class="c-input-text qty text" onchange="updateQuantity('${i.product.productID}', this.value)"></td>
                                            <td class="total-pr">
                                                <h6><fmt:formatNumber type="currency" value="${((i.product.salePrice) - (i.product.salePrice)*(i.product.discount))*i.quantity}"/></h6>
                                            </td>
                                            <td class="remove-pr" style="text-align: center">
                                                <form name="fs" action="process" method="post">
                                                    <input type="submit" value="Remove"/>   
                                                    <input type="hidden" name="act" value="remove"/>
                                                    <input type="hidden" name="id" value="${i.product.getProductID()}"/>
                                                </form>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="row my-5">
                    <div class="col-lg-8 col-sm-12"></div>
                    <div class="col-lg-4 col-sm-12">
                        <div class="order-box">
                            <h2>Tổng Tiền Giỏ Hàng</h2>
                            <div class="d-flex">
                                <h4>Thành Tiền</h4>
                                <div class="ml-auto font-weight-bold"><fmt:formatNumber type="currency" value="${o.getTotalMoney()}"/></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 d-flex shopping-box"><a href="checkout" class="ml-auto btn hvr-hover">Checkout</a> </div>
                </div>

            </div>
        </div>
        <!-- End Cart -->

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
        <script>
                                                function updateQuantity(productID, quantity) {
                                                    document.f.action = "process?id=" + productID + "&num=" + quantity;
                                                    document.f.submit();
                                                }
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>

</html>
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
        <link rel="stylesheet" href="css/style_1.css">
        <!-- Responsive CSS -->
        <link rel="stylesheet" href="css/csscart/responsive.css">
        <!-- Custom CSS -->
        <link rel="stylesheet" href="css/csscart/custom.css">

        <!--FONTAWESOME-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer"/>
        <!-- CSS -->
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <link rel="stylesheet" type="text/css" href="css/queries.css" />
        <link rel="stylesheet" type="text/css" href="css/homepage.css" />
    </head>

    <body>
        <%@include file="model/header.jsp" %>

        <!-- Start All Title Box -->
        <div class="all-title-box">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <h2>Shop Detail</h2>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="shop">Shop</a></li>
                            <li class="breadcrumb-item active">Shop Detail </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- End All Title Box -->

        <!-- Start Shop Detail  -->
        <%  HttpServletRequest req = (HttpServletRequest) request; 
 String uri = req.getServletPath();%>
        <c:set value="${requestScope.data}" var="d"/>
        <div class="shop-detail-box-main">
            <div class="container">
                <div class="row">
                    <div class="col-xl-5 col-lg-5 col-md-6">
                        <div id="carousel-example-1" class="single-product-slider carousel slide" data-ride="carousel">
                            <div class="carousel-inner" role="listbox">
                                <div class="carousel-item active"> <img class="d-block w-100" src="${d.productImg}" alt="First slide"> </div>
                                <div class="carousel-item"> <img class="d-block w-100" src="${d.productImg}" alt="Second slide"> </div>
                                <div class="carousel-item"> <img class="d-block w-100" src="${d.productImg}" alt="Third slide"> </div>
                            </div>
                            <a class="carousel-control-prev" href="#carousel-example-1" role="button" data-slide="prev"> 
                                <i class="fa fa-angle-left" aria-hidden="true"></i>
                                <span class="sr-only">Previous</span> 
                            </a>
                            <a class="carousel-control-next" href="#carousel-example-1" role="button" data-slide="next"> 
                                <i class="fa fa-angle-right" aria-hidden="true"></i> 
                                <span class="sr-only">Next</span> 
                            </a>
                            <ol class="carousel-indicators">
                                <li data-target="#carousel-example-1" data-slide-to="0" class="active">
                                    <img class="d-block w-100 img-fluid" src="${d.productImg}" alt="" />
                                </li>
                                <li data-target="#carousel-example-1" data-slide-to="1">
                                    <img class="d-block w-100 img-fluid" src="${d.productImg}" alt="" />
                                </li>
                                <li data-target="#carousel-example-1" data-slide-to="2">
                                    <img class="d-block w-100 img-fluid" src="${d.productImg}" alt="" />
                                </li>
                            </ol>
                        </div>
                    </div>
                    <div class="col-xl-7 col-lg-7 col-md-6">
                        <div class="single-product-details">
                            <h2>${d.productName}</h2>
                            <h5> <c:if test="${d.discount > 0}">
                                    <del><fmt:formatNumber  type = "currency" value="${(d.salePrice)}"/></del> </c:if>&nbsp;
                                <fmt:formatNumber  type = "currency" value="${(d.salePrice) - (d.salePrice)*(d.discount)}"/></h5>
                            <p class="available-stock"><span>${d.quantity} Sản Phẩm Có Sẵn</span><p>
                            <h4>Chi Tiết Sản Phẩm:</h4>
                            <p>RAM: ${d.ram} | CPU: ${d.cpu} | Capacity: ${d.capacity} | Graphic Card: ${d.graphicCard} | Display: ${d.display}</p>
                            <ul>
                                <li>
                                    <div class="form-group size-st"></div>
                                    <label class="size-label"></label>
                                    <div class="price-box-bar">
                                        <div class="cart-and-bay-btn">
                                            <a class="btn hvr-hover" data-fancybox-close="" href="process?productID=${d.productID}&returnUrl=<%= uri %>"><i class="fas fa-shopping-cart"></i> Thêm Vào Giỏ Hàng</a

                                        </div>
                                    </div>
                                    </div>
                                </li>

                                <li>
                                    <div class="form-group size-st"></div>
                                    <label class="size-label"></label>
                                    <div class="add-comp">
                                        <a class="btn hvr-hover" href="#"><i class="fas fa-heart"></i> Thêm Vào Yêu Thích</a>
                                    </div>
                                </li>
                            </ul>

                            <div class="share-bar">
                                <a class="btn hvr-hover" href="#"><i class="fab fa-facebook" aria-hidden="true"></i></a>
                                <a class="btn hvr-hover" href="#"><i class="fab fa-google-plus" aria-hidden="true"></i></a>
                                <a class="btn hvr-hover" href="#"><i class="fab fa-twitter" aria-hidden="true"></i></a>
                            </div>
                        </div>
                    </div>

                </div>

                <hr>
                <div><h4 style="font-weight: bold;">Thông Số Sản Phẩm:</h4>
                    <p>${d.description}</p></div> 


                <div class="row my-5">
                    <div class="col-lg-12">
                        <div class="title-all text-center">
                            <h1>Sản Phẩm Tương Tự</h1>
                        </div>
                        <div class="featured-products-box owl-carousel owl-theme">
                            <c:forEach items="${requestScope.datal}" var="dc">
                                <div class="item">

                                    <div class="products-single fix">
                                        <div class="box-img-hover">
                                            <div class="type-lb">
                                                <c:if test="${dc.discount > 0}"><p class="sale">- ${dc.discount * 100}%</p></c:if>
                                                <c:if test="${dc.discount == 0}"><p class="new">New</p></c:if>
                                                </div>
                                                <img src="${dc.productImg}" class="img-fluid" alt="Image">
                                            <div class="mask-icon">
                                                <ul>
                                                    <li><a href="productdetail?productID=${dc.productID}" data-toggle="tooltip" data-placement="right" title="Chi Tiết"><i class="fas fa-eye"></i></a></li>
                                                    <li><a href="#" data-toggle="tooltip" data-placement="right" title="Thêm Vào Yêu Thích"><i class="far fa-heart"></i></a></li>
                                                </ul>
                                                <a class="cart" href="process?productID=${dc.productID}&returnUrl=<%= uri %>">Thêm Vào Giỏ Hàng</a>
                                            </div>
                                        </div>
                                        <div class="why-text">
                                            <h4>${dc.productName}</h4>
                                            <c:if test="${dc.discount > 0}">
                                                <h6 style="color: red"><del class="text-muted"><fmt:formatNumber  type = "currency" value="${(dc.salePrice)}"/> &nbsp;</del>
                                                    ̣(Tiết Kiệm: ${dc.discount * 100}%)̣</h6>
                                                </c:if>
                                            <h5><fmt:formatNumber  type = "currency" value="${(dc.salePrice) - (dc.salePrice)*(dc.discount)}"/></h5>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>

</html>
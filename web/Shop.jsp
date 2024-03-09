<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                        <h2>Shop</h2>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="home">Home</a></li>
                            <li class="breadcrumb-item active">Shop</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- End All Title Box -->

        <!-- Start Shop Page  -->
        <div class="shop-box-inner">
            <div class="container">
                <div class="row">
                    <div class="col-xl-3 col-lg-3 col-sm-12 col-xs-12 sidebar-shop-left">
                        <div class="product-categori">
                            <div class="search-product">
                                <form name="fs" action="shop">
                                    <input class="form-control" name="searchname" placeholder="Search here..." type="text">
                                    <button type="submit"> <i class="fa fa-search"></i> </button>
                                </form>
                            </div>
                            <form action="shop" method="">
                                <div class="filter-sidebar-left">
                                    <div class="title-left">
                                        <h3>Categories</h3>
                                    </div>
                                    <div class="list-group list-group-collapse list-group-sm list-group-tree" id="list-group-men" data-children=".sub-men">
                                        <div class="list-group-collapse sub-men">
                                            <input type="checkbox" name="category" value="" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <label>All</label>
                                        </div>
                                        <c:forEach items="${requestScope.dataAllc}" var="dac">
                                            <div class="list-group-collapse sub-men">
                                                <input type="checkbox" name="category" value="${dac.categoryId}"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <label>${dac.categoryName}</label>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                                <%
                                     String queryString = request.getQueryString();
    if (queryString != null && queryString.contains("&priceS=")) {
        queryString = queryString.replaceAll("&priceS=[1-2]+", "");
    }
                                %>
                                <%!
    public String removeSpace(String queryString) {
        if (queryString != null) {
            queryString = queryString.replace("%20", "").trim();
        }
        return queryString;
    }
                                %>
                                <%  HttpServletRequest req = (HttpServletRequest) request; 
 String uri = req.getServletPath();%>
                                <div class="filter-price-left">
                                    <div class="title-left">
                                        <h3>Price</h3>
                                    </div>
                                    <div class="price-box-slider">
                                        <div id="slider-range"></div>
                                        <p>
                                            <input type="text" id="amount" name="price" readonly style="border:0; color:#FF8C00; font-weight:bold;">
                                        </p>
                                    </div>
                                </div>
                                <div class="filter-brand-left">
                                    <div class="title-left">
                                        <h3>Brand</h3>
                                    </div>
                                    <div class="brand-box">
                                        <ul>
                                            <li>
                                                <div class="radio radio-danger">
                                                    <input name="brand " type="checkbox" value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <label>All</label>
                                                </div>
                                            </li>
                                            <c:forEach var="dab" items="${requestScope.dataAllb}">
                                                <li>
                                                    <div class="radio radio-danger">
                                                        <input name="brand" value="${dab.brandID}" type="checkbox">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                        <label>${dab.brandName}</label>
                                                    </div>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                                <button class="btn hvr-hover" type="submit" style="color: #000">Filter</button>
                            </form>
                        </div>
                    </div>
                    <div class="col-xl-9 col-lg-9 col-sm-12 col-xs-12 shop-content-right">
                        <div class="right-product-box">
                            <div class="product-item-filter row">
                                <div class="col-12 col-sm-8 text-center text-sm-left">
                                    <div class="toolbar-sorter-right">
                                        <span>Sort by </span>
                                        <div class="sort-price">
                                            <a href="shop?<% if (queryString != null) {%><%= removeSpace(queryString) %><%}%>&priceS=1">High Price &rarr; Low Price</a>
                                        </div>
                                        <div class="sort-price">
                                            <a href="shop?<% if (queryString != null) {%><%= removeSpace(queryString) %><%}%>&priceS=2">Low Price &rarr; High Price</a>
                                        </div>
                                    </div>
                                    <span>Show   <c:if test="${requestScope.listProductFilter == null && requestScope.listSearch == null}">all results</c:if> 
                                        <c:if test="${requestScope.listProductFilter != null}">${requestScope.listProductFilter.size()} results</c:if>
                                        <c:if test="${requestScope.listSearch != null}">${requestScope.listSearch.size()} results</c:if>
                                        </span>
                                    </div>
                                    <div class="col-12 col-sm-4 text-center text-sm-right">
                                        <ul class="nav nav-tabs ml-auto">
                                            <li>
                                                <a class="nav-link active" href="#grid-view" data-toggle="tab"> <i class="fa fa-th"></i> </a>
                                            </li>
                                            <li>
                                                <a class="nav-link" href="#list-view" data-toggle="tab"> <i class="fa fa-list-ul"></i> </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <!--all product-->

                            <c:if test="${requestScope.listSearch == null}">
                                <c:if test="${requestScope.listProductFilter == null}">
                                    <div class="row product-categorie-box" id="product-container">
                                        <div class="tab-content">
                                            <div role="tabpanel" class="tab-pane fade show active" id="grid-view">
                                                <div class="row">
                                                    <c:forEach var="da" items="${requestScope.dataAll}">
                                                        <div class="col-sm-6 col-md-6 col-lg-4 col-xl-4">
                                                            <div class="products-single fix">
                                                                <div class="box-img-hover">
                                                                    <div class="type-lb">
                                                                        <c:if test="${da.discount > 0}"><p class="sale">- ${da.discount * 100}%</p></c:if>
                                                                        <c:if test="${da.discount == 0}"><p class="new">New</p></c:if>
                                                                        </div>
                                                                        <img src="${da.productImg}" class="img-fluid" alt="${da.productName}">
                                                                    <div class="mask-icon">
                                                                        <ul>
                                                                            <li><a href="productdetail?productID=${da.productID}" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye"></i></a></li>
                                                                            <li><a href="#" data-toggle="tooltip" data-placement="right" title="Add to Wishlist"><i class="far fa-heart"></i></a></li>
                                                                        </ul>
                                                                        <a class="cart" href="process?productID=${da.productID}&returnUrl=<%= uri %>">Add to Cart</a>
                                                                    </div>
                                                                </div>
                                                                <div class="why-text">
                                                                    <h4>${da.productName}</h4>
                                                                    <fmt:setLocale value = "vi_VN"/>
                                                                    <c:if test="${da.discount > 0}">
                                                                        <h6 style="color: red"><b><del class="text-muted"><fmt:formatNumber  type = "currency" value="${(da.salePrice)}"/></del></b>
                                                                            <tt>̣(Save: ${da.discount * 100}%)</tt>̣</h6>
                                                                        </c:if>
                                                                    <h5><fmt:formatNumber  type = "currency" value="${(da.salePrice) - (da.salePrice)*(da.discount)}"/></h5>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                            <div role="tabpanel" class="tab-pane fade" id="list-view">
                                                <c:forEach var="da" items="${requestScope.dataAll}">

                                                    <div class="list-view-box">
                                                        <div class="row">
                                                            <div class="col-sm-6 col-md-6 col-lg-4 col-xl-4">
                                                                <div class="products-single fix">
                                                                    <div class="box-img-hover">
                                                                        <div class="type-lb">
                                                                            <c:if test="${da.discount > 0}"><p class="sale">- ${da.discount * 100}%</p></c:if>
                                                                            <c:if test="${da.discount == 0}"><p class="new">New</p></c:if>
                                                                            </div>
                                                                            <img src="${da.productImg}" class="img-fluid" alt="${da.productName}">
                                                                        <div class="mask-icon">
                                                                            <ul>
                                                                                <li><a href="productdetail?productID=${da.productID}" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye"></i></a></li>
                                                                                <li><a href="#" data-toggle="tooltip" data-placement="right" title="Add to Wishlist"><i class="far fa-heart"></i></a></li>
                                                                            </ul>

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-6 col-md-6 col-lg-8 col-xl-8">
                                                                <div class="why-text full-width">
                                                                    <h4>${da.productName}</h4>
                                                                    <fmt:setLocale value = "vi_VN"/>
                                                                    <c:if test="${da.discount > 0}">
                                                                        <h5 style="color: red"><b><del class="text-muted"><fmt:formatNumber  type = "currency" value="${(da.salePrice)}"/></del></b>
                                                                            <tt>̣(Save: ${da.discount * 100}%)</tt>̣</h5>
                                                                        </c:if>
                                                                    <h5><fmt:formatNumber  type = "currency" value="${(da.salePrice) - (da.salePrice)*(da.discount)}"/></h5>
                                                                    <p>RAM: ${da.ram} | CPU: ${da.cpu} | Capacity: ${da.capacity} | Graphic Card: ${da.graphicCard} | Display: ${da.display}</p>
                                                                    <a class="btn hvr-hover" href="process?productID=${da.productID}&returnUrl=<%= uri %>">Add to Cart</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>

                                            </div>
                                        </div>
                                    </div>
                                </c:if>


                                <!--filter product-->
                                <div class="row product-categorie-box" id="product-container">
                                    <div class="tab-content">
                                        <div role="tabpanel" class="tab-pane fade show active" id="grid-view">
                                            <div class="row">
                                                <c:forEach var="df" items="${requestScope.listProductFilter}">
                                                    <div class="col-sm-6 col-md-6 col-lg-4 col-xl-4">
                                                        <div class="products-single fix">
                                                            <div class="box-img-hover">
                                                                <div class="type-lb">
                                                                    <c:if test="${df.discount > 0}"><p class="sale">- ${df.discount * 100}%</p></c:if>
                                                                    <c:if test="${df.discount == 0}"><p class="new">New</p></c:if>
                                                                    </div>
                                                                    <img src="${df.productImg}" class="img-fluid" alt="${df.productName}">
                                                                <div class="mask-icon">
                                                                    <ul>
                                                                        <li><a href="productdetail?productID=${df.productID}" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye"></i></a></li>
                                                                        <li><a href="#" data-toggle="tooltip" data-placement="right" title="Add to Wishlist"><i class="far fa-heart"></i></a></li>
                                                                    </ul>
                                                                    <a class="cart" href="process?productID=${df.productID}&returnUrl=<%= uri %>">Add to Cart</a>
                                                                </div>
                                                            </div>
                                                            <div class="why-text">
                                                                <h4>${df.productName}</h4>
                                                                <fmt:setLocale value = "vi_VN"/>
                                                                <c:if test="${df.discount > 0}">
                                                                    <h6 style="color: red"><b><del class="text-muted"><fmt:formatNumber  type = "currency" value="${(df.salePrice)}"/></del></b>
                                                                        <tt>̣(Save: ${df.discount * 100}%)</tt>̣</h6>
                                                                    </c:if>
                                                                <h5><fmt:formatNumber  type = "currency" value="${(df.salePrice) - (df.salePrice)*(df.discount)}"/></h5>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>

                                        <div role="tabpanel" class="tab-pane fade" id="list-view">
                                            <c:forEach var="df" items="${requestScope.listProductFilter}">

                                                <div class="list-view-box">
                                                    <div class="row">
                                                        <div class="col-sm-6 col-md-6 col-lg-4 col-xl-4">
                                                            <div class="products-single fix">
                                                                <div class="box-img-hover">
                                                                    <div class="type-lb">
                                                                        <c:if test="${df.discount > 0}"><p class="sale">- ${df.discount * 100}%</p></c:if>
                                                                        <c:if test="${df.discount == 0}"><p class="new">New</p></c:if>
                                                                        </div>
                                                                        <img src="${df.productImg}" class="img-fluid" alt="${df.productName}">
                                                                    <div class="mask-icon">
                                                                        <ul>
                                                                            <li><a href="productdetail?productID=${df.productID}" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye"></i></a></li>
                                                                            <li><a href="#" data-toggle="tooltip" data-placement="right" title="Add to Wishlist"><i class="far fa-heart"></i></a></li>
                                                                        </ul>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-6 col-md-6 col-lg-8 col-xl-8">
                                                            <div class="why-text full-width">
                                                                <h4>${df.productName}</h4>
                                                                <fmt:setLocale value = "vi_VN"/>
                                                                <c:if test="${df.discount > 0}">
                                                                    <h5 style="color: red"><b><del class="text-muted"><fmt:formatNumber  type = "currency" value="${(df.salePrice)}"/></del></b>
                                                                        <tt>̣(Save: ${df.discount * 100}%)</tt>̣</h5>
                                                                    </c:if>
                                                                <h5><fmt:formatNumber  type = "currency" value="${(df.salePrice) - (df.salePrice)*(df.discount)}"/></h5>
                                                                <p>RAM: ${df.ram} | CPU: ${df.cpu} | Capacity: ${df.capacity} | Graphic Card: ${df.graphicCard} | Display: ${df.display}</p>
                                                                <a class="btn hvr-hover" href="process?productID=${df.productID}&returnUrl=<%= uri %>">Add to Cart</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                            <!--search product-->
                            <div class="row product-categorie-box" id="product-container">
                                <div class="tab-content">
                                    <div role="tabpanel" class="tab-pane fade show active" id="grid-view">
                                        <div class="row">
                                            <c:forEach var="ds" items="${requestScope.listSearch}">
                                                <div class="col-sm-6 col-md-6 col-lg-4 col-xl-4">
                                                    <div class="products-single fix">
                                                        <div class="box-img-hover">
                                                            <div class="type-lb">
                                                                <c:if test="${ds.discount > 0}"><p class="sale">- ${ds.discount * 100}%</p></c:if>
                                                                <c:if test="${ds.discount == 0}"><p class="new">New</p></c:if>
                                                                </div>
                                                                <img src="${ds.productImg}" class="img-fluid" alt="${ds.productName}">
                                                            <div class="mask-icon">
                                                                <ul>
                                                                    <li><a href="productdetail?productID=${ds.productID}" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye"></i></a></li>
                                                                    <li><a href="#" data-toggle="tooltip" data-placement="right" title="Add to Wishlist"><i class="far fa-heart"></i></a></li>
                                                                </ul>
                                                                <a class="cart" href="process?productID=${ds.productID}&returnUrl=<%= uri %>">Add to Cart</a>
                                                            </div>
                                                        </div>
                                                        <div class="why-text">
                                                            <h4>${ds.productName}</h4>
                                                            <fmt:setLocale value = "vi_VN"/>
                                                            <c:if test="${ds.discount > 0}">
                                                                <h6 style="color: red"><b><del class="text-muted"><fmt:formatNumber  type = "currency" value="${(ds.salePrice)}"/></del></b>
                                                                    <tt>̣(Save: ${ds.discount * 100}%)</tt>̣</h6>
                                                                </c:if>
                                                            <h5><fmt:formatNumber  type = "currency" value="${(ds.salePrice) - (ds.salePrice)*(ds.discount)}"/></h5>

                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                    <div role="tabpanel" class="tab-pane fade" id="list-view">
                                        <c:forEach var="ds" items="${requestScope.listSearch}">
                                            <div class="list-view-box">
                                                <div class="row">
                                                    <div class="col-sm-6 col-md-6 col-lg-4 col-xl-4">
                                                        <div class="products-single fix">
                                                            <div class="box-img-hover">
                                                                <div class="type-lb">
                                                                    <c:if test="${ds.discount > 0}"><p class="sale">- ${ds.discount * 100}%</p></c:if>
                                                                    <c:if test="${ds.discount == 0}"><p class="new">New</p></c:if>
                                                                    </div>
                                                                    <img src="${ds.productImg}" class="img-fluid" alt="${ds.productName}">
                                                                <div class="mask-icon">
                                                                    <ul>
                                                                        <li><a href="productdetail?productID=${ds.productID}" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye"></i></a></li>
                                                                        <li><a href="#" data-toggle="tooltip" data-placement="right" title="Add to Wishlist"><i class="far fa-heart"></i></a></li>
                                                                    </ul>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-6 col-md-6 col-lg-8 col-xl-8">
                                                        <div class="why-text full-width">
                                                            <h4>${ds.productName}</h4>
                                                            <fmt:setLocale value = "vi_VN"/>
                                                            <c:if test="${ds.discount > 0}">
                                                                <h5 style="color: red"><b><del class="text-muted"><fmt:formatNumber  type = "currency" value="${(ds.salePrice)}"/></del></b>
                                                                    <tt>̣(Save: ${ds.discount * 100}%)</tt>̣</h5>
                                                                </c:if>
                                                            <h5><fmt:formatNumber  type = "currency" value="${(ds.salePrice) - (ds.salePrice)*(ds.discount)}"/></h5>
                                                            <p>RAM: ${ds.ram} | CPU: ${ds.cpu} | Capacity: ${ds.capacity} | Graphic Card: ${ds.graphicCard} | Display: ${ds.display}</p>
                                                            <a class="btn hvr-hover" href="process?productID=${ds.productID}&returnUrl=<%= uri %>">Add to Cart</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                    <c:if test="${requestScope.notfound != null}">
                                        <div class="centered-message">
                                            <p><i class="fas fa-exclamation-circle"></i>${requestScope.notfound}</p>
                                        </div>
                                    </c:if>

                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Shop Page -->


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
        <script src="js/jquery-ui.js"></script>
        <script src="js/jquery.nicescroll.min.js"></script>
        <script src="js/form-validator.min.js"></script>
        <script src="js/contact-form-script.js"></script>
        <script src="js/custom.js"></script>

        <script async src="https://cse.google.com/cse.js?cx=553610216f3604cf3"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>

</html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value = "vi_VN"/>
<!DOCTYPE html>
<html lang="en">
    <head>
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
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/queries.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/homepage.css" />
        <title>Modernize</title>
    </head>
    <body>
        <%@include file="model/header.jsp" %>

        <!-- SLIDER -->
        <section class="slider">
            <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-indicators">
                    <c:forEach items="${cbanners}" var="cbanner" varStatus="i">
                        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="${i.index}" <c:if test="${i.index==0}"> class="active" aria-current="true"</c:if> aria-label="${cbanner.getTitle()}"></button>
                    </c:forEach>
                </div>
                <div class="carousel-inner">
                    <c:forEach items="${cbanners}" var="cbanner" varStatus="i">
                        <div class="carousel-item ${i.index==0?'active':''}">
                            <img src="${pageContext.request.contextPath}/resources/img/banner/${cbanner.getImg()}" class="d-block w-100" alt="..." />
                            <div class="carousel-caption d-none d-md-block text-center slider-text ">
                                <h3 style="color:white;">${cbanner.getTitle()}</h3>
                                <p style="color:white;">
                                    ${cbanner.getDesc()}
                                </p>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions"
                        data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions"
                        data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </section>
        <!-- Product -->
        <section class="product ">
            <div class="container">
                <div class="row">

                    <div class="title text-center">
                        <h4>New Product</h4>
                    </div>
                </div>
                <div class="row " style="width: 100%">
                    <form name="f" action="" method="post"></form>
                    <c:forEach var="o" items="${listProduct}">
                        <div class="col-md-3 mt-4" >
                            <div class="card card-custom h-100 shadow-sm"> <a href="productdetail?productID=${o.getProductID()}"><img src="${o.productImg}" class="card-img-top" alt="..."></a>
                                <div class="card-body">
                                    <div class="clearfix mb-3 text-center"> 
                                        <p class="currency  price-hp "><fmt:formatNumber type="currency" value="${o.salePrice}"/></p> 
                                    </div>
                                    <h5 class="card-title text-center">${o.getProductName()}</h5>
                                    <div class="text-center my-4"> <a href="productdetail?productID=${o.getProductID()}" class="btn btn-primary">Check offer</a> <input type="button" onclick="buy('${o.getProductID()}')"  value="Add to cart"/></div>
                                    <div class="text-center my-4">  </div>
                                    <!-- <div class="clearfix mb-1"> <span class="float-start"><i class="far fa-question-circle"></i></span> <span class="float-end"><i class="fas fa-plus"></i></span> </div> -->
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>

            </div>

        </section>


        <section class="brand mt-3 text-center pb-5">
            <div class="title text-center">
                <h4>Brands</h4>
            </div>
            <div class="container">
                <div class="d-flex justify-content-between align-items-center flex-wrap">
                    <div class="col ">
                        <img src="./resources/img/Brands/nike.png">
                    </div>
                    <div class="col">
                        <img src="./resources/img/Brands/dickies.png">
                    </div>
                    <div class="col">
                        <img src="./resources/img/Brands/h&m.png">
                    </div>
                    <div class="col">
                        <img src="./resources/img/Brands/champions.png">
                    </div>
                    <div class="col">
                        <img src="./resources/img/Brands/chanel.png">
                    </div>
                </div>
            </div>
        </section>

        <%@include file="model/footer.jsp" %>
        <!-- BOOTSTRAP5-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <!-- SCRIPT -->
        <script src="${pageContext.request.contextPath}/js/script.js"></script>
    </body>
    <script type="text/javascript">
                                        function buy(id) {
                                            document.f.action = "home?id=" + id;
                                            document.f.submit();
                                        }
    </script>  
</html>

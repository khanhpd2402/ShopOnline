<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value = "vi_VN"/>
<%@page import = "Model.*" %>
<%@page import= "java.util.*" %>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Lumino - Dashboard</title>
        <link href="cssadmin/bootstrap.min.css" rel="stylesheet">
        <link href="cssadmin/font-awesome.min.css" rel="stylesheet">
        <link href="cssadmin/datepicker3.css" rel="stylesheet">
        <link href="cssadmin/styles.css" rel="stylesheet">
        <link href="css/listproducts.css" rel="stylesheet">
        <link href="css/dropdown.css" rel="stylesheet">
        <!--Custom Font-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous"/>
        <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
        <![endif]-->
        <style>
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

    <body>
        <nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#sidebar-collapse"><span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span></button>
                    <a class="navbar-brand" href="#"><span>Lumino</span>Admin</a>
                    <ul class="nav navbar-top-links navbar-right">
                        <li class="dropdown"><a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                                <em class="fa fa-envelope"></em><span class="label label-danger">15</span>
                            </a>
                            <ul class="dropdown-menu dropdown-messages">
                                <li>
                                    <div class="dropdown-messages-box"><a href="profile.html" class="pull-left">
                                            <img alt="image" class="img-circle" src="http://placehold.it/40/30a5ff/fff">
                                        </a>
                                        <div class="message-body"><small class="pull-right">3 mins ago</small>
                                            <a href="#"><strong>John Doe</strong> commented on <strong>your photo</strong>.</a>
                                            <br /><small class="text-muted">1:24 pm - 25/03/2015</small></div>
                                    </div>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <div class="dropdown-messages-box"><a href="profile.html" class="pull-left">
                                            <img alt="image" class="img-circle" src="http://placehold.it/40/30a5ff/fff">
                                        </a>
                                        <div class="message-body"><small class="pull-right">1 hour ago</small>
                                            <a href="#">New message from <strong>Jane Doe</strong>.</a>
                                            <br /><small class="text-muted">12:27 pm - 25/03/2015</small></div>
                                    </div>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <div class="all-button"><a href="#">
                                            <em class="fa fa-inbox"></em> <strong>All Messages</strong>
                                        </a></div>
                                </li>
                            </ul>
                        </li>
                        <li class="dropdown"><a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                                <em class="fa fa-bell"></em><span class="label label-info"></span>
                            </a>
                            <ul class="dropdown-menu dropdown-alerts">
                                <li class="divider"></li>
                                <li><a href="#">
                                        <div><em class="fa fa-heart"></em> 12 New Likes
                                            <span class="pull-right text-muted small">4 mins ago</span></div>
                                    </a></li>
                                <li class="divider"></li>
                                <li><a href="#">
                                        <div><em class="fa fa-user"></em> 5 New Followers
                                            <span class="pull-right text-muted small">4 mins ago</span></div>
                                    </a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div><!-- /.container-fluid -->
        </nav>



        <div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
            <div class="profile-sidebar">
                <div class="profile-userpic">
                    <img src="" class="img-responsive" alt="">
                </div>
                <div class="profile-usertitle">
                    <div class="profile-usertitle-name"></div>
                    <div class="profile-usertitle-status"><span class="indicator label-success"></span>Online</div>
                </div>
                <div class="clear"></div>
            </div>
            <div class="divider"></div>
            <ul class="nav menu">
                <li class="active"><a href="productmanage"><em class="fa fa-dashboard">&nbsp;</em> Home</a></li>
                <li><a href="listod"><em class="fa fa-calendar">&nbsp;</em> Order Detail</a></li>
                <li><a href="guaranteeAdmin"><span class="icon"><i class="fas fa-shield-alt"></i></span> Guarantee</a></li>                
                <li><a href="addoldprod1.jsp"> <em class="fa fa-plus"></em> Add Old Product</a></li>
                <li><a href="addproduct"> <em class="fa fa-plus"></em> Add New Product</a></li>
                <li><a href="News.jsp"><em class="fa fa-clone">&nbsp;</em> News</a></li>              
                <li><a href="logout"><em class="fa fa-power-off">&nbsp;</em> Logout</a></li>
            </ul>
        </div><!--/.sidebar-->

        <div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
            <div class="row">
                <ol class="breadcrumb">
                    <li><a href="Home.jsp">
                            <em class="fa fa-home"></em>
                        </a></li>
                    <li class="active">Home</li>
                </ol>

            </div><!--/.row-->

            <div class="row">
                <div class="col-lg-6 row" style="display: inline-block;">
                    <form action="productmanage" method="post" > 
                        <div class="form-group col-lg-12 row " >
                            <input type="text" class="form-control"  name="search" placeholder="Search" style="height: 38px; width: 300px;" >                                     
                            <input type="submit"  value="Search" style="height: 38px; width: 100px;">  
                        </div>
                    </form>
                </div>

                <div class="col-lg-2" style="display: inline-block;">
                    <h2>Products</h2>
                </div>
                <div class="dropdown col-lg-2 row" style="display: inline-block; margin-left: 18%;">
                    <ul>
                        <li class="dropdown"><a class="dropdown-toggle count-info" data-toggle="dropdown" href="#"><span style="color: #000000"><c:if test="${requestScope.dataCategoryName == null}">ALL Product</c:if>${requestScope.dataCategoryName} &#9660;</span></a>
                            <ul class="dropdown-menu dropdown-alerts">
                                <li><a href="productmanage">ALL Product</a></li>
                                <c:forEach items="${requestScope.dataAllCategory}" var="dc">
                                    <li class="divider"></li>
                                    <li><a href="productmanage?cid=${dc.categoryId}">${dc.categoryName}</a></li>
                                    </c:forEach>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div><!--/.row-->



            <!--/.main-->
            <div class="row">
                <div class="tbl-header col-lg-12">
                    <label for="columnSelector">Select columns to display:</label>
                    <select id="columnSelector" multiple>
                        <option value="ProductID" selected>Product ID</option>
                        <option value="ProductName" selected>Product Name</option>
                        <option value="Description">Description</option>
                        <option value="OriginPrice" selected>Origin Price</option>
                        <option value="SalePrice" selected>Sale Price</option>
                        <option value="Discount">Discount</option>
                        <option value="ProductImg" selected>Product Image</option>
                        <option value="Quantity">Quantity</option>
                        <option value="ProductStatus" selected>Product Status</option>
                        <option value="BrandID">Brand ID</option>
                        <option value="CategoryID">Category ID</option>
                        <option value="CPU">CPU</option>
                        <option value="RAM">RAM</option>
                        <option value="Capacity">Capacity</option>
                        <option value="GraphicCard">Graphic Card</option>
                        <option value="Display">Display</option>
                        <option value="Action" selected>Action</option>
                    </select>

                    <table id="productTable">
                        <thead>
                            <tr>
                            <tr>
                                <th id="ProductID">Product ID</th>
                                <th id="ProductName">Product Name</th>
                                <th id="Description">Description</th>
                                <th id="OriginPrice">Origin Price</th>
                                <th id="SalePrice">Sale Price</th>
                                <th id="Discount">Discount</th>
                                <th id="ProductImg">Product Image</th>
                                <th id="Quantity">Quantity</th>
                                <th id="ProductStatus">Product Status</th>
                                <th id="BrandID">Brand ID</th>
                                <th id="CategoryID">Category ID</th>
                                <th id="CPU">CPU</th>
                                <th id="RAM">RAM</th>
                                <th id="Capacity">Capacity</th>
                                <th id="GraphicCard">Graphic Card</th>
                                <th id="Display">Display</th>
                                <th id="Action">Action</th>
                            </tr>
                            </tr>
                        </thead>
                        <tbody>
                            <c:if test="${requestScope.dataProductByCategory == null}">
                                <!-- danh sach tat ca product -->
                                <c:forEach items="${requestScope.dataAll}" var="da">
                                    <tr>
                                        <td id="ProductID" data-column="col1">${da.productID}</td>
                                        <td id="ProductName" data-column="col2">${da.productName}</td>
                                        <td id="Description" data-column="col3">${da.description}</td>
                                        <td id="OriginPrice" data-column="col4"><fmt:formatNumber type="currency" value="${da.originPrice}"/></td>
                                        <td id="SalePrice" data-column="col5"><fmt:formatNumber type="currency" value="${da.salePrice}"/></td>
                                        <td id="Discount" data-column="col6">${da.discount}</td>
                                        <td id="ProductImg" data-column="col7"><img class="imgbook" id="division" src="${da.productImg}" alt="" style="max-width: 60px; height: 60px;"></td>
                                        <td id="Quantity" data-column="col8">${da.quantity}</td>
                                        <c:if test="${da.productStatus == 1}"><td id="ProductStatus" data-column="col9">Active</td></c:if>
                                        <c:if test="${da.productStatus == 0}"><td id="ProductStatus" data-column="col9">De-Active</td></c:if>
                                        <td id="BrandID" data-column="col0">${da.brandID}</td>
                                        <td id="CategoryID" data-column="col11">${da.categoryID}</td>
                                        <td id="CPU" data-column="col12">${da.cpu}</td>
                                        <td id="RAM" data-column="col13">${da.ram}</td>
                                        <td id="Capacity" data-column="col14">${da.capacity}</td>
                                        <td id="GraphicCard" data-column="col15">${da.graphicCard}</td>
                                        <td id="Display" data-column="col16">${da.display}</td>
                                        <td id="Action" data-column="col17"><a href="updateproduct?productID=${da.productID}"><li class=" fa fa-pencil-square-o"></li></a></td>
                                    </tr>
                                </c:forEach>
                            </c:if>
                            <!-- danh sach theo category -->
                            <c:forEach items="${requestScope.dataProductByCategory}" var="da">
                                <tr>
                                    <td id="ProductID" data-column="col1">${da.productID}</td>
                                    <td id="ProductName" data-column="col2">${da.productName}</td>
                                    <td id="Description" data-column="col3">${da.description}</td>
                                    <td id="OriginPrice" data-column="col4"><fmt:formatNumber type="currency" value="${da.originPrice}"/></td>
                                    <td id="SalePrice" data-column="col5"><fmt:formatNumber type="currency" value="${da.salePrice}"/></td>
                                    <td id="Discount" data-column="col6">${da.discount}</td>
                                    <td id="ProductImg" data-column="col7"><img class="imgbook" id="division" src="${da.productImg}" alt="" style="max-width: 60px; height: 60px;"></td>
                                    <td id="Quantity" data-column="col8">${da.quantity}</td>
                                    <c:if test="${da.productStatus == 1}"><td id="ProductStatus" data-column="col9">Active</td></c:if>
                                    <c:if test="${da.productStatus == 0}"><td id="ProductStatus" data-column="col9">De-Active</td></c:if>
                                    <td id="BrandID" data-column="col0">${da.brandID}</td>
                                    <td id="CategoryID" data-column="col11">${da.categoryID}</td>
                                    <td id="CPU" data-column="col12">${da.cpu}</td>
                                    <td id="RAM" data-column="col13">${da.ram}</td>
                                    <td id="Capacity" data-column="col14">${da.capacity}</td>
                                    <td id="GraphicCard" data-column="col15">${da.graphicCard}</td>
                                    <td id="Display" data-column="col16">${da.display}</td>
                                    <td id="Action" data-column="col17"><a href="updateproduct?productID=${da.productID}"><li class=" fa fa-pencil-square-o"></li></a></td>
                                </tr>
                            </c:forEach>
                            <!-- danh sach tim kiem -->
                            <c:forEach items="${requestScope.listSearch}" var="da">
                                <tr>
                                    <td id="ProductID" data-column="col1">${da.productID}</td>
                                    <td id="ProductName" data-column="col2">${da.productName}</td>
                                    <td id="Description" data-column="col3">${da.description}</td>
                                    <td id="OriginPrice" data-column="col4"><fmt:formatNumber type="currency" value="${da.originPrice}"/></td>
                                    <td id="SalePrice" data-column="col5"><fmt:formatNumber type="currency" value="${da.salePrice}"/></td>
                                    <td id="Discount" data-column="col6">${da.discount}</td>
                                    <td id="ProductImg" data-column="col7"><img class="imgbook" id="division" src="${da.productImg}" alt="" style="max-width: 60px; height: 60px;"></td>
                                    <td id="Quantity" data-column="col8">${da.quantity}</td>
                                    <c:if test="${da.productStatus == 1}"><td id="ProductStatus" data-column="col9">Active</td></c:if>
                                    <c:if test="${da.productStatus == 0}"><td id="ProductStatus" data-column="col9">De-Active</td></c:if>
                                    <td id="BrandID" data-column="col0">${da.brandID}</td>
                                    <td id="CategoryID" data-column="col11">${da.categoryID}</td>
                                    <td id="CPU" data-column="col12">${da.cpu}</td>
                                    <td id="RAM" data-column="col13">${da.ram}</td>
                                    <td id="Capacity" data-column="col14">${da.capacity}</td>
                                    <td id="GraphicCard" data-column="col15">${da.graphicCard}</td>
                                    <td id="Display" data-column="col16">${da.display}</td>
                                    <td id="Action" data-column="col17"><a href="updateproduct?productID=${da.productID}"><li class=" fa fa-pencil-square-o"></li></a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <c:if test="${requestScope.notfound != null}">
                        <div class="centered-message">
                            <p><i class="fas fa-exclamation-circle"></i>${requestScope.notfound}</p>
                        </div>
                    </c:if>
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
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <script>
            $(document).ready(function () {
                // Handle column selection change
                $('#columnSelector').change(function () {
                    var selectedColumns = $(this).val();

                    // Show/hide columns based on selection
                    $('#productTable th, #productTable td').each(function () {
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

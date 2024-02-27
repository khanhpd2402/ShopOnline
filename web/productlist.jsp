<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Product</title>

        <!-- Custom fonts for this template -->
        <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
              rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="../css/sb-admin-2.min.css" rel="stylesheet">

        <!-- Custom styles for this page -->
        <link href="../vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

    </head>

    <body id="page-top">

        <!-- Page Wrapper -->
        <div id="wrapper">

            <!-- Sidebar -->
            <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

                <!-- Sidebar - Brand -->
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="#">
                    <div class="sidebar-brand-text mx-3">Marketing dashboard</div>
                </a>

                <!-- Divider -->
                <hr class="sidebar-divider my-0">

                <!-- Nav Item - Dashboard -->
                <li class="nav-item">
                    <a class="nav-link" href="#">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span>Dashboard</span></a>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider">

                <!-- Nav Item - Tables -->
                <li class="nav-item active">
                    <a class="nav-link" href="${pageContext.request.contextPath}/mkt/productlist">
                        <i class="fas fa-fw fa-table"></i>
                        <span>Product list</span></a>
                </li>


            </ul>
            <!-- End of Sidebar -->

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">
                    <!-- Topbar -->
                    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                        
                    </nav>
                    <!-- End of Topbar -->
                    <!-- Begin Page Content -->
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-sm-10">
                                <h1 class="h3 text-gray-800">Product List</h1>				
                            </div>
                            <div class="col-sm-2">
                                <%-- link to add form --%>
                                <a href="${pageContext.request.contextPath}/mkt/addproduct"  class="btn btn-success" > <span>Add New Product</span></a>					
                            </div>
                        </div>
                        <!-- Page Heading -->
                        

                        <!-- DataTales Example -->
                        <div class="card shadow ">

                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Name</th>
                                                <th>Image</th>
                                                <th>Category</th>
                                                <th>Discount</th>
                                                <th>Sale Price</th>
                                                <th>Price</th>
                                                <th>Status</th>
                                                <th>Detail</th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                            <%-- loop to get the list product by "listproduct" taken from servlet productlistcontroller --%>
                                            <c:forEach items="${requestScope.listproduct}" var="l">
                                                <tr>
                                                    <td>${l.productId}</td>             <%-- display product id --%>
                                                    <td>${l.productName}</td>           <%-- display product name --%>   
                                                    <td>    <%-- display product img --%>
                                                        <img src="../resources/img/product/${l.productImg}" alt="alt"  width="150px" height="150px"/>
                                                    </td>
                                                    <td>${l.category.categoryName}</td> <%-- get the category name --%>
                                                    <td>${l.discount}</td><%-- display product discount --%>
                                                    <%-- format money like 20,000,000 --%>
                                                    <td><fmt:formatNumber pattern="###,###,###" value="${l.salePrice}"/></td>   
                                                    <td><fmt:formatNumber pattern="###,###,###" value="${l.originPrice}"/></td>
                                                    <td>
                                                        <%-- if product status is true display green else inactive display red --%>
                                                        <c:choose>
                                                            <c:when test="${l.productStatus}">
                                                                <button style="padding: 10px;background-color: green;color: white">Active</button>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <button style="padding: 10px;background-color: red;color: white">Inactive</button>
                                                            </c:otherwise>
                                                        </c:choose>

                                                    </td>

                                                    <td>        <%-- detail button, pass product id to servlet --%>
                                                        <a href="${pageContext.request.contextPath}/mkt/productdetail?id=${l.productId}" class="edit">
                                                            <i class="far fa-edit"></i>
                                                        </a> 
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                    </div>
                    <!-- /.container-fluid -->

                </div>
                <!-- End of Main Content -->


            </div>
            <!-- End of Content Wrapper -->

        </div>
        <!-- End of Page Wrapper -->    
        <!-- Bootstrap core JavaScript-->
        <script src="../vendor/jquery/jquery.min.js"></script>
        <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="../js/sb-admin-2.min.js"></script>

        <!-- Page level plugins -->
        <script src="../vendor/datatables/jquery.dataTables.min.js"></script>
        <script src="../vendor/datatables/dataTables.bootstrap4.min.js"></script>

        <!-- Page level custom scripts -->
        <script src="../js/demo/datatables-demo.js"></script>

    </body>

</html>


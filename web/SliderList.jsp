

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page trimDirectiveWhitespaces="true" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1">
        <title>Manage Slider</title>
        <!-- Icon -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/favicon.ico" type="image/x-icon">
        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet"/>
        <!--BOOTSTRAP5-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/dataTables.bootstrap5.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/dashboard.css" />
        <!--FONTAWESOME-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <!--CSS-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/queries.css">
        <style>
            .addmore{
                color:silver;
            }
            .addmore:hover
            {
                color:black;
                transform: scale(1.3101);
                transition: all .2s;
            }

        </style>
    </head>
    <body>
        <div class="wrapper">
            <div id="content">
                <%@include file="model/SidebarMarketing.jsp" %>

                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-10">
                            <h2>List Slider</h2>
                        </div>
                        <div class="col-md-2">
                            <i class="fas fa-plus d-block text-center addmore" style="font-size: 25px;" data-bs-toggle="modal" data-bs-target="#addcbanner"></i>
                            <form method="post" action="${pageContext.request.contextPath}/mkt/slideradd" enctype="multipart/form-data">
                                <div class="modal fade" id="addcbanner" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="addcbanner" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="staticBackdropLabel" style="color:black;">Add Slider</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="mb-3 w-100">
                                                    <label for="formFile" class="form-label" style="display: none;">Banner Image</label>
                                                    <input class="form-control" name="newcbannerimage" type="file" id="formFile" required>
                                                </div>
                                                <div class="form-floating mb-3 w-100">
                                                    <input type="text" name="newcbannertitle" class="form-control" id="newcbannertitle" style="font-weight: normal ;color:black;" placeholder="Icon" required>
                                                    <label for="newcbannertitle" style="color:black;">Title</label>
                                                </div>
                                                <div class="form-floating mb-3 w-100">
                                                    <input type="text" name="newcbannerdesc" class="form-control" id="newcbannerdesc" style=" font-weight: normal ;color:black;" placeholder="Name" required>
                                                    <label for="newcbannerdesc" style="color:black;">Description</label>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                <input type="submit" class="btn btn-success" value="Add"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!-- CBanner -->
                    <div class="row">

                        <table class="table table-striped table-light table-hover">
                            <colgroup>
                                <col span="1" style="width: 5%;"/>
                                <col span="1" style="width: 30%;"/>
                                <col span="1" style="width: 15%;"/>
                                <col span="1" style="width: 30%;"/>
                                <col span="1" style="width: 10%;"/>
                            </colgroup>
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Image</th>
                                    <th scope="col">Title</th>
                                    <th scope="col">Description</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${cbanners}" var="cbanner" varStatus="i">
                                    <tr>
                                        <th scope="row">${i.count}</th>
                                        <td><img class="img-fluid img-thumbnail" style="width:100%" src="${pageContext.request.contextPath}/resources/img/banner/${cbanner.getImg()}"></td>
                                        <td>${cbanner.getTitle()}</td>
                                        <td>${cbanner.getDesc()}</td>
                                        <td>

                                            <div class="btn-group flex-warp" style="flex-wrap: wrap;">
                                                <button type="button" class="btn btn-warning white-text" data-bs-toggle="modal" data-bs-target="#edit${i.count}cbanner">
                                                    <i class="fas fa-edit"></i>
                                                </button>
                                                <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#delete${i.count}cbanner">
                                                    <i class="fas fa-trash-alt"></i>
                                                </button>
                                            </div>

                                            <%-- EDIT CBANNER --%>
                                            <form method="post" action="#" enctype="multipart/form-data">
                                                <div class="modal fade" id="edit${i.count}cbanner" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="edit${i.count}cbanner" aria-hidden="true">
                                                    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="staticBackdropLabel">Slider detail</h5>
                                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <input type="hidden" value="${cbanner.getId()}" name="editcbannerid">
                                                                <div class="mb-3 w-100">
                                                                    <input type="file" class="form-control" id="edit${i.count}cbannerimg" name="editcbannerimage" >
                                                                    <label for="edit${i.count}cbannerimg" style="display: none;">Image</label>
                                                                </div>
                                                                <div class="form-floating mb-3 w-100">
                                                                    <input type="text" class="form-control" id="edit${i.count}cbannertitle" placeholder="Name" style="color:black;" name="editcbannertitle" value="${cbanner.getTitle()}" required>
                                                                    <label for="edit${i.count}cbannertitle">Title</label>
                                                                </div>
                                                                <div class="form-floating mb-3 w-100">
                                                                    <input type="text" class="form-control" id="edit${i.count}cbannerdesc" placeholder="Name" style="color:black;" name="editcbannerdesc" value="${cbanner.getDesc()}" required>
                                                                    <label for="edit${i.count}cbannerdesc">Description</label>
                                                                </div>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                                <input type="submit" class="btn btn-warning white-text" value="Edit">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                            <%-- EDIT CBANNER --%>
                                            <%-- DELETE CBANNER --%>
                                            <div class="modal fade" id="delete${i.count}cbanner" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="delete1brand" aria-hidden="true">
                                                <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="staticBackdropLabel">Delete Slider</h5>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body">
                                                            Are you sure about this?
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                            <button type="button" class="btn btn-danger">
                                                                <a class="text-decoration-none text-white" href="#">Delete</a>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <%-- DELETE CBANNER --%>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>

                        </table>


                    </div>
                </div>

            </div>
        </div>                               
        <div class="overlay"></div>
        <!-- BOOTSTRAP5-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous" ></script>
        <!-- jQuery CDN -->
        <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
        <!-- Bootstrap Js CDN -->
        <!--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>-->
        <!-- jQuery Custom Scroller CDN -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>

        <script type="text/javascript">
            $(document).ready(function () {
                $("#sidebar").mCustomScrollbar({
                    theme: "minimal"
                });

                $('#dismiss, .overlay').on('click', function () {
                    $('#sidebar').removeClass('active');
                    $('.overlay').fadeOut();
                });

                $('#sidebarCollapse').on('click', function () {
                    $('#sidebar').addClass('active');
                    $('.overlay').fadeIn();
                    $('.collapse.in').toggleClass('in');
                    $('a[aria-expanded=true]').attr('aria-expanded', 'false');
                });
            });
        </script>


    </body>
</html>

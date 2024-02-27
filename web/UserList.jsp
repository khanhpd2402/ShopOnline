
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Manage User</title>
        <!--Boostrap-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <!--Font-->
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
        <!--Fontawesome-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
        <!--CSS-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/dashboard.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/queries.css">
        <!--ICON-->
        <link rel="shortcut icon" href="resources/favicon.ico" type="image/x-icon"> 
    </head>
    <body>
        <%@include file="model/Sidebar.jsp" %> 

        <div class="row">
            </br>
        </div >

        <h2 style="text-align: center; font-size: 50px">
            List User           
        </h2>

        <hr>

        <div class="container bootstrap snippets bootdey">
            <div class="row">
                <div class="col-lg-12">
                    <div class="main-box no-header clearfix">
                        <div class="main-box-body clearfix">
                            <div class="table-responsive p-5">
                                <table class="table user-list table-striped table-hover table-bordered">
                                    <thead>
                                        <tr>
                                            <th class="text-center"><span>ID</span></th>
                                            <th class="text-center"><span>UserName</span></th>
                                            <th class="text-center"><span>Email</span></th>
                                            <th class="text-center"><span>Gender</span></th>
                                            <th class="text-center"><span>Phone</span></th>
                                            <th class="text-center"><span>Role</span></th>
                                            <th class="text-center"><span>Action</span></th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${listUser}" var="o">
                                            <tr>
                                                <td class="text-center">${o.userID}</td>
                                                <td class="text-center">${o.userName}</td>
                                                <td class="text-center">${o.email}</td>
                                                <td class="text-center">
                                                    <c:if test="${o.isGender()==true}">Male</c:if>
                                                    <c:if test="${o.isGender()==false}">Female</c:if>
                                                </td>
                                                <td class="text-center">${o.phone}</td>
                                                <td class="text-center">
                                                    <c:if test="${o.roleID==1}">
                                                        <a href="#" class="btn btn-secondary btn-sm active" role="button" aria-pressed="true">Admin</a>
                                                    </c:if>
                                                    <c:if test="${o.roleID==2}">
                                                        <a href="#" class="btn btn-secondary btn-sm active" role="button" aria-pressed="true">Seller</a>
                                                    </c:if>
                                                    <c:if test="${o.roleID==3}">
                                                        <a href="#" class="btn btn-secondary btn-sm active" role="button" aria-pressed="true">Customer</a>
                                                    </c:if>
                                                    <c:if test="${o.roleID==4}">
                                                        <a href="#" class="btn btn-secondary btn-sm active" role="button" aria-pressed="true">Marketer</a>
                                                    </c:if>
                                                </td>
                                                <td style="width: 20%;" class="text-center">
                                                    <a href="#" class="table-link text-info">
                                                        <span class="fa-stack">
                                                            <i class="fa fa-square fa-stack-2x"></i>
                                                            <i class="fa fa-pencil fa-stack-1x fa-inverse"></i>
                                                        </span>
                                                    </a>
                                                    
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                <br><br>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            </br>
        </div>

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

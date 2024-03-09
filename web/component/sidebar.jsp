<%-- 
    Document   : sidebar.jsp
    Created on : Feb 29, 2024, 12:03:20 AM
    Author     : khanh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
            <div class="profile-sidebar">
                <div class="profile-userpic">
                    <img src="" class="img-responsive" alt="">
                </div>
                <div class="profile-usertitle">
                    <div class="profile-usertitle-name"></div>
                    <div class="profile-usertitle-status"><span class="indicator label-success"></span>${sessionScope.admininfo.adminName}</div>
                </div>
                <div class="clear"></div>
            </div>
            <div class="divider"></div>
            <ul class="nav menu">
                <li class="active"><a href="productmanage"><em class="fa-brands fa-product-hunt">&nbsp;</em> Product Manage</a></li>
                <li><a href="manageorder?status=1"><em class="fa fa-truck">&nbsp;</em> Order Manage</a></li>
                <li><a href="couponmanage"><em class="fa fa-ticket-alt">&nbsp;</em> Coupon Manage</a></li>
                <li><a href="#"> <em class="fa fa-user-plus"></em> Add New Admin</a></li>
                <li><a href="addproduct"> <em class="fa fa-plus"></em> Add New Product</a></li>
                <li><a href="addcoupon"> <em class="fa fa-plus-circle"></em> Add New Coupon</a></li>
                <li><a href="logout?logout=out"><em class="fa fa-power-off">&nbsp;</em> Logout</a></li>
            </ul>
        </div><!--/.sidebar-->
    </body>
</html>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %> 

<nav class="navbar main-navbar navbar-expand-lg navbar-light bg-light pt-0" id="navbar1">

    <div class="container-fluid bg-light">
        <!-- LOGO -->
        <a class="navbar-brand col-lg-2 offset-lg-2 logo" href="${pageContext.request.contextPath}/home">
            <img src="images/logo.png" width="180px"> 
        </a>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">

            <ul class="navbar-nav me-auto ms-auto">                

                <li class="nav-item">
                    <a class="nav-link" href="cart">
                        <i class="fas fa-shopping-cart"></i>

                    </a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="fas fa-user-circle">${sessionScope.userinfo.username}</i>
                    </a>

                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">

                        <c:if test="${empty sessionScope.userinfo}">
                            <!-- Hiển thị khi không có session username -->
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/login">Login/Register</a></li>
                            </c:if>

                        <c:if test="${not empty sessionScope.userinfo}">
                            <!-- Hiển thị khi có session username -->
                            <li><a class="dropdown-item" href="myorder?status=1">My Order</a></li>
                            <li><a class="dropdown-item" href="infouser">My Account</a></li>
                            <li><a class="dropdown-item" href="logout?logout=out">Logout</a></li>
                            </c:if>
                    </ul>                 
                </li>                              
            </ul>
        </div>
    </div>
</nav>

<!-- SECONDARY NAVBAR -->
<nav id="navbar2" class="navbar navbar-expand-lg navbar-dark bg-dark d-none d-lg-block p-1">
    <div class="container-fluid">
        <ul class="navbar-nav offset-2 me-auto mb-2 mb-lg-0">
            <li class="nav-item me-4">
                <a class="nav-link" aria-current="page" href="${pageContext.request.contextPath}/home">Home</a>
            </li>

            <li class="nav-item me-4">
                <a class="nav-link" aria-current="page" href="shop">Products</a>
            </li>
            <li class="nav-item me-4">
                <a class="nav-link" href="#footer">About Us</a>
            </li>
        </ul>
    </div>
</nav>
<%-- NAV --%>

<%-- Top Btn --%>
<button onclick="topFunction()" id="myTBTN" title="Go to top"><i class="fas fa-arrow-up"></i></button>
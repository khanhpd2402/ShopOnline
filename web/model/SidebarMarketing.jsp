
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<nav id="sidebar">
    <div id="dismiss">
        <i class="fas fa-arrow-left"></i>
    </div>

    <div class="sidebar-header">
        <h3>Shopee</h3>
    </div>

    <ul class="list-unstyled components">
        <p>Marketing</p>
        <li>
            <a href="${pageContext.request.contextPath}/home">Home
                <i class="bi bi-house float-end"></i>
            </a>

        </li>
        <li>
            <a href="${pageContext.request.contextPath}/mkt/dashboard">Dashboard&nbsp;<i class="fas fa-chart-line"></i></a>
            <a href="${pageContext.request.contextPath}/mkt/banner">Manage Slider&nbsp;<i class="fab fa-adversal"></i></a>
        </li>
    </ul>

    <ul class="list-unstyled CTAs">
        <li><a href="${pageContext.request.contextPath}/logout" class="download">Log out</a></li>
    </ul>
</nav>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" id="sidebarCollapse" class="btn btn-info navbar-btn">
                <i class="glyphicon glyphicon-align-left"></i>
                <span>Shopee</span>
            </button>
        </div>
    </div>
</nav>

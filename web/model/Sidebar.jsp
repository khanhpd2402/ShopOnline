
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
        <p class="fw-bold">Dashboard Manager</p>
        <li>
            <a href="home">Home
                <i class="bi bi-house float-end"></i>
            </a>

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
                <span>Dashboard</span>
            </button>
        </div>
    </div>
</nav>

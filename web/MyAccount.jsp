<%-- 
    Document   : MyAccount
    Created on : Jun 2, 2023, 5:22:56 PM
    Author     : win
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import = "Context.*" %>
<%@page import = "Model.*" %>
<%@page import= "java.util.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">
        <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>
        <link type="text/css" rel="stylesheet" href="css/slick.css"/>
        <link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>
        <link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>
        <link href="cssadmin/bootstrap.min.css" rel="stylesheet">
        <link href="cssadmin/font-awesome.min.css" rel="stylesheet">
        <link href="cssadmin/datepicker3.css" rel="stylesheet">
        <link href="cssadmin/styles.css" rel="stylesheet">
        <link href="cssadmin/myaccount.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous"/>

        <!--Font Awesome Icon--> 
        <link rel="stylesheet" href="css/font-awesome.min.css">

        <!-- Custom stlylesheet -->
        <link type="text/css" rel="stylesheet" href="css/style.css"/>
        <link href="css/style1.css" rel="stylesheet">
        <title>JSP Page</title>
    </head>
    <%
        SupplierDAO supDao = new SupplierDAO();
        List<Supplier> supList = supDao.getAllSupplier();
        List<Cart> carts = new ArrayList<>();
        if (session.getAttribute("Cart") != null) {
            carts = (List<Cart>) session.getAttribute("Cart");
        }
        Account acc = (Account) session.getAttribute("acc");
        Account acct = (Account) session.getAttribute("acct");
    %>
    <body>
        <nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
            <div class="container-fluid">
                <div class="navbar-header">

                    <div id="">

                        <div class="container">
                            <ul class="header-links pull-left">
                                <li><a href="#"><i class="fa fa-phone"></i> +021-95-51-84</a></li>
                                <li><a href="#"><i class="fa fa-envelope-o"></i> email@email.com</a></li>
                                <li><a href="#"><i class="fa fa-map-marker"></i> 1734 Stonecoal Road</a></li>
                            </ul>
                            <ul class="header-links pull-right">
                                <c:if test="${sessionScope.acc != null}">
                                    <li><a href="logout"><i class="fa fa-user-o"></i> Logout</a></li>
                                </c:if>
                                <c:if test="${sessionScope.acct != null}">
                                    <li><a href="manager"><i class="fa fa-user-o"></i> Manager</a></li>
                                </c:if> 
                                <c:choose>
                                    <c:when test="${sessionScope.acc != null}">
                                        <li><a href="myaccount"><i class="fa fa-user-o"></i>${acc.fname} ${acc.lname}</a></li>
                                    </c:when>
                                    <c:otherwise>
                                            <li><a href="myaccount"><i class="fa fa-user-o"></i> My Account</a></li>
                                    </c:otherwise>
                                </c:choose>
                            </ul>                           
                        </div>        
                    </div>

                </div>
            </div><!-- /.container-fluid -->
        </nav>

        <header>
        </header>

        <!--END HEADER-->
        <%
            Account3 a = new Account3();
            Account3 ac = a.getAccountByAcId(acc.getAcId());
            String text = (String) request.getAttribute("text");
            if (text == null) text ="";
        %>
        <div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
            <div class="profile-sidebar">
                <div class="profile-userpic">
                    <img src="<%= ac.getAccimg()%>" class="img-responsive" alt="">
                </div>
                <div class="profile-usertitle">
                    <div class="profile-usertitle-name"><%= ac.getFname() +" "+ ac.getLname()%></div>
                    <div class="profile-usertitle-status"><span class="indicator label-success"></span>Online</div>
                </div>
                <div class="clear"></div>
            </div>
            <div class="divider"></div>
            <!--            <form role="search">
                            <div class="form-group ">
                                <input type="text" class="form-control col-lg-10" placeholder="Search">
                            </div>
                            <div>
                                <input type="submit"  value="Search">
                            </div>
                        </form>-->
            <ul class="nav menu">
                <li class="active"><a href="myaccount"><em class="fa fa-calendar">&nbsp;</em> My Profile</a></li>
                <li><a href="myorder?accId=${sessionScope.accId}&viewOrder=1"><i class="fa fa-user-o"></i> My Order</a></li>
                <li><a href="home"><em class="fa fa-home"></em> Home</a></li>                                              
                 <li><a href="GuaranteeCustomer.jsp"><span class="icon"><i class="fas fa-shield-alt"></i></span> Guarantee</a></li>
                <li><a href="panels.html"><em class="fa fa-clone">&nbsp;</em> Alerts &amp; Panels</a></li>               
                <li><a href="logout"><em class="fa fa-power-off">&nbsp;</em> Logout</a></li>
            </ul>
        </div>

        <div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
            <form action="myaccount" method="post" enctype="multipart/form-data">
                <div class="row">
                    <div class="container">
                        <div class="col-lg-12 gutters">
                            <div class="col-lg-6" style="margin-top: 50px;">
                                <div class="card h-100">
                                    <div class="card-body">
                                        <div class="account-settings">
                                            <div class="user-profile">
                                                <div class="user-avatar">
                                                    <img src="<%= ac.getAccimg()%>" id="preview" alt="<%= ac.getFname() +" "+ ac.getLname()%>">
                                                    <input type="file" name="accimg" onchange="showImage(this);" style="margin: 5% 35%; ">
                                                    <script>
                                                        // Hàm này sẽ được gọi khi người dùng chọn file ảnh
                                                        function showImage(input) {
                                                            // Kiểm tra xem input có chứa file hay không
                                                            if (input.files && input.files[0]) {
                                                                // Tạo một đối tượng FileReader để đọc nội dung của file
                                                                var reader = new FileReader();
                                                                // Định nghĩa hàm onload cho đối tượng FileReader
                                                                reader.onload = function (e) {
                                                                    // Lấy đối tượng img theo id
                                                                    var img = document.getElementById("preview");
                                                                    // Gán nội dung của file cho thuộc tính src của img
                                                                    img.src = e.target.result;
                                                                    // Thay đổi kích thước của img nếu cần
                                                                    img.width = 245;
                                                                    img.height = 160;
                                                                    var fileName = input.files[0].name;
                                                                    document.getElementById("filename").value = "images/" + fileName;

                                                                };
                                                                // Đọc nội dung của file dưới dạng URL
                                                                reader.readAsDataURL(input.files[0]);
                                                            }
                                                        }
                                                    </script>
                                                </div>                                                    
                                                <h5 class="user-name"><%= ac.getFname() +" "+ ac.getLname()%></h5>
                                                <h6 class="user-email"><%= ac.getEmail()%></h6>
                                            </div>
                                            <div class="about">
                                                <h5>About</h5>
                                                <p></p>
                                            </div>
                                        </div>                                      
                                        <div>
                                            <% String msg1 = (String) request.getAttribute("msg1");
                                            String msg2 = (String) request.getAttribute("msg2");
                                            if(msg1 != null){%>
                                            <h5 style="margin: 2% 35%; color: green;"><%= msg1%></h5><%}%>
                                            <% if(msg2 != null){%>
                                            <h5 style="margin: 2% 35%; color: red;"><%= msg2%></h5><%}%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6" style="margin-top: 50px;">
                                <div class="card h-100">
                                    <div class="card-body">
                                        <div class="row gutters">
                                            <div class="col-lg-12">
                                                <h6 class="mb-2 text-primary">Personal Details</h6>
                                            </div>
                                            <div class=" col-lg-6 ">
                                                <div class="form-group">
                                                    <label for="fullName">First Name</label>
                                                    <input type="text" class="form-control" name="fname" value="<%= ac.getFname()%>" style="width: 100%;">
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <label for="lname">Last Name</label>
                                                    <input type="text" class="form-control" name="lname" value="<%= ac.getLname()%>" style="width: 100%;">
                                                </div>
                                            </div>
                                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                <div class="form-group">
                                                    <label for="phone">Phone</label>
                                                    <input type="text" class="form-control" name="phone" value ="<%= ac.getPhone()%>" style="width: 100%;">
                                                </div>
                                            </div>
                                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                <div class="form-group">
                                                    <label for="website">Email</label>
                                                    <input type="email" class="form-control" name="email" value="<%= ac.getEmail()%>" style="width: 100%;">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row gutters">
                                            <div class="col-lg-12 ">
                                                <h6 class="mt-3 mb-2 text-primary">Address</h6>
                                            </div>
                                            <div class="col-lg-12">
                                                <div class="form-group">
                                                    <!--                                                    <label for="Street">Street</label>-->
                                                    <input type="name" class="form-control" name="address" value="<%= ac.getAddress()%>" style="width: 100%;">
                                                </div>
                                            </div>                                                                                         
                                        </div>

                                        <div class="row gutters">
                                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                                <div class="text-right">
                                                    <button type="button" class="btn btn-secondary col-lg-3" style="margin-left: 20%;">Cancel</button>
                                                    <input type="submit" value="Save Change" name="submit" class="btn btn-primary col-lg-3" style="margin-left: 10%;">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <div class="col-lg-12 row">
                <div class="col-lg-6" style="border: 1px solid white; background-color: whitesmoke">
                    <p>Pass Word</p>
                    <ul class="list">
                        <li class="flex">
                            <div class="flex">
                                <picture>
                                    <img src="images/ic-lock.png" alt="alt" style="width: 2rem; height: 2rem;">
                                </picture>
                                <span style="margin-top: 0.2rem;">*********</span>
                            </div>
                            <a href="#" class="button-edit flex" onclick="togglePasswordForm()">
                                <span>Edit</span>
                            </a>
                        </li>
                        <%if(text != null &&  !text.contains("not")){%>
                        <p style="color: green;"><%= text%></p>
                        <%}else{%>
                        <p style="color: red;"><%= text%></p><%}%>
                    </ul>
                </div>
            </div>
            <%
                String msg = (String) request.getAttribute("msg");
                String pass = (String) request.getAttribute("pass");                                      
                String mess = (String) request.getAttribute("mess");
                if(pass == null ) pass="";
            %>        
            <script>
                var msg = "<%= msg %>"; // Lấy giá trị của msg từ request attribute

                window.onload = function () {
                    var passwordForm = document.getElementById("password-form");
                    if (msg !== "null" && msg === "") {
                        passwordForm.style.display = "block";
                    } else {
                        passwordForm.style.display = "none";
                    }
                };
            </script>
            <div id="password-form" class="password-form col-lg-12" style="display: none;margin: 2% 15%;">
                <div class="modal-content">
                    <form action="changepass" method="post" style="background: #ffffff;">

                        <h5> New Pass Word</h5>
                        <input type="password" name="newpass" class="input-change" id="newpass" value="<%= pass%>" oninput="validatePassword()" required><br>
                        <ul style="font-size: 10px;">
                            <li id="lower-case" style="color: red;">contain at least one uppercase or lowercase character </li>
                            <li id="number-length" style="color: red;">contains at least one number or least 8 character</li>
                            <li id="special-char" style="color: red;">contain at least 1 special character</li>
                        </ul>
                        <h5> ReEnter Pass Word</h5>
                        <input type="password" name="repass" class="input-change" id="repass" value="<%= pass%>" oninput="checkReEnterPass()" required><br>
                        <p id="checkpass" style="color: red;font-size: 10px;"></p>
                        <h5>Verification</h5>
                        <input type="text" name="code" class="input-send" required>
                        <a href="#" class="button-send" onclick="sendRequest()" style="height: 3.5rem;  width: 10rem;">
                            <span>Send</span>
                        </a>
                        <span id="countdown"></span>
                        <% if(mess != null){%>
                        <p style="color: red;font-size: 10px;"><%= mess%></p>
                        <%}%>
                        <input type="submit" id="saveButton"  style="height: 3.5rem; width: 9rem;" value="Save" disabled>
                    </form>
                </div>
            </div>
            <script>
                function togglePasswordForm() {
                    var passwordForm = document.getElementById("password-form");
                    if (passwordForm.style.display === "none") {
                        passwordForm.style.display = "block";
                    } else {
                        passwordForm.style.display = "none";
                    }
                }
            </script>
            <script>
                var isValid = false;
                var saveButton = document.getElementById("saveButton");
                function validatePassword() {
                    var password = document.getElementById("newpass").value;
                    var lowercaseRegex = /[a-z]/;
                    var uppercaseRegex = /[A-Z]/;
                    var numberRegex = /[0-9]/;
                    var specialCharRegex = /[!@#$%^&*(),.?":{}|<>]/;

                    // Kiểm tra mật khẩu có chứa ký tự viết thường hoặc viết hoa không
                    if (password.match(lowercaseRegex) && password.match(uppercaseRegex)) {
                        document.getElementById("lower-case").style.color = "green";
                    } else {
                        document.getElementById("lower-case").style.color = "red";
                    }

                    // Kiểm tra mật khẩu có chứa số hoặc ít nhất 8 ký tự không
                    if (password.length >= 8 && password.match(numberRegex)) {
                        document.getElementById("number-length").style.color = "green";
                    } else {
                        document.getElementById("number-length").style.color = "red";
                    }

                    // Kiểm tra mật khẩu có chứa ký tự đặc biệt không
                    if (password.match(specialCharRegex)) {
                        document.getElementById("special-char").style.color = "green";
                    } else {
                        document.getElementById("special-char").style.color = "red";
                    }
                    if (password.match(lowercaseRegex) && password.match(uppercaseRegex) && password.length >= 8 && password.match(numberRegex)
                            && password.match(specialCharRegex)) {
                        isValid = true;
                    }
                    checkReEnterPass();
                }
                function checkReEnterPass() {
                    var repass = document.getElementById("repass").value;
                    var newpass = document.getElementById("newpass").value;
                    var isValid2 = false;
                    if (repass !== newpass) {
                        document.getElementById("checkpass").textContent = "ReEnter Password do not match";
                        isValid2 = false;
                    } else {
                        document.getElementById("checkpass").textContent = "";
                        isValid2 = true;
                    }
                    saveButton.disabled = !(isValid && isValid2);
                }
                var canClick = true;
                var waitTime = 60000; // 60 giây
                var countdownInterval;
                var sendRequestExecuted = false;
                function sendRequest() {
                    if (sendRequestExecuted) {
                        return; // Ngăn hàm được gọi lại trong thời gian đếm ngược
                    }

                    sendRequestExecuted = true;

                    var url = "sendcode"; // Thay thế "servlet-url" bằng URL của servlet bạn muốn gửi yêu cầu đến

                    fetch(url, {
                        method: "GET"
                    })
                            .then(function (response) {
                                // Xử lý phản hồi từ servlet (nếu cần)
                            })
                            .catch(function (error) {
                                // Xử lý lỗi (nếu có)
                            });
                    if (canClick) {
                        canClick = false;
                        var countdownElement = document.getElementById("countdown");
                        countdownElement.style.display = "block";

                        countdownInterval = setInterval(function () {
                            updateCountdown();
                        }, 1000);

                        setTimeout(function () {
                            enableSendButton();
                        }, waitTime);
                    }
                }

                function enableSendButton() {
                    canClick = true;
                    clearInterval(countdownInterval);
                    updateCountdown();
                    sendRequestExecuted = false;
                    // Hiển thị lại button send
                    var sendButton = document.getElementsByClassName("button-send")[0];
                    sendButton.style.display = "inline-block";
                }

                function updateCountdown() {
                    var countdownElement = document.getElementById("countdown");
                    var secondsLeft = Math.floor(waitTime / 1000);

                    countdownElement.textContent = secondsLeft + "s";

                    if (secondsLeft <= 0) {
                        countdownElement.style.display = "none";

                        // Ẩn button send
                        var sendButton = document.getElementsByClassName("button-send")[0];
                        sendButton.style.display = "none";
                    } else {
                        waitTime -= 1000;
                    }
                }


            </script>


            <script src="jsadmin/jquery-1.11.1.min.js"></script>
            <script src="jsadmin/bootstrap.min.js"></script>
            <script src="jsadmin/chart.min.js"></script>
            <script src="jsadmin/chart-data.js"></script>
            <script src="jsadmin/easypiechart.js"></script>
            <script src="jsadmin/easypiechart-data.js"></script>
            <script src="jsadmin/bootstrap-datepicker.js"></script>
            <script src="jsadmin/custom.js"></script>
    </body>
</html>

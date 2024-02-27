<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "Model.*" %>
<%@page import= "java.util.*" %>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Lumino - Dashboard</title>
        <link href="cssadmin/bootstrap.min.css" rel="stylesheet">
        <link href="cssadmin/font-awesome.min.css" rel="stylesheet">
        <link href="cssadmin/datepicker3.css" rel="stylesheet">
        <link href="cssadmin/styles.css" rel="stylesheet">
        <link href="cssadmin/newproduct.css" rel="stylesheet">
        <link href="cssadmin/dropdown.css" rel="stylesheet">
        <!--Custom Font-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous"/>

    </head>
    <%
       ProductTypeDAO ptd = new ProductTypeDAO();
        List<Integer> p = (List<Integer>) ptd.getProductID();
        SupplierDAO sd = new SupplierDAO();
        List<Supplier> s = (List<Supplier>) sd.getSupplier();
        String sid =null;
        String pid = null;
        pid = (String) request.getAttribute("pid");
        sid = (String) request.getAttribute("sid");
        List<ProductType> list = new ArrayList<>();
        if(sid != null){
        list = (List<ProductType>) request.getAttribute("list");
        }
        ProductType pt = new ProductType();
        if(pid != null && !pid.isEmpty()){
        int id = Integer.parseInt(pid);
        pt = ptd.getProductTypeByID(id);      
        }  
        GuaranteeDAO gd = new GuaranteeDAO();
        OrderDetailDAO odd = new OrderDetailDAO();
        Map<Integer, Integer> countGuarantee = (Map<Integer, Integer>) gd.countRecords();
    %>
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
                                <% for (Map.Entry<Integer, Integer> entry : countGuarantee.entrySet()) {
                                    int record = entry.getValue();
                                    if(record >=1){%>
                                <li><a href="guaranteeProduct?pid=<%= entry.getKey()%>">
                                        <div><em class="fa fa-envelope"></em> "<%= ptd.getProductType(entry.getKey()).getPname()%>" Warranty
                                            <span class="pull-right text-muted small"> now</span></div>
                                    </a></li>
                                <li class="divider"></li>
                                    <%}
                                        }%>

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
                    <img src="http://placehold.it/50/30a5ff/fff" class="img-responsive" alt="">
                </div>
                <div class="profile-usertitle">
                    <div class="profile-usertitle-name">Username</div>
                    <div class="profile-usertitle-status"><span class="indicator label-success"></span>Online</div>
                </div>
                <div class="clear"></div>
            </div>
            <div class="divider"></div>        
            <ul class="nav menu">
                <li class="active"><a href="ProductManager.jsp"><em class="fa fa-dashboard">&nbsp;</em> Home</a></li>
                <li><a href="listod"><em class="fa fa-calendar">&nbsp;</em> Order Detail</a></li>
                <li><a href="guaranteeAdmin"><span class="icon"><i class="fas fa-shield-alt"></i></span> Guarantee</a></li>                
                <li><a href="addoldprod1.jsp"> <em class="fa fa-plus"></em> Add Old Product</a></li>
                <li><a href="addnewprod.jsp"> <em class="fa fa-plus"></em> Add New Product</a></li>
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

                <div class="col-lg-4">
                    <h2>Add Product</h2>
                </div>
                <div class="col-lg-4">
                    <% 
            String msg;
            msg =(String) request.getAttribute("msg");
            if(msg !=null){
                    %>
                    <h3><%= msg%></h3><%}%>
                </div>

            </div><!--/.row-->
            <div class="row">
                <form action="insertold" method="post" enctype="multipart/form-data"style="margin-left: 5%">
                    <div class="col-lg-6">

                        <div class="dropdown col-lg-6">
                            <div class="col-lg-8">
                                <button class="dropbtn">Supplier Name</button>
                                <div class="dropdown-content">
                                    <% for(Supplier su : s ){%>
                                    <a href="insertold?sid=<%= su.getSid()%>&pid=<%%>" target="_self"><%= su.getSname()%></a>  

                                    <%}%>

                                </div>
                            </div>
                            <input name="sid"  class="col-lg-4"value="<%= sid%>" readonly="">
                            <!--                            <select class="col-lg-6" onchange="window.location.href = this.value">
                            <% for (Supplier su : s) { %>
                            <option value="insertold?sid=<%= su.getSid() %>&pid=<%%>">
                            <%= su.getSname() %>
                        </option>
                            <% } %>
                        </select>-->


                        </div>


                        <div class="dropdown col-lg-6">
                            <div class="col-lg-8">
                                <button class="dropbtn">Product Name</button>
                                <div class="dropdown-content">
                                    <% if(sid != null){%>
                                    <% for(ProductType pi: list ){%>
                                    <a href="insertold?pid=<%= pi.getPid()%>&sid=<%=sid%>" target="_self"><%=pi.getPname()%></a>

                                    <%}}%>

                                </div>
                            </div>
                            <input  name="pid" class="col-lg-4" value="<%= pid%>" readonly=""> 
                        </div>



                        <div class="ctn-add row">
                            <div class="inp_ctn col-lg-6"><h3> Product Name</h3>
                                <input type="text" name="pname" value="<%= pt.getPname()%>" readonly="" style="height: 50px; width: 180px;"></div>
                            <div class="inp_ctn col-lg-6"><h3> RAM of Product</h3>
                                <input type="text" name="pname" value="<%= pt.getRam()%>" readonly="" style="height: 50px; width: 180px;"></div>
                            <div class="inp_ctn col-lg-6 "><h3> CPU of Product</h3>
                                <input type="text" name="pname" value="<%= pt.getCpu()%>" readonly="" style="height: 50px; width: 180px;"></div>
                            <div class="inp_ctn col-lg-6"><h3> Hard Driver Product</h3>
                                <input type="text" name="pname" value="<%= pt.getHarddriver()%>" readonly="" style="height: 50px; width: 180px;"></div>
                            <div class="inp_ctn col-lg-6"><h3> Screen of Product</h3>
                                <input type="text" name="pname" value="<%= pt.getScreen()%>" readonly="" style="height: 50px; width: 180px;"></div>
                            <div class="inp_ctn col-lg-6"><h3> Quantity of Product</h3>
                                <input type="text" name="pname" value="<%= pt.getQuantity()%>" readonly="" style="height: 50px; width: 180px;"></div>
                            <div class="inp_ctn col-lg-6"><h3>Describe of Product</h3>
                                <input type="text" name="pname" value="<%= pt.getDescribe()%>" readonly="" style="height: 50px; width: 300px;"></div>
                        </div>
                    </div>
                    <div class="ctn-add col-lg-6">
                        <div class="inp_ctn col-lg-12">
                            <h3>Seri</h3>
                            <textarea id="seri_product" name="seri" class="content_inf" rows="2" cols="60"
                                      placeholder="Product Seri"></textarea>

                        </div>
                        <div class="inp_ctn col-lg-12">
                            <h3>Price</h3>
                            <textarea name="price" id="numberInput" oninput="formatNumber()" class="content_inf" rows="2" cols="60" placeholder="Price"></textarea>
                            <script>
                                function formatNumber() {
                                    var input = document.getElementById("numberInput");
                                    var value = input.value;
                                    // Loại bỏ tất cả các ký tự không phải số và dấu chấm
                                    value = value.replace(/[^\d.]/g, "");
                                    // Chèn dấu phẩy giữa các cụm ba số liên tiếp
                                    value = value.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                                    // Gán giá trị đã định dạng vào ô input
                                    input.value = value;
                                }

                            </script>
                        </div>


                        <div class="inp_ctn col-lg-6">
                            <h3>Sell</h3>
                            <select name="sell" id="sell"  class="content_inf" style="height: 50px; width: 180px;">
                                <% for(int i =0; i<100; i+=5){%>
                                <option value="<%=i%>"><%= i%> %</option>
                                <%}%>
                            </select>

                        </div>
                        <div class="inp_ctn col-lg-6">
                            <h3>Guarantee</h3>
                            <select name="guarantee" id="guarantee"  class="content_inf"  style="height: 50px; width: 180px;">
                                <% for(int i =0; i<=60; i+=6){%>
                                <option value="<%=i%>"><%= i%> Month</option>
                                <%}%>
                            </select>
                        </div>

                        <div class="inp_ctn col-lg-12">
                            <div>
                                <h3>Images </h3>
                                Chọn file ảnh: <input type="file" name="image" onchange="showImage(this);"> 
                                <img id="preview" src="#" alt="Ảnh của bạn">
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
                        </div>                

                    </div>
                    <div class="button col-lg-12 row">
                        <button class="button btn_cancel col-lg-6" style="height: 50px; width: 180px;"> <a href="ProductManager.jsp"
                                                                                                           style="text-decoration: none;">Cancel</a></button>
                        <input type="submit" class="button btn_save col-lg-6" value="Save" style="height: 50px; width: 180px;">
                    </div>
                </form>
            </div>
            <script src="jsadmin/jquery-1.11.1.min.js"></script>
            <script src="jsadmin/bootstrap.min.js"></script>
            <script src="jsadmin/chart.min.js"></script>
            <script src="jsadmin/chart-data.js"></script>
            <script src="jsadmin/easypiechart.js"></script>
            <script src="jsadmin/easypiechart-data.js"></script>
            <script src="jsadmin/bootstrap-datepicker.js"></script>
            <script src="jsadmin/custom.js"></script>
            <script src="https://cdn.ckeditor.com/ckeditor5/38.0.0/classic/ckeditor.js"></script>
            <script>
                                    window.onload = function () {
                                        var chart1 = document.getElementById("line-chart").getContext("2d");
                                        window.myLine = new Chart(chart1).Line(lineChartData, {
                                            responsive: true,
                                            scaleLineColor: "rgba(0,0,0,.2)",
                                            scaleGridLineColor: "rgba(0,0,0,.05)",
                                            scaleFontColor: "#c5c7cc"
                                        });
                                    };
                                    ClassicEditor
                                            .create(document.getElementById('describe'))
                                            .then(editor => {
                                                console.log(describe);
                                            })
                                            .catch(error => {
                                                console.error(error);
                                            });
                                    var ulElement = document.querySelector('.dropdown-menu.dropdown-alerts');
                                    var aElements = ulElement.getElementsByTagName('a');
                                    var count = aElements.length;
                                    var spanElement = document.querySelector('.label.label-info');
                                    spanElement.textContent = count.toString();
            </script>
    </body>
</html>

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
        <script src="jsadmin/ckeditor/ckeditor.js"></script>
        <!--Custom Font-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous"/>
    </head>

    <body>
        <%@include file="component/nav.jsp" %>
        <%@include file="component/sidebar.jsp" %>

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
                    <h3></h3>
                </div>
            </div><!--/.row-->
            <div class="row">
                <form action="addproduct" method="post" enctype="multipart/form-data">
                    <div class="add_form">
                        <div class="cont_addprod">
                            <div class="col-lg-12">
                                <h4>Product Name</h4>
                                <textarea id="name_product" class="content_inf"  name="productName" rows="3" cols="140" maxlength="100" placeholder="Name Product" required=""></textarea>
                            </div>
                            <div>
                                <div class="inp_ctn col-lg-6"><h4> RAM of Product</h4>
                                    <input type="text" name="ram" placeholder="Example: 64GB " ></div>
                                <div class="inp_ctn col-lg-6 "><h4> CPU of Product</h4>
                                    <input type="text" name="cpu" placeholder="Example: Intel i9"  ></div>
                                <div class="inp_ctn col-lg-6"><h4> Capacity Product</h4>
                                    <input type="text" name="capacity" placeholder="Example: 1TB SSD"   ></div>
                                <div class="inp_ctn col-lg-6"><h4> Graphic Card</h4>
                                    <input type="text" name="graphic" placeholder="Example: NVIDIA RTX 3070"   ></div>
                                <div class="inp_ctn col-lg-6"><h4> Display of Product</h4>
                                    <input type="text" name="display" placeholder="Example: 15.6 inch"   ></div>
                                <div class="inp_ctn col-lg-6"><h4> Quantity of Product</h4>
                                    <input type="text" name="quantity" placeholder="Example: 100" required  ></div>
                                <div class="inp_ctn col-lg-6"><h4>Discount</h4>
                                    <input type="text" name="discount" placeholder="Example: 0.1"  ></div>
                                <div class="inp_ctn col-lg-6"><h4> Product Status</h4>
                                    <select name="productStatus" id="ProductStatus" class="content_inf" style="height: 30px;width:150px;">
                                        <option value="1">Active</option>
                                        <option value="0">De-active</option>
                                    </select></div>

                                <div class="ctn-add">
                                    <div class="col-lg-6">
                                        <h4>Origin Price</h4>
                                        <textarea required name="OriginPrice" id="OriginPriceInput" oninput="formatNumber('OriginPriceInput')" class="content_inf" rows="2" cols="30" placeholder="Origin Price"></textarea>

                                    </div>
                                    <div class="col-lg-6">
                                        <h4>Sale Price</h4>
                                        <textarea required name="SalePrice" id="SalePriceInput" oninput="formatNumber('SalePriceInput')" class="content_inf" rows="2" cols="30" placeholder="Sale Price"></textarea>
                                    </div>
                                </div>
                                <script>
                                    function formatNumber(id) {
                                        var input = document.getElementById(id);
                                        var value = input.value;
                                        // Loại bỏ tất cả các ký tự không phải số và dấu chấm
                                        value = value.replace(/[^\d.]/g, "");
                                        // Chèn dấu phẩy giữa các cụm ba số liên tiếp
                                        value = value.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                                        // Gán giá trị đã định dạng vào ô input
                                        input.value = value;
                                    }
                                </script>
                                <div class="col-lg-6">
                                    <h4>Brand Name</h4>
                                    <select name="BrandID" style="margin-bottom: 30px; height: 30px;width:300px;">
                                        <c:forEach var="dab" items="${requestScope.datab}">
                                            <option value ="${dab.brandID}">${dab.brandName}</option>
                                        </c:forEach>
                                    </select>

                                </div>
                                <div class="col-lg-6">
                                    <h4>Category Name</h4>
                                    <select name="CategoryID" style="margin-bottom: 30px; height: 30px;width:300px;">
                                        <c:forEach items="${requestScope.datac}" var="dac">
                                            <option value ="${dac.categoryId}" >${dac.categoryName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>


                            <div class="col-lg-12">
                                <h4> DESCRIBE</h4>
                                <textarea name="describe" id="describe" class="content_inf" rows="5" cols="146  " placeholder="Describe"></textarea>
                            </div>
                            <div class="add_img col-lg-12">
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
                                                img.width = 240;
                                                img.height = 240;
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
                    <div class="button">
                        <button class="button btn_cancel"> <a href="ProductManager.jsp" style="text-decoration: none;">Cancel</a></button>
                        <input type="submit" class="button btn_save" value="Save" > 
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

    </body>
</html>

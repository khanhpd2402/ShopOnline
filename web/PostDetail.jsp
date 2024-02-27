
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- icon -->
        <link rel="shortcut icon" href="resources/favicon.ico" type="image/x-icon">
        <!-- link Fonts -->
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet"/>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+Display&family=Poppins:wght@100;400;600&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@350&display=swap" rel="stylesheet">
        <!--BOOTSTRAP5-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>
        <!--FONTAWESOME-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <!-- CSS -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/queries.css" />

        <style>
            .gallery-wrap .img-big-wrap img {
                height: 500px;
                width: auto;
                display: inline-block;
                cursor: zoom-in;
            }
            .img-big-wrap img{
                margin-top: 60px;
                margin-left: 40px;
                width: 100% !important;
                height: auto !important;
            }

            .content{
                font-family: 'Poppins', sans-serif;
                font-size: 19px;
                text-align: left;
            }
            h5{
                font-family:  'Poppins', sans-serif;
                font-size: 17px;
                text-align: right;
                font-style: italic;
                font-weight: 400;

            }
            .card-title show_txt a
            {
                font-family: 'Noto Serif Display', serif;
                font-weight: 600;
                font-size: 17px;
            }
            .spotlight h2{
                font-family: 'Noto Serif Display', serif;
                font-weight: 600;

            }
            .spotlight{
                margin: 45px;
            }

            .img-big-wrap img{
                width: 100% ;
                height: auto ;
            }
            .title1{
                text-decoration: none;
                color: black;
                font-family: 'Noto Serif Display', serif;
                font-weight: 600;
                font-size: 30px;
                margin:  40px 0 40px 0;
            }
            a:hover {
                text-decoration: underline;
            }

            .row .img-big-wrap{
                margin-top: 20px;
                margin-bottom: 20px;
            }
            body{
                background-image: url(./resources/img/Blog/blue-abstract-gradient-wave-wallpaper.jpg);
                background-attachment: fixed;
                background-repeat: no-repeat;
                background-size: cover;
            }
        </style>
    </head>

    <body>
        <%@include file="model/header.jsp" %>   

        <%-- Content here--%>
    <center>

        <div class="col-sm-10">
            <div class="container">
                <div class="card">
                    <div class="row">
                        <div class="col-md-4 ">
                            <article class="gallery-wrap"> 
                                <div class="img-big-wrap">
                                    <div> <a href="#"><img src="${post.imgURL}"></a></div>
                                </div>                            
                            </article> 
                        </div>
                        <div class="col-md-8">
                            <article class="card-body p-5">
                                <h3 class="title1">${post.getDescription()}</h3> 

                               
                                <h5 class="item-property">by ${post.username}</h5>   
                            </article>
                        </div>
                    </div>
                    <p style="font-family: 'Noto Serif Display', serif; ">Nếu bạn muốn đóng góp bài viết cho chúng tôi, vui lòng gửi qua hòm thư: Shopee@gmail.com</p>
                </div>
            </div>
        </div>
                            
       
    </center>
      <!-- Form Add Post -->
      <div class="row" style="margin-left: 130px; margin-top: 3%;margin-bottom: 2%">
                <div class="col-md-7">
                    <form action="<c:url value='/AddPostController' />" method="post" class ="formadd">
                        <!-- Các trường nhập liệu cho Add Post -->
                        <div class="mb-3">
                            <label for="postDescription" class="form-label">Description</label>
                            <div><p class = "text-danger" style ="font-size: 11px; color: red">${mess}</p></div>
                            <input type="text" class="form-control" id="postTitle" name="description" required>
                        </div>
                        <div class="mb-3">
                            <label for="postCategory" class="form-label">Category</label>
                            
                            <select class="form-control" id="postCategory" name="category" required>
                                <c:forEach items="${postCate}" var="pc">
                                    <option value="${pc.categoryID}">${pc.categoryname}</option>
                                </c:forEach>
                            </select>
                        </div>
                       
                        <div class="mb-3">
                            <label for="postImage" class="form-label">Image</label>
                            <div><p class = "text-danger" style ="font-size: 11px; color: red">${mess3}</p></div>
                            <input type="text" class="form-control" id="postTitle" name="image" required>
                        </div>
                        <button type="submit" class="btn btn-primary">Add Post</button>
                    </form >
                </div>
            </div>
    <%@include file="model/footer.jsp" %>
    <script>
            function toggleVisibility() {
                alert("Toggle Visibility Logic");
            }
        </script>
        <%@include file="model/footer.jsp" %>
        <!-- BOOTSTRAP5-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <!-- SCRIPT -->
        <script src="${pageContext.request.contextPath}/js/script.js"></script>
</body>
</html>

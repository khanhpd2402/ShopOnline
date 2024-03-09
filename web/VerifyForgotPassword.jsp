<%-- 
    Document   : waitforresetpass
    Created on : Jun 12, 2023, 4:03:22 PM
    Author     : duykh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Notification Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <style>
            body {
                margin: 0;
                padding: 0;
                font-family: Arial, sans-serif;
                background-color: #f5f5f5;
            }
            .container {
                max-width: 400px;
                margin: 0 auto;
                padding: 40px;
                background-color: #fff;
                border-radius: 5px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                text-align: center;
            }
            .notification {
                color: #2ecc71;
                font-size: 24px;
                margin-bottom: 20px;
            }
            .btn {
                display: inline-block;
                padding: 10px 20px;
                background-color: #00483d;
                color: #fff;
                text-decoration: none;
                border-radius: 5px;
                transition: background-color 0.3s ease;
                margin-top: 10px;
            }
            .btn:hover {
                background-color: #FF8C00;
            }
            .input-wrapper {
                display: flex;
                align-items: center;
                margin-bottom: 10px;
            }

            .input-wrapper input[type="text"] {
                flex: 1;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }
            .input-wrapper button.btn:hover {
                background-color: #FF8C00;
            }

            .input-wrapper button.btn:hover span {
                text-decoration: underline;
            }
            .error-container {
                border: 2px solid #000;
                padding: 10px;
                display: inline-block;
            }

            .error-message {
                color: red;
            }

            @media (min-width: 768px) {
                .error-container {
                    width: 100%;
                }
            }
            .input-wrapper button.btn {
                margin-left: 10px;
                padding: 10px 20px;
                background-color: #00483d;
                color: #fff;
                text-decoration: none;
                border-radius: 5px;
                transition: background-color 0.3s ease;
            }
            @media only screen and (max-width: 480px) {
                .container {
                    max-width: 100%;
                    padding: 20px;
                }
                .notification {
                    font-size: 20px;
                }
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="login-logo">
                <a href="home">
                    <img src="images/logo.png" alt="Gas">
                </a>
            </div>
            <h1 class="notification">Chúng tôi đã gửi thông báo đến email của bạn!</h1>
            <p>Vui lòng kiểm tra email của bạn để được hướng dẫn thêm.</p>
            <form action="verifyfogotpass" method="post">
                <c:if test="${requestScope.error != null}">
                    <div class="error-container">
                        <p class="error-message"><i class="fas fa-exclamation-triangle"></i> ${requestScope.error}</p>
                    </div>
                </c:if>
                <div class="input-wrapper">
                    <input type="text" name="verificationCode" placeholder="Mã xác nhận" required>
                    <button type="submit" class="btn"><i class="fas fa-check"></i> Xác nhận</button>
                </div>
            </form>
            <a class="btn" href="login"><i class="fas fa-arrow-left"></i> Quay về trang đăng nhập</a>
        </div>
    </body>
     <script type="text/javascript">
            !(function (e, t, a) {
                function r() {
                    for (var e = 0; e < o.length; e++)
                        o[e].alpha <= 0
                                ? (t.body.removeChild(o[e].el), o.splice(e, 1))
                                : (o[e].y--,
                                        (o[e].scale += 0.004),
                                        (o[e].alpha -= 0.013),
                                        (o[e].el.style.cssText =
                                                "left:" +
                                                o[e].x +
                                                "px;top:" +
                                                o[e].y +
                                                "px;opacity:" +
                                                o[e].alpha +
                                                ";transform:scale(" +
                                                o[e].scale +
                                                "," +
                                                o[e].scale +
                                                ") rotate(45deg);background:" +
                                                o[e].color +
                                                ";z-index:99999"));
                    requestAnimationFrame(r);
                }
                function n(e) {
                    var a = t.createElement("div");
                    (a.className = "heart"),
                            o.push({el: a, x: e.clientX - 5, y: e.clientY - 5, scale: 1, alpha: 1, color: "rgb(" + ~~(255 * Math.random()) + "," + ~~(255 * Math.random()) + "," + ~~(255 * Math.random()) + ")"}),
                            t.body.appendChild(a);
                }
                var o = [];
                (e.requestAnimationFrame =
                        e.requestAnimationFrame ||
                        e.webkitRequestAnimationFrame ||
                        e.mozRequestAnimationFrame ||
                        e.oRequestAnimationFrame ||
                        e.msRequestAnimationFrame ||
                        function (e) {
                            setTimeout(e, 1e3 / 60);
                        }),
                        (function (e) {
                            var a = t.createElement("style");
                            a.type = "text/css";
                            try {
                                a.appendChild(t.createTextNode(e));
                            } catch (t) {
                                a.styleSheet.cssText = e;
                            }
                            t.getElementsByTagName("head")[0].appendChild(a);
                        })(
                        ".heart{width: 10px;height: 10px;position: fixed;background: #f00;transform: rotate(45deg);-webkit-transform: rotate(45deg);-moz-transform: rotate(45deg);}.heart:after,.heart:before{content: '';width: inherit;height: inherit;background: inherit;border-radius: 50%;-webkit-border-radius: 50%;-moz-border-radius: 50%;position: fixed;}.heart:after{top: -5px;}.heart:before{left: -5px;}",
                        ),
                        (function () {
                            var t = "function" == typeof e.onclick && e.onclick;
                            e.onclick = function (e) {
                                t && t(), n(e);
                            };
                        })(),
                        r();
            })(window, document);
        </script>
</html>
</html>

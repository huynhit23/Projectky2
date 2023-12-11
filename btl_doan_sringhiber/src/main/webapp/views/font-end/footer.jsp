 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
 <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="footer__about">
                        <div class="footer__about__logo">
                            <a href="./index.html"><img src="<c:url value="resources"/>/img/logo.png" alt=""></a>
                        </div>
                        <ul>
                            <li>Địa chỉ: 236 Hoàng Quốc Việt</li>
                            <li>Phone: +84 333333444</li>
                            <li>Email: originshop.com</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
                    <div class="footer__widget">
                        <h2>Các liên kết hữu ích</h2>
                        <ul>
                            <li><a href="home">Trang chủ</a></li>
                            <li><a href="blog">Giới thiệu</a></li>
                            <li><a href="contact">Liên hệ</a></li>
                        </ul>
                        <ul>
                             <li><a href="shop?catId=0">Cửa hàng</a></li>
                            <li><a href="cart">Giỏ hàng</a></li>
                             <li><a href="follow?add=Đã+theo+dõi+thành+công">theo dõi</a></li>
                           
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4 col-md-12">
                    <div class="footer__widget">
                        <h6>Tham gia Bản tin của chúng tôi ngay bây giờ</h6>
                        <p>Nhận thông tin cập nhật qua email về cửa hàng mới nhất của chúng tôi và các ưu đãi đặc biệt.</p>
                        <form action="#">
                            <input type="text" placeholder="Điên eamil của bạn">
                            <button type="submit" class="site-btn">xác nhận</button>
                        </form>
                        <div class="footer__widget__social">
                            <a href="https://vi-vn.facebook.com/"><i class="fa fa-facebook"></i></a>
                            <a href="https://www.instagram.com/accounts/login/"><i class="fa fa-instagram"></i></a>
                            <a href="https://twitter.com/i/flow/login"><i class="fa fa-twitter"></i></a>
                            <a href="https://www.pinterest.com/login/"><i class="fa fa-pinterest"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="footer__copyright">
                        <div class="footer__copyright__text"><p>Các công ty tập đoàn liên kết với chúng tôi</p></div>
                         <div class="footer__copyright__payment"><img src="<c:url value="resources"/>/img/payment-item.png" alt=""></div>
                       
                    </div>
                </div>
            </div>
        </div>
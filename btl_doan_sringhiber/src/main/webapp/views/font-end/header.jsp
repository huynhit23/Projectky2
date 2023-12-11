<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<div id="preloder">
	<div class="loader"></div>
</div>

<!-- Humberger Begin -->
	<div class="humberger__menu__overlay"></div>
	<div class="humberger__menu__wrapper">
		<div class="humberger__menu__logo">
			<a href="#"><img src="<c:url value="resources"/>/img/logo.png"
				alt=""></a>
		</div>
		<div class="humberger__menu__cart">
			<ul>
				<li><a href="#"><i class="fa fa-heart"></i></a></li>
				<li><a href="#"><i class="fa fa-shopping-bag"></i> </a></li>
			</ul>
			<!-- <div class="header__cart__price">
				item: <span>$150.00</span>
			</div> -->
		</div>

		<nav class="humberger__menu__nav mobile-menu">
			<ul>
				<li class="active"><a href="home">Trang chủ</a></li>
				<li class=""><a href="shop?catId=0">Cửa hàng</a></li>
				<li><a href="blog">Giới thiệu</a></li>
				<li><a href="contact">Liên hệ</a></li>
			</ul>s
		</nav>
		<div id="mobile-menu-wrap"></div>
		<div class="header__top__right__social">
			<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
				class="fa fa-twitter"></i></a> <a href="#"><i class="fa fa-linkedin"></i></a>
			<a href="#"><i class="fa fa-pinterest-p"></i></a>
		</div>
		<div class="humberger__menu__contact">
			<ul>
				<li><i class="fa fa-envelope"></i> originshop.com</li>
				<li>Miễn phí giao hàng cho trong 2km</li>
			</ul>
		</div>
	</div>
	<!-- Humberger End -->

	<!-- Header Section Begin -->
	<header class="header">
		<div class="header__top">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 col-md-6">
						<div class="header__top__left">
							<ul>
								<li><i class="fa fa-envelope"></i> originshop.com</li>
								<li>Miễn phí giao hàng cho trong 2km</li>
							</ul>
						</div>
					</div>
					<div class="col-lg-6 col-md-6">
						<div class="header__top__right">
							<div class="header__top__right__social">
								<a href="https://vi-vn.facebook.com/"><i class="fa fa-facebook"></i></a> <a href="#"><i
									class="fa fa-twitter"></i></a> <a href="#"><i
									class="fa fa-linkedin"></i></a> <a href="#"><i
									class="fa fa-pinterest-p"></i></a>
							</div>

							<c:if test="${not empty pageContext.request.userPrincipal.name}">
								<div class="header__top__right__social">
								<p> Xin chào :<span style="color: red;">${pageContext.request.userPrincipal.name} </span> </p>
								</div>
								<div class="header__top__right__auth" style="background: none;">
									<form action="<c:url value="/j_spring_security_logout" />"
										method="post">
										<input style="background: none; border: none;" type="hidden" name="${_csrf.parameterName}"
											value="${_csrf.token}" /> <i class="fas fa-sign-out-alt"></i><input
											class="stext-102 cl2 hov-cl1 trans-04" type="submit"
											value="Logout" style="background: none;border: none;"/>
									</form>
								</div>

							</c:if>

							<c:if test="${empty pageContext.request.userPrincipal.name}">
								<div class="header__top__right__auth">
									<a
										href="${pageContext.request.contextPath}/<c:url value="login"/>"><i
										class="fa fa-user"></i>Đăng nhập</a>
								</div>

							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="header__logo">
						<a href="home"><img
							src="<c:url value="resources"/>/img/logo.png" alt=""></a>
					</div>
				</div>
				<div class="col-lg-6">
					<nav class="header__menu">
						<ul>
							<li class=""><a href="home">Trang chủ</a></li>
							<li ><a href="shop?catId=0">Cửa hàng</a></li>
							<li><a href="blog">Giới thiệu</a></li>
							<li><a href="contact">Liên hệ</a></li>
						</ul>
					</nav>
				</div>
				<div class="col-lg-3">
					<div class="header__cart">
						<ul>
							<li><a href="follow"><i class="fa fa-heart"></i> </a></li>
							<li><a href="cart"><i class="fa fa-shopping-bag"></i></a></li>
						</ul>
						<!-- <div class="header__cart__price">
							item: <span>$150.00</span>
						</div> -->
					</div>
				</div>
			</div>
			<div class="humberger__open">
				<i class="fa fa-bars"></i>
			</div>
		</div>
	</header>

<!-- Hero Section Begin -->
<section class="hero hero-normal">
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<div class="hero__categories">
					<div class="hero__categories__all">
						<i class="fa fa-bars"></i> <span>Danh Mục</span>
					</div>
					<ul>
						<c:forEach items="${listCat }" var="c">
							<li><a href="shop?catId=${c.id}">${c.name }</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div class="col-lg-9">
				<div class="hero__search">
					<div class="hero__search__form">
							<form action="search">
								<input type="text" name="name" placeholder="Tìm kiếm">
								<button type="submit" class="site-btn">Tìm</button>
							</form>
						</div>
					<div class="hero__search__phone">
						<!-- <div class="hero__search__phone__icon">
							<i class="fa fa-phone"></i>
						</div> -->
						<div class="hero__search__phone">
							<div class="hero__search__phone__icon">
								<i class="fa fa-phone"></i>
							</div>
							<div class="hero__search__phone__text">
								<h5>+84 3333334440</h5>
								<span>Hỗ trợ 24/7</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
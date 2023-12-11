<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="Lodrem" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Ogani | Template</title>

<!-- Google Font -->
<jsp:include page="link_css.jsp"></jsp:include>

<style type="text/css">
.price {
	font-size: 30px;
}

a:hover {
	color: blue;
}
</style>
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	<!-- Hero Section End -->

	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg"
		data-setbg="<c:url value="resources"/>/img/breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>${pro.name }</h2>
						<div class="breadcrumb__option">
							<a href="home">Home</a> <a href="shop?catId=0">shop</a> <span>${pro.name }</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Product Details Section Begin -->
	<section class="product-details spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6">
					<div class="product__details__pic">
						<div class="product__details__pic__item">
							<img class="product__details__pic__item--large"
								src="<c:url value="resources"/>/img/${pro.img}" alt="">
						</div>
						<!-- <div class="product__details__pic__slider owl-carousel">
								<img data-imgbigurl="img/product/details/product-details-2.jpg"
									src="img/product/details/thumb-1.jpg" alt=""> <img
									data-imgbigurl="img/product/details/product-details-3.jpg"
									src="img/product/details/thumb-2.jpg" alt=""> <img
									data-imgbigurl="img/product/details/product-details-5.jpg"
									src="img/product/details/thumb-3.jpg" alt=""> <img
									data-imgbigurl="img/product/details/product-details-4.jpg"
									src="img/product/details/thumb-4.jpg" alt="">
							</div> -->
					</div>
				</div>
				<div class="col-lg-6 col-md-6">
					<div class="product__details__text">
						<h3>${pro.name }</h3>
						<div class="product__details__rating">
							<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star"></i> <i class="fa fa-star"></i> <i
								class="fa fa-star-half-o"></i> <span>(18 reviews)</span>
						</div>
						<div class="product__details__price">
							<c:if test="${pro.salePrice > 0 }">
								<h5>
									<span class="text-danger price font-weight-bold"><fmt:formatNumber
											value="${pro.salePrice}" type="NUMBER" />đ</span> <span
										style="text-decoration: line-through;"><fmt:formatNumber
											value="${pro.price}" type="NUMBER" />đ</span>
								</h5>
							</c:if>
							<c:if test="${pro.salePrice == 0 }">
								<h5 class="price">
									<fmt:formatNumber value="${pro.price}" type="NUMBER" />
									đ
								</h5>
							</c:if>

						</div>
						<p>
						<c:if test="${pro.sets != ''}">
							Bộ : <a href="set?set=${pro.sets}" style="text-decoration:underline;">
							<span> ${pro.sets } </span> <i class="fa fa-chevron-right"></i></a> 
							<br>
						</c:if>
							Ngày Xuất Bản:
							<fmt:formatDate value="${pro.ngay_xuat_ban }" />
						</p>

						<c:if test="${pro.status ==1}">
							<form:form action="${pageContext.request.contextPath}/AddToCart"
								modelAttribute="cart" method='POST'>
								<input type="hidden" value="${pro.id}" name="proId">
								<div class="product__details__quantity">
									<div class="quantity">
										<div class="pro-qty">
											<form:input type="number" path="quantity" value="1" />
										</div>
									</div>
								</div>
								<button type="submit" class="primary-btn">Thêm</button>

							</form:form>
						</c:if>
						<c:if test="${pro.status ==0}">
							<div class="product__details__quantity">
								<div class="quantity">
									<div class="pro-qty">
										<input type="text" value="1">
									</div>
								</div>
							</div>
							<button class="primary-btn" disabled="disabled"
								style="background-color: red;">Hết Hàng</button>

						</c:if>
						<c:if test="${pro.status ==2}">
							<div class="product__details__quantity">
								<div class="quantity">
									<div class="pro-qty">
										<input type="text" value="1">
									</div>
								</div>
							</div>
							<button class="primary-btn" disabled="disabled"
								style="background-color: red;">Sắp Ra</button>

						</c:if>
						<c:if test="${empty pageContext.request.userPrincipal.name}">
							<a href="login" class="heart-icon btn btn-primary"><i class="fa fa-heart"></i></a>
						</c:if>
						<c:if test="${not empty pageContext.request.userPrincipal.name}">
								
							<form:form action="addFollow" modelAttribute="f" method='POST'>
								<input type="hidden" value="${pro.id}" name="proId.id">
								<input type="hidden"
									value="${pageContext.request.userPrincipal.name}"
									name="accName">
								<button type="submit" class="primary-btn heart-icon btn btn-primary"><i class="fa fa-heart"></i></button>
							</form:form>
						</c:if>
						<ul>
							<%-- <li><b>Nhà hàng</b> <span>${pro.restaurantId.name }</span></li>
							<li><b>Địa chỉ</b> <span>${pro.restaurantId.address }</span></li> --%>
							<li><b>Tác giả</b> <span>${pro.author }</span></li>
							<li><b>Nhà cung cấp</b> <span>${pro.nha_cung_cap }</span></li>
							<li><b>Nhà xuất bản</b> <span>${pro.nha_xuat_ban }</span></li>
							<li><b>Chia sẻ</b>
								<div class="share">
									<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
										class="fa fa-twitter"></i></a> <a href="#"><i
										class="fa fa-instagram"></i></a> <a href="#"><i
										class="fa fa-pinterest"></i></a>
								</div></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-12">
					<div class="product__details__tab">
						<ul class="nav nav-tabs" role="tablist">
							<li class="nav-item"><a class="nav-link active"
								data-toggle="tab" href="#tabs-1" role="tab" aria-selected="true">Mô
									Tả </a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#tabs-2" role="tab" aria-selected="false">Chi tiết</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#tabs-3" role="tab" aria-selected="false">Đánh giá </a></li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="tabs-1" role="tabpanel">
								<div class="product__details__tab__desc">
									<pre>${pro.content }
									</pre>
								</div>
							</div>
							<div class="tab-pane" id="tabs-2" role="tabpanel">
								<div class="product__details__tab__desc">
									<pre>${pro.thong_tin }
									</pre>
								</div>
							</div>
							<div class="tab-pane" id="tabs-3" role="tabpanel">
								<div class="product__details__tab__desc">
									<h6>Products Infomation</h6>
									<p>Vestibulum ac diam sit amet quam vehicula elementum sed
										sit amet dui. Pellentesque in ipsum id orci porta dapibus.
										Proin eget tortor risus. Vivamus suscipit tortor eget felis
										porttitor volutpat. Vestibulum ac diam sit amet quam vehicula
										elementum sed sit amet dui. Donec rutrum congue leo eget
										malesuada. Vivamus suscipit tortor eget felis porttitor
										volutpat. Curabitur arcu erat, accumsan id imperdiet et,
										porttitor at sem. Praesent sapien massa, convallis a
										pellentesque nec, egestas non nisi. Vestibulum ac diam sit
										amet quam vehicula elementum sed sit amet dui. Vestibulum ante
										ipsum primis in faucibus orci luctus et ultrices posuere
										cubilia Curae; Donec velit neque, auctor sit amet aliquam vel,
										ullamcorper sit amet ligula. Proin eget tortor risus.</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Product Details Section End -->

	<!-- Related Product Section Begin -->
	<section class="related-product">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title related__product__title">
						<h2>Liên quan</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<c:forEach items="${listAll}" var="lq" begin="0" end="4">
					<c:if test="${lq.catId.id==pro.catId.id &&  lq.id != pro.id }">
						<div class="col-lg-3 col-md-4 col-sm-6">
							<div class="product__item">
								<div class="product__item__pic set-bg"
									data-setbg="<c:url value="resources"/>/img/${lq.img}">
									<ul class="product__item__pic__hover">
										<li><a href="detail?proId=${lq.id}"><i class="fa fa-heart"></i></a></li>
										<li><a href="#"><i class="fa fa-retweet"></i></a></li>
										<li><a href="detail?proId=${lq.id}"><i
												class="fa fa-shopping-cart"></i></a></li>
									</ul>
								</div>
								<div class="product__item__text">
									<h6>
										<a href="detail?proId=${lq.id}">${lq.name }</a>
									</h6>
									<c:if test="${lq.salePrice > 0 }">
										<h5>
											<span style="text-decoration: line-through;"><fmt:formatNumber
													value="${lq.price}" type="NUMBER" />đ</span> <br> <span
												class="text-danger"><fmt:formatNumber
													value="${lq.salePrice}" type="NUMBER" />đ</span>
										</h5>
									</c:if>
									<c:if test="${lq.salePrice == 0 }">
										<h5>
											<fmt:formatNumber value="${lq.price}" type="NUMBER" />
											đ
										</h5>
									</c:if>
								</div>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>
	</section>
	<!-- Related Product Section End -->

	<!-- Footer Section Begin -->
	<footer class="footer spad">
		<jsp:include page="footer.jsp"></jsp:include>
	</footer>
	<!-- Footer Section End -->

	<!-- Js Plugins -->
	<jsp:include page="link_js.jsp"></jsp:include>

</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Ogani | Template</title>

<!-- Google Font -->
<jsp:include page="link_css.jsp"></jsp:include>
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	<!-- Hero Section End -->




	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg"
		data-setbg="<c:url value="resources"/>/img/baner1.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>Organi Shop</h2>
						<div class="breadcrumb__option">
							<a href="home">Trang chủ</a> <span>Theo giõi</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Product Section Begin -->
	<section class="product spad">
		<div class="container">
			<div class="row">
					<div class="section-title product__discount__title ">
						<h2>Tủ sách của bạn</h2>
					</div>
				<div class="col-lg-12 col-md-7">

					<div class="filter__item">
						<div class="row">
							<div class="col-lg-4 col-md-5">
								<!-- <div class="filter__sort">
									<span>Xếp theo</span> <select>
										<option value="0">Default</option>
										<option value="1">Default</option>
									</select>
								</div> -->
							</div>
							<div class="col-lg-4 col-md-4">
								<div class="filter__found">
									<div class="alert alert-dannger" role="alert">
										<h2> ${delete }</h2>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-3">
								<div class="filter__option">
									<!-- <span class="icon_grid-2x2"></span> <span class="icon_ul"></span> -->
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<c:forEach items="${listFl }" var="a">
							<c:if test="${a.accId.userName == pageContext.request.userPrincipal.name  }">
								<div class="col-lg-3 col-md-6 col-sm-6">
									<div class="product__item">
										<div class="product__item__pic set-bg"
											data-setbg="<c:url value="resources"/>/img/${a.proId.img}">
											<ul class="product__item__pic__hover">
												<li><a href="delete?flId=${a.id }"><i class="fa fa-heart"></i></a></li>
												<li><a href="#"><i class="fa fa-retweet"></i></a></li>
												<li><a href="detail?proId=${a.proId.id}"><i
														class="fa fa-shopping-cart"></i></a></li>
											</ul>
										</div>
										<div class="product__item__text">
											<h6>
												<a href="detail?proId=${a.proId.id}">${a.proId.name }</a>
											</h6>
											<c:if test="${a.proId.salePrice > 0 }">
												<h5>
													<span style="text-decoration: line-through;"><fmt:formatNumber
															value="${a.proId.price}" type="NUMBER" /></span> <br> <span
														class="text-danger"><fmt:formatNumber
															value="${a.proId.salePrice}" type="NUMBER" /></span>
												</h5>
											</c:if>
											<c:if test="${a.proId.salePrice == 0 }">
												<h5>
													<fmt:formatNumber value="${a.proId.price}" type="NUMBER" />
												</h5>
											</c:if>
										</div>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
					<div class="product__pagination">
						<!-- <a href="#">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#"><i
							class="fa fa-long-arrow-right"></i></a> -->
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Product Section End -->

	<!-- Footer Section Begin -->
	<footer class="footer spad">
		<jsp:include page="footer.jsp"></jsp:include>
	</footer>
	<!-- Footer Section End -->

	<jsp:include page="link_js.jsp"></jsp:include>

</body>

</html>
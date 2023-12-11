<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<jsp:include page="link_css.jsp"></jsp:include>
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
						<h2>Đặt Hàng</h2>
						<div class="breadcrumb__option">
							<a href="home">Home</a> <span>Đặt Hàng</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Checkout Section Begin -->
	<section class="checkout spad">
		<div class="container">
			<div class="checkout__form">
				<h4>Đơn Hàng</h4>
				<form:form action="CheckOut2" method="post" modelAttribute="orders" >
					<div class="row">
						<div class="col-lg-6 col-md-6">
							<div class="checkout__input">
								<p>
									Tên người nhận<span>*</span>
								</p>
								<input type="text" name="fullName" value="${acc.fullName }">
							</div>
							<div class="checkout__input">
								<p>
									Địa chỉ<span>*</span>
								</p>
								<input type="text" name="address" value="${acc.address }">
							</div>

							<div class="row">
								<div class="col-lg-6">
									<div class="checkout__input">
										<p>
											Số điện thoại<span>*</span>
										</p>
										<input type="text" name="phone" value="${acc.phone }">
									</div>
								</div>
								<div class="col-lg-6">
									<div class="checkout__input">
										<p>
											Email<span>*</span>
										</p>
										<input type="text" name="email" value="${acc.email }">
									</div>
								</div>
							</div>
							<div class="checkout__input">
								<p>
									Ghi chú
								</p>
								<input type="text"
									placeholder="Ghi chú cần lưu ý" name="note" >
							</div>
						</div>
						<input type="hidden" value="${acc.id}" name="acId.id"> 
						<input type="hidden" value="0" name="status">
						<div class="col-lg-6 col-md-6">
							<div class="checkout__order">
								<h4>Your Order</h4>
								<div class="checkout__order__products">
									Sản Phẩm<span>Tổng giá</span>
								</div>
								
								<ul>
								<c:forEach items="${sessionScope.myCartItems}" var="cart">
									<input type="hidden" value="${cart.value.pro.id}" name="proId">
									<input type="hidden" value="${cart.value.quantity}" name="quantity">
									<input type="hidden" value="${sessionScope.myCartTotal}" name="totalPrice">
									<c:if test="${cart.value.pro.salePrice == 0}">
										<li >${cart.value.pro.name}<span><fmt:formatNumber
													value="${cart.value.quantity * cart.value.pro.price}" />đ</span></li>
									</c:if>
									<c:if test="${cart.value.pro.salePrice > 0}">
										<li >${cart.value.pro.name}<span ><fmt:formatNumber
													value="${cart.value.quantity * cart.value.pro.salePrice}" />đ</span></li>
									</c:if>
								</c:forEach>
								</ul>
								<div class="checkout__order__subtotal">
									Tổng Phụ <span><fmt:formatNumber
										value="${sessionScope.myCartTotal}" />đ</span>
								</div>
								<div class="checkout__order__total">
									Thành Tiền <span><fmt:formatNumber
										value="${sessionScope.myCartTotal}" />đ</span>
								</div>
								
								<button type="submit" class="site-btn">Xác Nhận</button>
							</div>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</section>
	<!-- Checkout Section End -->

	<!-- Footer Section Begin -->
	<footer class="footer spad">
		<jsp:include page="footer.jsp"></jsp:include>
	</footer>
	<!-- Footer Section End -->

	<!-- Js Plugins -->
	<jsp:include page="link_js.jsp"></jsp:include>



</body>

</html>
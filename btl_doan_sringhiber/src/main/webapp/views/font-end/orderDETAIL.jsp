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
<jsp:include page="link_css.jsp"></jsp:include>
<style type="text/css">
.shoping__cart__item {
	width: 500px !important;
}
</style>
</head>

<body>
	<!-- Page Preloder -->
	<jsp:include page="header.jsp"></jsp:include>

	<!-- Hero Section End -->

	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg"
		data-setbg="<c:url value="resources"/>/img/breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>Đơn hàng</h2>
						<div class="breadcrumb__option">
							<a href="home">Home</a> <span>Giỏ hàng</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Shoping Cart Section Begin -->
	<section class="shoping-cart spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="shoping__cart__table">

						<table>
							<thead>
								<tr>
									<th>Ngày đặt hàng</th>
									<th class="shoping__product">Thông tin người đặt</th>
									<th>Ghi chú</th>
									<th>Tổng tiền Đơn hàng</th>
									<th>Tình trạng</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${listOd}" var="od">
									<c:if
										test="${od.acId.userName == pageContext.request.userPrincipal.name  }">
										<tr>
											<td class="shoping__cart__quantity">
												<h5>

													<fmt:formatDate value="${od.orderDate}" />
												</h5>
											</td>
											<td class="shoping__cart__item">
												<h5>
													<span class="font-weight-bold">Tên </span>:${od.fullName}
												</h5> <br>
												<h5>
													<span class="font-weight-bold">Địa chỉ </span>:${od.address}
												</h5> <br>
												<h5>
													<span class="font-weight-bold">SĐT </span>:${od.phone}
												</h5> <br>
												<h5>
													<span class="font-weight-bold">Email </span>:${od.email}
												</h5>
											</td>
											<td class="shoping__cart__item"><c:if
													test="${od.note == ''}">
													<h5>Không có ghi chú</h5>
												</c:if> <c:if test="${od.note != ''}">
													<h5>${od.note}</h5>
												</c:if></td>

											<td class="shoping__cart__quantity">
												<h5 style="text-align: center">
													<fmt:formatNumber value="${od.totalPrice}" type="NUMBER" />
													đ
												</h5>
											</td>

											<td class="shoping__cart__quantity"><c:if
													test="${od.status  == 0}">
													<h5>Đang xác nhận</h5>
												</c:if> <c:if test="${od.status == 1}">
													<h5>Đang giao hàng</h5>
												</c:if> <c:if test="${od.status == 2}">
													<h5>Đã Hoàn thành</h5>
												</c:if> <c:if test="${od.status == 3}">
													<h5>Đã Hủy</h5>
												</c:if></td>

											<td class="shoping__cart__price">
												<button type="button" class="btn btn-primary"
													data-toggle="modal"
													data-target=".bd-example-modal-lg${od.id+3 }">Chi
													tiết</button>
											</td>

											<div class="modal fade bd-example-modal-lg${od.id+3 }" tabindex="-1"
												role="dialog" aria-labelledby="myLargeModalLabel"
												aria-hidden="true">
												<div class="modal-dialog modal-lg">
													<div class="modal-content">
														<div class="modal-header">
															<h4 class="modal-title" id="myLargeModalLabel">Chi tiết đơn hàng</h4>
															<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span>  </button>
														</div>
														<div class="modal-body">
														
															<c:forEach items="${listOdd}" var="odd">
																<c:if test="${odd.order.id == od.id }">
																  <div class="row">
																    <div class="col-md-5">
																		<img src="<c:url value="resources"/>/img/${odd.proO.img}"
																		width="100px" height="100px" alt="">
																		<h5>${odd.proO.name}</h5>
																    </div>
																    <div class="col-md-2">
																    	<h6><span class="font-weight-bold">Số lượng </span>: ${odd.quantity}</h6>
																    </div>
																    <div class="col-md-2">
																    	<h6><span class="font-weight-bold">Giá </span>: <fmt:formatNumber value="${odd.proO.price}" />đ</h6>
																    </div>
																    <div class="col-md-3">
																    	<h6><span class="font-weight-bold">Tổng Tiền </span>: <fmt:formatNumber value="${odd.proO.price * odd.quantity}" />đ</h6>
																    </div>
																  </div>
																    <hr>
																	
																</c:if>
															</c:forEach>
															
														</div>

													</div>
												</div>
											</div>


											<%-- <div class="modal fade" id="exampleModal${od.id+3 }"
												tabindex="-1" aria-labelledby="exampleModalLabel"
												aria-hidden="true">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
															<h5 class="modal-title" id="exampleModalLabel">
																Thông tin Đơn hàng</h5>
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
														</div>
														<div class="modal-body">

															<c:forEach items="${listOdd}" var="odd">
																<c:if test="${odd.order.id == od.id }">

																</c:if>
															</c:forEach>
														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-secondary"
																data-dismiss="modal">Close</button>
														</div>
													</div>
												</div>
											</div> --%>

											<%-- <td class="shoping__cart__item__close"><a
											onclick="return confirm('Bạn có muốn xóa không?')"
											href="<c:url value="removeItem"/>?proId=${cart.value.pro.id}"
											class=" hov-btn3  trans-04"> <span class="icon_close"></span>
										</a></td> --%>

										</tr>
									</c:if>
								</c:forEach>



							</tbody>
						</table>
					</div>
				</div>
			</div>

		</div>
	</section>
	<!-- Shoping Cart Section End -->

	<!-- Footer Section Begin -->
	<footer class="footer spad">
		<jsp:include page="footer.jsp"></jsp:include>
	</footer>
	<!-- Footer Section End -->

	<!-- Js Plugins -->
	<jsp:include page="link_js.jsp"></jsp:include>
	<script type="text/javascript">
		function submitForm() {
			document.getElementById('myform').submit();
		}
	</script>
</body>

</html>
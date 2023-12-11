<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="<c:url value="resources"/>/images/favicon.ico"
	type="image/ico" />

<title>Quản lý đơn hàng |</title>

<jsp:include page="link_css.jsp"></jsp:include>
</head>

<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<jsp:include page="left_menu.jsp"></jsp:include>

			<!-- top navigation -->
			<jsp:include page="header.jsp"></jsp:include>
			<!-- /top navigation -->

			<!-- page content -->
			<div class="right_col" role="main">
				<h2>Danh sách đơn hàng</h2>
				<hr>
				<div class="container">
					<table class="table table-striped">
						<thead>
							<tr>
								<th scope="col">Ngày đặt hàng</th>
								<th scope="col">Thông tin người đặt</th>
								<th scope="col">Ghi chú</th>
								<th scope="col">Tổng tiền Đơn hàng</th>
								<th scope="col">Tình trạng</th>
								<th scope="col"></th>
								<th scope="col"></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${listOd}" var="od">
								<tr>
									<td><fmt:formatDate value="${od.orderDate}" /></td>
									<td><h5>
											<span class="font-weight-bold">Tên </span>:${od.fullName}
										</h5>
										<h5>
											<span class="font-weight-bold">Địa chỉ </span>:${od.address}
										</h5>
										<h5>
											<span class="font-weight-bold">SĐT </span>:${od.phone}
										</h5>
										<h5>
											<span class="font-weight-bold">Email </span>:${od.email}
										</h5>
									<td><c:if test="${od.note == ''}">
											Không có ghi chú
										</c:if> <c:if test="${od.note != ''}">
											${od.note}
										</c:if></td>
									<td><fmt:formatNumber value="${od.totalPrice}" />đ</td>
									<td><c:if test="${od.status  == 0}">
											Đang xác nhận
										</c:if> <c:if test="${od.status == 1}">
											Đang giao hàng
										</c:if> <c:if test="${od.status == 2}">
											Đã Hoàn thành
										</c:if> <c:if test="${od.status == 3}">
											Đã Hủy
										</c:if></td>
									<td><button type="button" class="btn btn-success"
											data-toggle="modal"
											data-target=".bd-example-modal-lg${od.id+3 }">Chi
											tiết</button></td>
									
									<td><button type="button" class="btn btn-primary"
											data-toggle="modal"
											data-target="#exampleModalLongs${od.id+3 }">Cập
											nhật tình trạng</button></td>
									
									
									
									<!-- Chi tiết -->
									<div class="modal fade bd-example-modal-lg${od.id+3 }"
										tabindex="-1" role="dialog"
										aria-labelledby="myLargeModalLabel" aria-hidden="true">
										<div class="modal-dialog modal-lg">
											<div class="modal-content">
												<div class="modal-header">
													<h4 class="modal-title" id="myLargeModalLabel">Chi
														tiết đơn hàng</h4>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">×</span>
													</button>
												</div>
												<div class="modal-body">

													<c:forEach items="${listOdd}" var="odd">
														<c:if test="${odd.order.id == od.id }">
															<div class="row">
																<div class="col-md-5">
																	<img
																		src="<c:url value="../resources"/>/img/${odd.proO.img}"
																		width="100px" height="100px" alt="">
																	<h5>${odd.proO.name}</h5>
																</div>
																<div class="col-md-2">
																	<h6>
																		<span class="font-weight-bold">Số lượng </span>:
																		${odd.quantity}
																	</h6>
																</div>
																<div class="col-md-2">
																	<h6>
																		<span class="font-weight-bold">Giá </span>:
																		<fmt:formatNumber value="${odd.proO.price}" />
																		đ
																	</h6>
																</div>
																<div class="col-md-3">
																	<h6>
																		<span class="font-weight-bold">Tổng Tiền </span>:
																		<fmt:formatNumber
																			value="${odd.proO.price * odd.quantity}" />
																		đ
																	</h6>
																</div>
															</div>
															<hr>

														</c:if>
													</c:forEach>

												</div>

											</div>
										</div>
									</div>
								</tr>

							</c:forEach>

							<!-- Cập nhật tình trạng đơn hàng -->
							<c:forEach items="${listOd}" var="od">
								<div class="modal fade" id="exampleModalLongs${od.id+3 }"
									tabindex="-1" role="dialog"
									aria-labelledby="exampleModalLongTitle" aria-hidden="true">
									<div class="modal-dialog" role="document">
										<form:form action="updateStatus" modelAttribute="s"
											method='POST'>
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLongTitle">Tình
														trạng đơn hàng của : ${od.fullName}</h5>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">
													<input type="hidden" value="${od.id}" name="id"> 
													<input type="hidden" value="${od.fullName}" name="fullName"> 
													<input type="hidden" value="${od.acId.id}" name="acId.id">
													<input type="hidden" value="${od.orderDate}" name="orderDate"> 
													<input type="hidden" value="${od.address}" name="address"> 
													<input type="hidden" value="${od.phone}" name="phone"> 
													<input type="hidden" value="${od.email}" name="email"> 
													<input type="hidden" value="${od.totalPrice}" name="totalPrice"> 
													<input type="hidden" value="${od.note}" name="note"> 
												
													<c:if test="${od.status  == 0}">
														<div class="custom-control custom-radio">
															<form:radiobutton id="customRadio1${od.id}"
																path="status" value="0" checked="checked"
																class="custom-control-input" />
															<label class="custom-control-label"
																for="customRadio1${od.id}">Đang xác nhận</label>
														</div>
													</c:if>

													<c:if test="${od.status  <= 1}">
														<div class="custom-control custom-radio">
															<form:radiobutton id="customRadio2${od.id}"
																path="status" value="1" class="custom-control-input" />
															<label class="custom-control-label"
																for="customRadio2${od.id}">Đang giao hàng</label>
														</div>
													</c:if>
													<div class="custom-control custom-radio">
														<form:radiobutton id="customRadio3${od.id}" path="status"
															value="2" class="custom-control-input" />
														<label class="custom-control-label"
															for="customRadio3${od.id}">Đã Hoàn thành</label>
													</div>
													<div class="custom-control custom-radio">
														<form:radiobutton id="customRadio4${od.id}" path="status"
															value="3" class="custom-control-input" />
														<label class="custom-control-label"
															for="customRadio4${od.id}">Đã Hủy</label>
													</div>

												</div>
												<div class="modal-footer">
													<button type="submit" class="btn btn-primary">Xác
														Nhận</button>
												</div>
											</div>
										</form:form>
									</div>
								</div>
							</c:forEach>

						</tbody>
					</table>
					<!-- /footer content -->
				</div>
			</div>
			<jsp:include page="footer.jsp"></jsp:include>

			<!-- jQuery -->
			<jsp:include page="link_js.jsp"></jsp:include>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<title>Gentelella Alela! |</title>

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
				<h2>Danh sách sản phẩm</h2>
				<hr>
				<div class="container">
					
					
					<table class="table">
						<thead>
							<tr>
								<th>Mã</th>
								<th>Tên</th>
								<th>Giá</th>
								<th>Giá khuyến mãi</th>
								<th>Nội dung</th>
								<th>Ảnh</th>
								<th>Trạng thái</th>
								<th>Thông tin</th>
								<th>Ngày xuất bản</th>
								<th>Nhà xuát bản</th>
								<th>Tác giả</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="p">
								<tr>
									<td>${p.id }</td>
									<td>${p.name }</td>
									<td>${p.price }</td>
									<td>${p.salePrice }</td>
									<td>${p.content }</td>
									<td><img src="<c:url value="../resources"/>/img/${p.img}"
										width="60" /></td>
										<c:if test="${p.status == 1}">
											<td>Còn hàng</td>
										
										</c:if>
										<c:if test="${p.status == 0}">
											<td>Hết hàng</td>
										
										</c:if>
										<c:if test="${p.status == 2}">
											<td>Sắp ra</td>
										
										</c:if>
									<td>${p.thong_tin}</td>
									<td>${p.ngay_xuat_ban}</td>
									<td>${p.nha_xuat_ban}</td>
									<td>${p.author}</td>
									<td><a href="detailProduct?proId=${p.id}" class="btn btn-success">Detail</a>
									<td><a href="preUpdateProduct?proId=${p.id}" class="btn btn-primary">Edit</a>
									<td><a href="deleteProduct?proId=${p.id}" class="btn btn-danger"
										onclick="return confirm('Sure?')">delete</a>
								</tr>
							</c:forEach>
						</tbody>
					</table>



					<!-- jQuery -->
					<jsp:include page="link_js.jsp"></jsp:include>
</body>
</html>

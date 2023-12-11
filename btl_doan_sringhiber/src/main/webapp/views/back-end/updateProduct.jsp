<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

				<hr>
				<form action="updateProduct" method="POST"
					enctype="multipart/form-data">
					<h3 style="color: red">${err }</h3>
					<div class="form-group">
						<label for="">Danh mục sản phẩm</label><Select>
							<c:forEach items="${listcat}" var="c">
								<option name="catId" value="${c.id}">${c.name }</option>
							</c:forEach>
						</Select>

					</div>

					<div class="form-group">
						<label for="">Tên sản phẩm</label><input type="text"
							class="form-control" name="name">

					</div>

					<div class="form-group">
						<label for="">Giá sản phẩm</label> <input type="number"
							class="form-control" name="price">
					</div>

					<div class="form-group">
						<label for="">Giá KM</label> <input type="number"
							class="form-control" name="sale_price">
					</div>

					<div class="form-group">
						<label for="">Trạng thái</label>
						<div class="radio">
							<label> <input type="radio" name="status" value="0">
								Còn hàng
							</label>
						</div>
						<div class="radio">
							<label> <input type="radio" name="status" value="1">
								Hết hàng
							</label>
						</div>
						<div class="radio">
							<label> <input type="radio" name="status" value="2">
								Sắp ra
							</label>
						</div>
					</div>

					<div class="form-group">
						<label for="">Mô tả </label> <input type="text"
							class="form-control" name="content">
					</div>

					<div class="form-group">
						<label for="">Ngày xuất bản </label> <input type="date"
							class="form-control" name="ngay_xuat_ban"  value="10/01/2002">
					</div>
					<div class="form-group">
						<label for="">Nhà xuất bản </label> <input type="text"
							class="form-control" name="nha_xuat_ban"
							value="${p.nha_xuat_ban }">
					</div>
					<div class="form-group">
						<label for="">Nhà cung cấp </label> <input type="text"
							class="form-control" name="nha_cung_cap" value="${p.nha_cung_cap }">
					</div>
					<div class="form-group">
						<label for="">Thông tin </label> <input type="text"
							class="form-control" name="thong_tin">
					</div>

					<div class="form-group">
						<label for="">Ảnh đại diện</label> <input type="file"
							class="form-control" path="img" />
						<hr>
						<img src="<c:url value="../resources"/>/img/${p.img}" width="250">
					</div>

					<button type="submit" class="btn btn-primary">Cập nhật</button>
				</form>
			</div>
			<!-- /page content -->

			<!-- footer content -->
			<jsp:include page="footer.jsp"></jsp:include>
			<!-- /footer content -->
		</div>
	</div>

	<!-- jQuery -->
	<jsp:include page="link_js.jsp"></jsp:include>

</body>
</html>

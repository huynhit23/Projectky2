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
				<h2>Thêm mới sản phẩm</h2>
				<h3 style="color:red">${err }</h3>
				<hr>
				<form action="insertProduct" method="post"
					enctype="multipart/form-data">

					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label for=""><b>Tên sản phẩm</b></label> <input type="text"
									class="form-control" name="name" aria-describedby="helpId"
									placeholder="">

							</div>
							<div class="form-group">
								<label for=""><b>Nhà xuất bản</b></label> <input type="text"
									class="form-control" name="nha_xuat_ban"
									aria-describedby="helpId" placeholder="">

							</div>
							<div class="form-group">
								<label for=""><b>Nhà cung cấp</b></label>
								<textarea name="nha_cung_cap" class="form-control" cols="30"
									rows="10"></textarea>

							</div>
							<hr>
							<div class="form-check">

								<label><b>Trạng thái</b></label>

								<div class="row">
									<div class="col-md-4">
										<label class="form-check-label"> <input type="radio"
											class="form-check-input" name="status" value="1"> Hết
											hàng
										</label>
									</div>
									<div class="col-md-4">
										<label class="form-check-label"> <input type="radio"
											class="form-check-input" name="status" value="0" checked>
											Còn hàng
										</label>
									</div>
									<div class="col-md-4">
										<label class="form-check-label"> <input type="radio"
											class="form-check-input" name="status" value="2" checked>
											Sắp ra
										</label>
									</div>
								</div>


							</div>
							<hr>
							<div class="form-group">
								<label for=""><b>Ngày xuất bản</b></label> <input type="date"
									class="form-control" name="ngay_xuat_ban"
									aria-describedby="helpId" placeholder="">

							</div>
							<div class="form-group">
								<h5 for="">
									<b>Danh Mục</b>
								</h5>
								<Select>
									<c:forEach items="${listcat}" var="c">
										<option name="catId" value="${c.id}">${c.name }</option>
									</c:forEach>
								</Select>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for=""><b>Chọn ảnh</b></label> <input type="file"
									class="form-control" name="imgFile" placeholder="Tên danh mục">

							</div>

							<div class="form-group">
								<label for=""><b>Giá</b></label> <input type="number"
									class="form-control" name="price" aria-describedby="helpId"
									placeholder="">
							</div>

							<div class="form-group">
								<label for=""><b>Giá KM</b></label> <input type="number"
									class="form-control" name="salePrice" aria-describedby="helpId"
									placeholder="">

							</div>

							<div class="form-group">
								<label for=""><b>Mô tả</b></label>
								<textarea name="content" class="form-control" cols="30"
									rows="10"></textarea>

							</div>
							<div class="form-group">
								<label for=""><b>Thông tin</b></label>
								<textarea name="thong_tin" class="form-control" cols="30"
									rows="10"></textarea>

							</div>
							<div class="form-group">
								<label for=""><b>Tác giả</b></label>
								<textarea name="author" class="form-control" cols="30"
									rows="10"></textarea>

							</div>


						</div>
					</div>

					<button type="submit" class="btn btn-info">Thêm</button>
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

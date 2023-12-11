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
				<div class="container">
					<div class="row">
					<div col-md-6>
						<img src="<c:url value="../resources"/>/img/${p.img}"
										width="200" />
					</div>
					<div col-md-6>
						<table class="table table-bordered" >
							<tr>
								<td>Mã sản phẩm</td>
								<td>${p.id }</td>
							</tr>
							<tr>
								<td>Tên sản phẩm</td>
								<td>${p.name }</td>
							</tr>
							<tr>
								<td>Giá Sản phẩm</td>
								<td>${p.price }</td>
							</tr>
							<tr>
								<td>Giá khuyến mãi</td>
								<td>${p.salePrice }</td>
							</tr>
							<tr>
								<td>Nội dung sản phẩm</td>
								<td>${p.content }</td>
							</tr>
							<tr>
								<td>Thông tin sản phẩm</td>
								<td>${p.thong_tin }</td>
							</tr>
							<tr>
								<td>Ngày xuất bản</td>
								<td>${p.ngay_xuat_ban }</td>
							</tr>

							<tr>
								<td>Nhà xuát bản</td>
								<td>${p.nha_xuat_ban }</td>
							</tr>
							<tr>
								<td>Tác giả</td>
								<td>${p.author }</td>
							</tr>
						</table>
					</div>
				</div>
				</div>

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

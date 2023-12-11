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
				<h2>Danh sách danh mục</h2>
				<hr>
				<div class="container">


					<hr>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>ID</th>
								<th>NAME</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="c">
								<tr>
									<td>${c.id }</td>
									<td>${c.name }</td>
									<td><a href="preUpdateCategories?id=${c.id}" class="btn btn-primary">Edit</a>
									<td><a href="deleteCategories?id=${c.id}" class="btn btn-danger"
										onclick="return confirm('Sure?')">delete</a>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<hr>

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
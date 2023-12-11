<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" href="<c:url value="resources"/>/images/favicon.ico" type="image/ico" />

    <title>Gentelella Alela! | </title>

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
          <h1>Xin chào :<span style="color: red;">${pageContext.request.userPrincipal.name} </span> </h1>
          
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

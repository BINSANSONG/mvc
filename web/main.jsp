<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>USER/PRODUCT</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <!-- Bootstrap core CSS-->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom fonts for this template-->
  <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <!-- Page level plugin CSS-->
  <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
  <!-- Custom styles for this template-->
  <link href="css/sb-admin.css" rel="stylesheet">
</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
  <!-- Navigation-->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
    <a class="navbar-brand" href="index.html">USER/PRODUCT</a>
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Dashboard">
          <a class="nav-link" href="main.kakao?page=useradd">
            <i class="fa fa-fw fa-dashboard"></i>
            <span class="nav-link-text">ADD USER</span>
          </a>
        </li>
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Charts">
          <a class="nav-link" href="user.kakao?cmd=list">
            <i class="fa fa-fw fa-area-chart"></i>
            <span class="nav-link-text">USER LIST</span>
          </a>
        </li>
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Tables">
          <a class="nav-link" href="main.kakao?page=productadd">
            <i class="fa fa-fw fa-table"></i>
            <span class="nav-link-text">ADD PRODUCT</span>
          </a>
        </li>
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Components">
          <a class="nav-link" href="product.kakao?cmd=list">
            <i class="fa fa-fw fa-wrench"></i>
            <span class="nav-link-text">PRODUCT LIST</span>
          </a>
        </li>
        
          <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Components">
          <a class="nav-link" href="main.kakao?page=weatherweather">
            <i class="fa fa-fw fa-wrench"></i>
            <span class="nav-link-text">WEATHER</span>
          </a>
        </li>
      </ul>
      <ul class="navbar-nav sidenav-toggler">
        <li class="nav-item">
          <a class="nav-link text-center" id="sidenavToggler">
            <i class="fa fa-fw fa-angle-left"></i>
          </a>
        </li>
      </ul>
    </div>
    <ul class="navbar-nav ml-auto">
    	<c:choose>
			<c:when test="${loginuser==null}">
				<li class="nav-item">
					<a class="nav-link" href="main.kakao?page=login"> 
						<i class="fa fa-fw fa-sign-in"></i>Login
					</a>
				</li>
			</c:when>
			<c:otherwise>
				<li class="nav-item">
					<a class="nav-link">${loginuser.getId()} ${loginuser.getName()}님</a>
				</li>
				<li class="nav-item">
          			<a class="nav-link" href="loginout.kakao">
            			<i class="fa fa-fw fa-sign-out"></i>Logout
            		</a>
        		</li>
        	</c:otherwise>
        </c:choose>
    </ul>
  </nav>
  <div class="content-wrapper">
    <div class="container-fluid">
      <c:choose>
        <c:when test="${center!=null}">
          <jsp:include page="${center}.jsp"/>
        </c:when>
        <c:otherwise>
        	<jsp:include page="center.jsp"/>
        </c:otherwise>
      </c:choose>
    </div>
    <!-- /.container-fluid-->
    <!-- /.content-wrapper-->
    <footer class="sticky-footer">
      <div class="container">
        <div class="text-center">
          <small>Copyright © BINSAN 2018</small>
        </div>
      </div>
    </footer>
    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
      <i class="fa fa-angle-up"></i>
    </a>
    <!-- Logout Modal-->
    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
    <!-- Page level plugin JavaScript-->
    <script src="vendor/chart.js/Chart.min.js"></script>
    <script src="vendor/datatables/jquery.dataTables.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.js"></script>
    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin.min.js"></script>
    <!-- Custom scripts for this page-->
    <script src="js/sb-admin-datatables.min.js"></script>
    <script src="js/sb-admin-charts.min.js"></script>
  </div>
</body>

</html>

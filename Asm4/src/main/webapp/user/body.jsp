<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>${title }</title>
<link rel="icon" href="https://ap.poly.edu.vn/images/favicon.ico"
	type="image/icon type">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" />

<style type="text/css">
ul li a {
	color: white;
}

.hv li {
	padding-left: 10px;
	padding-right: 10px;
}

.hv li:hover {
	background: white;
	color: re;
	display: block;
	border-radius: 10px;
}
</style>
</head>
<body
	style="background: url(/Asm4/images/hinh-nen-den-25.jpg) no-repeat; background-size: cover;">
	<main class="container">
		<header class="row pt-5 pb-2 pl-10">
			<div class="col-9">
				<a href="/Asm4/home" style="color: white; font-size: 32px">Thành
					Nguyễn</a>
			</div>
			<div class="col-3 text-right">
				<a href="/Asm4/home"><img style="width: 150px"
					src="/Asm4/images/icon2a.png" alt="" class="mr-8"></a>

			</div>
		</header>
		<nav class="row">
			<nav class="col navbar navbar-expand-sm" style="border-radius: 20px;">
				<div class="collapse navbar-collapse" id="collapsibleNavId"
					style="height: 50px; border-radius: 10px; background: url(/Asm4/images/ff046d7378f46cd987704ec8bb27a019.png) no-repeat; background-size: cover;">
					<ul class="navbar-nav mr-auto mt-2 mt-lg-0 hv">
						<c:if
							test="${ fn:contains(lienKet,'home')||fn:contains(lienKet,'user')||fn:contains(lienKet,'video') }">
							<li class="nav-item "
								style="background: white; border-radius: 10px"><a
								style="color: black;" class="nav-link"
								href="<%=request.getContextPath()%>/home">Home <span
									class="sr-only">(current)</span></a></li>
							<li class="nav-item "><a class="nav-link"
								href="<%=request.getContextPath()%>/yeu-thich">Yêu Thích<span
									class="sr-only">(current)</span></a></li>
							<li class="nav-item dropdown "><a
								class="nav-link dropdown-toggle" href="#" id="dropdownId"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">Tài khoản của tôi</a>
								<div class="dropdown-menu" aria-labelledby="dropdownId">
									<c:if test="${not isLogIn}">
										<a class="dropdown-item"
											href="<%=request.getContextPath()%>/dang-nhap">Đăng Nhập</a>
										<a class="dropdown-item"
											href="<%=request.getContextPath()%>/forgot">Quên Mật Khẩu</a>
									</c:if>

									<c:if test="${isLogIn}">
										<a class="dropdown-item"
											href="<%=request.getContextPath()%>/TTCN">Tài khoản của
											tôi</a>
										<a class="dropdown-item"
											href="<%=request.getContextPath()%>/dang-xuat">Đăng Xuất</a>
										<a class="dropdown-item" href="#">Đổi Mật Khẩu</a>
										<a class="dropdown-item"
											href="<%=request.getContextPath()%>/yeu-thich">Yêu Thích</a>

									</c:if>
								</div></li>
						</c:if>
						<c:if
							test="${ fn:contains(lienKet,'yeu-thich')&&username.admins == false}">
							<li class="nav-item "><a class="nav-link"
								href="<%=request.getContextPath()%>/home">Home <span
									class="sr-only">(current)</span></a></li>
							<li class="nav-item "
								style="background: white; border-radius: 10px"><a
								style="color: black;" class="nav-link"
								href="<%=request.getContextPath()%>/yeu-thich">Yêu Thích<span
									class="sr-only">(current)</span></a></li>
							<li class="nav-item dropdown "><a
								class="nav-link dropdown-toggle" href="#" id="dropdownId"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">Tài khoản của tôi</a>
								<div class="dropdown-menu" aria-labelledby="dropdownId">
									<c:if test="${not isLogIn}">
										<a class="dropdown-item"
											href="<%=request.getContextPath()%>/dang-nhap">Đăng Nhập</a>
										<a class="dropdown-item"
											href="<%=request.getContextPath()%>/forgot">Quên Mật Khẩu</a>
									</c:if>

									<c:if test="${isLogIn}">
										<a class="dropdown-item"
											href="<%=request.getContextPath()%>/TTCN">Tài khoản của
											tôi</a>
										<a class="dropdown-item"
											href="<%=request.getContextPath()%>/dang-xuat">Đăng Xuất</a>
										<a class="dropdown-item" href="#">Đổi Mật Khẩu</a>
										<a class="dropdown-item"
											href="<%=request.getContextPath()%>/yeu-thich">Yêu Thích</a>

									</c:if>
								</div></li>
						</c:if>

						<c:if test="${username.admins == true }">
							<li class="nav-item "><a class="nav-link"
								href="<%=request.getContextPath()%>/admin">Quản Lí<span
									class="sr-only">(current)</span></a></li>
						</c:if>
						<c:if test="${ fn:contains(lienKet,'TTCN')}">
							<li class="nav-item "><a class="nav-link"
								href="<%=request.getContextPath()%>/home">Home <span
									class="sr-only">(current)</span></a></li>
							<li class="nav-item "><a class="nav-link"
								href="<%=request.getContextPath()%>/yeu-thich">Yêu Thích<span
									class="sr-only">(current)</span></a></li>
							<li class="nav-item dropdown "
								style="background: white; border-radius: 10px"><a
								style="color: black;" class="nav-link dropdown-toggle" href="#"
								id="dropdownId" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">Tài khoản của tôi</a>
								<div class="dropdown-menu" aria-labelledby="dropdownId">
									<c:if test="${not isLogIn}">
										<a class="dropdown-item"
											href="<%=request.getContextPath()%>/dang-nhap">Đăng Nhập</a>
										<a class="dropdown-item"
											href="<%=request.getContextPath()%>/forgot">Quên Mật Khẩu</a>
									</c:if>

									<c:if test="${isLogIn}">
										<a class="dropdown-item"
											href="<%=request.getContextPath()%>/TTCN">Tài khoản của
											tôi</a>
										<a class="dropdown-item"
											href="<%=request.getContextPath()%>/dang-xuat">Đăng Xuất</a>
										<a class="dropdown-item" href="#">Đổi Mật Khẩu</a>
										<a class="dropdown-item"
											href="<%=request.getContextPath()%>/yeu-thich">Yêu Thích</a>

									</c:if>
								</div></li>
						</c:if>
					</ul>
					<form class="form-inline my-2 my-lg-0" action="/Asm4/find">
						<input class="form-control mr-sm-2" style="width: 500px"
							type="text" placeholder="Search" value="" name="ten">
						<button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>
					</form>
				</div>
			</nav>
		</nav>
		<%-- --%>

		<section>
			<jsp:include page="${view}"></jsp:include>

		</section>
		<!-- Footer -->

		<footer class="text-center text-lg-start text-light">
			<!-- Section: Social media -->
			<section
				class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom">
				<!-- Left -->
				<!-- Right -->
			</section>
			<!-- Section: Social media -->

			<!-- Section: Links  -->
			<section class="">
				<div class="container text-center text-md-start mt-5">
					<!-- Grid row -->
					<div class="row mt-3">
						<!-- Grid column -->
						<div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
							<!-- Content -->
							<h6 class="text-uppercase fw-bold mb-4">
								<i class="fas fa-gem me-3"></i>Thành Nguyễn
							</h6>
							<p>Here you can use rows and columns to organize your footer
								content. Lorem ipsum dolor sit amet, consectetur adipisicing
								elit.</p>
						</div>
						<!-- Grid column -->

						<!-- Grid column -->
						<div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
							<!-- Links -->
							<h6 class="text-uppercase fw-bold mb-4">Products</h6>
							<p>
								<a href="#!" class="text-reset">Angular</a>
							</p>
							<p>
								<a href="#!" class="text-reset">React</a>
							</p>
							<p>
								<a href="#!" class="text-reset">Vue</a>
							</p>
							<p>
								<a href="#!" class="text-reset">Laravel</a>
							</p>
						</div>
						<!-- Grid column -->

						<!-- Grid column -->
						<div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
							<!-- Links -->
							<h6 class="text-uppercase fw-bold mb-4">Useful links</h6>
							<p>
								<a href="#!" class="text-reset">Pricing</a>
							</p>
							<p>
								<a href="#!" class="text-reset">Settings</a>
							</p>
							<p>
								<a href="#!" class="text-reset">Orders</a>
							</p>
							<p>
								<a href="#!" class="text-reset">Help</a>
							</p>
						</div>
						<!-- Grid column -->

						<!-- Grid column -->
						<div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
							<!-- Links -->
							<h6 class="text-uppercase fw-bold mb-4">Contact</h6>
							<p>
								<i class="fas fa-home me-3"></i>Vân Côn, Hoài Đức, Hà Nội
							</p>
							<p>
								<i class="fas fa-envelope me-3"></i>thanha8k26@gmail.com
							</p>
							<p>
								<i class="fas fa-phone me-3"></i> + 84 979 268 525
							</p>
							<p>
								<i class="fas fa-print me-3"></i> + 84 979 268 525
							</p>
						</div>
						<!-- Grid column -->
					</div>
					<!-- Grid row -->
				</div>
			</section>
			<!-- Section: Links  -->

			<!-- Copyright -->
			<div class="text-center p-4"
				style="background-color: rgba(0, 0, 0, 0.05);">
				© 2021 Copyright: <a class="text-reset fw-bold"
					href="https://mdbootstrap.com/">MDBootstrap.com</a>
			</div>
			<!-- Copyright -->
		</footer>
		<!-- Footer -->
	</main>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
</body>
</html>
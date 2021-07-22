<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Thành Nguyễn</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<style type="text/css">
	.css>.a{
		color: white;	
	}
</style>
</head>
<body>
	<main class="container-fluid">
		<section class="row">
			<div class="col mt-4">
				<ul class="nav nav-tabs" id="myTab" role="tablist">
					<li class="nav-item" role="presentation"><a
						class="nav-link " id="Edit-tab" data-toggle="tab"
						href="#Edit" role="tab" aria-controls="Edit" aria-selected="false">Edit</a>
					</li>
					<li class="nav-item" role="presentation"><a class="nav-link active"
						id="VideoList-tab" data-toggle="tab" href="#VideoList" role="tab"
						aria-controls="VideoList" aria-selected="true">List</a></li>

				</ul>
				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade" id="Edit" role="tabpanel"
						aria-labelledby="Edit-tab">
						<form action="/Asm4/userservlet" method="post">
							<div class="card" style=" background: url(/Asm4/images/hinh-nen-background-dep-32.jpg) no-repeat;background-size: cover;border-radius: 10px">
								<div class="card-body" >
									<div class="row">
										<div class="col">
											<div class="form-group">
											<!-- readonly="readonly" -->
												<label for="idTaiKhoan">Tài Khoản</label> <input
													 class="form-control" required
													type="text" class="form-control" name="id" id="idTaiKhoan"
													aria-describedby="idTaiKhoanHid" placeholder="Tài khoản"
													value="${userOject.id }"> <small id="idTaiKhoanHid"
													class="form-text text-muted" style="color: red">Bắt buộc!</small>
											</div>
											<div class="form-group">
												<label for="Fullname">Họ và Tên</label> <input
													class="form-control" required type="text"
													class="form-control" name="fullname" id="Fullname"
													aria-describedby="FullnameHid" placeholder="Họ và tên"
													value="${userOject.fullname }"> <small id="idTaiKhoanHid"
													class="form-text text-muted" style="color: red">Bắt buộc!</small>
											</div>
											<div class="form-group">
												<label for="matKhau">Mật khẩu</label> <input
													class="form-control" required type="password"
													class="form-control" name="passwords" id="passwords"
													aria-describedby="matKhaiHid" placeholder="Mật khẩu"
													value="${userOject.passwords }"><small id="idTaiKhoanHid"
													class="form-text text-muted" style="color: red">Bắt buộc!</small>
											</div>
											<div class="form-group">
												<label for="emailId">Email</label> <input
													class="form-control" required type="text"
													class="form-control" name="email" id="emailId"
													aria-describedby="EmailidHid" placeholder="Email"
													value="${userOject.email }"><small id="idTaiKhoanHid"
													class="form-text text-muted" style="color: red">Bắt buộc!</small>
											</div>
											<div class="form-check form-check-inline">
												<label><input type="radio" class="form-check-input"
													value="true" name="admin" id="status"
													${userOject.admins ?'checked':'' }> Admin </label> <label><input
													class="" required type="radio" class="form-check-input"
													value="false" name="admin" id="status"
													${!userOject.admins ?'checked':""}> User</label>
											</div>
										</div>

										<div class="col"></div>
									</div>
								</div>

								<div class="card-footer text-muted">
									<button class="btn btn-primary" formaction="cu">Create</button>
									<button class="btn btn-warning" formaction="uu">Update</button>
									<button class="btn btn-danger" formaction="du">Delete</button>
									<button class="btn btn-info" formaction="ru">Reset</button>
								</div>
							</div>

						</form>
					</div>
					<div class="tab-pane fade  show active" id="VideoList" role="tabpanel"
						aria-labelledby="VideoList-tab">
						<table class="table table-strip">
							<tr style="color: white">
								<td>Tai Khoan</td>
								<td>Ho Ten</td>
								<td>Email</td>
								<td>Chuc vu</td>
								<td>Action</td>
							</tr>

							<%
							if (request.getAttribute("listUser") != null) {
							%>
							<c:forEach var="item" items="${listUser}" varStatus="STT">
								<tr style="color: white">
									<td>${item.id}</td>
									<td>${item.fullname}</td>
									<td>${item.email}</td>
									<td><c:choose>
											<c:when test="${item.admins == true }">Quản Lí</c:when>
											<c:otherwise>Nhân Viên</c:otherwise>
										</c:choose></td>
									<td><a href="/Asm4/edit?userId=<c:out value='${item.id}'/>">Edit</a></td>
								</tr>
							</c:forEach>
							<%
							}
							%>

						</table>
						<nav aria-label="Page navigation" >
							<form action="" >
								<label style="color: white" for="limit">Page Size</label>
								<select style="width: 100px" name="limit" id="size" class="form-control" onchange="this.form.submit()" >
									<option  value="4">4</option>
									<option  value="8">8</option>
									<option  value="16">16</option>
									<option  value="32">32</option>
									<option  value="64">64</option>
									<option selected>${limit}</option>
								</select>
							</form>
							
							<ul class="pagination justify-content-center">
								<li class="page-item"><a
									href="/Asm4/qlus?page=${ page - 1 }&limit=${ limit }"
									class="page-link">&laquo;</a></li>
								<li class="page-item"><a class="page-link" href="/Asm4/qlus?page=${ page - 1 }&limit=${ limit }">${page-1}</a></li>
								<li class="page-item"><a class="page-link" href="/Asm4/qlus?page=${ page }&limit=${ limit }">${page}</a></li>
								<li class="page-item"><a class="page-link" href="/Asm4/qlus?page=${ page + 1 }&limit=${ limit }">${page+1}</a></li>
								<li class="page-item"><a
									href="/Asm4/qlus?page=${ page + 1 }&limit=${ limit }"
									class="page-link">&raquo;</a></li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</section>
	</main>
</body>
</html>
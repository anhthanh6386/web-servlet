<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!doctype html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<style type="text/css">
	label{
		color: white;
	}
</style>
<body>
	<main class="container-fluid">
		<section class="row">
			<div class="col mt-4" style="left: 370px">
				<div class="col-9" >
					<form action="/Asm4/userservlet" method="POST">
						<div class="form-group">
							<label>Tài Khoản</label> <input type="text" style="width: 350px" class="form-control"
								required name="id" id="id" placeholder="Tài Khoản" disabled
								value="${userTTCN.id }">

						</div>
						<div class="form-group">
							<label>Mật Khẩu</label> <input type="text" style="width: 350px" class="form-control"
								required name="passwords" id="matkhau" placeholder="Mật Khẩu"
								value="${userTTCN.passwords}">

						</div>
						<div class="form-group">
							<label>Họ Tên</label> <input type="text" style="width: 350px" class="form-control"
								required name="fullname" id="hoten" placeholder="Họ Tên"
								value="${userTTCN.fullname }">

						</div>
						<div class="form-group">
							<label>Email</label> <input type="email" style="width: 350px" class="form-control"
								required name="email" id="email" placeholder="Email"
								value="${userTTCN.email}">

						</div>
						<div>
							<button type="submit" class="btn btn-warning" formaction="up">Update</button>
						</div>

					</form>
				</div>

			</div>
		</section>
	</main>

</body>

</html>
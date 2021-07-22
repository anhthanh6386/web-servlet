<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
	tr{
	color:white; 
	}
	label {
	color: white
}
</style>
</head>
<body>
	<main class="container-fluid">
		<section class="row">
			<div class="col mt-4">
				<ul class="nav nav-tabs" id="myTab" role="tablist">
					<li class="nav-item" role="presentation"><a
						class="nav-link active" id="VideoList-tab" data-toggle="tab"
						href="#VideoList" role="tab" aria-controls="VideoList"
						aria-selected="false">Video</a></li>

					<li class="nav-item" role="presentation"><a class="nav-link "
						id="User-tab" data-toggle="tab" href="#User" role="tab"
						aria-controls="User" aria-selected="true">User</a></li>

					<li class="nav-item" role="presentation"><a class="nav-link"
						id="Share-tab" data-toggle="tab" href="#Share" role="tab"
						aria-controls="Share" aria-selected="false">Share</a></li>
				</ul>
				<div class="tab-content" id="myTabContent">

					<div class="tab-pane fade show active" id="VideoList"
						role="tabpanel" aria-labelledby="VideoList-tab">
						<table class="table table-strip">
							<tr>
								<td>Video Title</td>
								<td>like count</td>
								<td>latest date</td>
								<td>oldest date</td>
							</tr>
							<c:forEach var="item" items="${listFavoriteReport}"
								varStatus="STT">
								<tr>
									<td>${item.videoTitle}</td>
									<td>${item.favoriteCoount}</td>
									<td>${item.newesdate}</td>
									<td>${item.oldesdate}</td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<div class="tab-pane fade " id="User" role="tabpanel"
						aria-labelledby="User-tab">
						<form action="" method="get">
							<div class="row mt-3">
								<div class="form-inline">
								</div>
							</div>
							<div class="row">
								<div class="col mt-3">
									<table class="table table-strip">
										<tr>
											<td>UserName</td>
											<td>FullName</td>
											<td>Email</td>
											<td>Count Login</td>
										</tr>
										<c:forEach var="listF" items="${ listF }" varStatus="STT">
											<tr>
												<td>${listF.id}</td>
												<td>${listF.fullname }</td>
												<td>${listF.email }</td>
												<td>${listF.countLogin }</td>
											</tr>
										</c:forEach>
									</table>
								</div>
							</div>

						</form>

					</div>
					<div class="tab-pane fade" id="Share" role="tabpanel"
						aria-labelledby="Share-tab">
						<form action="" method="">
							<div class="row">
								<div class="col mt-3">
									<table class="table table-strip">
										<tr>
											<td>Share ID</td>
											<td>Video ID</td>
											<td>Tên video</td>
											<td>Nguoi gui</td>
											<td>Email</td>
											<td>Email nhan</td>
											<td>Ngay share</td>
										</tr>
										<c:forEach var="vList" items="${vList }" varStatus="STT">
											<tr>
												<td>${vList.id }</td>
												<td>${vList.video.id}</td>
												<td>${vList.video.tiTile}</td>
												<td>${vList.user.fullname}</td>
												<td>${vList.emailgui }</td>
												<td>${vList.email }</td>
												<td>${vList.sharedate }</td> 
											</tr>
										</c:forEach>
									</table>
								</div>
							</div>

						</form>
					</div>
				</div>
			</div>
		</section>

	</main>
</body>
</html>
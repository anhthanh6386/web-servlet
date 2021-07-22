<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="en">
<head>
<title>Title</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>

<body>
	<main class="container">
		<div class="row">
			<div class="col-8">
				<div class="card text-center mt-3">
					<div class="card-body"
						style="background: url(/Asm4/images/ff046d7378f46cd987704ec8bb27a019.png) no-repeat;background-size: cover;">
						<div class="row">
							<input hidden="true" name="videoId" value="${videoOject.id}">
							<iframe width="720" height="450"
								src="https://www.youtube.com/embed/${videoOject.id}"
								title="YouTube video player" frameborder="0"
								allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
								allowfullscreen></iframe>
						</div>
						<div class="row p-2">
							<b style="color: white">${videoOject.tiTile}</b>
						</div>
						<div class="row p-2">
							<b style="color: white"><fmt:formatNumber type="number">${videoOject.views}</fmt:formatNumber> Views</b>
						</div>
						<div class="card-footer text-right">
							<c:if test="${not isLogIn}">
								<a href="#deleteEmployeeModal" data-toggle="modal"
									class="btn btn-outline-success"> <span>Like</span></a>
								<a href="#deleteEmployeeModal" data-toggle="modal"
									class="btn btn-outline-success"> <span>Share</span></a>
							</c:if>
							<c:if test="${isLogIn}">
								<c:set var="check" value="true" />

								<c:forEach var="itemfa" items="${listFavorite}">
									<c:choose>
										<c:when test="${itemfa.video.id == videoOject.id}">
											<c:set var="check" value="false" />
										</c:when>
										<c:otherwise>
										</c:otherwise>
									</c:choose>
								</c:forEach>


								<c:if test="${check == false}">
									<a
										href="<%=request.getContextPath()%>/UL?ULId=<c:out value='${videoOject.id}'/>">
										<span class="btn btn-outline-danger">UnLike</span>
									</a>
									<a
										href="<%=request.getContextPath()%>/Sh?SId=<c:out value='${videoOject.id}'/>"
										class="btn btn-outline-info">Share</a>
								</c:if>

								<c:if test="${check == true}"> 
									<a
										href="<%=request.getContextPath()%>/L?LId=<c:out value='${videoOject.id}'/>"
										class="btn btn-outline-success">Like</a>
									<a
										href="<%=request.getContextPath()%>/Sh?SId=<c:out value='${videoOject.id}'/>"
										class="btn btn-outline-info">Share</a>
								</c:if>
							</c:if>
						</div>
						<div>
							 <input id="a" hidden="true" value="">
							 <h6 style="color: white;text-align: left">${videoOject.descriptions}</h6>
						</div>
						<div class="form-inline">
							<form action="/Asm4/comment" method="post">							
								<input hidden="true" value="${videoOject.id}" name="idVid">
								<input hidden="true" value="${ usernametk }" name="usernametk">
								<span style="color: white">${ usernametk }</span><input name="comment" style="border-radius:20px;margin-left: 10px;width: 450px" type="text" >;
								<c:if test="${not isLogIn}">
								<a href="#deleteEmployeeModal" data-toggle="modal"
									class="btn btn-outline-primary"> <span>Bình Luận</span></a>
							</c:if>
							<c:if test="${isLogIn}">
								<button class="btn btn-outline-primary" style="border-radius:20px;">Bình Luận</button>
							</c:if>
							</form>
						</div>
						
						<c:forEach items="${ listComment }" var="list">
							<div align="left">
							<span style="color: yellow;">${ list.username }:</span>
							<span style="color: white;">${ list.comment }</span>
							</div>
						</c:forEach>
							
						
					</div>
				</div>
			</div>
			<div class="col-4">
				<%
				if (request.getAttribute("listVideo") != null) {
				%>
				<c:forEach var="item" items="${listVideo}">
					<a
						href="<%=request.getContextPath()%>/video?videoId=<c:out value='${item.id}'/>">
						<div class="row mt-3 mb-3">
							<div class="col-4">
								<img style="width: 100%; height:100px" id="blah" name="poster"
									src="/Asm4/images/${item.poster}" alt="your image"></img>
							</div>
							<div style="font-size: 5; color: white;width: 200px">${item.tiTile}</div>
						</div>
					</a>
				</c:forEach>
				<%
				}
				%>
			</div>
		</div>
	</main>



	<!-- Delete Modal HTML -->
	<div id="deleteEmployeeModal" class="modal fade" >
		<div class="modal-dialog" >
			<div class="modal-content" style="border:1px solid white;background: url(/Asm4/images/ff046d7378f46cd987704ec8bb27a019.png) no-repeat;background-size: cover;">
				<div class="modal-header">
					<h4 style="color: white" class="modal-title">Chào mừng đến với Thành Nguyễn</h4>
					<button type="button" class="btn close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div style="text-align: center;">
					<h1 style="color: white">Bạn Chưa Đăng Nhập</h1>
					<a href="<%=request.getContextPath()%>/dang-nhap"
						class="btn btn-outline-light">Đăng Nhập</a> <br> <br>
				</div>
			</div>
		</div>
	</div>
</body>
</html>






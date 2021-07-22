<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<style type="text/css">
	label{
		color: white;
	}
</style>	
</head>
<body>
	<main class="container">
		<section class="row">
			<div class="col-12">
				<div class="row p-5">
					<%
					if (request.getAttribute("listFavorite") != null) {
					%>
					<c:forEach var="item" items="${listFavorite}">
						<c:if test="${nametk == item.user.id }">
							<div class="row mt-3 mb-3">
								<div class="col-7">
									<div class="row">
										<div class="col-3">
											<img style="width: 200px;height: 100px" src="/Asm4/images/${item.video.poster}" alt=""
												class="img-fluid">
										</div>
										<div style="color: white;width: 200px;">${ item.video.tiTile }</div>
										<%-- <c:choose>
											<c:when test="${fn:length(item.video.tiTile) > 70}">
												<div style="font-size: 5; color: white">${fn:substring(item.video.tiTile, 0, 70)}
												</div>
												${fn:length(item.video.tiTile)}
											
											<br>${fn:substring(item.video.tiTile, 70,90)}
											</c:when>
											<c:otherwise>
												<div style="font-size: 5; color: white">${fn:substring(item.video.tiTile, 0, 70)}...</div>
												<br />
											</c:otherwise>
										</c:choose> --%>
									</div>
								</div>
								<div class="col-2">
									<a
										href="<%=request.getContextPath()%>/UL?ULId=<c:out value='${item.video.id}'/>">
										<span class="btn btn-danger">UnLike</span>
									</a>
								</div>
							</div>
						</c:if>
					</c:forEach>
					<%
					}
					%>
				</div>

				<div class="row">
					<div class="col">
						<nav aria-label="Page navigation">
							<ul class="pagination justify-content-center">
								<li class="page-item disabled"><a class="page-link"
									href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
										<span class="sr-only">Previous</span>
								</a></li>
								<li class="page-item active"><a class="page-link" href="#">1</a></li>
								<li class="page-item"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#"
									aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										<span class="sr-only">Next</span>
								</a></li>
							</ul>
						</nav>
					</div>
				</div>
			</div>

		</section>
	</main>
</body>

</html>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!doctype html>
<html lang="en">

<head>

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
.heart {
  width: 200px;
  height: 200px;
  top: 15%;
  left: 10%;
  z-index: 1;
  display: block;
  position: absolute;
  transform: translate(-50%,-50%);
  animation: heart 1s ease infinite
}

@keyframes heart {
  96% {
    transform: translate(-50%,-50%) scale(.8,.8)
  }

  100% {
    transform: translate(-50%,-50%) scale(1,1)
  }
}

.heart div {
  background: white;
  width: 21px;
  height: 30px;
  top: 40px;
  display: block;
  position: absolute;
  border-radius: 100%;
}

.left {
  left: 85px;
  transform: rotate(330deg);
}

.right {
  right: 85px;
  transform: rotate(30deg);
}

</style>
</head>

<body>
	<main class="container">
		<section class="row">
			<div class="col-12">
				<div class="row p-2">			
					<%
					if (request.getAttribute("listVideo") != null) {
					%>
					
					<c:forEach var="item" items="${listVideo}" varStatus="STT">
						<c:if test="${!item.deleteVD}">


							<c:set var="check" value="true" />
							
							<a
								href="<%=request.getContextPath()%>/video?videoId=<c:out value='${item.id}'/>">
								<div class="col-3 mt-2">								
									<div class="card text-center" style="height:400px; background: url(/Asm4/images/hinh-nen-khong-gian-vu-tru-cho-dien-thoai.jpg) no-repeat;background-size: cover;border-radius: 20px" >
										<div class="card-body">
										<c:forEach var="itemfa" items="${listFavoreti}"
													varStatus="STT">
													<c:choose>
														<c:when test="${itemfa.video.id == item.id}">
															<c:set var="check" value="false" />
														</c:when>
														<c:otherwise>
														</c:otherwise>
													</c:choose>
												</c:forEach>
										<c:if test="${check == false}">
											<div class="heart">
											  <div class="left"></div>
											  <div class="right"></div>
											</div>
										</c:if>
											<img style="border-radius:50px; width: 200px; height: 225px" id="blah"
												name="" src="/Asm4/images/${item.poster}"
												alt="your image"></img>
											<div class="row border-top mt-4">
													<div style="font-size: 18px; color: white;height: 50px;font-family: Century;">${item.tiTile}</div>					
											</div>
										</div>
										<div class="card-footer">
											<c:if test="${not isLogIn}">
												<a
														href="<%=request.getContextPath()%>/video?videoId=<c:out value='${item.id}'/>"
														class="btn btn-outline-light"><b>Watch Now!</b></a>
											</c:if>
											<c:if test="${isLogIn}">
												<c:forEach var="itemfa" items="${listFavoreti}"
													varStatus="STT">
													<c:choose>
														<c:when test="${itemfa.video.id == item.id}">
															<c:set var="check" value="false" />
														</c:when>
														<c:otherwise>
														</c:otherwise>
													</c:choose>
												</c:forEach>
												<c:if test="${check == false}">
													<a
														href="<%=request.getContextPath()%>/video?videoId=<c:out value='${item.id}'/>">
														<span class="btn btn-outline-danger"><b>Favorite</b></span>
													</a>
												</c:if>

												<c:if test="${check == true}">
													<a
														href="<%=request.getContextPath()%>/video?videoId=<c:out value='${item.id}'/>"
														class="btn btn-outline-light"><b>Watch Now!</b></a>
												</c:if>
											</c:if>
										</div>
									</div>
								</div>
							</a>
						</c:if>
					</c:forEach>
					<%
					}
					%>
				</div>
				<div class="row">
					<div class="col">
						<c:if test="${ fn:contains(duongdan, 'home')||fn:contains(duongdan, 'user') }">
						<nav aria-label="Page navigation" >
							<form action="" >
								<label for="limit">Page Size</label>
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
									href="/Asm4/home?page=${ page - 1 }&limit=${ limit }"
									class="page-link">&laquo;</a></li>
								<li class="page-item"><a class="page-link" href="/Asm4/home?page=${ page - 1 }&limit=${ limit }">${page-1}</a></li>
								<li class="page-item"><a class="page-link" href="/Asm4/home?page=${ page }&limit=${ limit }">${page}</a></li>
								<li class="page-item"><a class="page-link" href="/Asm4/home?page=${ page + 1 }&limit=${ limit }">${page+1}</a></li>
								<li class="page-item"><a
									href="/Asm4/home?page=${ page + 1 }&limit=${ limit }"
									class="page-link">&raquo;</a></li>
							</ul>
						</nav>
						</c:if>
						<c:if test="${ fn:contains(duongdan, 'find') }">
						<nav aria-label="Page navigation">
							<form action="/Asm4/find?ten=${ ten }&page=${ page }" method="post">
								<label for="limit">Page Size</label>
								<select style="width: 100px" name="limit" id="size" class="form-control" onchange="this.form.submit()">
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
									href="/Asm4/find?ten=${ ten }&page=${ page - 1 }"
									class="page-link">&laquo;</a></li>
								<li class="page-item"><a
								    class="page-link" href="/Asm4/find?ten=${ ten }&page=${ page-1 }">${page-1}</a></li>
								<li class="page-item"><a
								    class="page-link" href="/Asm4/find?ten=${ ten }&page=${ page }">${page}</a></li>
								<li class="page-item"><a
								    class="page-link" href="/Asm4/find?ten=${ ten }&page=${ page+1 }">${page+1}</a></li>
								<li class="page-item"><a
									href="/Asm4/find?ten=${ ten }&page=${ page + 1 }"
									class="page-link">&raquo;</a></li>
							</ul>
						</nav>
						</c:if>
						
					</div>
				</div>
			</div>
		</section>
	</main>

	<!-- Delete Modal HTML -->
	<div id="deleteEmployeeModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">Wellcome to My APP</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div style="text-align: center;">
					<h1>Bạn Chưa Đăng Nhập</h1>
					<a href="<%=request.getContextPath()%>/dang-nhap"
						class="btn btn-success">Đăng Nhập</a> <br> <br>
				</div>
			</div>
		</div>
	</div>

</body>


</html>



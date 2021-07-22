<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Thành Nguyễn</title>
<script>
	function readURL(input) {
		var reader = new FileReader();
		reader.onload = function(e) {
			$('#blah').attr('src', e.target.result);
		};
		reader.readAsDataURL(input.files[0]);
	}
</script>
</head>
<body>
	<main class="container-fluid">
		<section class="row">
			<label style="color: green">${messentge}</label>
			<div class="col mt-4">
				<ul class="nav nav-tabs" id="myTab" role="tablist">
					<li class="nav-item" role="presentation"><a
						class="nav-link " id="Edit-tab" data-toggle="tab"
						href="#Edit" role="tab" aria-controls="Edit" aria-selected="true">Edit</a>
					</li>
					<li class="nav-item" role="presentation"><a class="nav-link active"
						id="VideoList-tab" data-toggle="tab" href="#VideoList" role="tab"
						aria-controls="VideoList" aria-selected="false">List</a></li>

				</ul>
				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade " id="Edit" role="tabpanel"
						aria-labelledby="Edit-tab">
						<form action="/Asm4/videoservlet" method="POST"
							enctype="multipart/form-data">
							<div class="card" style=" background: url(/Asm4/images/hinh-nen-background-dep-32.jpg) no-repeat;background-size: cover;border-radius: 10px">
								<div class="card-body">
									<div class="row">

										<div class="col-3">
											<c:if test="${videoOject.poster==null}">
												<img style="width: 100%; height: 60%" id="blah"
													name="poster" src="/Asm4/images/ZiClJf-1920w.jpg"
													alt="your image"></img>
											</c:if>
											<c:if test="${videoOject.poster!=null}">
												<img style="width: 100%; height: 60%" id="blah"
													name="poster" src="/Asm4/images/${videoOject.poster}"
													alt="your image"></img>
											</c:if>
											<input name="image" type='file' onchange="readURL(this);"
												class="form-control-file" />
											<span style="color: red">${ validateHinh }</span>
										</div>
										<div class="col-9">
											<div class="form-group">
												<label for="youtubeId">Youtube ID</label> <input required
													type="text" class="form-control" name="id" id="youtubeId"
													aria-describedby="helpId" placeholder="Youtube ID"
													value="${videoOject.id }"> <small
													id="youtubeIdhelpId" class="form-text text-muted">youtube
													id is required</small>
											</div>
											<div class="form-group">
												<label for="videoTitle">Video Title</label> <input required
													type="text" class="form-control" name="tiTile"
													id="videoTitle" aria-describedby="videoTitle"
													placeholder="Video Title" value="${videoOject.tiTile }">
												<small id="videoTitle" class="form-text text-muted">video
													title is required</small>
											</div>
											<div class="form-group">
												<label for="ViewCount">View Count</label> <input required
													type="text" class="form-control" name="views"
													id="ViewCount" aria-describedby="viewCountHid"
													placeholder="View Count" value="${videoOject.views }">
												<small id="viewCountHid" class="form-text text-muted">view
													count is required</small>
											</div>
											<div class="form-check form-check-inline">
												<label> <input type="radio" class="form-check-input"
													value="true" name="actives" id="status"
													${videoOject.actives ?'checked':""}> Active
												</label> <label> <input type="radio"
													class="form-check-input" value="false" name="actives"
													id="status" ${!videoOject.actives ?'checked':""}>
													Inactive
												</label>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-12">
											<label for="descreption">Descreption</label>
											<textarea name="descriptions" id="descreption" cols="30"
												rows="5" class="form control">${videoOject.descriptions }</textarea>
										</div>
									</div>
								</div>

								<div class="card-footer text-muted">
									<button class="btn btn-primary " formaction="CV">Create</button>
									<button class="btn btn-warning" formaction="UV">Update</button>
									<button class="btn btn-danger" formaction="DV">Delete</button>
									<button class="btn btn-info" formaction="RV">Reset</button>
								</div>
							</div>

						</form>
					</div>
					<div class="tab-pane fade show active" id="VideoList" role="tabpanel"
						aria-labelledby="VideoList-tab">
						<table class="table table-strip">
							<tr style="color: white">
								<td>Youtube ID</td>
								<td>Video Title</td>
								<td>View Count</td>
								<td>Status</td>
								<td>&nbsp;</td>
							</tr>
							<%
							if (request.getAttribute("listVideo") != null) {
							%>
							<c:forEach var="item" items="${listVideo}" varStatus="STT">
								<c:if test="${!item.deleteVD}">
									<tr style="color: white">
										<td>${item.id}</td>
										<td>${item.tiTile}</td>
										<td><fmt:formatNumber type="NUMBER" value="${item.views}"/></td>
										<td><c:choose>
												<c:when test="${item.actives == true }">Active</c:when>
												<c:otherwise>Inactive</c:otherwise>
											</c:choose></td>
										<td><a
											href="/Asm4/editvideo?videoId=<c:out value='${item.id}'/>">Edit</a></td>
									</tr>
								</c:if>
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
									href="/Asm4/qlvd?page=${ page - 1 }&limit=${ limit }"
									class="page-link">&laquo;</a></li>
								<li class="page-item"><a class="page-link" href="/Asm4/qlvd?page=${ page - 1 }&limit=${ limit }">${page-1}</a></li>
								<li class="page-item"><a class="page-link" href="/Asm4/qlvd?page=${ page }&limit=${ limit }">${page}</a></li>
								<li class="page-item"><a class="page-link" href="/Asm4/qlvd?page=${ page + 1 }&limit=${ limit }">${page+1}</a></li>
								<li class="page-item"><a
									href="/Asm4/qlvd?page=${ page + 1 }&limit=${ limit }"
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
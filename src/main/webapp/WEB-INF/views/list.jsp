<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="layout/header.jsp"%>
<main>

	<!-- Page Content -->
	<div class="container">

		<div class="row">

			<!-- Blog Entries Column -->
			<div class="col-md-8">

				<h1 class="my-4">
					게시글 목록 <small>RHJ's Blog</small>
				</h1>
				<div class="table-wrap">
				<table class="table table-bordered" style="margin-left: auto; margin-right: auto;">
					<tr>
						<td>ID</td>
						<td>TITLE</td>
						<td>CONTENT</td>
						<td>READCOUNT</td>
						<td>CREATEDATE</td>
					</tr>
					<c:forEach var="board" items="${boards.content}">
						<tr>
							<td>${board.id }</td>
							<td><a href="/board/${board.id}">${board.title }</a></td>
							<td>${board.content }</td>
							<td>${board.readCount }</td>
							<td>${board.createDate }</td>
						</tr>
					</c:forEach>
				</table>
				</div>


				<div>
					<ul class="pagination justify-content-center mb-4">
						<c:choose>
							<c:when test="${boards.first}">
								<li class="page-item disabled"><a class="page-link"
									href="/list?page=${boards.pageable.pageNumber-1}">&larr;
										Prev</a></li>

							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="/list?page=${boards.pageable.pageNumber-1}">&larr;
										Prev</a></li>
							</c:otherwise>
						</c:choose>

						<c:choose>
							<c:when test="${boards.last}">
								<li class="page-item disabled"><a class="page-link"
									href="/list?page=${boards.pageable.pageNumber+1}">Next
										&rarr;</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="/list?page=${boards.pageable.pageNumber+1}">Next
										&rarr;</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
		</div>
	</div>
</main>
<%@include file="layout/footer.jsp"%>
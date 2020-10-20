<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="layout/header.jsp" %>


<main>
<div class="container">

		<div class="row">

			<!-- Blog Entries Column -->
			<div class="col-md-8">

				<h1 class="my-4">
					게시물 작성 <small>RHJ's Blog</small>
				</h1>

	<div class="content">
	제목 : <input type="text" id="title" name="title" value="${board.title }"/>
	<br/><br/>
	<textarea id="summernote" id="content" name="content">${board.content }</textarea>
	<br /><br/>
	<button onclick="updateBoard(${board.id})">수정</button>
	</div>
	<br/><br/>
	</div>
	</div>
	</div>
	
</main>


<script>
$(document).ready(function() {
	  $('#summernote').summernote({
	    	placeholder: 'content',
	        minHeight: 370,
	        maxHeight: null,
	        focus: true, 
	        lang : 'ko-KR',
	  });

	});

function updateBoard(id){
	// id, title, content
	let title = document.querySelector("#title").value;
	let content = document.querySelector("#content").value;
	
	console.log("id", id);
	console.log("title", title);
	console.log("content", content);

	let board = {
		title: title,
		content: content
	};

	fetch("/board/"+id, {
		method: "put",
		headers: {
			'Content-Type': 'application/json; charset=utf-8',
		},
		body: JSON.stringify(board)
	}).then(res=> res.text())
	.then(res=> {
		if(res=="ok"){
			alert("수정완료");
			location.href="/board/"+id;
		}else{
			alert("수정실패");
		}
	});

}
		
		
</script>
<%@include file="layout/footer.jsp" %>

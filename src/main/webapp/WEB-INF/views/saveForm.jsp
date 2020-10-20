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
	제목 : <input type="text" id="title" name="title"/>
	<br/><br/>
	<textarea id="summernote" id="content" name="content"></textarea>
	<br /><br/>
	<button onclick="saveButton()">글쓰기완료</button>
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

	function saveButton(){
		
		let title = $('#title').val();
		var content = $('#summernote').summernote('code');
		

		console.log("title",title);
		console.log("content",content);

		let board = {
				title: title,
				content: content
					};

			fetch("/save",{
				method:"post",
				headers:{
					'Content-Type':'application/json; charset=utf-8',
					},
					body:JSON.stringify(board)
				}).then(res=> res.text())
				.then(res=>{
					if(res=="ok"){
						alert("게시글 저장 완료");
						location.href="/list";
						}else{
							alert("게시글 저장 실패");
							}
	});
		
		}
</script>
<%@include file="layout/footer.jsp" %>

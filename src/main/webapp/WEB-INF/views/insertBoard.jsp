<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- fonts -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Poor+Story&display=swap" rel="stylesheet">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새글등록</title>
</head>
<body style="background-color:#f5f5f5;font-family:'Poor Story', cursive;" align='center'>
	<h1><strong>글 쓰기</strong></h1>
	<hr>
	<div class="container">
	<form id="id">
		<table align="center" border="2" class="table table-condensed" style="width:500;height:200;">
			<tr>
				<td bgcolor="#CED8F6" width="70"><h3>제목</h3></td>
				<td align="left">
					<input type="text" id="title" name="title" class="form-control">
				</td>
			</tr>
			<tr>
				<td bgcolor="#CED8F6"><h3>작성자</h3></td>
				<td align="left">
					<input type="text" id="writer" name="writer" class="form-control" size="10" />
				</td>
			</tr>
			<tr>
				<td bgcolor="#CED8F6"><h3>내용</h3></td>
				<td align="left">
					<textarea id="content" name="content" class="form-control" cols="40" rows="10"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type='button'name="write" id="write"class='btn btn-primary'>쓰기</button>
				</td>
			</tr>
		</table>
	</form>
	<hr>
	<h3><a href="getBoardList.do">글 목록 가기</a></h3>
	</div>
</body>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function (e){
		
		//쓰기 버튼을 클릭했을 경우
		$('#write').click(function(){

			var title = $("#title").val();
			var writer = $("#writer").val();
			var content = $("#content").val();

			if(title == "") {
				alert("제목을 입력해주세요.");
				$("#title").focus();
			} else if(writer == "") {
				alert("작성자를 입력해주세요.");
				$("#writer").focus();
			} else if(content == "") {
				alert("내용을 입력해주세요.");
				$("#content").focus();
			} else { 
			
				$.ajax({
					type:"POST",
					url:"/insertBoard",
					data: $("#id").serialize(),
					success:function(data) {
						var result = data.data;
						if(result == "success") {
							window.location.href="/getBoardList.do";
						} else {
							alert("실패했습니다.")
						}	
					},  error:function(request,status,error){
			             alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			          }
				});

			}
			
		});
	});
	
	
</script>
</html>
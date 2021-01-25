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
<title>글 수정</title>
</head>
<body style="background-color:#f5f5f5;font-family:'Poor Story', cursive;" align='center'>
	<h1><strong>글 수정하기</strong></h1>
	<hr>
	<div class="container">
	<form id="frm" name="frm" action="<c:url value='/getBoardList.do' />" method="post">
		<table align="center" border="2" class="table table-condensed" style="width:500;height:200;">
			<tr>
				<td bgcolor="#CED8F6" width="70"><h3>제목</h3></td>
				<td align="left">
					<div id="titleDi">
					</div>
				</td>
			</tr>
			<tr>
				<td bgcolor="#CED8F6"><h3>작성자</h3></td>
				<td align="left">
					<div id="writerDi">
					</div>
				</td>
			</tr>
			<tr>
				<td bgcolor="#CED8F6"><h3>내용</h3></td>
				<td align="left">
					<div id="contentDi">
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type='button' name="update" id="write"class='btn btn-primary' onclick='updateTable()'>수정하기</button>
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

	window.onload = function() { 

		var row = sessionStorage.getItem("update");

		$.ajax({
			url:"/boardAll?row="+row,
			type:"GET",
			success:function(data) {
				var board = data.list;

				$.each(board, function( index, value ) {
                    $("#titleDi").append("<input type='text' id='title' name='title' class='form-control' value='"+value.title+"'>");
            		$("#writerDi").append("<input type='text' id='writer' name='writer' class='form-control' value='"+value.writer+"'size='10' readonly>"); 
            		$("#contentDi").append("<textarea id='content' name='content' class='form-control' cols='40' rows='10'>"+value.content+"</textarea>"); 
                 });
				console.log("값 가져오기 성공");
				
			},  error:function(request,status,error){
	             alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	          }
		});
	}

	//수정하기 버튼을 눌렀을 때 실행
	function updateTable() {

		var row = sessionStorage.getItem("update");
		
		var title = $('input[name=title]').val();
		var content = document.getElementById('content').value;
		
		$.ajax({
			type:"GET",
			url:"/updateBoard?row="+row+"&title="+title+"&content="+content,
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
		
		sessionStorage.removeItem("update");

		
	}

	
</script>
</html>
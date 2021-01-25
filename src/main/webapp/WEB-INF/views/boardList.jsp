<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- fonts -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Poor+Story&display=swap"
	rel="stylesheet">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 목록</title>

</head>
<body
	style="background-color:#f5f5f5; font-family: 'Poor Story', cursive;">
	<div style='float: left; width: 50%; padding-left: 5%;'>
		<div class='container'>
			<div class='table-responsive' style='padding-top:5%;float:left;width:50%;'>
				<h1><strong>게시판</strong></h1>
				<table border=2 class='table table-striped table-sm'>
					<tr>
						<td><strong>NO</strong></td>
						<td><strong>제목</strong></td>
						<td><strong>등록자명</strong></td>
						<td><strong>등록일</strong></td>
					</tr>
					<c:forEach var="params" items="${params}" varStatus="status">
						<div id="empty"></div>
						<tr onclick='getTable(<c:out value="${params.id }"/>)'>
							<td><c:out value="${params.id }"/></td>
							<td><c:out value="${params.title }"/></td>
							<td><c:out value="${params.writer }"/></td>
							<td><c:out value="${params.today }"/></td>
						</tr>
					</c:forEach>
				</table>
				
				<div style="display: block; text-align: center;">		
					<c:if test="${paging.startPage != 1 }">
						<a href="/getBoardList.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
					</c:if>
					<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
						<c:choose>
							<c:when test="${p == paging.nowPage }">
								<b>${p }</b>
							</c:when>
							<c:when test="${p != paging.nowPage }">
								<a href="/getBoardList.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
							</c:when>
						</c:choose>
					</c:forEach>
					<c:if test="${paging.endPage != paging.lastPage}">
						<a href="/getBoardList.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
					</c:if>
				</div>
				
				<br><h3><a href='<c:url value='/moveInsertBoard.do' />'>글 쓰기</a></h3><br>
			</div>
		</div>
	</div>
	
	<div style='float: right; width: 50%; padding-top: 5%; padding-left: 3%;'>
		<div id="content"></div>
	</div>
</body>

<script type="text/javascript">

	//table에 <tr> 열을 클릭하면 실행
	$(function(){
		
        $("table tr").click(function(){
            
        	$('table tr').eq(0).not('table tr').css('color', 'black');
            //table tr 글씨 색상을 black으로 초기화
        	$("table tr").css("color", "black");
        	//클릭된 <tr> 해당열의 글씨 색상을 바꿈
        	$(this).css("color", "#8181F7");
        	$("tr:first").css("color", "black");
        	
        });
        
    });

	//<tr> 열을 클릭하면 실행
	function getTable(row) {

		var rowData = {
			row : row
		};

		$.ajax({
			type:"GET",
			url:"/getContent",
			data:rowData,
			success : function(data) {
				var content = data.data;
				var str = "";
				str += "<h1><strong>[내용]</strong></h1><br>";
				str += "<div style='float:left;'><h1>"+ content + "</h1></div><br>";
				str += "<div style='padding-top:25%;'><button type='button'onclick='deleteTable("+row+")'class='btn btn-basic'>해당 글 삭제</button></div>";
				str += "<div style='padding-top:5%;'><button type='button'onclick='updateTable("+row+")'class='btn btn-basic'>해당 글 수정</button></div>";

				document.getElementById("content").innerHTML = str;
			
			}
		});

	}

	//해당 글 삭제 버튼을 눌렀을 때 실행
	function deleteTable(row) {

		var rowData = {
			row : row
		};

		$.ajax({
			type:"GET",
			url:"/deleteBoard",
			data:rowData,
			success : function(data) {
				var result = data.data;
				if(result == 'success') {
					$('table tr').eq(row).remove();
					location.reload();
				}
				else {
					alert('데이터 삭제에 실패하였습니다.');
				}
			}
		});
		
	}

	//해당 글 수정 버튼을 눌렀을 때 실행
	function updateTable(row) {
		
		sessionStorage.setItem("update", row);
		window.location.href="/updateBoard.do";
		
	}
	
</script>

</html>
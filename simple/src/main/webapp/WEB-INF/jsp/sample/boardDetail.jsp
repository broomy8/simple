<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/include/include-header.jspf"%>
</head>
<body>
	<form id="frm">
		<table class="board_view">
			<colgroup>
				<col width="15%" />
				<col width="35%" />
				<col width="15%" />
				<col width="35%" />
			</colgroup>
			<caption>게시글 상세</caption>
			<tbody>
				<tr>
					<th scope="row">글 번호</th>
					<td>${map.NUM }<input type="hidden" id="NUM" name="NUM" value="${map.NUM }">
					</td>
					<th scope="row">조회수</th>
					<td>${map.HIT }</td>
				</tr>
				<tr>
					<th scope="row">작성자</th>
					<td>${map.WRITER }</td>
					<th scope="row">작성시간</th>
					<td>${map.REG_DATE }</td>
				</tr>
				<tr>
					<th scope="row">제목</th>
					<td colspan="3">${map.SUBJECT }</td>
				</tr>
				<tr>
					<td colspan="4">${map.CONTENT }</td>
				</tr>
				<c:choose>
					<c:when test="${fn:length(list) > 0}">
				<tr>
					<th scope="row">첨부파일</th>
						<td colspan="3"><input type="hidden" id="NUM" value="${row.NUM }">
						<c:forEach var="row" items="${list}"> 
							<p>
								<a href="#this" name="file">${row.ORIGINAL_FILE_NAME}</a> (${row.FILE_SIZE }Kb)
							</p>
						</c:forEach>
					</td>
				</tr>
					</c:when>
					<c:otherwise>
				<tr>
					<td colspan="4">첨부 파일이 없습니다.</td>
				</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</form>

	<a href="#this" class="btn" id="list">목록으로</a>
	<a href="#this" class="btn" id="update">수정하기</a>
	<a href="#this" class="btn" id="delete">삭제하기</a>

	<%@ include file="/include/include-body.jspf"%>
	<script type="text/javascript">
		$(document).ready(function()
		{
			$("#list").on("click", function(e)
			{ //목록으로 버튼
				e.preventDefault();
				fn_openBoardList();
			});

			$("#update").on("click", function(e)
			{
				e.preventDefault();
				fn_updateBoard();
			});

			$("#delete").on("click", function(e)
			{ //삭제하기 버튼
				e.preventDefault();
				fn_deleteBoard();
			});

			$("a[name='file']").on("click", function(e)
			{ //파일다운로드
				e.preventDefault();
				fn_downloadFile($(this));
			});
		});

		function fn_openBoardList()
		{
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/openBoardList.do' />");
			comSubmit.submit();
		}

		function fn_updateBoard()
		{
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/openBoardUpdate.do' />");
			comSubmit.submit();
		}

		function fn_deleteBoard()
		{
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/deleteBoard.do' />");
			comSubmit.addParam("NUM", $("#NUM").val());
			comSubmit.submit();

		}
		
		function fn_downloadFile(obj)
		{
			var num = obj.parent().find("#NUM").val();
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/common/downloadFile.do' />");
			comSubmit.addParam("NUM", num);
			comSubmit.submit();
		}
	</script>
</body>
</html>


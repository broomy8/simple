<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>simple</title>
<%@ include file="/include/include-header.jspf"%>
</head>
<body>
	<h2>게시판 목록</h2>
	<table style="border: 1px solid #ccc">
		<colgroup>
			<col width="10%" />
			<col width="*" />
			<col width="15%" />
			<col width="20%" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col">글번호</th>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">조회수</th>
				<th scope="col">작성일</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(list) > 0}">
					<c:forEach items="${list }" var="row">
						<tr>
							<td>${row.NUM }</td>
							<td class="subject">
								<a href="#this" name="subject">${row.SUBJECT}</a> 
								<input type="hidden" id="NUM" value="${row.NUM}">
							</td>
							<td>${row.WRITER }</td>
							<td>${row.HIT }</td>
							<td>${row.REG_DATE }</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="4">조회된 결과가 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>

		</tbody>
	</table>
	<br>
	<a href="#this" class="btn" id="write">글쓰기</a>
	<%@ include file="/include/include-body.jspf"%>

	<script type="text/javascript">
		$(document).ready(function()
		{
			$("a[name='subject']").on("click", function(e)
			{
				e.preventDefault();
				fn_openBoardDetail($(this));
			});

			$("#write").on("click", function(e)
			{
				e.preventDefault();
				fn_openBoardWrite($(this));
			});
		});

		function fn_openBoardWrite()
		{
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/openBoardWrite.do' /> ");
			comSubmit.submit();
		}

		function fn_openBoardDetail(obj)
		{
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/openBoardDetail.do' /> ");
			comSubmit.addParam("NUM", obj.parent().find('#NUM').val());
			comSubmit.submit();
		}
	</script>
</body>
</html>

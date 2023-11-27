<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board.jsp</title>
</head>
<body>
	<form action="BoardWriteController" name="insertForm">
		<c:if test="${sessionScope.loginMember != null }">
			<table class="memberInsertTable" border="1" align="center">

				<tr>
					<td style="font-size: 60px">글쓰기<input type="hidden"
						value="${generatedToken }"></input>
					</td>
				</tr>
				<tr>
					<td><textarea id="boardTextarea" name="b_text"
							placeholder="내용" autofocus="autofocus" maxlength="200"></textarea></td>
				</tr>
				<tr>
					<td><button class="BoardInputButton">&nbsp;&nbsp;확인&nbsp;&nbsp;</button></td>
				</tr>
			</table>
		</c:if>
	</form>
	<table align="center">
		<tr>
			<td><c:if test="${pageNo != 1}">
					<a href="BoardPageController?p=${pageNo - 1 }" id="boardL">&lt;</a>
				</c:if> <c:if test="${pageNo != pageCount}">
					<a href="BoardPageController?p=${pageNo + 1 }" id="boardR">&gt;</a>
				</c:if></td>
		</tr>

	</table>

		<c:forEach var="board" items="${boards}">

			<table class="boardContent" align="center">
				<tr>
					<td valign="top" align="center" rowspan="4" class="boardPhoto">
						<img src="image/${board.m_photo }">
					</td>
					<td class="boardWriter">- ${board.b_writer } -</td>
				</tr>
				<tr>
					<td align="right" class="boardWhen"><input name="b_no"
						value="${board.b_no }" type="hidden"> <fmt:formatDate
							value="${board.b_when }" type="both" dateStyle="long"
							timeStyle="short" /></td>
				</tr>
				<tr>
					<td class="boardText"><textarea name="b_text"
							readonly="readonly">${board.b_text}</textarea></td>
				</tr>
				<c:if test="${board.b_writer == sessionScope.loginMember.m_id }">
					<tr>
						<td><button onclick="updateBtn();">수정</button>
							<button onclick="deleteBtn(${board.b_no});">삭제</button></td>
					</tr>
				</c:if>
			</table>

		</c:forEach>
</body>
</html>
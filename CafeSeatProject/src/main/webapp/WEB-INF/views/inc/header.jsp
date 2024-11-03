<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header>
	<div style="position: sticky; top: 0;">
		<table style="display: flex; justify-content: space-between; padding-left: 30px; border: 1px solid #CCC; width: 1000px;">
				<tr>
					<th>이름</th>
					<th>번호</th>
					<th>메일</th>
					<th>상태</th>
					<th>인증</th>
					<th>권한</th>
				</tr>
				<tr>
					<td>${info.name}</td>
					<td>${info.tel}</td>
					<td>${info.email}</td>
					<td>${info.ing}</td>
					<td>${auth}</td>
					<td>${loginType}</td>
				</tr>
		</table>
	</div>
</header>